import { RequestHandler } from "express";
import { PrismaClient } from "@prisma/client";
import { generateRecuInscriptionPDF } from "../utils/pdf.utils";

const prisma = new PrismaClient();

// 📥 Créer une nouvelle inscription
export const createInscription: RequestHandler = async (req, res) => {
    try {
        const {
            etudiantId,
            anneeScolaire,
            filiere,
            parcours,
            statutFinancement,
            fraisInscription,
            fraisAnnexes,
            uniformeChoisi,
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

        const newInscription = await prisma.inscription.create({
            data: {
                etudiantId,
                anneeScolaire,
                filiere,
                parcours,
                statutFinancement,
                fraisInscription,
                fraisAnnexes,
                uniformeChoisi,
                fraisUniforme,
                totalAPayer,
                paiementEffectue,
                dateSoumission: new Date(),
                statut,
                ficheInscriptionPDF: null,
                documentsComplets: false
            }
        });

        // 📄 Générer le reçu PDF
        const pdfPath = await generateRecuInscriptionPDF(
            {
                id: newInscription.id,
                anneeScolaire,
                filiere,
                parcours,
                totalAPayer,
                paiementEffectue,
                dateSoumission: newInscription.dateSoumission
            },
            {
                nom: etudiant.nom,
                prenom: etudiant.prenom,
                email: etudiant.email
            }
        );

        // 📌 Mise à jour du champ ficheInscriptionPDF
        const updatedInscription = await prisma.inscription.update({
            where: { id: newInscription.id },
            data: {
                ficheInscriptionPDF: pdfPath
            }
        });

        res.status(201).json(updatedInscription);

    } catch (error) {
        console.error("Erreur lors de l'inscription :", error);
        res.status(500).json({ error: "Erreur serveur" });
    }
};




export const verifierInscription: RequestHandler = async (req, res) => {
    const { id } = req.params;

    try {
        const inscription = await prisma.inscription.update({
            where: { id },
            data: { verifieParAdmin: true }
        });

        res.status(200).json({
            message: "Inscription marquée comme vérifiée par l'admin",
            inscription
        });
    } catch (error) {
        console.error("Erreur vérification admin :", error);
        res.status(500).json({ error: "Erreur serveur" });
    }
};
