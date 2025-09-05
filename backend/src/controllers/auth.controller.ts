import { RequestHandler } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

// @ts-ignore
export const login: RequestHandler = async (req, res) => {
    const { email, password } = req.body;

    if (!email || !password) {
        return res.status(400).json({ error: "Email et mot de passe sont requis." });
    }

    try {
        // Vérifier dans la table des administrateurs
        const admin = await prisma.administrateur.findUnique({
            where: { email },
        });

        if (admin) {
            if (admin.motDePasse === password) {
                return res.status(200).json({
                    id: admin.id,
                    nom: admin.nom,
                    email: admin.email,
                    role: "admin",
                });
            } else {
                return res.status(401).json({ error: "Mot de passe incorrect (admin)" });
            }
        }

        // Vérifier dans la table des étudiants
        const etudiant = await prisma.etudiant.findUnique({
            where: { email },
        });

        if (etudiant) {
            if (etudiant.motDePasse === password) {
                return res.status(200).json({
                    id: etudiant.id,
                    nom: etudiant.nom,
                    email: etudiant.email,
                    role: "etudiant",
                });
            } else {
                return res.status(401).json({ error: "Mot de passe incorrect (étudiant)" });
            }
        }

        // Aucun utilisateur trouvé
        return res.status(401).json({ error: "Aucun compte ne correspond à cet email." });

    } catch (error) {
        console.error("Erreur lors de la tentative de connexion :", error);
        return res.status(500).json({ error: "Erreur interne du serveur." });
    }
};
