/*
  Warnings:

  - You are about to drop the column `email` on the `preinscription` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `Preinscription_email_key` ON `preinscription`;

-- AlterTable
ALTER TABLE `preinscription` DROP COLUMN `email`;
