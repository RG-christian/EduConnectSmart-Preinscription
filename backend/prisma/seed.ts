import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

async function main() {

    // Vérifie si un admin existe déjà
    const adminExists = await prisma.administrateur.findUnique({
        where: { email: "admin@gmail.com" }
    })

    if (!adminExists) {
        await prisma.administrateur.create({
            data: {
                nom: "Admin",
                email: "admin@gmail.com",
                motDePasse: "admin123",
                role: "superadmin",
                actif: true,
                dernierAcces: new Date()
            }
        })
        console.log("✅ Admin créé")
    } else {
        console.log("ℹ️ Admin déjà existant — aucune action")
    }


    // Vérifie si un étudiant existe déjà
    const etudiantExists = await prisma.etudiant.findUnique({
        where: { email: "rapo@gmail.com" }
    })

    if (!etudiantExists) {
        await prisma.etudiant.create({
            data: {
                nom: "Rapontchombo",
                prenom: "Cristian",
                email: "rapo@gmail.com",
                telephone: "065281858",
                motDePasse: "rapo123",
                dateNaissance: new Date("2000-01-01"),
                lieuNaissance: "Libreville",
                statutEtudiant: "nouveau",
                statutFinancement: "physique",
                boursier: false,
                serieBac: "C",
                domaine: "Sciences",
                filiere: "Informatique",
                anneeInscription: 2024,
                parcours: "local",
                uniforme: true,
                fraisAnnexesPayes: true,
                statutDossier: "en attente",
                derniereMiseAJour: new Date()
            }
        })
        console.log("✅ Étudiant inséré")
    } else {
        console.log("ℹ️ Étudiant déjà présent")
    }
}

main()
    .catch((e) => {
        console.error("❌ Erreur lors du seed :", e)
        process.exit(1)
    })
    .finally(() => {
        prisma.$disconnect()
    })
