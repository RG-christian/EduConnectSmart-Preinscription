import { Router } from "express";
import { createInscription } from "../controllers/inscription.controller";
import { verifierInscription } from "../controllers/inscription.controller";


const router = Router();

router.post("/", createInscription);

export default router;

router.patch("/:id/verifier", verifierInscription);
