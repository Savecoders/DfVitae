/*
  Warnings:

  - Added the required column `description` to the `DetailsProducts` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `DetailsProducts` ADD COLUMN `description` VARCHAR(191) NOT NULL;
