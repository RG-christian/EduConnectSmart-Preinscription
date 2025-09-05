/*
  Warnings:

  - The primary key for the `preinscriptions` table will be changed. If it partially fails, the table could be left without primary key constraint.

*/
-- AlterTable
ALTER TABLE `preinscriptions` DROP PRIMARY KEY,
    MODIFY `idpreins` BIGINT NOT NULL,
    MODIFY `boursier` VARCHAR(191) NULL,
    MODIFY `idafdnp` BIGINT NOT NULL,
    MODIFY `dateaj` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    MODIFY `observation` TEXT NULL,
    ADD PRIMARY KEY (`idpreins`);
