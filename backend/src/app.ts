// src/app.ts
import express from "express"
import cors from "cors"
import dotenv from "dotenv"
import path from "path"

import etudiantRoutes from "./routes/etudiant.routes"
import preinscriptionRoutes from "./routes/preinscription.routes"
import inscriptionRoutes from "./routes/inscription.routes"
import reinscriptionRoutes from "./routes/reinscription.routes"
import authRoutes from "./routes/auth.routes"

dotenv.config()

const app = express()
app.use((req, res, next) => {
    console.log(`🛬 [${req.method}] ${req.url}`)
    next()
})

app.use(cors())
app.use(express.json())

app.get("/", (_, res) => {
    res.send("EduConnect API")
})

// ✅ Toutes les routes
app.use("/api/etudiants", etudiantRoutes)
app.use("/api/preinscriptions", preinscriptionRoutes)
app.use("/api/inscriptions", inscriptionRoutes)
app.use("/api/reinscriptions", reinscriptionRoutes)
app.use("/api/auth", authRoutes)

// ✅ Fichiers statiques
app.use("/pdfs", express.static(path.join(__dirname, "../public/pdfs")))

// ✅ EXPORT À LA FIN !
export default app
