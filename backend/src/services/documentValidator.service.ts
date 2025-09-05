import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

export function getDocumentsRequis(profil: { statutEtudiant: string; boursier: boolean }): string[] {
    const deBase = [
        "demande_manuscrite",
        "acte_naissance",
        "carte_identite",
        "photos_identite",
        "baccalaureat",
        "dernier_diplome",
        "releves_notes",
        "certificat_medical"
    ];

    if (profil.statutEtudiant === "ancien") {
        deBase.push("recu_inscription");
        if (profil.boursier) {
            deBase.push("attestation_bourse");
        }
    }

    return deBase;
}



export async function updateDocumentsComplets(inscriptionId: string): Promise<void> {
    const inscription = await prisma.inscription.findUnique({
        where: { id: inscriptionId },
        include: {
            etudiant: true,
            documents: true
        }
    });

    if (!inscription) return;

    const requis = getDocumentsRequis({
        statutEtudiant: inscription.etudiant.statutEtudiant,
        boursier: inscription.etudiant.boursier
    });

    const fournis = inscription.documents.map(doc => doc.type);
    const complet = requis.every(type => fournis.includes(type));

    await prisma.inscription.update({
        where: { id: inscriptionId },
        data: { documentsComplets: complet }
    });
}

