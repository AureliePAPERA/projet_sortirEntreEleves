-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 11 mai 2021 à 11:06
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sortir`
--

-- --------------------------------------------------------

--
-- Structure de la table `campus`
--

DROP TABLE IF EXISTS `campus`;
CREATE TABLE IF NOT EXISTS `campus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `campus`
--

INSERT INTO `campus` (`id`, `nom`) VALUES
(5, 'Nantes'),
(6, 'Rennes'),
(7, 'Quimper'),
(8, 'En ligne');

-- --------------------------------------------------------

--
-- Structure de la table `etat`
--

DROP TABLE IF EXISTS `etat`;
CREATE TABLE IF NOT EXISTS `etat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
(7, 'Créée'),
(8, 'Ouverte'),
(9, 'Clôturée'),
(10, 'Activité en cours'),
(11, 'Passée'),
(12, 'Annulée');

-- --------------------------------------------------------

--
-- Structure de la table `lieu`
--

DROP TABLE IF EXISTS `lieu`;
CREATE TABLE IF NOT EXISTS `lieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ville_id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rue` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2F577D59A73F0036` (`ville_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lieu`
--

INSERT INTO `lieu` (`id`, `ville_id`, `nom`, `rue`, `latitude`, `longitude`) VALUES
(2, 1, 'Parc de la Gaudinière', 'Boulevard Robert Schuman', 47.244435, -1.579519),
(3, 5, 'Musée Jacques Cartier', 'Rue David Macdonald Stewart', 48.673851, -1.966569),
(4, 6, 'Restaurant le Globe', 'Boulevard Amiral de Kerguelen', 47.995531, -4.097494),
(5, 9, 'Cité des sciences', 'Avenue Corentin Cariou', NULL, NULL),
(6, 2, 'Plage de la fontaine', 'Chemin des Noëlles', 47.09963, -2.07153),
(7, 7, 'Océanopolis', 'Port de Plaisance du Moulin Blanc', 48.391815, -4.431913),
(8, 1, 'Les machines de l\'île', 'Boulevard Léon Bureau', NULL, NULL),
(9, 1, 'Musée Jules Verne', 'Rue de l\'Hermitage', 47.202343, -1.576653),
(10, 4, 'Parc du Thabor', 'Place Saint-Mélaine', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `participant`
--

DROP TABLE IF EXISTS `participant`;
CREATE TABLE IF NOT EXISTS `participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campus_id` int(11) NOT NULL,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `administrateur` tinyint(1) NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D79F6B11F85E0677` (`username`),
  UNIQUE KEY `UNIQ_D79F6B117E9E4C8C` (`photo_id`),
  KEY `IDX_D79F6B11AF5D55E1` (`campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `participant`
--

INSERT INTO `participant` (`id`, `campus_id`, `nom`, `prenom`, `telephone`, `password`, `administrateur`, `actif`, `username`, `email`, `photo_id`) VALUES
(3, 6, 'Épéril', 'Astérix', '04.05.06.07.08', '$argon2id$v=19$m=65536,t=4,p=1$YjRNZzFodEw3Si4xRzFqbA$hJ1XS0PvmNzHr+dzh8neMRJi6moIsD4Yx2JOywBpVrs', 0, 1, 'aeperil', 'aeperil@campus-rennes.com', NULL),
(4, 5, 'Connerie', 'Arétha', NULL, '$argon2id$v=19$m=65536,t=4,p=1$ZkZBanl3QTF1UmpJeWcyeA$0enQQ3/cKkVJbkhcFzeT9zBteTg2IXqqLtTstqvxcYc', 0, 1, 'aconnerie', 'aconnerie@campus-nantes.com', 6),
(5, 7, 'Kent', 'Bowie', NULL, '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'bkent', 'bkent@campus-quimper.com', NULL),
(6, 7, 'Hyère', 'Claire', '06.05.04.03.02', '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'chyere', 'chyere@campus-quimper.com', NULL),
(8, 7, 'Lapêche', 'Ella', '07.08.09.10.11', '$argon2id$v=19$m=65536,t=4,p=1$NDVScThSUEJEYjJ5cktoWQ$V5TjuFjjqHxtyO8DUUEDu3Ov6qxd/bMcETR/trcpZGk', 0, 1, 'elapeche', 'elapache@campus-quimper.com', NULL),
(9, 8, 'Manvussa', 'Gérard', NULL, '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'gmanvussa', 'gmanvussa@campus-enligne.com', NULL),
(11, 5, 'Cover', 'Harry', '05.87.34.96.34', '$argon2id$v=19$m=65536,t=4,p=1$Zm9rNi92Ty9WcHZJNXdiaw$y2UsyfTYu22iCEnzGcJAVZBnT28UVesJwvkrDi6AzAE', 0, 1, 'hcover', 'hcover@campus-nantes.com', 5),
(12, 8, 'Xellere', 'Jacques', NULL, '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'jxellere', 'jxellere@campus-enligne.com', NULL),
(13, 6, 'Némard', 'Jean', '03.02.01.09.08', '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'jnemard', 'jnemard@campus-rennes.com', NULL),
(14, 7, 'Diote', 'Kelly', NULL, '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'kdiote', 'kdiote@campus-quimper.com', NULL),
(15, 8, 'Masse', 'Lara', NULL, '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'lmasse', 'lmasse@campus-enligne.com', NULL),
(16, 7, 'Fer', 'Lucie', '06.12.15.13.16', '$argon2id$v=19$m=65536,t=4,p=1$LmdNWkRzeHNDa2VJVmYvRg$erQLDkw6/y/tiUWmavLTXlVJOWpJoUKneZlQG0uM5gA', 0, 1, 'lfer', 'lfer@campus-quimper.com', 3),
(17, 8, 'Ateur', 'Nordine', NULL, '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'nateur', 'nateur@campus-enligne.com', NULL),
(18, 6, 'Roïd', 'Paula', NULL, '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'proid', 'proid@campus-rennes.com', NULL),
(19, 5, 'Fasol', 'Remy', NULL, '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'rfasol', 'rfasol@campus-nantes.com', NULL),
(20, 7, 'Vigote', 'Sarah', '02.42.12.65.87', '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'svigote', 'svigote@campus-quimper.com', NULL),
(21, 6, 'Dicule', 'Terry', NULL, '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'tdicule', 'tdicule@campus-rennes.com', NULL),
(22, 5, 'Égérie', 'Tom', NULL, '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 0, 1, 'tegerie', 'tegerie@campus-nantes.com', NULL),
(23, 8, 'Bourdin', 'Camille', NULL, '$argon2id$v=19$m=65536,t=4,p=1$M3ZvQS4yYjRQcy5rVmZ0Rw$LBgnwEWHGUjEHGmjO6fANNWN8XHgf42pn1kho3dEUpQ', 1, 1, 'cbourdin', 'cbourdin@campus-enligne.com', 8),
(24, 8, 'Papèra', 'Aurélie', NULL, '$argon2id$v=19$m=65536,t=4,p=1$azVrRkF3VFY0emdPQlpPSA$rCYHcSd9TUk3CUrE1OKpUULnmdU8MtTRONYENe4uJqk', 1, 1, 'apapera', 'apapera@campus-enligne.com', NULL),
(25, 8, 'Wayne', 'Bruce', NULL, '$argon2id$v=19$m=65536,t=4,p=1$T1B1OHVZUFJ1eTJ0NG9JVw$/KE+owuR+ur2u5teXANnczrCKzI9ESXIY9wN5ReXy4k', 0, 1, 'Batman', 'bwayne@campus-enligne.com', 9);

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

DROP TABLE IF EXISTS `photo`;
CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `photo`
--

INSERT INTO `photo` (`id`, `nom`) VALUES
(1, '036c526d8c3cdf2c9af5e3dbaf831b1a.jpg'),
(2, '5ecfeace7f019058294ddae8700d3fed.jpg'),
(3, '346057362e1f750a52490699f323f8a6.jpg'),
(4, '23a1e44b9ff05b3cc5716e9340229faa.jpg'),
(5, '35c3ac0aba4b4e0f3d1eceecc7fa76c3.jpg'),
(6, '2fb66b184ecd3c6da5ef43aed0347964.jpg'),
(7, '43581bc75e36157d3c60e36b45a35e60.png'),
(8, '59af148e98698a7fe8a8107d559d19a8.jpg'),
(9, '4ef9bf2d6f767ce8a3c62ae3dae2270a.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sortie`
--

DROP TABLE IF EXISTS `sortie`;
CREATE TABLE IF NOT EXISTS `sortie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etat_id` int(11) NOT NULL,
  `lieu_id` int(11) NOT NULL,
  `site_organisateur_id` int(11) NOT NULL,
  `organisateur_id` int(11) NOT NULL,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_heure_debut` datetime NOT NULL,
  `duree` int(11) DEFAULT NULL,
  `date_limite_inscription` datetime NOT NULL,
  `nb_inscriptions_max` int(11) NOT NULL,
  `infos_sortie` longtext COLLATE utf8mb4_unicode_ci,
  `motif_annulation` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_3C3FD3F2D5E86FF` (`etat_id`),
  KEY `IDX_3C3FD3F26AB213CC` (`lieu_id`),
  KEY `IDX_3C3FD3F2D7AC6C11` (`site_organisateur_id`),
  KEY `IDX_3C3FD3F2D936B2FA` (`organisateur_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sortie`
--

INSERT INTO `sortie` (`id`, `etat_id`, `lieu_id`, `site_organisateur_id`, `organisateur_id`, `nom`, `date_heure_debut`, `duree`, `date_limite_inscription`, `nb_inscriptions_max`, `infos_sortie`, `motif_annulation`) VALUES
(2, 9, 2, 5, 4, 'Pique-nique', '2021-04-24 12:07:17', 180, '2021-04-17 14:07:17', 20, 'Petit-pique nique pour se détendre et fêter l\'arrivée des beaux jours', NULL),
(3, 9, 3, 6, 3, 'Musée Jacques Cartier', '2021-04-14 10:23:23', 120, '2021-04-12 14:23:23', 10, 'Pour les aspirants navigateurs', NULL),
(4, 9, 7, 7, 8, 'Virée à Océanopolis', '2021-04-10 14:00:23', 90, '2021-04-09 14:00:23', 6, 'Venez admirer les créatures de la mer :)', NULL),
(5, 12, 4, 7, 14, 'Sortie gastronomique', '2021-04-17 12:30:58', 120, '2021-04-15 14:34:58', 5, 'Avis à tous les gourmets miam miam', 'Ben... Covid !'),
(6, 11, 8, 5, 19, 'Parc d\'attractions', '2021-03-06 14:34:58', 360, '2021-03-04 14:34:58', 10, 'Sensations fortes garanties ', NULL),
(7, 11, 10, 8, 21, 'Projet Symfony', '2021-03-29 14:39:25', 20160, '2021-03-26 14:39:25', 4, 'Tu veux faire partie d\'une dream team et travailler au soleil en pleine nature OKLM ? Alors rejoins-nous pour le projet Symfony !', NULL),
(8, 11, 6, 8, 11, 'Vamos à la playa', '2021-04-07 14:43:17', 720, '2021-03-31 14:43:17', 30, 'YOLO on va passer une journée à la plage en semaine ?', NULL),
(9, 9, 10, 7, 16, 'Chasse aux oeufs de Pâques', '2021-04-10 10:28:12', 90, '2021-04-09 08:28:12', 3, 'Il n\'est jamais trop tard pour manger du chocolat', NULL),
(10, 11, 5, 8, 23, 'Expo à la Cité des Sciences', '2021-03-24 12:00:18', 180, '2021-03-20 10:00:18', 10, 'Sans commentaire', NULL),
(11, 7, 2, 5, 4, 'Atelier tricot', '2021-04-12 16:00:47', 120, '2021-04-11 16:01:47', 6, 'Puisque on est destiné à vivre cloîtré, autant apprendre à faire des trucs utiles !', NULL),
(12, 9, 2, 5, 11, 'Pétanque', '2021-04-12 16:00:00', 90, '2021-04-10 18:00:00', 5, 'blabla', NULL),
(13, 7, 9, 7, 16, 'Musée Jules Vernes', '2021-04-25 15:00:00', 120, '2021-04-20 00:00:00', 6, '20 mille lieues de confinement', NULL),
(14, 7, 2, 8, 25, 'Séance de yoga', '2021-05-09 14:00:00', 120, '2021-05-05 00:00:00', 6, 'C\'est important de rester souple et de se relaxer !', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `sortie_participant`
--

DROP TABLE IF EXISTS `sortie_participant`;
CREATE TABLE IF NOT EXISTS `sortie_participant` (
  `sortie_id` int(11) NOT NULL,
  `participant_id` int(11) NOT NULL,
  PRIMARY KEY (`sortie_id`,`participant_id`),
  KEY `IDX_E6D4CDADCC72D953` (`sortie_id`),
  KEY `IDX_E6D4CDAD9D1C3019` (`participant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sortie_participant`
--

INSERT INTO `sortie_participant` (`sortie_id`, `participant_id`) VALUES
(2, 3),
(2, 4),
(2, 25),
(3, 4),
(3, 15),
(3, 16),
(3, 17),
(3, 25),
(4, 16),
(6, 9),
(6, 12),
(8, 3),
(8, 6),
(8, 16),
(8, 17),
(9, 16);

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_postal` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id`, `nom`, `code_postal`) VALUES
(1, 'Nantes', '44000'),
(2, 'Pornic', '44210'),
(3, 'Guérande', '44350'),
(4, 'Rennes', '35000'),
(5, 'Saint-Malo', '35400'),
(6, 'Quimper', '29000'),
(7, 'Brest', '29200'),
(8, 'Concarneau', '29900'),
(9, 'Paris', '75000'),
(10, 'Toulouse', '33000');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `lieu`
--
ALTER TABLE `lieu`
  ADD CONSTRAINT `FK_2F577D59A73F0036` FOREIGN KEY (`ville_id`) REFERENCES `ville` (`id`);

--
-- Contraintes pour la table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `FK_D79F6B117E9E4C8C` FOREIGN KEY (`photo_id`) REFERENCES `photo` (`id`),
  ADD CONSTRAINT `FK_D79F6B11AF5D55E1` FOREIGN KEY (`campus_id`) REFERENCES `campus` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `participant` (`id`);

--
-- Contraintes pour la table `sortie`
--
ALTER TABLE `sortie`
  ADD CONSTRAINT `FK_3C3FD3F26AB213CC` FOREIGN KEY (`lieu_id`) REFERENCES `lieu` (`id`),
  ADD CONSTRAINT `FK_3C3FD3F2D5E86FF` FOREIGN KEY (`etat_id`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `FK_3C3FD3F2D7AC6C11` FOREIGN KEY (`site_organisateur_id`) REFERENCES `campus` (`id`),
  ADD CONSTRAINT `FK_3C3FD3F2D936B2FA` FOREIGN KEY (`organisateur_id`) REFERENCES `participant` (`id`);

--
-- Contraintes pour la table `sortie_participant`
--
ALTER TABLE `sortie_participant`
  ADD CONSTRAINT `FK_E6D4CDAD9D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_E6D4CDADCC72D953` FOREIGN KEY (`sortie_id`) REFERENCES `sortie` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
