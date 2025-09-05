import PDFDocument from "pdfkit"
import puppeteer from "puppeteer"
import * as path from "path"
import * as fs from "fs"

export const generateAttestationPDF = async (
    preinscription: {
        id: string
        nom: string
        prenom: string
        dateNaissance: Date
        lieuNaissance: string
        domaine: string
        niveau: string
        specialite: string
        serieBac: string
        dateSoumission: Date
    }
): Promise<string> => {
    const fileName = `attestation_preinscription_${preinscription.id}.pdf`
    const outputPath = path.join(__dirname, `../../public/pdfs/${fileName}`)

    const annee = preinscription.dateSoumission.getFullYear()
    const html = `
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <title>Attestation</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="p-12 font-sans text-gray-900 text-[15px] leading-relaxed">
  <div class="text-center mb-6">
    <div class="font-bold text-sm">RÉPUBLIQUE GABONAISE</div>
    <div class="text-sm">Union – Travail – Justice</div>
    <div class="flex flex-col items-center justify-center text-center mt-6">
  <!-- Texte ESGIS -->
  <div class="font-bold text-[15px] flex flex-wrap gap-1 justify-center">
    <span class="text-1xl font-bold text-red-600">É</span>cole
    <span class="text-1xl font-bold text-red-600">S</span>upérieure de
    <span class="text-1xl font-bold text-red-600">G</span>estion et
    d’<span class="text-1xl font-bold text-red-600">I</span>nformatique et des
    <span class="text-1xl font-bold text-red-600">S</span>ciences
  </div>

  <!-- Logo ESGIS -->
  <div class="mt-2">
    <img src="/images/esgis.png" alt="Logo ESGIS" class="w-28 h-auto" />
  </div>
</div>


  </div>

  <h2 class="text-center text-lg font-bold underline mb-6">ATTESTATION DE PRÉINSCRIPTION</h2>

  <p class="mb-4">Je soussigné, Pr. Daniel René AKENDENGUE, Chef d'Etablissement (CE) de l'EcoIe
Supérieure de Gestion d'Informatique et des Sciences (ESGIS) Gabon. attestons que :</p>

  <div class="space-y-2 mb-6">
    <p><span class="font-semibold">Nom :</span> ${preinscription.nom}</p>
    <p><span class="font-semibold">Prénom :</span> ${preinscription.prenom}</p>
    <p><span class="font-semibold">Date de naissance :</span> ${preinscription.dateNaissance.toLocaleDateString()}</p>
    <p><span class="font-semibold">Lieu de naissance :</span> ${preinscription.lieuNaissance}</p>
  </div>

  <p class="mb-2">Est préinscrit en :</p>

  <div class="space-y-2 mb-6">
    <p><span class="font-semibold">Niveau :</span> ${preinscription.niveau}
       &nbsp;&nbsp;&nbsp; <span class="font-semibold">Domaine :</span> ${preinscription.domaine}
       &nbsp;&nbsp;&nbsp; <span class="font-semibold">Spécialité :</span> ${preinscription.specialite}</p>
    <p><span class="font-semibold">Série Bac :</span> ${preinscription.serieBac}</p>
    <p>Pour l’année académique ${annee} - ${annee + 1}.</p>
  </div>

  <div class="mt-12">
    <p>Fait à Libreville, le ${new Date().toLocaleDateString()}</p>
    <p class="text-right mt-8 pr-10 font-semibold">Le Chef d'Etablissement</p>
    <p class="text-right mt-8 pr-10 font-semibold">Pr. Daniel Roné AKENDENGUE</p>
    <p class="text-right mt-8 pr-10 font-semibold">P/O le Directeur des Etudes</p>
  </div>
</body>
</html>
  `

    const browser = await puppeteer.launch({headless: true, // ✅ compatible toutes versions
        args: ["--no-sandbox"]
    })
    const page = await browser.newPage()

    await page.setContent(html, { waitUntil: "networkidle0" })
    await page.pdf({ path: outputPath, format: "A4", printBackground: true })
    await browser.close()

    return `/pdfs/${fileName}`
}




export const generateRecuInscriptionPDF = async (
    inscription: {
        id: string;
        anneeScolaire: number;
        filiere: string;
        parcours: string;
        totalAPayer: number;
        paiementEffectue: boolean;
        dateSoumission: Date;
    },
    etudiant: {
        nom: string;
        prenom: string;
        email: string;
    }
): Promise<string> => {
    const doc = new PDFDocument();
    const fileName = `recu_inscription_${inscription.id}.pdf`;
    const outputPath = path.join(__dirname, `../../public/pdfs/${fileName}`);
    const stream = fs.createWriteStream(outputPath);

    doc.pipe(stream);

    doc.fontSize(18).text("REÇU D’INSCRIPTION", { align: "center" });
    doc.moveDown();

    doc.fontSize(12).text(`Nom : ${etudiant.nom}`);
    doc.text(`Prénom : ${etudiant.prenom}`);
    doc.text(`Email : ${etudiant.email}`);
    doc.moveDown();

    doc.text(`Filière : ${inscription.filiere}`);
    doc.text(`Parcours : ${inscription.parcours}`);
    doc.text(`Année scolaire : ${inscription.anneeScolaire}`);
    doc.text(`Total à payer : ${inscription.totalAPayer} FCFA`);
    doc.text(`Paiement effectué : ${inscription.paiementEffectue ? "Oui" : "Non"}`);
    doc.text(`Date d’inscription : ${inscription.dateSoumission.toLocaleDateString()}`);
    doc.moveDown();

    doc.text(`Fait à Libreville, le ${new Date().toLocaleDateString()}`);
    doc.text("Service Administratif", { align: "right" });

    doc.end();

    return new Promise((resolve, reject) => {
        stream.on("finish", () => resolve(`/pdfs/${fileName}`));
        stream.on("error", reject);
    });
};


export const generateRecuReinscriptionPDF = async (
    reinscription: {
        id: string;
        anneeScolaire: number;
        parcours: string;
        totalAPayer: number;
        paiementEffectue: boolean;
        dateSoumission: Date;
    },
    etudiant: {
        nom: string;
        prenom: string;
        email: string;
    }
): Promise<string> => {
    const PDFDocument = require("pdfkit");
    const fs = require("fs");
    const path = require("path");

    const doc = new PDFDocument();
    const fileName = `attestation_inscription_${reinscription.id}.pdf`;
    const outputPath = path.join(__dirname, `../../public/pdfs/${fileName}`);
    const stream = fs.createWriteStream(outputPath);

    doc.pipe(stream);

    doc.fontSize(18).text("ATTESTATION D’INSCRIPTION", { align: "center" });
    doc.moveDown();

    doc.fontSize(12).text(`Nom : ${etudiant.nom}`);
    doc.text(`Prénom : ${etudiant.prenom}`);
    doc.text(`Email : ${etudiant.email}`);
    doc.moveDown();

    doc.text(`Année académique : ${reinscription.anneeScolaire}`);
    doc.text(`Parcours : ${reinscription.parcours}`);
    doc.text(`Total à payer : ${reinscription.totalAPayer} FCFA`);
    doc.text(`Paiement effectué : ${reinscription.paiementEffectue ? "Oui" : "Non"}`);
    doc.text(`Date de réinscription : ${reinscription.dateSoumission.toLocaleDateString()}`);
    doc.moveDown();

    doc.text(`Fait à Libreville, le ${new Date().toLocaleDateString()}`);
    doc.text("Direction des Affaires Académiques", { align: "right" });

    doc.end();

    return new Promise((resolve, reject) => {
        stream.on("finish", () => resolve(`/pdfs/${fileName}`));
        stream.on("error", reject);
    });
};
