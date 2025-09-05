-- CreateTable
CREATE TABLE `Etudiant` (
    `id` VARCHAR(191) NOT NULL,
    `nom` VARCHAR(191) NOT NULL,
    `prenom` VARCHAR(191) NOT NULL,
    `dateNaissance` DATETIME(3) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `telephone` VARCHAR(191) NOT NULL,
    `motDePasse` VARCHAR(191) NOT NULL,
    `statutEtudiant` VARCHAR(191) NOT NULL,
    `statutFinancement` VARCHAR(191) NOT NULL,
    `boursier` BOOLEAN NOT NULL,
    `serieBac` VARCHAR(191) NOT NULL,
    `domaine` VARCHAR(191) NOT NULL,
    `filiere` VARCHAR(191) NOT NULL,
    `anneeInscription` INTEGER NOT NULL,
    `parcours` VARCHAR(191) NOT NULL,
    `uniforme` BOOLEAN NOT NULL,
    `fraisAnnexesPayes` BOOLEAN NOT NULL,
    `statutDossier` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Etudiant_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Preinscription` (
    `id` VARCHAR(191) NOT NULL,
    `etudiantId` VARCHAR(191) NOT NULL,
    `anneeScolaire` INTEGER NOT NULL,
    `domaine` VARCHAR(191) NOT NULL,
    `serieBac` VARCHAR(191) NOT NULL,
    `statut` VARCHAR(191) NOT NULL,
    `dateSoumission` DATETIME(3) NOT NULL,
    `attestationPDF` VARCHAR(191) NULL,

    UNIQUE INDEX `Preinscription_etudiantId_key`(`etudiantId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Inscription` (
    `id` VARCHAR(191) NOT NULL,
    `etudiantId` VARCHAR(191) NOT NULL,
    `anneeScolaire` INTEGER NOT NULL,
    `filiere` VARCHAR(191) NOT NULL,
    `parcours` VARCHAR(191) NOT NULL,
    `statutFinancement` VARCHAR(191) NOT NULL,
    `fraisInscription` DOUBLE NOT NULL,
    `fraisAnnexes` DOUBLE NOT NULL,
    `uniformeChoisi` BOOLEAN NOT NULL,
    `fraisUniforme` DOUBLE NOT NULL,
    `totalAPayer` DOUBLE NOT NULL,
    `paiementEffectue` BOOLEAN NOT NULL,
    `dateSoumission` DATETIME(3) NOT NULL,
    `statut` VARCHAR(191) NOT NULL,
    `ficheInscriptionPDF` VARCHAR(191) NULL,

    UNIQUE INDEX `Inscription_etudiantId_key`(`etudiantId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Reinscription` (
    `id` VARCHAR(191) NOT NULL,
    `etudiantId` VARCHAR(191) NOT NULL,
    `anneeScolaire` INTEGER NOT NULL,
    `parcours` VARCHAR(191) NOT NULL,
    `statutFinancement` VARCHAR(191) NOT NULL,
    `uniformeChoisi` BOOLEAN NOT NULL,
    `fraisAnnexes` DOUBLE NOT NULL,
    `fraisUniforme` DOUBLE NOT NULL,
    `totalAPayer` DOUBLE NOT NULL,
    `paiementEffectue` BOOLEAN NOT NULL,
    `dateSoumission` DATETIME(3) NOT NULL,
    `statut` VARCHAR(191) NOT NULL,
    `ficheReinscriptionPDF` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Document` (
    `id` VARCHAR(191) NOT NULL,
    `inscriptionId` VARCHAR(191) NULL,
    `reinscriptionId` VARCHAR(191) NULL,
    `type` VARCHAR(191) NOT NULL,
    `url` VARCHAR(191) NOT NULL,
    `dateDepot` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PDF` (
    `id` VARCHAR(191) NOT NULL,
    `etudiantId` VARCHAR(191) NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `url` VARCHAR(191) NOT NULL,
    `anneeScolaire` INTEGER NOT NULL,
    `dateGeneration` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Administrateur` (
    `id` VARCHAR(191) NOT NULL,
    `nom` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `motDePasse` VARCHAR(191) NOT NULL,
    `role` VARCHAR(191) NOT NULL,
    `actif` BOOLEAN NOT NULL,
    `dernierAcces` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Administrateur_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Preinscription` ADD CONSTRAINT `Preinscription_etudiantId_fkey` FOREIGN KEY (`etudiantId`) REFERENCES `Etudiant`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Inscription` ADD CONSTRAINT `Inscription_etudiantId_fkey` FOREIGN KEY (`etudiantId`) REFERENCES `Etudiant`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reinscription` ADD CONSTRAINT `Reinscription_etudiantId_fkey` FOREIGN KEY (`etudiantId`) REFERENCES `Etudiant`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Document` ADD CONSTRAINT `Document_inscriptionId_fkey` FOREIGN KEY (`inscriptionId`) REFERENCES `Inscription`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Document` ADD CONSTRAINT `Document_reinscriptionId_fkey` FOREIGN KEY (`reinscriptionId`) REFERENCES `Reinscription`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PDF` ADD CONSTRAINT `PDF_etudiantId_fkey` FOREIGN KEY (`etudiantId`) REFERENCES `Etudiant`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
