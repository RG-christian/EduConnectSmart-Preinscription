import { Router, Request, Response } from "express";
import multer from "multer";
import path from "path";
import fs from "fs";
import { PrismaClient } from "@prisma/client";
import { enregistrerPreinscription } from "../controllers/preinscription.controller";
import { generateAttestationPDF } from "../utils/pdf/attestation";

const prisma = new PrismaClient();
const router = Router();

// === CONFIG UPLOAD ===
const uploadDir = path.join(process.cwd(), "uploads", "photos");
if (!fs.existsSync(uploadDir)) fs.mkdirSync(uploadDir, { recursive: true });

const storage = multer.diskStorage({
    destination: (_req, _file, cb) => cb(null, uploadDir),
    filename: (_req, file, cb) => {
        const uniqueName = "photo_" + Date.now() + path.extname(file.originalname);
        cb(null, uniqueName);
    },
});
const upload = multer({ storage });

// === ROUTE DE PRÉINSCRIPTION ===
router.post("/preinscriptions", upload.single("photo"), async (req: Request, res: Response): Promise<void> => {
    try {
        // 1. Gestion du fichier photo
        let photoFileName: string | null = null;
        if (req.file) {
            photoFileName = req.file.filename;
        }

        // 2. Mapping données formulaire
        const trimOrEmpty = (v: any) => (v ? String(v).trim() : "");

        const data = {
            nom: trimOrEmpty(req.body.nom),
            prenoms: trimOrEmpty(req.body.prenom),
            datenaiss: trimOrEmpty(req.body.date_naissance),
            lieunaiss: trimOrEmpty(req.body.lieu_naissance),
            sexe: req.body.genre === "Masculin" ? "M" : "F",
            nationalite: trimOrEmpty(req.body.nationalite),
            matrimo: trimOrEmpty(req.body.situation_matrimoniale),
            telperso: trimOrEmpty(req.body.telephone_etudiant),
            telephone_parent: trimOrEmpty(req.body.telephone_parent),
            domicile: trimOrEmpty(req.body.lieu_residence),
            email: trimOrEmpty(req.body.email),
            photo: photoFileName,

            bac: trimOrEmpty(req.body.serie_bac),
            anneebac: trimOrEmpty(req.body.annee_bac),
            moybac: req.body.moyenne_bac ? Number(req.body.moyenne_bac) : null,
            mention: trimOrEmpty(req.body.mention_bac),
            etaborigin: trimOrEmpty(req.body.etablissement_provenance),
            pays_bac: trimOrEmpty(req.body.pays_bac),

            oriente: req.body.oriente === "Oui" ? 1 : 0,
            noriente: trimOrEmpty(req.body.numero_orientation),
            boursier: req.body.boursier === "Oui" ? "OUI" : "NON",
            nombourse: trimOrEmpty(req.body.denomination_bourse),
            organisme: trimOrEmpty(req.body.organisme_donateur),
            numbourse: trimOrEmpty(req.body.numero_bourse),

            institut: trimOrEmpty(req.body.institut),
            mention_orientation: trimOrEmpty(req.body.mention),
            niveau: trimOrEmpty(req.body.niveau),
            specialite: trimOrEmpty(req.body.specialite),
            annee_academique: trimOrEmpty(req.body.annee_academique),

            numero: Date.now().toString(),
            idanuniv: 1,
            idafdnp: 1,
        };

        // 3. Enregistrement via Prisma (controller déjà existant)
        const newPreinscription = await prisma.preinscriptions.create({
            data: {
                ...data,
                datenaiss: new Date(data.datenaiss),
                moybac: data.moybac,
            },
            select: { idpreins: true, nom: true, prenoms: true },
        });

        // 4. Génération du PDF
        const { filePath } = await generateAttestationPDF({
            ...data,
            idpreins: newPreinscription.idpreins,
            datenaiss: new Date(data.datenaiss),
        });

        res.status(201).json({
            message: "Préinscription enregistrée.",
            id: newPreinscription.idpreins.toString(),
            pdf: `/pdf/${path.basename(filePath)}`,
        });
    } catch (err: any) {
        console.error("Erreur route préinscription:", err);
        res.status(400).json({ error: err.message });
    }
});

export default router;
