import { RequestHandler } from "express";
import { PrismaClient } from "@prisma/client";
import { getDocumentsRequis, updateDocumentsComplets } from "../services/documentValidator.service";

const prisma = new PrismaClient();

// 📤 Upload d’un document lié à une inscription ou réinscription
export const uploadDocument: RequestHandler = async (req, res) => {
    const { inscriptionId, reinscriptionId, type } = req.body;

    // Vérification : au moins un ID doit être fourni
    if (!inscriptionId && !reinscriptionId) {
        res.status(400).json({ error: "Inscription ou Réinscription requise" });
        return;
    }

    // Vérification de la présence du fichier
    if (!req.file) {
        res.status(400).json({ error: "Aucun fichier reçu" });
        return;
    }

    const url = `/uploads/documents/${req.file.filename}`;

    // Création du document lié soit à une inscription soit à une réinscription
    const doc = await prisma.document.create({
        data: {
            inscriptionId: inscriptionId || null,
            reinscriptionId: reinscriptionId || null,
            type,
            url,
            dateDepot: new Date()
        }
    });

    // 🔁 Mise à jour de la complétude uniquement si c'est une inscription
    if (inscriptionId) {
        await updateDocumentsComplets(inscriptionId);
    }

    res.status(201).json({
        message: "Document téléversé avec succès",
        document: doc
    });
};

export const checkDocumentsCompletude: RequestHandler = async (req, res) => {
    const { id } = req.params; // id = inscriptionId

    const inscription = await prisma.inscription.findUnique({
        where: { id },
        include: { etudiant: true, documents: true }
    });

    if (!inscription) {
        res.status(404).json({ error: "Inscription non trouvée" });
        return;
    }

    const profil = {
        statutEtudiant: inscription.etudiant.statutEtudiant,
        boursier: inscription.etudiant.boursier
    };

    const requis = getDocumentsRequis(profil);
    const fournis = inscription.documents.map(doc => doc.type);
    const manquants = requis.filter(type => !fournis.includes(type));

    const estComplet = manquants.length === 0;

    res.status(200).json({
        inscriptionId: inscription.id,
        etudiant: `${inscription.etudiant.nom} ${inscription.etudiant.prenom}`,
        complet: estComplet, manquants,
        documentsFournis: fournis
    });
};


