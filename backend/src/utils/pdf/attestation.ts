import puppeteer from "puppeteer";
import path from "path";
import fs from "fs";

/**
 * Génère un PDF d’attestation à partir d’un template HTML
 * @param data Données nécessaires (nom, prenom, etc.)
 * @returns chemin du fichier PDF généré
 */
export async function generateAttestationPDF(data: any): Promise<string | null> {
    try {
        // Créer dossier si nécessaire
        const outDir = path.join(process.cwd(), "public", "pdf");
        if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });

        const timestamp = Date.now();
        const fileName = `attestation_${data.nom?.toLowerCase()}_${data.prenoms?.toLowerCase()}_${timestamp}.pdf`;
        const filePath = path.join(outDir, fileName);

        // --- Construire le HTML (ici inline, mais tu peux charger un fichier .html) ---
        const html = `
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <style>
    body { font-family: Arial, sans-serif; margin: 50px; }
    h1 { text-align: center; text-decoration: underline; }
    .header { text-align: center; margin-bottom: 20px; }
    .info { margin: 20px 0; }
    .signature { margin-top: 50px; text-align: right; }
    .footer { margin-top: 60px; text-align: center; font-size: 10px; }
  </style>
</head>
<body>
  <div class="header">
    <img src="https://www.esgis.org/logo.png" alt="ESGIS" width="120" />
    <h1>ATTESTATION DE PRÉINSCRIPTION</h1>
  </div>

  <p>Je soussigné <b>M. TENDAR Koffi Adomayakpo</b>, Directeur Exécutif de l’École Supérieure de Gestion d’Informatique et des Sciences (E.S.G.I.S.), atteste par la présente que le nommé :</p>

  <div class="info">
    <p><b>Nom :</b> ${data.nom}</p>
    <p><b>Prénoms :</b> ${data.prenoms}</p>
    <p><b>Né le :</b> ${new Date(data.datenaiss).toLocaleDateString("fr-FR")} à ${data.lieunaiss} (${data.nationalite})</p>
  </div>

  <p>est préinscrit dans notre institution pour le compte de l’année académique <b>${data.annee_academique}</b>,
     sous le numéro matricule provisoire <b>${data.numero}</b> en <b>${data.niveau}</b>,
     dans la spécialité <b>${data.specialite}</b>, du domaine des <b>${data.domaine ?? "Sciences et Technologies"}</b>.</p>

  <p>En foi de quoi, la présente attestation lui est délivrée pour servir et valoir ce que de droit.</p>

  <div class="signature">
    <p>Fait à Libreville, le ${new Date().toLocaleDateString("fr-FR")}</p>
    <p><b>LE DIRECTEUR EXECUTIF</b></p>
    <p>M. TENDAR Koffi Adomayakpo</p>
  </div>

  <div class="footer">
    Document généré automatiquement – EduConnect Smart
  </div>
</body>
</html>
    `;

        // --- Génération PDF avec Puppeteer ---
        const browser = await puppeteer.launch({
            headless: "new", // ou true
            args: ["--no-sandbox", "--disable-setuid-sandbox"]
        });
        const page = await browser.newPage();
        await page.setContent(html, { waitUntil: "networkidle0" });

        await page.pdf({
            path: filePath,
            format: "A4",
            printBackground: true,
        });

        await browser.close();
        return filePath;
    } catch (e) {
        console.error("Erreur génération PDF:", e);
        return null;
    }
}
