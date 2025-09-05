/*
  Warnings:

  - You are about to drop the column `anneeScolaire` on the `preinscription` table. All the data in the column will be lost.
  - You are about to drop the column `etudiantId` on the `preinscription` table. All the data in the column will be lost.
  - You are about to drop the column `statut` on the `preinscription` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `Preinscription` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `dateNaissance` to the `Preinscription` table without a default value. This is not possible if the table is not empty.
  - Added the required column `email` to the `Preinscription` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lieuNaissance` to the `Preinscription` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nom` to the `Preinscription` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prenom` to the `Preinscription` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `preinscription` DROP FOREIGN KEY `Preinscription_etudiantId_fkey`;

-- DropIndex
DROP INDEX `Preinscription_etudiantId_key` ON `preinscription`;

-- AlterTable
ALTER TABLE `preinscription` DROP COLUMN `anneeScolaire`,
    DROP COLUMN `etudiantId`,
    DROP COLUMN `statut`,
    ADD COLUMN `dateNaissance` DATETIME(3) NOT NULL,
    ADD COLUMN `email` VARCHAR(191) NOT NULL,
    ADD COLUMN `lieuNaissance` VARCHAR(191) NOT NULL,
    ADD COLUMN `nom` VARCHAR(191) NOT NULL,
    ADD COLUMN `prenom` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Preinscription_email_key` ON `Preinscription`(`email`);
