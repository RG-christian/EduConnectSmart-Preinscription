/*
  Warnings:

  - Added the required column `lieuNaissance` to the `Etudiant` table without a default value. This is not possible if the table is not empty.
  - Added the required column `niveau` to the `Preinscription` table without a default value. This is not possible if the table is not empty.
  - Added the required column `specialite` to the `Preinscription` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `etudiant` ADD COLUMN `lieuNaissance` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `preinscription` ADD COLUMN `niveau` VARCHAR(191) NOT NULL,
    ADD COLUMN `specialite` VARCHAR(191) NOT NULL;
