import { Router } from "express";
import { upload } from "../middlewares/upload.middleware";
import { uploadDocument,  checkDocumentsCompletude } from "../controllers/document.controller";


const router = Router();

router.post("/", upload.single("document"), uploadDocument);

export default router;

router.get("/check/:id", checkDocumentsCompletude);
