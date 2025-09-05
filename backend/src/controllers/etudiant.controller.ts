// src/controllers/etudiant.controller.ts

import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";
import { RequestHandler } from "express";
const prisma = new PrismaClient();

// Créer un étudiant

export const createEtudiant = async (req: Request, res: Response): Promise<void> => {
    try {
        const {
            nom,
            prenom,
            email,
            telephone,
            dateNaissance,
            lieuNaissance,
            motDePasse,
            statutEtudiant,
            statutFinancement,
            boursier,
            serieBac,
            domaine,
            filiere,
            anneeInscription,
            parcours,
            uniforme,
            fraisAnnexesPayes,
            statutDossier
        } = req.body;


        // @ts-ignore
        const newEtudiant = await prisma.etudiant.create({
            data: {
                nom,
                prenom,
                email,
                telephone,
                motDePasse,
                statutEtudiant,
                statutFinancement,
                boursier: boursier === true || boursier === "true",
                serieBac,
                domaine,
                filiere,
                anneeInscription: parseInt(anneeInscription),
                parcours,
                uniforme: uniforme === true || uniforme === "true",
                fraisAnnexesPayes: fraisAnnexesPayes === true || fraisAnnexesPayes === "true",
                statutDossier,
                dateNaissance: new Date(dateNaissance),
                lieuNaissance: lieuNaissance || "Non spécifié",
                derniereMiseAJour: new Date()
            }
        });

        res.status(201).json(newEtudiant);
    } catch (error) {
        console.error("Erreur création étudiant:", error);
        res.status(500).json({ error: "Erreur serveur" });
    }
};

// Récupérer tous les étudiants
export const getAllEtudiants = async (_req: Request, res: Response) => {
    try {
        const etudiants = await prisma.etudiant.findMany();
        res.status(200).json(etudiants);
    } catch (error) {
        console.error("Erreur lors de la récupération :", error);
        res.status(500).json({ error: "Erreur serveur" });
    }
};


// 🔄 Mise à jour partielle des infos de l'étudiant
export const updateEtudiant: RequestHandler = async (req, res) => {
    const { id } = req.params;
    const dataToUpdate = req.body;

    try {
        const updated = await prisma.etudiant.update({
            where: { id },
            data: {
                ...dataToUpdate,
                derniereMiseAJour: new Date()
            }
        });

        res.status(200).json({
            message: "Informations mises à jour avec succès",
            etudiant: updated
        });
    } catch (error) {
        console.error("Erreur mise à jour étudiant :", error);
        res.status(500).json({ error: "Erreur serveur" });
    }
};