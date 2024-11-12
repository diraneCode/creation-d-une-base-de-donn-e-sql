--
-- Base de données : `centre_formation`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

DROP TABLE IF EXISTS `etudiant`;
CREATE TABLE IF NOT EXISTS `etudiant` (
  `numCINEtud` int NOT NULL AUTO_INCREMENT,
  `nomEtud` text COLLATE utf8mb4_general_ci NOT NULL,
  `prenomEtud` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `dateNaissance` date NOT NULL,
  `adresseEtu` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `niveauEtu` int NOT NULL,
  PRIMARY KEY (`numCINEtud`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formation`
--

DROP TABLE IF EXISTS `formation`;
CREATE TABLE IF NOT EXISTS `formation` (
  `codeForm` int NOT NULL AUTO_INCREMENT,
  `titreForm` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `dureeForm` float NOT NULL,
  `prixForm` float NOT NULL,
  `codeSpec` int NOT NULL,
  PRIMARY KEY (`codeForm`),
  KEY `codeSpec` (`codeSpec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscription`
--

DROP TABLE IF EXISTS `inscription`;
CREATE TABLE IF NOT EXISTS `inscription` (
  `numCINEtu` int NOT NULL,
  `codeSess` int NOT NULL,
  `typeCours` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  KEY `numCINEtu` (`numCINEtu`),
  KEY `codeSess` (`codeSess`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `codeSess` int NOT NULL AUTO_INCREMENT,
  `nomSess` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `dateDebut` date NOT NULL,
  `dateFin` date NOT NULL,
  PRIMARY KEY (`codeSess`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
CREATE TABLE IF NOT EXISTS `specialite` (
  `codeSpec` int NOT NULL AUTO_INCREMENT,
  `nomSpec` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `descSpec` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codeSpec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `formation`
--
ALTER TABLE `formation`
  ADD CONSTRAINT `formation_ibfk_1` FOREIGN KEY (`codeSpec`) REFERENCES `specialite` (`codeSpec`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `inscription`
--
ALTER TABLE `inscription`
  ADD CONSTRAINT `inscription_ibfk_1` FOREIGN KEY (`numCINEtu`) REFERENCES `etudiant` (`numCINEtud`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inscription_ibfk_2` FOREIGN KEY (`codeSess`) REFERENCES `session` (`codeSess`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

