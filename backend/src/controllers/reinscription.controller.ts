import { RequestHandler } from "express";
import { PrismaClient } from "@prisma/client";
import { generateRecuReinscriptionPDF } from "../utils/pdf.utils";

const prisma = new PrismaClient();

// 📥 Réinscription
export const createReinscription: RequestHandler = async (req, res) => {
    try {
        const {
            etudiantId,
            anneeScolaire,
            parcours,
            statutFinancement,
            uniformeChoisi,
            fraisAnnexes,
            fraisUniforme,
            totalAPayer,
            paiementEffectue,
            statut
        } = req.body;

        const etudiant = await prisma.etudiant.findUnique({ where: { id: etudiantId } });
        if (!etudiant) {
            res.status(404).json({ error: "Étudiant non trouvé" });
            return;
        }

        const newReinscription = await prisma.reinscription.create({
            data: {
                etudiantId,
                anneeScolaire,
                parcours,
                statutFinancement,
                uniformeChoisi,
                fraisAnnexes,
                fraisUniforme,
                totalAPayer,
                paiementEffectue,
                dateSoumission: new Date(),
                statut,
                ficheReinscriptionPDF: null
            }
        });

        // 📄 Générer attestation d'inscription uniquement si ancien boursier
        let pdfPath: string | null = null;

        if (etudiant.statutEtudiant === "ancien" && etudiant.boursier) {
            pdfPath = await generateRecuReinscriptionPDF(
                {
                    id: newReinscription.id,
                    anneeScolaire,
                    parcours,
                    totalAPayer,
                    paiementEffectue,
                    dateSoumission: newReinscription.dateSoumission
                },
                {
                    nom: etudiant.nom,
                    prenom: etudiant.prenom,
                    email: etudiant.email
                }
            );

            await prisma.reinscription.update({
                where: { id: newReinscription.id },
                data: {
                    ficheReinscriptionPDF: pdfPath
                }
            });
        }

        const reinscriptionFinale = await prisma.reinscription.findUnique({
            where: { id: newReinscription.id }
        });

        res.status(201).json(reinscriptionFinale);

    } catch (error) {
        console.error("Erreur réinscription :", error);
        res.status(500).json({ error: "Erreur serveur" });
    }
};




export const getAllReinscriptions: RequestHandler = async (_req, res) => {
    try {
        const reinscriptions = await prisma.reinscription.findMany({
            include: {
                etudiant: true
            },
            orderBy: {
                dateSoumission: "desc"
            }
        });

        res.status(200).json(reinscriptions);
    } catch (error) {
        console.error("Erreur récupération réinscriptions :", error);
        res.status(500).json({ error: "Erreur serveur" });
    }
};



export const verifierReinscription: RequestHandler = async (req, res) => {
    const { id } = req.params;

    try {
        const reinscription = await prisma.reinscription.update({
            where: { id },
            data: { verifieParAdmin: true }
        });

        res.status(200).json({
            message: "Réinscription marquée comme vérifiée par l'admin",
            reinscription
        });
    } catch (error) {
        console.error("Erreur vérification admin :", error);
        res.status(500).json({ error: "Erreur serveur" });
    }
};

