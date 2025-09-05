/*
  Warnings:

  - You are about to drop the `preinscription` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `preinscription`;

-- CreateTable
CREATE TABLE `Acces` (
    `idac` INTEGER NOT NULL,
    `idc` INTEGER NOT NULL,
    `pc` VARCHAR(191) NOT NULL,
    `ip` VARCHAR(191) NOT NULL,
    `os` VARCHAR(191) NULL,
    `pagevisitee` VARCHAR(191) NOT NULL,
    `dateac` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idac`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Anfacdepts` (
    `idanfacdept` INTEGER NOT NULL,
    `idanfac` INTEGER NOT NULL,
    `iddep` INTEGER NOT NULL,
    `idens` INTEGER NULL,

    PRIMARY KEY (`idanfacdept`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Anfacdptniv` (
    `idanfdn` INTEGER NOT NULL,
    `idanfacdept` INTEGER NOT NULL,
    `idnv` INTEGER NOT NULL,
    `semestres` VARCHAR(191) NOT NULL,
    `scolariteo` INTEGER NULL,
    `scolariteno` INTEGER NULL,
    `scolaritei` INTEGER NULL,
    `inscription` INTEGER NULL,
    `scolaritet` INTEGER NULL,

    PRIMARY KEY (`idanfdn`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Anfacdptnvparcs` (
    `idafdnp` INTEGER NOT NULL,
    `idanfdn` INTEGER NOT NULL,
    `idparc` INTEGER NOT NULL,

    PRIMARY KEY (`idafdnp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Anfacdptnvprcmats` (
    `idafdnpm` INTEGER NOT NULL,
    `idafdnp` INTEGER NOT NULL,
    `idm` INTEGER NOT NULL,
    `heure` INTEGER NOT NULL,
    `credit` DOUBLE NOT NULL,
    `semestre` INTEGER NOT NULL,
    `requis` INTEGER NULL,
    `idens` INTEGER NULL,

    PRIMARY KEY (`idafdnpm`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Anneesunivs` (
    `idanuniv` INTEGER NOT NULL,
    `anuniv` VARCHAR(191) NOT NULL,
    `cloture` INTEGER NULL,
    `archive` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idanuniv`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Anonymats` (
    `idano` INTEGER NOT NULL,
    `idanuniv` INTEGER NOT NULL,
    `idins` INTEGER NOT NULL,
    `idcm` INTEGER NOT NULL,
    `unique_code` VARCHAR(191) NOT NULL,
    `session` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idano`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Ansites` (
    `idas` INTEGER NOT NULL,
    `idanuniv` INTEGER NOT NULL,
    `idsit` INTEGER NOT NULL,

    PRIMARY KEY (`idas`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Anunivfacs` (
    `idanfac` INTEGER NOT NULL,
    `idanuniv` INTEGER NOT NULL,
    `idf` INTEGER NOT NULL,

    PRIMARY KEY (`idanfac`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Approdetails` (
    `idapprod` INTEGER NOT NULL,
    `idappro` INTEGER NOT NULL,
    `idar` INTEGER NOT NULL,
    `quantite` INTEGER NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idapprod`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Approvisionnements` (
    `idappro` INTEGER NOT NULL,
    `numappro` VARCHAR(191) NOT NULL,
    `intitule` VARCHAR(191) NULL,
    `fichier` VARCHAR(191) NULL,
    `dateappro` DATETIME(3) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idappro`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Articles` (
    `idar` INTEGER NOT NULL,
    `libelle` VARCHAR(191) NOT NULL,
    `caracteristique` VARCHAR(191) NULL,
    `minima` INTEGER NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idar`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Asbats` (
    `idasb` INTEGER NOT NULL,
    `idas` INTEGER NOT NULL,
    `idbat` INTEGER NOT NULL,
    `genre` VARCHAR(191) NULL,

    PRIMARY KEY (`idasb`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Asbpals` (
    `idasbp` INTEGER NOT NULL,
    `idasb` INTEGER NOT NULL,
    `idpal` INTEGER NOT NULL,

    PRIMARY KEY (`idasbp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Asbpchs` (
    `idasbpc` INTEGER NOT NULL,
    `idasbp` INTEGER NOT NULL,
    `idchb` INTEGER NOT NULL,
    `requisitionnee` INTEGER NULL,

    PRIMARY KEY (`idasbpc`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Avoirs` (
    `idav` INTEGER NOT NULL,
    `idfact` INTEGER NOT NULL,
    `periode` VARCHAR(191) NOT NULL,
    `designation` VARCHAR(191) NOT NULL,
    `montant` INTEGER NOT NULL,
    `abattement` INTEGER NOT NULL,
    `payes` INTEGER NOT NULL,
    `reste` INTEGER NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idav`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Banques` (
    `idb` INTEGER NOT NULL,
    `libb` VARCHAR(191) NOT NULL,
    `archive` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idb`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Batiments` (
    `idbat` INTEGER NOT NULL,
    `batiment` VARCHAR(191) NOT NULL,
    `arch` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idbat`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Categories` (
    `idcat` INTEGER NOT NULL,
    `categorie` VARCHAR(191) NOT NULL,
    `codec` VARCHAR(191) NOT NULL,
    `archive` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idcat`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Chambres` (
    `idchb` INTEGER NOT NULL,
    `chambre` VARCHAR(191) NOT NULL,
    `arch` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idchb`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cheques` (
    `idch` INTEGER NOT NULL,
    `idb` INTEGER NOT NULL,
    `idpaie` INTEGER NOT NULL,
    `numero` VARCHAR(191) NOT NULL,
    `ncd` VARCHAR(191) NULL,
    `etatcheque` VARCHAR(191) NULL,
    `datech` DATETIME(3) NOT NULL,
    `daterejet` DATETIME(3) NULL,
    `motif` VARCHAR(191) NULL,
    `supprime` INTEGER NULL,

    PRIMARY KEY (`idch`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Communications` (
    `idcom` INTEGER NOT NULL,
    `idanuniv` INTEGER NOT NULL,
    `cible` VARCHAR(191) NOT NULL,
    `destinataires` VARCHAR(191) NULL,
    `objet` VARCHAR(191) NOT NULL,
    `message` VARCHAR(191) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idcom`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comptes` (
    `idc` INTEGER NOT NULL,
    `photo` VARCHAR(191) NULL,
    `idpro` INTEGER NOT NULL,
    `dpt` VARCHAR(191) NULL,
    `nom` VARCHAR(191) NOT NULL,
    `prenoms` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `login` VARCHAR(191) NOT NULL,
    `motpass` VARCHAR(191) NOT NULL,
    `active` INTEGER NULL,
    `dateconn` DATETIME(3) NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idc`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comptesetudiants` (
    `idce` INTEGER NOT NULL,
    `ide` INTEGER NOT NULL,
    `matricule` VARCHAR(191) NOT NULL,
    `motpass` VARCHAR(191) NOT NULL,
    `dateconn` DATETIME(3) NULL,
    `active` INTEGER NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idce`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Comptesparents` (
    `idcp` INTEGER NOT NULL,
    `identitep` VARCHAR(191) NOT NULL,
    `professionp` VARCHAR(191) NULL,
    `contactp` VARCHAR(191) NULL,
    `emailp` VARCHAR(191) NULL,
    `identitem` VARCHAR(191) NOT NULL,
    `professionm` VARCHAR(191) NULL,
    `contactm` VARCHAR(191) NULL,
    `emailm` VARCHAR(191) NULL,
    `login` VARCHAR(191) NOT NULL,
    `motpass` VARCHAR(191) NOT NULL,
    `dateconn` DATETIME(3) NULL,
    `active` INTEGER NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idcp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Configmoy` (
    `idcm` INTEGER NOT NULL,
    `idafdnpm` INTEGER NOT NULL,
    `idev` INTEGER NOT NULL,
    `poids` DOUBLE NULL,
    `typoids` VARCHAR(191) NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idcm`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Consultations` (
    `idcons` INTEGER NOT NULL,
    `idanuniv` INTEGER NOT NULL,
    `idc` INTEGER NOT NULL,
    `idpat` INTEGER NOT NULL,
    `numcons` VARCHAR(191) NOT NULL,
    `poids` DOUBLE NOT NULL,
    `temperature` DOUBLE NOT NULL,
    `tension` VARCHAR(191) NOT NULL,
    `frecardiac` INTEGER NOT NULL,
    `declaration` VARCHAR(191) NULL,
    `diagnostic` VARCHAR(191) NULL,
    `decision` VARCHAR(191) NULL,
    `datecons` DATETIME(3) NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idcons`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Contrats` (
    `idcont` INTEGER NOT NULL,
    `contrat` VARCHAR(191) NOT NULL,
    `codect` VARCHAR(191) NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idcont`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Deliberations` (
    `idelib` INTEGER NOT NULL,
    `idafdnpm` INTEGER NOT NULL,
    `idins` INTEGER NOT NULL,
    `idafdnp` INTEGER NOT NULL,
    `semestre` INTEGER NOT NULL,
    `moyenne` DOUBLE NOT NULL,
    `session1` DOUBLE NOT NULL,
    `creditseus` DOUBLE NULL,
    `observation` VARCHAR(191) NULL,
    `datedelib` DATETIME(3) NOT NULL,
    `moyenne2` DOUBLE NULL,
    `session2` DOUBLE NULL,
    `obsess2` VARCHAR(191) NULL,
    `creditseus2` DOUBLE NULL,
    `datesess2` DATETIME(3) NULL,
    `creditsdus` DOUBLE NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idelib`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Delibue` (
    `idelue` INTEGER NOT NULL,
    `idins` INTEGER NOT NULL,
    `idafdnp` INTEGER NULL,
    `idue` INTEGER NOT NULL,
    `semestre` INTEGER NOT NULL,
    `moyenne` DOUBLE NOT NULL,
    `session1` DOUBLE NOT NULL,
    `creditseus` DOUBLE NULL,
    `observation` VARCHAR(191) NULL,
    `datedelib` DATETIME(3) NOT NULL,
    `moyenne2` DOUBLE NULL,
    `session2` DOUBLE NULL,
    `creditseus2` DOUBLE NULL,
    `obsess2` VARCHAR(191) NULL,
    `datesess2` DATETIME(3) NULL,
    `creditsdus` DOUBLE NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idelue`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Departements` (
    `iddep` INTEGER NOT NULL,
    `departement` VARCHAR(191) NOT NULL,
    `code` VARCHAR(191) NOT NULL,
    `archive` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`iddep`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Dettacads` (
    `iddac` INTEGER NOT NULL,
    `ide` INTEGER NOT NULL,
    `idafdnpm` INTEGER NOT NULL,
    `moyenne` DOUBLE NOT NULL,
    `etat` VARCHAR(191) NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`iddac`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Directions` (
    `iddir` INTEGER NOT NULL,
    `direction` VARCHAR(191) NOT NULL,
    `codedir` VARCHAR(191) NOT NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`iddir`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Documents` (
    `iddoc` INTEGER NOT NULL,
    `idform` INTEGER NOT NULL,
    `doc` VARCHAR(191) NOT NULL,
    `fichier` VARCHAR(191) NOT NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`iddoc`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Ecuminmoys` (
    `idemm` INTEGER NOT NULL,
    `idafdnpm` INTEGER NOT NULL,
    `minmoy` DOUBLE NOT NULL,
    `etat` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idemm`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Edocuments` (
    `idedoc` INTEGER NOT NULL,
    `idemp` INTEGER NOT NULL,
    `doc` VARCHAR(191) NOT NULL,
    `fichier` VARCHAR(191) NOT NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idedoc`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Edtbats` (
    `idedtbat` INTEGER NOT NULL,
    `batiment` VARCHAR(191) NOT NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idedtbat`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Emplois` (
    `idemploi` INTEGER NOT NULL,
    `idemp` INTEGER NOT NULL,
    `idserv` INTEGER NOT NULL,
    `idfonct` INTEGER NOT NULL,
    `idcont` INTEGER NOT NULL,
    `idcat` INTEGER NULL,
    `datembauche` DATETIME(3) NOT NULL,
    `classe` INTEGER NULL,
    `echelon` INTEGER NULL,
    `typers` VARCHAR(191) NOT NULL,
    `typens` VARCHAR(191) NULL,
    `grade` VARCHAR(191) NULL,
    `specialite` VARCHAR(191) NULL,
    `datedepart` DATETIME(3) NULL,
    `motif` VARCHAR(191) NULL,
    `declaration` INTEGER NULL,
    `cessation` INTEGER NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idemploi`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Employes` (
    `idemp` INTEGER NOT NULL,
    `matricule` VARCHAR(191) NULL,
    `photo` VARCHAR(191) NULL,
    `numcnss` VARCHAR(191) NULL,
    `xpro` INTEGER NULL,
    `nom` VARCHAR(191) NULL,
    `prenoms` VARCHAR(191) NULL,
    `sexe` VARCHAR(191) NULL,
    `datenaiss` DATETIME(3) NULL,
    `lieunaiss` VARCHAR(191) NULL,
    `religion` VARCHAR(191) NOT NULL,
    `handicap` VARCHAR(191) NULL,
    `matrimo` VARCHAR(191) NULL,
    `epoux` VARCHAR(191) NULL,
    `adresse` VARCHAR(191) NULL,
    `tel` VARCHAR(191) NULL,
    `cel` VARCHAR(191) NULL,
    `email` VARCHAR(191) NULL,
    `pays` VARCHAR(191) NOT NULL,
    `nationalite` VARCHAR(191) NULL,
    `numpid` VARCHAR(191) NULL,
    `naturepid` VARCHAR(191) NULL,
    `datetabpid` DATETIME(3) NULL,
    `autoritepid` VARCHAR(191) NULL,
    `etatcivil` VARCHAR(191) NULL,
    `quartier` VARCHAR(191) NULL,
    `rue` VARCHAR(191) NOT NULL,
    `niveau` VARCHAR(191) NULL,
    `diplome` VARCHAR(191) NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idemp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Enfants` (
    `idenf` INTEGER NOT NULL,
    `idemp` INTEGER NOT NULL,
    `nom` VARCHAR(191) NOT NULL,
    `prenoms` VARCHAR(191) NOT NULL,
    `sexe` VARCHAR(191) NOT NULL,
    `datenaiss` DATETIME(3) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idenf`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Enseignants` (
    `idens` INTEGER NOT NULL,
    `nom` VARCHAR(191) NOT NULL,
    `prenoms` VARCHAR(191) NOT NULL,
    `sexe` VARCHAR(191) NOT NULL,
    `adresse` VARCHAR(191) NULL,
    `tel` VARCHAR(191) NULL,
    `cel` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `categorie` VARCHAR(191) NOT NULL,
    `diplome` VARCHAR(191) NOT NULL,
    `specialite` VARCHAR(191) NULL,
    `grade` VARCHAR(191) NULL,
    `etbservice` VARCHAR(191) NULL,
    `provenance` VARCHAR(191) NULL,
    `employeur` VARCHAR(191) NOT NULL,
    `archive` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idens`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Entreprises` (
    `ident` INTEGER NOT NULL,
    `idtype` INTEGER NOT NULL,
    `idsecteur` INTEGER NOT NULL,
    `rs` VARCHAR(191) NOT NULL,
    `tel` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`ident`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Etudiants` (
    `ide` INTEGER NOT NULL,
    `matricule` VARCHAR(191) NOT NULL,
    `nom` VARCHAR(191) NOT NULL,
    `prenoms` VARCHAR(191) NOT NULL,
    `sexe` VARCHAR(191) NOT NULL,
    `datenaiss` DATETIME(3) NOT NULL,
    `lieunaiss` VARCHAR(191) NOT NULL,
    `identitep` VARCHAR(191) NOT NULL,
    `professionp` VARCHAR(191) NULL,
    `contactp` VARCHAR(191) NOT NULL,
    `emailp` VARCHAR(191) NULL,
    `emailm` VARCHAR(191) NULL,
    `identitem` VARCHAR(191) NOT NULL,
    `professionm` VARCHAR(191) NULL,
    `contactm` VARCHAR(191) NULL,
    `profilbac` VARCHAR(191) NOT NULL,
    `sessionbac` VARCHAR(191) NOT NULL,
    `villebac` VARCHAR(191) NULL,
    `pvbac` VARCHAR(191) NOT NULL,
    `mention` VARCHAR(191) NOT NULL,
    `paysbac` VARCHAR(191) NOT NULL,
    `etaborigin` VARCHAR(191) NOT NULL,
    `adressetab` VARCHAR(191) NULL,
    `archive` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`ide`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Evaluations` (
    `idev` INTEGER NOT NULL,
    `intitule` VARCHAR(191) NOT NULL,
    `arch` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idev`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Examens` (
    `idex` INTEGER NOT NULL,
    `idc` INTEGER NOT NULL,
    `idcons` INTEGER NOT NULL,
    `nature` VARCHAR(191) NOT NULL,
    `designation` VARCHAR(191) NOT NULL,
    `resultats` VARCHAR(191) NULL,
    `decision` VARCHAR(191) NULL,
    `datex` DATETIME(3) NULL,

    PRIMARY KEY (`idex`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Factures` (
    `idfact` INTEGER NOT NULL,
    `ids` INTEGER NOT NULL,
    `numfact` VARCHAR(191) NOT NULL,
    `datefact` DATETIME(3) NOT NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idfact`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Facultes` (
    `idf` INTEGER NOT NULL,
    `fac` VARCHAR(191) NOT NULL,
    `code` VARCHAR(191) NOT NULL,
    `archive` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idf`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Fonctions` (
    `idfonct` INTEGER NOT NULL,
    `fonction` VARCHAR(191) NOT NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idfonct`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Formations` (
    `idform` INTEGER NOT NULL,
    `idins` INTEGER NOT NULL,
    `annee` VARCHAR(191) NOT NULL,
    `niveau` VARCHAR(191) NOT NULL,
    `diplome` VARCHAR(191) NOT NULL,
    `moyenne` VARCHAR(191) NOT NULL,
    `pays` VARCHAR(191) NOT NULL,
    `etablissement` VARCHAR(191) NOT NULL,
    `mention` VARCHAR(191) NULL,
    `sup` INTEGER NULL,

    PRIMARY KEY (`idform`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Hebergements` (
    `idh` INTEGER NOT NULL,
    `idanuniv` INTEGER NOT NULL,
    `ide` INTEGER NOT NULL,
    `numero` VARCHAR(191) NOT NULL,
    `duree` VARCHAR(191) NOT NULL,
    `modepay` VARCHAR(191) NOT NULL,
    `motivation` VARCHAR(191) NOT NULL,
    `autremotive` VARCHAR(191) NULL,
    `etat` INTEGER NULL,
    `avis` VARCHAR(191) NULL,
    `observation` VARCHAR(191) NULL,
    `dateavis` DATETIME(3) NULL,
    `idasbpc` VARCHAR(191) NULL,
    `datechb` DATETIME(3) NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idh`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Horaires` (
    `idh` INTEGER NOT NULL,
    `horaire` VARCHAR(191) NOT NULL,
    `archive` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idh`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Inscriptions` (
    `idins` INTEGER NOT NULL,
    `idanuniv` INTEGER NOT NULL,
    `ide` INTEGER NOT NULL,
    `oriente` INTEGER NULL,
    `noriente` VARCHAR(191) NULL,
    `photo` VARCHAR(191) NULL,
    `pieceid` VARCHAR(191) NOT NULL,
    `npieceid` VARCHAR(191) NOT NULL,
    `matrimo` VARCHAR(191) NOT NULL,
    `nomjeunefille` VARCHAR(191) NULL,
    `religion` VARCHAR(191) NULL,
    `diocese` VARCHAR(191) NULL,
    `diocontacts` VARCHAR(191) NULL,
    `ville` VARCHAR(191) NOT NULL,
    `commune` VARCHAR(191) NOT NULL,
    `quartier` VARCHAR(191) NOT NULL,
    `bp` VARCHAR(191) NULL,
    `contact` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `region` VARCHAR(191) NULL,
    `pays` VARCHAR(191) NOT NULL,
    `nationalite` VARCHAR(191) NOT NULL,
    `boursier` VARCHAR(191) NOT NULL,
    `nombourse` VARCHAR(191) NULL,
    `organisme` VARCHAR(191) NULL,
    `numbourse` VARCHAR(191) NULL,
    `profession` VARCHAR(191) NULL,
    `societe` VARCHAR(191) NULL,
    `ctidentite` VARCHAR(191) NULL,
    `ctprofession` VARCHAR(191) NULL,
    `ctadresse` VARCHAR(191) NULL,
    `ctcel` VARCHAR(191) NULL,
    `ctemail` VARCHAR(191) NULL,
    `ctquartier` VARCHAR(191) NOT NULL,
    `nummaison` VARCHAR(191) NULL,
    `idafdnp` INTEGER NOT NULL,
    `acquis` INTEGER NULL,
    `typeins` VARCHAR(191) NULL,
    `reinscrit` INTEGER NULL,
    `dette` INTEGER NULL,
    `dettecu` VARCHAR(191) NULL,
    `idpreins` INTEGER NULL,
    `idreins` INTEGER NULL,
    `idreinsdet` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,
    `sup` INTEGER NULL,
    `diplomeapbac` VARCHAR(191) NOT NULL,
    `mentiondiplomeapbac` VARCHAR(191) NOT NULL,
    `site` VARCHAR(191) NOT NULL,
    `cntsociete` VARCHAR(191) NOT NULL,
    `canal` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idins`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Matieres` (
    `idm` INTEGER NOT NULL,
    `idue` INTEGER NULL,
    `matiere` VARCHAR(191) NOT NULL,
    `code` VARCHAR(191) NULL,
    `archive` INTEGER NULL,
    `datearch` DATETIME(3) NULL,
    `sup` INTEGER NULL,
    `datesup` DATETIME(3) NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idm`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Messages` (
    `idmsg` INTEGER NOT NULL,
    `message` VARCHAR(191) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idmsg`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Modperms` (
    `idmp` INTEGER NOT NULL,
    `idmo` INTEGER NOT NULL,
    `idperm` INTEGER NOT NULL,
    `codeMP` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idmp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Modules` (
    `idmo` INTEGER NOT NULL,
    `module` VARCHAR(191) NOT NULL,
    `code` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idmo`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Niveaux` (
    `idnv` INTEGER NOT NULL,
    `niveau` VARCHAR(191) NOT NULL,
    `archive` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idnv`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Notes` (
    `idn` INTEGER NOT NULL,
    `idins` INTEGER NOT NULL,
    `note` DOUBLE NULL,
    `observation` VARCHAR(191) NULL,
    `idcm` INTEGER NOT NULL,
    `semestre` INTEGER NOT NULL,
    `idafdnpm` INTEGER NOT NULL,
    `daten` DATETIME(3) NOT NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idn`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Operations` (
    `ido` INTEGER NOT NULL,
    `operation` VARCHAR(191) NOT NULL,
    `archive` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`ido`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Paiements` (
    `idpaie` INTEGER NOT NULL,
    `numrecu` INTEGER NOT NULL,
    `ids` INTEGER NOT NULL,
    `ido` INTEGER NOT NULL,
    `montant` INTEGER NOT NULL,
    `mois` INTEGER NULL,
    `nature` VARCHAR(191) NOT NULL,
    `datepaie` DATETIME(3) NULL,
    `datetrans` DATETIME(3) NULL,
    `piece` VARCHAR(191) NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idpaie`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Paiepreins` (
    `idppaie` INTEGER NOT NULL,
    `idpreins` INTEGER NOT NULL,
    `numrecu` INTEGER NOT NULL,
    `montant` INTEGER NOT NULL,
    `datepaie` DATETIME(3) NULL,
    `piece` VARCHAR(191) NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idppaie`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Paliers` (
    `idpal` INTEGER NOT NULL,
    `palier` VARCHAR(191) NOT NULL,
    `arch` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idpal`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Parcours` (
    `idparc` INTEGER NOT NULL,
    `idpar` INTEGER NULL,
    `code` VARCHAR(191) NULL,
    `libelle` VARCHAR(191) NOT NULL,
    `archive` INTEGER NULL,
    `sup` INTEGER NULL,

    PRIMARY KEY (`idparc`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Patients` (
    `idpat` INTEGER NOT NULL,
    `ide` INTEGER NOT NULL,
    `ethnie` VARCHAR(191) NULL,
    `gsanguin` VARCHAR(191) NULL,
    `maladies` VARCHAR(191) NULL,
    `allergies` VARCHAR(191) NULL,
    `handicap` VARCHAR(191) NULL,
    `etat` INTEGER NULL,
    `datedos` DATETIME(3) NULL,
    `statut` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idpat`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pdocuments` (
    `idpdoc` INTEGER NOT NULL,
    `idpreins` INTEGER NULL,
    `idpform` INTEGER NOT NULL,
    `categorie` VARCHAR(191) NULL,
    `doc` VARCHAR(191) NOT NULL,
    `fichier` VARCHAR(191) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idpdoc`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Permissions` (
    `idperm` INTEGER NOT NULL,
    `permission` VARCHAR(191) NOT NULL,
    `code` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idperm`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pformations` (
    `idpform` INTEGER NOT NULL,
    `idpreins` INTEGER NOT NULL,
    `annee` VARCHAR(191) NOT NULL,
    `niveau` VARCHAR(191) NOT NULL,
    `diplome` VARCHAR(191) NOT NULL,
    `moyenne` VARCHAR(191) NULL,
    `pays` VARCHAR(191) NOT NULL,
    `etablissement` VARCHAR(191) NOT NULL,
    `mention` VARCHAR(191) NULL,
    `sup` INTEGER NULL,

    PRIMARY KEY (`idpform`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Phototheque` (
    `idp` INTEGER NOT NULL,
    `album` VARCHAR(191) NOT NULL,
    `miniature` VARCHAR(191) NOT NULL,
    `dossier` VARCHAR(191) NOT NULL,
    `publier` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Plannings` (
    `idpl` INTEGER NOT NULL,
    `idafdnpm` INTEGER NOT NULL,
    `idsal` INTEGER NOT NULL,
    `jour` VARCHAR(191) NOT NULL,
    `dheure` VARCHAR(191) NOT NULL,
    `fheure` VARCHAR(191) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idpl`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Preinscriptions` (
    `idpreins` INTEGER NOT NULL,
    `idanuniv` INTEGER NOT NULL,
    `oriente` INTEGER NOT NULL,
    `noriente` VARCHAR(191) NULL,
    `numero` VARCHAR(191) NOT NULL,
    `photo` VARCHAR(191) NULL,
    `nom` VARCHAR(191) NOT NULL,
    `prenoms` VARCHAR(191) NOT NULL,
    `nomjeunefille` VARCHAR(191) NULL,
    `sexe` VARCHAR(191) NOT NULL,
    `matrimo` VARCHAR(191) NULL,
    `datenaiss` DATETIME(3) NOT NULL,
    `lieunaiss` VARCHAR(191) NOT NULL,
    `nationalite` VARCHAR(191) NOT NULL,
    `telperso` VARCHAR(191) NOT NULL,
    `telephone_parent` VARCHAR(191) NULL,
    `domicile` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `boursier` VARCHAR(191) NOT NULL,
    `nombourse` VARCHAR(191) NULL,
    `organisme` VARCHAR(191) NULL,
    `numbourse` VARCHAR(191) NULL,
    `bac` VARCHAR(191) NOT NULL,
    `anneebac` VARCHAR(191) NOT NULL,
    `totalpoints` DOUBLE NULL,
    `moybac` DOUBLE NULL,
    `mention` VARCHAR(191) NULL,
    `etaborigin` VARCHAR(191) NULL,
    `pays_bac` VARCHAR(191) NULL,
    `institut` VARCHAR(191) NULL,
    `mention_orientation` VARCHAR(191) NULL,
    `niveau` VARCHAR(191) NULL,
    `specialite` VARCHAR(191) NULL,
    `annee_academique` VARCHAR(191) NULL,
    `idafdnp` INTEGER NOT NULL,
    `acquis` INTEGER NULL,
    `dateaj` DATETIME(3) NOT NULL,
    `inscrit` INTEGER NULL,
    `status` VARCHAR(191) NULL,
    `observation` VARCHAR(191) NULL,
    `archive` INTEGER NULL,
    `sup` INTEGER NULL,
    `online` INTEGER NULL,
    `confirm` INTEGER NULL,

    PRIMARY KEY (`idpreins`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Prescriptions` (
    `idpres` INTEGER NOT NULL,
    `idc` INTEGER NOT NULL,
    `idcons` INTEGER NOT NULL,
    `medicament` VARCHAR(191) NOT NULL,
    `psologie` VARCHAR(191) NOT NULL,
    `quantite` VARCHAR(191) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idpres`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Profils` (
    `idpro` INTEGER NOT NULL,
    `profil` VARCHAR(191) NOT NULL,
    `modules` VARCHAR(191) NOT NULL,
    `droits` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idpro`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Remplacenotes` (
    `idrn` INTEGER NOT NULL,
    `idins` INTEGER NOT NULL,
    `idafdnpm` INTEGER NOT NULL,
    `note` DOUBLE NULL,
    `observation` VARCHAR(191) NULL,
    `semestre` INTEGER NOT NULL,
    `datern` DATETIME(3) NOT NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idrn`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Resultats` (
    `idr` INTEGER NOT NULL,
    `idafdnp` INTEGER NOT NULL,
    `idins` INTEGER NOT NULL,
    `semestre` INTEGER NOT NULL,
    `session` INTEGER NOT NULL,
    `moyenne` DOUBLE NOT NULL,
    `creditseus` DOUBLE NOT NULL,
    `creditsdus` DOUBLE NOT NULL,

    PRIMARY KEY (`idr`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Salles` (
    `idsal` INTEGER NOT NULL,
    `idedtbat` INTEGER NOT NULL,
    `salle` VARCHAR(191) NOT NULL,
    `capacite` INTEGER NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idsal`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Scolarites` (
    `ids` INTEGER NOT NULL,
    `idins` INTEGER NOT NULL,
    `idanfdn` INTEGER NOT NULL,
    `abattement` INTEGER NULL,
    `piece` VARCHAR(191) NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`ids`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Secteurs` (
    `idsecteur` INTEGER NOT NULL,
    `secteur` VARCHAR(191) NOT NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idsecteur`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Seminmoys` (
    `idsemm` INTEGER NOT NULL,
    `idafdnp` INTEGER NOT NULL,
    `minmoy` DOUBLE NULL,
    `tcredits` DOUBLE NULL,
    `etat` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idsemm`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Services` (
    `idserv` INTEGER NOT NULL,
    `iddir` INTEGER NOT NULL,
    `service` VARCHAR(191) NOT NULL,
    `codeserv` VARCHAR(191) NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idserv`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sites` (
    `idsit` INTEGER NOT NULL,
    `site` VARCHAR(191) NOT NULL,
    `arch` INTEGER NULL,
    `sup` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idsit`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sms` (
    `idsms` INTEGER NOT NULL,
    `idmsg` INTEGER NOT NULL,
    `destinataire` INTEGER NOT NULL,
    `cel` VARCHAR(191) NOT NULL,
    `categorie` VARCHAR(191) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idsms`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sortiesarticles` (
    `idsar` INTEGER NOT NULL,
    `idserv` INTEGER NOT NULL,
    `idemp` INTEGER NOT NULL,
    `numsort` VARCHAR(191) NOT NULL,
    `intitule` VARCHAR(191) NULL,
    `fichier` VARCHAR(191) NULL,
    `datesort` DATETIME(3) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idsar`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sortiesdetails` (
    `idsard` INTEGER NOT NULL,
    `idsar` INTEGER NOT NULL,
    `idar` INTEGER NOT NULL,
    `quantite` INTEGER NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idsard`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Stages` (
    `idstage` INTEGER NOT NULL,
    `ident` INTEGER NOT NULL,
    `idins` INTEGER NOT NULL,
    `ddate` DATETIME(3) NOT NULL,
    `fdate` DATETIME(3) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idstage`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Stocks` (
    `idsto` INTEGER NOT NULL,
    `idar` INTEGER NOT NULL,
    `quantite` INTEGER NOT NULL,

    PRIMARY KEY (`idsto`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Suivicours` (
    `idsc` INTEGER NOT NULL,
    `idafdnpm` INTEGER NOT NULL,
    `heure` INTEGER NOT NULL,
    `comment` VARCHAR(191) NULL,
    `dates` DATETIME(3) NOT NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idsc`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Typentreprises` (
    `idtype` INTEGER NOT NULL,
    `type` VARCHAR(191) NOT NULL,
    `arch` INTEGER NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idtype`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Valdeliberations` (
    `idvelib` INTEGER NOT NULL,
    `idafdnp` INTEGER NOT NULL,
    `idafdnpm` INTEGER NOT NULL,
    `idpreins` INTEGER NOT NULL,
    `semestre` INTEGER NOT NULL,
    `moyenne` DOUBLE NOT NULL,
    `session1` DOUBLE NOT NULL,
    `creditseus` DOUBLE NOT NULL,
    `creditsdus` DOUBLE NOT NULL,
    `observation` VARCHAR(191) NULL,
    `datedelib` DATETIME(3) NOT NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idvelib`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Valdelibue` (
    `idvelue` INTEGER NOT NULL,
    `idpreins` INTEGER NOT NULL,
    `idafdnp` INTEGER NULL,
    `idue` INTEGER NOT NULL,
    `semestre` INTEGER NOT NULL,
    `moyenne` DOUBLE NOT NULL,
    `session1` DOUBLE NOT NULL,
    `creditseus` DOUBLE NULL,
    `creditsdus` DOUBLE NULL,
    `observation` VARCHAR(191) NULL,
    `datedelib` DATETIME(3) NOT NULL,
    `dateaj` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idvelue`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Valresultats` (
    `idvr` INTEGER NOT NULL,
    `idafdnp` INTEGER NOT NULL,
    `idpreins` INTEGER NOT NULL,
    `semestre` INTEGER NOT NULL,
    `session` INTEGER NOT NULL,
    `moyenne` DOUBLE NOT NULL,
    `creditseus` DOUBLE NOT NULL,
    `creditsdus` DOUBLE NOT NULL,

    PRIMARY KEY (`idvr`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Varchetudiants` (
    `idc` INTEGER NOT NULL,
    `idcons` INTEGER NOT NULL,
    `decision` VARCHAR(191) NULL,
    `datevis` DATETIME(3) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idc`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Visiteurs` (
    `idvist` INTEGER NOT NULL,
    `idh` INTEGER NOT NULL,
    `pieceid` VARCHAR(191) NOT NULL,
    `npieceid` VARCHAR(191) NOT NULL,
    `lienp` VARCHAR(191) NOT NULL,
    `nom` VARCHAR(191) NOT NULL,
    `prenoms` VARCHAR(191) NOT NULL,
    `harrive` VARCHAR(191) NOT NULL,
    `hdepart` VARCHAR(191) NULL,
    `datevis` DATETIME(3) NOT NULL,
    `dateaj` DATETIME(3) NULL,

    PRIMARY KEY (`idvist`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- RenameIndex
ALTER TABLE `document` RENAME INDEX `Document_inscriptionId_fkey` TO `Document_inscriptionId_idx`;

-- RenameIndex
ALTER TABLE `document` RENAME INDEX `Document_reinscriptionId_fkey` TO `Document_reinscriptionId_idx`;

-- RenameIndex
ALTER TABLE `pdf` RENAME INDEX `PDF_etudiantId_fkey` TO `PDF_etudiantId_idx`;
