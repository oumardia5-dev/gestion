-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 13 mars 2026 à 11:48
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestion-tache`
--

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260301162925', '2026-03-01 17:31:16', 2216);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `task`
--

INSERT INTO `task` (`id`, `title`, `description`, `status`) VALUES
(12, 'Solide', 'La programmation SOLID est un ensemble de cinq principes utilisés en programmation orientée objet pour améliorer la qualité du code. Ces principes permettent de concevoir des applications plus claires, flexibles et faciles à maintenir en encourageant l’utilisation de classes ayant une seule responsabilité, l’utilisation d’interfaces et la réduction des dépendances entre les différentes parties d’un programme. Grâce à ces règles, le code devient plus organisé et plus facile à faire évoluer', 'Terminé'),
(13, 'ingénieur logiciel', 'Un ingénieur logiciel est un professionnel spécialisé dans la conception, le développement, le test et la maintenance des logiciels. Il applique des méthodes d’ingénierie pour créer des applications fiables, performantes et faciles à maintenir. Son travail consiste à analyser les besoins des utilisateurs, concevoir l’architecture du logiciel, écrire le code, corriger les erreurs et améliorer les fonctionnalités au fil du temps.', 'Terminé'),
(14, 'Audio visuel', 'L’audiovisuel désigne l’ensemble des techniques et des moyens qui permettent de combiner l’image et le son pour transmettre une information ou raconter une histoire. Il regroupe des domaines comme le cinéma, la télévision, la vidéo, la radio et la production multimédia. L’audiovisuel est utilisé pour informer, éduquer, divertir ou communiquer à travers différents supports, par exemple dans les films, les émissions télévisées ou les contenus diffusés sur des plateformes comme YouTube et Netflix. 🎬🎧', 'Terminé'),
(15, 'web mobile', 'Le web mobile désigne le développement et l’utilisation de sites web et d’applications accessibles depuis des appareils mobiles comme les smartphones et les tablettes. Il permet aux utilisateurs de naviguer sur Internet, d’accéder à des services en ligne et d’utiliser différentes fonctionnalités adaptées aux petits écrans et aux connexions mobiles. Le web mobile utilise des technologies comme HTML, CSS, JavaScript et des frameworks web pour créer des interfaces rapides, responsives et faciles à utiliser sur mobile. 📱💻', 'Terminé'),
(16, 'web full-stack', 'Le développement web full-stack désigne la capacité d’un développeur à travailler à la fois sur le front-end (la partie visible par l’utilisateur, comme l’interface d’un site web) et sur le back-end (la partie serveur qui gère la logique, la base de données et les fonctionnalités). Un développeur full-stack maîtrise généralement plusieurs technologies pour créer une application complète,', 'En cours');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0E3BD61CE16BA31DBBF396750` (`queue_name`,`available_at`,`delivered_at`,`id`);

--
-- Index pour la table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
