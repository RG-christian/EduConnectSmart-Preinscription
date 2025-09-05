import { Request, Response } from 'express'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

/** Helpers */
const ynToInt = (v: any): 0 | 1 =>
    (typeof v === 'string' && v.trim().toLowerCase() === 'oui') || v === true || v === 1
        ? 1
        : 0

const ynToStr = (v: any): 'Oui' | 'Non' => (ynToInt(v) === 1 ? 'Oui' : 'Non')

/** Parse "YYYY-MM-DD" ou "DD/MM/YYYY" -> Date UTC 00:00:00 */
function parseDateOnly(input: any): Date {
    if (input instanceof Date && !isNaN(input.valueOf())) {
        const d = new Date(Date.UTC(input.getUTCFullYear(), input.getUTCMonth(), input.getUTCDate()))
        return d
    }
    if (typeof input !== 'string') throw new Error('datenaiss invalide')

    const s = input.trim()

    // ISO simple
    const iso = /^(\d{4})-(\d{2})-(\d{2})$/.exec(s)
    if (iso) {
        const [, Y, M, D] = iso
        return new Date(Date.UTC(Number(Y), Number(M) - 1, Number(D)))
    }

    // FR JJ/MM/AAAA
    const fr = /^(\d{2})\/(\d{2})\/(\d{4})$/.exec(s)
    if (fr) {
        const [, jj, mm, aaaa] = fr
        return new Date(Date.UTC(Number(aaaa), Number(mm) - 1, Number(jj)))
    }

    // Dernier recours
    const d = new Date(s)
    if (isNaN(d.valueOf())) throw new Error('datenaiss invalide')
    return new Date(Date.UTC(d.getUTCFullYear(), d.getUTCMonth(), d.getUTCDate()))
}

/** Validation stricte (+ conditionnels via Oui/Non normalisés) */
function validerChamps(data: any) {
    const champsObligatoires = [
        'nom', 'prenoms', 'datenaiss', 'lieunaiss', 'sexe', 'nationalite',
        'telperso', 'domicile', 'bac', 'anneebac', 'mention', 'etaborigin',
        'pays_bac', 'oriente', 'boursier', 'institut',
        'mention_orientation', 'niveau', 'specialite', 'annee_academique',
        'numero', 'idanuniv', 'idafdnp'
    ]

    const orienteStr = ynToStr(data.oriente)
    const boursierStr = ynToStr(data.boursier)

    if (orienteStr === 'Oui') champsObligatoires.push('noriente')
    if (boursierStr === 'Oui') champsObligatoires.push('nombourse', 'organisme', 'numbourse')

    for (const champ of champsObligatoires) {
        const v = data[champ]
        if (v === undefined || v === null || String(v).trim() === '') {
            throw new Error(`Champ requis manquant ou vide : ${champ}`)
        }
    }
}

export const enregistrerPreinscription = async (req: Request, res: Response) => {
    try {
        const data = req.body

        // 1) Validation
        validerChamps(data)

        // 2) Normalisations cohérentes
        const datenaiss = parseDateOnly(data.datenaiss)
        const oriente   = ynToInt(data.oriente)          // Int (0/1)
        const boursier  = ynToStr(data.boursier)         // "Oui"/"Non"

        // 3) Vérif d’unicité applicative (filet #1)
        const exists = await prisma.preinscriptions.findUnique({
            where: {
                // grâce à @@unique([nom, prenoms, datenaiss], name: "uniq_nom_prenoms_datenaiss")
                uniq_nom_prenoms_datenaiss: {
                    nom: data.nom,
                    prenoms: data.prenoms,
                    datenaiss: new Date('2024-01-01') // ta date normalisée
                }
            },
            select: { idpreins: true }
        })
        if (exists) {
            return res.status(409).json({ message: 'Préinscription déjà existante.' })
        }

        // 4) Insertion
        const created = await prisma.preinscriptions.create({
            data: {
                nom: data.nom,
                prenoms: data.prenoms,
                datenaiss,
                lieunaiss: data.lieunaiss,
                sexe: data.sexe,
                nationalite: data.nationalite,
                telperso: data.telperso,
                domicile: data.domicile,
                email: data.email ?? null,

                oriente,
                boursier,

                noriente: data.noriente ?? null,
                nombourse: data.nombourse ?? null,
                organisme: data.organisme ?? null,
                numbourse: data.numbourse ?? null,

                bac: data.bac,
                anneebac: String(data.anneebac),
                moybac: data.moybac !== undefined && data.moybac !== null ? Number(data.moybac) : null,
                totalpoints: data.totalpoints !== undefined && data.totalpoints !== null ? Number(data.totalpoints) : null,
                mention: data.mention ?? null,
                etaborigin: data.etaborigin ?? null,
                pays_bac: data.pays_bac ?? null,

                institut: data.institut ?? null,
                mention_orientation: data.mention_orientation ?? null,
                niveau: data.niveau ?? null,
                specialite: data.specialite ?? null,
                annee_academique: data.annee_academique ?? null,

                numero: String(data.numero ?? ''),        // NOT NULL côté SQL
                idafdnp: BigInt(data.idafdnp ?? 0),       // bigint
                idanuniv: Number(data.idanuniv ?? 0),

                acquis: Number(data.acquis ?? 0),
                inscrit: Number(data.inscrit ?? 0),
                status: data.status ?? null,
                observation: data.observation ?? null,
                archive: Number(data.archive ?? 0),
                sup: Number(data.sup ?? 0),
                online: Number(data.online ?? 0),
                confirm: Number(data.confirm ?? 0),
                photo: data.photo ?? null,
            },
            select: { idpreins: true }
        })

        // 5) Réponse (BigInt -> string)
        return res.status(201).json({
            message: 'Préinscription enregistrée.',
            id: created.idpreins.toString()
        })
    } catch (err: any) {
        // Collision d’unicité DB (filet #2)
        if (err?.code === 'P2002') {
            return res.status(409).json({ message: 'Préinscription déjà existante.' })
        }
        console.error('Erreur préinscription:', err)
        return res.status(400).json({ error: err?.message || 'Erreur serveur' })
    }
}
