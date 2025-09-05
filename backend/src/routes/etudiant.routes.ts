// src/routes/etudiant.routes.ts

import { Router } from "express";
import { createEtudiant, getAllEtudiants } from "../controllers/etudiant.controller";
import { updateEtudiant } from "../controllers/etudiant.controller";

const router = Router();

router.post("/", createEtudiant);
router.get("/", getAllEtudiants); // <== route ajoutée ici

export default router;

router.patch("/:id", updateEtudiant);
