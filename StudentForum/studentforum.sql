-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 13, 2016 at 12:53 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `studentforum`
--
CREATE DATABASE IF NOT EXISTS `studentforum` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `studentforum`;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_answer`
--

CREATE TABLE IF NOT EXISTS `tbl_answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` text NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `submitted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`answer_id`),
  KEY `user_id` (`user_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_answer`
--

INSERT INTO `tbl_answer` (`answer_id`, `answer`, `question_id`, `user_id`, `submitted_date`) VALUES
(4, 'Pick an arbitrary node to be the root. Store in each node its depth (distance from the root). Also, build a least-common ancestor data structure so you can answer least-common ancestor queries in constant time.\r\n\r\nGiven two vertices u,v\r\n, compute their least common ancestor, a. Now the shortest path from u to v goes up from u to a, then down to v\r\n\r\n. You can compute the length of this path as\r\n\r\n(depth(u)â??depth(a))+(depth(v)â??depth(a)).\r\n\r\nThat''s the distance from u\r\nto v. Total running time is O(1) time per query. There exist LCA data structures that use only linear space.', 9, 4, '2016-08-24 19:56:38'),
(5, 'test', 9, 2, '2016-09-07 20:16:15'),
(6, 'Test 2', 9, 2, '2016-09-08 19:16:46');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course`
--

CREATE TABLE IF NOT EXISTS `tbl_course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` text NOT NULL,
  `programme_id` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `tbl_course_ibfk_1` (`programme_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `tbl_course`
--

INSERT INTO `tbl_course` (`course_id`, `course_name`, `programme_id`, `semester`) VALUES
(6, 'Computer system Architechture', 13, 3),
(7, 'C programming', 13, 1),
(8, 'web Technology', 13, 3),
(9, 'Graphic', 13, 4),
(11, 'E-commerce', 13, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ebooks`
--

CREATE TABLE IF NOT EXISTS `tbl_ebooks` (
  `ebook_id` int(11) NOT NULL AUTO_INCREMENT,
  `ebook_name` text NOT NULL,
  `description` text NOT NULL,
  `course_id` int(11) NOT NULL,
  `location` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ebook_id`),
  KEY `tbl_ebooks_ibfk_1` (`course_id`),
  KEY `tbl_ebooks_ibfk_2` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tbl_ebooks`
--

INSERT INTO `tbl_ebooks` (`ebook_id`, `ebook_name`, `description`, `course_id`, `location`, `user_id`, `added_date`) VALUES
(10, 'Test', 'Test', 6, 'C:\\Users\\BkoNod\\GlassFish_Server\\glassfish\\domains\\domain1\\Documents\\Science and technology\\Bachelor in computer Application (B.C.A)\\book\\ch9.VirtualMemory.pdf', 3, '2016-07-27 05:54:53');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faculties`
--

CREATE TABLE IF NOT EXISTS `tbl_faculties` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `faculty_name` text NOT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `tbl_faculties`
--

INSERT INTO `tbl_faculties` (`faculty_id`, `faculty_name`) VALUES
(12, 'Science and technology'),
(13, 'Management'),
(14, 'Arts'),
(15, 'Education '),
(16, 'Law'),
(17, 'Medical and allied Science');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_modalpapers`
--

CREATE TABLE IF NOT EXISTS `tbl_modalpapers` (
  `modal_id` int(11) NOT NULL AUTO_INCREMENT,
  `modal_name` text NOT NULL,
  `description` text NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `course_id` int(11) NOT NULL,
  `location` text NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`modal_id`),
  KEY `user_id` (`user_id`),
  KEY `tbl_modalpapers_ibfk_1` (`course_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tbl_modalpapers`
--

INSERT INTO `tbl_modalpapers` (`modal_id`, `modal_name`, `description`, `added_date`, `course_id`, `location`, `user_id`) VALUES
(5, 'chapter 1', 'Chapter 1', '2016-07-26 13:02:16', 7, 'C:\\Users\\BkoNod\\GlassFish_Server\\glassfish\\domains\\domain1\\Documents\\Science and technology\\Bachelor in computer Application (B.C.A)\\modalPaper\\Chp-3-notes-2nd-edition.doc', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_programme`
--

CREATE TABLE IF NOT EXISTS `tbl_programme` (
  `programme_id` int(11) NOT NULL AUTO_INCREMENT,
  `programme_name` text NOT NULL,
  `type` text NOT NULL,
  `year_semester` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  PRIMARY KEY (`programme_id`),
  KEY `tbl_programme_ibfk_1` (`faculty_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `tbl_programme`
--

INSERT INTO `tbl_programme` (`programme_id`, `programme_name`, `type`, `year_semester`, `faculty_id`) VALUES
(11, 'Bachelor in Architecture', 'Semester', 8, 12),
(12, 'Bachelor in Biomedical engineering', 'Year', 3, 12),
(13, 'Bachelor in computer Application (B.C.A)', 'Semester', 6, 12),
(14, 'Bachelor in Bussiness Study', 'Year', 4, 13),
(15, 'Bachelor in Bussiness Administration', 'Semester', 8, 13),
(16, 'Bacherlor in civil Engineering', 'Year', 3, 12);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_question`
--

CREATE TABLE IF NOT EXISTS `tbl_question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `question` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `tags` text NOT NULL,
  `submitted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `no_of_answer` int(11) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tbl_question`
--

INSERT INTO `tbl_question` (`question_id`, `title`, `question`, `user_id`, `status`, `tags`, `submitted_date`, `no_of_answer`) VALUES
(6, 'Sum of size of distinct set of descendants d distance from a node u , over all u and d is O(nn&#8730;)', 'Let''s consider a rooted tree T of n nodes. For any node u of the tree, define L(u,d) to be the list of descendants of u that are distance d away from u. Let |L(u,d)| denote the number of nodes that are present in the list L(u,d)\r\n\r\n.\r\n\r\nProve that the sum of |L(u,d)|\r\nover all distinct lists L(u,d) is bounded by O(nn&#8730;)\r\n\r\n.\r\nMy work\r\n\r\nConsider all L(u,d)\r\nsuch that the left most node on the level Level(u)+d is some node v. The pairs u,d for all such L(u,d) must be distinct and the sum of all di will correspond to the number of nodes x in the tree with Level(x)&#8804;Level(u)+d\r\n\r\n.\r\n\r\nThis is because if some sequence of nodes v1,v2,?vk\r\ncorresponds to the descendants of some node u at a distance d and the sequence of nodes v1,v2,?vk&#8242; where k&#8242;>k corresponds to the descendants of some node u&#8242; at a distance d+1, then there must also exist a node u&#8242;&#8242; such that L(u&#8242;&#8242;,d)=vk+1,vk+2,?vk&#8242;. This would also mean that u&#8242;&#8242; is not in the subtree of u and thus there are at least d distinct nodes in the subtree of u&#8242;&#8242; upto a distance d from u&#8242;&#8242;\r\n\r\n.\r\n\r\nIf the distinct distances are d1,d2,?dk\r\nthen, n&#8805;&#8721;idi&#8805;&#8721;ki=1i&#8805;k(k+1)2\r\n\r\n. =\r\n\r\n&#10233;k&#8804;n&#8730;\r\n\r\nAfter this I tried to show that there can be only O(n&#8730;)\r\ndistinct lists L(u,d) so that I can then trivially obtain the upper-boud of nn&#8730;\r\n\r\nbut I could not make any more useful observations.\r\n\r\nThis link claims that such an upper bound does exist but has not provided the proof.\r\n\r\nAny ideas how we might proceed to prove this?\r\n', 3, 0, 'Tree', '2016-08-24 19:46:06', 0),
(7, 'Why the update low value in Tarjan''s for the ancestors is not it''s low value instead of it''s discovery value? [on hold]', ' 1\r\ndown vote\r\nfavorite\r\n	\r\n\r\nIn Tarjan''s algorithm for finding SCC/AP/Bridges, we update the value of the low[u] to be the min ( low[u], desc[v] ) given that v is a neighbor and has been discovered before, why it''s not like this instead low[u] = min(low[u], low[v])?\r\n', 3, 0, 'tree', '2016-08-24 19:47:25', 0),
(8, 'Distance query in trees with integer edge weights (Constant time, linear space)', 'Consider an unrooted tree with integer edge weights. I''m looking for a linear space data structure which allows for constant time distance queries (finding the distance, i.e. the sum of edge weights, between any two vertices).\r\n\r\nIs this possible? If yes, how? I have an idea that it should be possible using some Lowest-Common-Ancestor or Range-Minimum-Query approach.\r\n', 3, 0, 'tree', '2016-08-24 19:48:28', 0),
(9, 'what is the name for the space between the leaves of a tree', 'I am trying to write a data-type not for a tree, but for the spaces in between the leaves of thee tree. In number theory (a part of math) this is known as a topograph does it have a name in CS?\r\n\r\n', 3, 0, 'tree', '2016-08-24 19:49:36', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE IF NOT EXISTS `tbl_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(256) NOT NULL,
  `last_name` varchar(256) NOT NULL,
  `username` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `createdDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` text NOT NULL,
  `image` text NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `first_name`, `last_name`, `username`, `password`, `email`, `createdDate`, `role`, `image`) VALUES
(2, 'Binod', 'Binod', 'binod', 'binod', 'gbnod55@gmail.com', '2016-07-21 09:25:19', 'ADMIN', 'C:\\Users\\BkoNod\\GlassFish_Server\\glassfish\\domains\\domain1\\images\\userDp\\13390796_1716123295332103_1215223934_n.jpg'),
(3, 'pritam', 'bhandari', 'pritam', 'pritam', 'pritam@gmail.com', '2016-07-21 12:35:09', 'USER', 'C:\\Users\\BkoNod\\GlassFish_Server\\glassfish\\domains\\domain1\\images\\userDp\\13413972_1716123245332108_532174863_n.jpg'),
(4, 'raju', 'thapaliya', 'raju', 'raju', 'raju@gmail.com', '2016-08-24 19:50:12', 'USERS', '');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_answer`
--
ALTER TABLE `tbl_answer`
  ADD CONSTRAINT `tbl_answer_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `tbl_answer_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `tbl_question` (`question_id`);

--
-- Constraints for table `tbl_course`
--
ALTER TABLE `tbl_course`
  ADD CONSTRAINT `tbl_course_ibfk_1` FOREIGN KEY (`programme_id`) REFERENCES `tbl_programme` (`programme_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_ebooks`
--
ALTER TABLE `tbl_ebooks`
  ADD CONSTRAINT `tbl_ebooks_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_ebooks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_modalpapers`
--
ALTER TABLE `tbl_modalpapers`
  ADD CONSTRAINT `tbl_modalpapers_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_modalpapers_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `tbl_modalpapers_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_programme`
--
ALTER TABLE `tbl_programme`
  ADD CONSTRAINT `tbl_programme_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `tbl_faculties` (`faculty_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_question`
--
ALTER TABLE `tbl_question`
  ADD CONSTRAINT `tbl_question_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
