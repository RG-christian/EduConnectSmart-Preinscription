import { Router } from "express";
import { createReinscription } from "../controllers/reinscription.controller";
import { getAllReinscriptions } from "../controllers/reinscription.controller";
import { verifierReinscription } from "../controllers/reinscription.controller";



const router = Router();

router.post("/", createReinscription);

export default router;

router.get("/", getAllReinscriptions);

router.patch("/:id/verifier", verifierReinscription);
