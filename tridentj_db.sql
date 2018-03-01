-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 01, 2018 at 06:16 AM
-- Server version: 10.0.27-MariaDB-cll-lve
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tridentj_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_keys`
--

CREATE TABLE IF NOT EXISTS `access_keys` (
  `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  PRIMARY KEY (`access_key_id`),
  KEY `access_keys_hash` (`key_hash`,`user_id`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE IF NOT EXISTS `announcements` (
  `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  `date_posted` datetime NOT NULL,
  PRIMARY KEY (`announcement_id`),
  KEY `announcements_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_settings`
--

CREATE TABLE IF NOT EXISTS `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  KEY `announcement_settings_announcement_id` (`announcement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_types`
--

CREATE TABLE IF NOT EXISTS `announcement_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` smallint(6) DEFAULT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `announcement_type_settings`
--

CREATE TABLE IF NOT EXISTS `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `announcement_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `primary_contact` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  `suffix` varchar(40) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `email` varchar(90) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  `include_in_browse` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`author_id`),
  KEY `authors_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `author_settings`
--

CREATE TABLE IF NOT EXISTS `author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  KEY `author_settings_author_id` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `auth_sources`
--

CREATE TABLE IF NOT EXISTS `auth_sources` (
  `auth_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` tinyint(4) NOT NULL DEFAULT '0',
  `settings` text,
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `citations`
--

CREATE TABLE IF NOT EXISTS `citations` (
  `citation_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `citation_state` bigint(20) NOT NULL,
  `raw_citation` text,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  `lock_id` varchar(23) DEFAULT NULL,
  PRIMARY KEY (`citation_id`),
  UNIQUE KEY `citations_assoc_seq` (`assoc_type`,`assoc_id`,`seq`),
  KEY `citations_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `citation_settings`
--

CREATE TABLE IF NOT EXISTS `citation_settings` (
  `citation_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `citation_settings_pkey` (`citation_id`,`locale`,`setting_name`),
  KEY `citation_settings_citation_id` (`citation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `completed_payments`
--

CREATE TABLE IF NOT EXISTS `completed_payments` (
  `completed_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` datetime NOT NULL,
  `payment_type` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `amount` double NOT NULL,
  `currency_code_alpha` varchar(3) DEFAULT NULL,
  `payment_method_plugin_name` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`completed_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocabs`
--

CREATE TABLE IF NOT EXISTS `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(64) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`controlled_vocab_id`),
  UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `controlled_vocabs`
--

INSERT INTO `controlled_vocabs` (`controlled_vocab_id`, `symbolic`, `assoc_type`, `assoc_id`) VALUES
(9, 'interest', 0, 0),
(7, 'mods34-genre-marcgt', 0, 0),
(5, 'mods34-name-role-roleTerms-marcrelator', 0, 0),
(4, 'mods34-name-types', 0, 0),
(8, 'mods34-physicalDescription-form-marcform', 0, 0),
(6, 'mods34-typeOfResource', 0, 0),
(3, 'nlm30-publication-types', 0, 0),
(2, 'openurl10-book-genres', 0, 0),
(1, 'openurl10-journal-genres', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocab_entries`
--

CREATE TABLE IF NOT EXISTS `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  PRIMARY KEY (`controlled_vocab_entry_id`),
  KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `controlled_vocab_entries`
--

INSERT INTO `controlled_vocab_entries` (`controlled_vocab_entry_id`, `controlled_vocab_id`, `seq`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 1),
(9, 2, 2),
(10, 2, 3),
(11, 2, 4),
(12, 2, 5),
(13, 2, 6),
(14, 2, 7),
(15, 3, 1),
(16, 3, 2),
(17, 3, 3),
(18, 3, 4),
(19, 4, 1),
(20, 4, 2),
(21, 4, 3),
(22, 5, 1),
(23, 5, 2),
(24, 5, 3),
(25, 5, 4),
(26, 5, 5),
(27, 5, 6),
(28, 5, 7),
(29, 6, 1),
(30, 6, 2),
(31, 6, 3),
(32, 7, 1),
(33, 7, 2),
(34, 7, 3),
(35, 7, 4),
(36, 7, 5),
(37, 7, 6),
(38, 7, 7),
(39, 7, 8),
(40, 7, 9),
(41, 7, 10),
(42, 7, 11),
(43, 7, 12),
(44, 8, 1),
(45, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `controlled_vocab_entry_settings`
--

CREATE TABLE IF NOT EXISTS `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `controlled_vocab_entry_settings`
--

INSERT INTO `controlled_vocab_entry_settings` (`controlled_vocab_entry_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'name', 'journal', 'string'),
(2, '', 'name', 'issue', 'string'),
(3, '', 'name', 'article', 'string'),
(4, '', 'name', 'proceeding', 'string'),
(5, '', 'name', 'conference', 'string'),
(6, '', 'name', 'preprint', 'string'),
(7, '', 'name', 'unknown', 'string'),
(8, '', 'name', 'book', 'string'),
(9, '', 'name', 'bookitem', 'string'),
(10, '', 'name', 'proceeding', 'string'),
(11, '', 'name', 'conference', 'string'),
(12, '', 'name', 'report', 'string'),
(13, '', 'name', 'document', 'string'),
(14, '', 'name', 'unknown', 'string'),
(15, '', 'name', 'journal', 'string'),
(16, '', 'name', 'book', 'string'),
(17, '', 'name', 'conf-proc', 'string'),
(18, '', 'name', 'thesis', 'string'),
(19, '', 'name', 'personal', 'string'),
(20, '', 'name', 'corporate', 'string'),
(21, '', 'name', 'conference', 'string'),
(22, '', 'description', 'Author', 'string'),
(22, '', 'name', 'aut', 'string'),
(23, '', 'description', 'Contributor', 'string'),
(23, '', 'name', 'ctb', 'string'),
(24, '', 'description', 'Editor', 'string'),
(24, '', 'name', 'edt', 'string'),
(25, '', 'description', 'Illustrator', 'string'),
(25, '', 'name', 'ill', 'string'),
(26, '', 'description', 'Photographer', 'string'),
(26, '', 'name', 'pht', 'string'),
(27, '', 'description', 'Sponsor', 'string'),
(27, '', 'name', 'spn', 'string'),
(28, '', 'description', 'Translator', 'string'),
(28, '', 'name', 'trl', 'string'),
(29, '', 'name', 'multimedia', 'string'),
(30, '', 'name', 'still image', 'string'),
(31, '', 'name', 'text', 'string'),
(32, '', 'name', 'article', 'string'),
(33, '', 'name', 'book', 'string'),
(34, '', 'name', 'conference publication', 'string'),
(35, '', 'name', 'issue', 'string'),
(36, '', 'name', 'journal', 'string'),
(37, '', 'name', 'newspaper', 'string'),
(38, '', 'name', 'picture', 'string'),
(39, '', 'name', 'review', 'string'),
(40, '', 'name', 'periodical', 'string'),
(41, '', 'name', 'series', 'string'),
(42, '', 'name', 'thesis', 'string'),
(43, '', 'name', 'web site', 'string'),
(44, '', 'name', 'electronic', 'string'),
(45, '', 'name', 'print', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `custom_issue_orders`
--

CREATE TABLE IF NOT EXISTS `custom_issue_orders` (
  `issue_id` bigint(20) NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_issue_orders_pkey` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `custom_section_orders`
--

CREATE TABLE IF NOT EXISTS `custom_section_orders` (
  `issue_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  UNIQUE KEY `custom_section_orders_pkey` (`issue_id`,`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstones`
--

CREATE TABLE IF NOT EXISTS `data_object_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_object_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `data_object_tombstones_data_object_id` (`data_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstone_oai_set_objects`
--

CREATE TABLE IF NOT EXISTS `data_object_tombstone_oai_set_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tombstone_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  PRIMARY KEY (`object_id`),
  KEY `data_object_tombstone_oai_set_objects_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `data_object_tombstone_settings`
--

CREATE TABLE IF NOT EXISTS `data_object_tombstone_settings` (
  `tombstone_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `data_object_tombstone_settings_pkey` (`tombstone_id`,`locale`,`setting_name`),
  KEY `data_object_tombstone_settings_tombstone_id` (`tombstone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `edit_decisions`
--

CREATE TABLE IF NOT EXISTS `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `editor_id` bigint(20) NOT NULL,
  `decision` tinyint(4) NOT NULL,
  `date_decided` datetime NOT NULL,
  PRIMARY KEY (`edit_decision_id`),
  KEY `edit_decisions_submission_id` (`submission_id`),
  KEY `edit_decisions_editor_id` (`editor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_log`
--

CREATE TABLE IF NOT EXISTS `email_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`log_id`),
  KEY `email_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_log_users`
--

CREATE TABLE IF NOT EXISTS `email_log_users` (
  `email_log_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `email_log_user_id` (`email_log_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email_templates_email_key` (`email_key`,`assoc_type`,`assoc_id`),
  KEY `email_templates_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_data`
--

CREATE TABLE IF NOT EXISTS `email_templates_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `subject` varchar(120) NOT NULL,
  `body` text,
  UNIQUE KEY `email_templates_data_pkey` (`email_key`,`locale`,`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_default`
--

CREATE TABLE IF NOT EXISTS `email_templates_default` (
  `email_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_key` varchar(64) NOT NULL,
  `can_disable` tinyint(4) NOT NULL DEFAULT '1',
  `can_edit` tinyint(4) NOT NULL DEFAULT '1',
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`email_id`),
  KEY `email_templates_default_email_key` (`email_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=59 ;

--
-- Dumping data for table `email_templates_default`
--

INSERT INTO `email_templates_default` (`email_id`, `email_key`, `can_disable`, `can_edit`, `from_role_id`, `to_role_id`) VALUES
(1, 'NOTIFICATION', 0, 1, NULL, NULL),
(2, 'NOTIFICATION_MAILLIST', 0, 1, NULL, NULL),
(3, 'NOTIFICATION_MAILLIST_WELCOME', 0, 1, NULL, NULL),
(4, 'NOTIFICATION_CENTER_DEFAULT', 0, 1, NULL, NULL),
(5, 'PASSWORD_RESET_CONFIRM', 0, 1, NULL, NULL),
(6, 'PASSWORD_RESET', 0, 1, NULL, NULL),
(7, 'USER_REGISTER', 0, 1, NULL, NULL),
(8, 'USER_VALIDATE', 0, 1, NULL, NULL),
(9, 'REVIEWER_REGISTER', 0, 1, NULL, NULL),
(10, 'PUBLISH_NOTIFY', 0, 1, NULL, NULL),
(11, 'LOCKSS_EXISTING_ARCHIVE', 0, 1, NULL, NULL),
(12, 'LOCKSS_NEW_ARCHIVE', 0, 1, NULL, NULL),
(13, 'SUBMISSION_ACK', 1, 1, NULL, 65536),
(14, 'SUBMISSION_ACK_NOT_USER', 1, 1, NULL, 65536),
(15, 'SUBMISSION_UNSUITABLE', 1, 1, 512, 65536),
(16, 'EDITOR_ASSIGN', 1, 1, 256, 512),
(17, 'REVIEW_CANCEL', 1, 1, 512, 4096),
(18, 'REVIEW_REQUEST', 1, 1, 512, 4096),
(19, 'REVIEW_REQUEST_SUBSEQUENT', 1, 1, 512, 4096),
(20, 'REVIEW_REQUEST_ONECLICK', 1, 1, 512, 4096),
(21, 'REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 1, 1, 512, 4096),
(22, 'REVIEW_REQUEST_ATTACHED', 0, 1, 512, 4096),
(23, 'REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 0, 1, 512, 4096),
(24, 'REVIEW_REQUEST_REMIND_AUTO', 0, 1, NULL, 4096),
(25, 'REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096),
(26, 'REVIEW_CONFIRM', 1, 1, 4096, 512),
(27, 'REVIEW_DECLINE', 1, 1, 4096, 512),
(28, 'REVIEW_ACK', 1, 1, 512, 4096),
(29, 'REVIEW_REMIND', 0, 1, 512, 4096),
(30, 'REVIEW_REMIND_AUTO', 0, 1, NULL, 4096),
(31, 'REVIEW_REMIND_ONECLICK', 0, 1, 512, 4096),
(32, 'REVIEW_REMIND_AUTO_ONECLICK', 0, 1, NULL, 4096),
(33, 'EDITOR_DECISION_ACCEPT', 0, 1, 512, 65536),
(34, 'EDITOR_DECISION_SEND_TO_EXTERNAL', 0, 1, 17, 65536),
(35, 'EDITOR_DECISION_SEND_TO_PRODUCTION', 0, 1, 17, 65536),
(36, 'EDITOR_DECISION_REVISIONS', 0, 1, 512, 65536),
(37, 'EDITOR_DECISION_RESUBMIT', 0, 1, 512, 65536),
(38, 'EDITOR_DECISION_DECLINE', 0, 1, 512, 65536),
(39, 'EDITOR_DECISION_INITIAL_DECLINE', 0, 1, 512, 65536),
(40, 'EDITOR_RECOMMENDATION', 0, 1, 17, 16),
(41, 'COPYEDIT_REQUEST', 1, 1, 512, 8192),
(42, 'LAYOUT_REQUEST', 1, 1, 512, 768),
(43, 'LAYOUT_COMPLETE', 1, 1, 768, 512),
(44, 'EMAIL_LINK', 0, 1, 1048576, NULL),
(45, 'SUBSCRIPTION_NOTIFY', 0, 1, NULL, 1048576),
(46, 'OPEN_ACCESS_NOTIFY', 0, 1, NULL, 1048576),
(47, 'SUBSCRIPTION_BEFORE_EXPIRY', 0, 1, NULL, 1048576),
(48, 'SUBSCRIPTION_AFTER_EXPIRY', 0, 1, NULL, 1048576),
(49, 'SUBSCRIPTION_AFTER_EXPIRY_LAST', 0, 1, NULL, 1048576),
(50, 'SUBSCRIPTION_PURCHASE_INDL', 0, 1, NULL, 2097152),
(51, 'SUBSCRIPTION_PURCHASE_INSTL', 0, 1, NULL, 2097152),
(52, 'SUBSCRIPTION_RENEW_INDL', 0, 1, NULL, 2097152),
(53, 'SUBSCRIPTION_RENEW_INSTL', 0, 1, NULL, 2097152),
(54, 'CITATION_EDITOR_AUTHOR_QUERY', 0, 1, NULL, NULL),
(55, 'REVISED_VERSION_NOTIFY', 0, 1, NULL, 512),
(56, 'ORCID_COLLECT_AUTHOR_ID', 0, 1, NULL, NULL),
(57, 'MANUAL_PAYMENT_NOTIFICATION', 0, 1, NULL, NULL),
(58, 'PAYPAL_INVESTIGATE_PAYMENT', 0, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_templates_default_data`
--

CREATE TABLE IF NOT EXISTS `email_templates_default_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text,
  `description` text,
  UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `email_templates_default_data`
--

INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('CITATION_EDITOR_AUTHOR_QUERY', 'en_US', 'Citation Editing', '{$authorFirstName},<br />\n<br />\nCould you please verify or provide us with the proper citation for the following reference from your article, {$submissionTitle}:<br />\n<br />\n{$rawCitation}<br />\n<br />\nThanks!<br />\n<br />\n{$userFirstName}<br />\nCopy-Editor, {$contextName}<br />\n', 'This email allows copyeditors to request additional information about references from authors.'),
('COPYEDIT_REQUEST', 'en_US', 'Copyediting Request', '{$participantName}:<br />\n<br />\nI would ask that you undertake the copyediting of &quot;{$submissionTitle}&quot; for {$contextName} by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Open any files available under Draft Files and do your copyediting, while adding any Copyediting Discussions as needed.<br />\n3. Save copyedited file(s), and upload to Copyedited panel.<br />\n4. Notify the Editor that all files have been prepared, and that the Production process may begin.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to a submission''s Copyeditor to request that they begin the copyediting process. It provides information about the submission and how to access it.'),
('EDITOR_ASSIGN', 'en_US', 'Editorial Assignment', '{$editorialContactName}:<br />\n<br />\nThe submission, &quot;{$submissionTitle},&quot; to {$contextName} has been assigned to you to see through the editorial process in your role as Section Editor.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$editorUsername}<br />\n<br />\nThank you,<br />\n{$editorialContactSignature}', 'This email notifies a Section Editor that the Editor has assigned them the task of overseeing a submission through the editing process. It provides information about the submission and how to access the journal site.'),
('EDITOR_DECISION_ACCEPT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Accept Submission<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them of a final "accept submission" decision regarding their submission.'),
('EDITOR_DECISION_DECLINE', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them of a final "decline" decision regarding their submission.'),
('EDITOR_DECISION_INITIAL_DECLINE', 'en_US', 'Editor Decision', '\n			{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Decline Submission<br />\n<br />\n{$editorialContactSignature}<br />', 'This email is send to the author if the editor declines his submission initially, before the review stage'),
('EDITOR_DECISION_RESUBMIT', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Resubmit for Review<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them of a final "resubmit" decision regarding their submission.'),
('EDITOR_DECISION_REVISIONS', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is: Revisions Required<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them of a final "revisions required" decision regarding their submission.'),
('EDITOR_DECISION_SEND_TO_EXTERNAL', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nWe have reached a decision regarding your submission to {$contextName}, &quot;{$submissionTitle}&quot;.<br />\n<br />\nOur decision is to: Send to Review<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to an external review.'),
('EDITOR_DECISION_SEND_TO_PRODUCTION', 'en_US', 'Editor Decision', '{$authorName}:<br />\n<br />\nThe editing of your submission, &quot;{$submissionTitle},&quot; is complete.  We are now sending it to production.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the Editor or Section Editor to an Author notifies them that their submission is being sent to production.'),
('EDITOR_RECOMMENDATION', 'en_US', 'Editor Recommendation', '{$editors}:<br />\n<br />\nThe recommendation regarding the submission to {$contextName}, &quot;{$submissionTitle}&quot; is: {$recommendation}<br />\n<br />\n{$editorialContactSignature}<br />\n', 'This email from the recommending Editor or Section Editor to the decision making Editors or Section Editors notifies them of a final recommendation regarding the submission.'),
('EMAIL_LINK', 'en_US', 'Article of Possible Interest', 'Thought you might be interested in seeing &quot;{$submissionTitle}&quot; by {$authorName} published in Vol {$volume}, No {$number} ({$year}) of {$contextName} at &quot;{$articleUrl}&quot;.', 'This email template provides a registered reader with the opportunity to send information about an article to somebody who may be interested. It is available via the Reading Tools and must be enabled by the Journal Manager in the Reading Tools Administration page.'),
('LAYOUT_COMPLETE', 'en_US', 'Galleys Complete', '{$editorialContactName}:<br />\n<br />\nGalleys have now been prepared for the manuscript, &quot;{$submissionTitle},&quot; for {$contextName} and are ready for proofreading.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$participantName}', 'This email from the Layout Editor to the Section Editor notifies them that the layout process has been completed.'),
('LAYOUT_REQUEST', 'en_US', 'Request Galleys', '{$participantName}:<br />\n<br />\nThe submission &quot;{$submissionTitle}&quot; to {$contextName} now needs galleys laid out by following these steps.<br />\n1. Click on the Submission URL below.<br />\n2. Log into the journal and use the Production Ready files to create the galleys according to the journal''s standards.<br />\n3. Upload the galleys to the Galley Files section.<br />\n4. Notify the Editor using Production Discussions that the galleys are uploaded and ready.<br />\n<br />\n{$contextName} URL: {$contextUrl}<br />\nSubmission URL: {$submissionLayoutUrl}<br />\nUsername: {$participantUsername}<br />\n<br />\nIf you are unable to undertake this work at this time or have any questions, please contact me. Thank you for your contribution to this journal.<br />\n<br />\n{$editorialContactSignature}', 'This email from the Section Editor to the Layout Editor notifies them that they have been assigned the task of performing layout editing on a submission. It provides information about the submission and how to access it.'),
('LOCKSS_EXISTING_ARCHIVE', 'en_US', 'Archiving Request for {$contextName}', 'Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member], serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe URL to the LOCKSS Publisher Manifest for our journal is: {$contextUrl}/gateway/lockss<br />\n<br />\nWe understand that you are already participating in LOCKSS. If we can provide any additional metadata for purposes of registering our journal with your version of LOCKSS, we would be happy to provide it.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email requests the keeper of a LOCKSS archive to consider including this journal in their archive. It provides the URL to the journal''s LOCKSS Publisher Manifest.'),
('LOCKSS_NEW_ARCHIVE', 'en_US', 'Archiving Request for {$contextName}', 'Dear [University Librarian]<br />\n<br />\n{$contextName} &amp;lt;{$contextUrl}&amp;gt;, is a journal for which a member of your faculty, [name of member] serves as a [title of position]. The journal is seeking to establish a LOCKSS (Lots of Copies Keep Stuff Safe) compliant archive with this and other university libraries.<br />\n<br />\n[Brief description of journal]<br />\n<br />\nThe LOCKSS Program &amp;lt;http://lockss.org/&amp;gt;, an international library/publisher initiative, is a working example of a distributed preservation and archiving repository, additional details are below. The software, which runs on an ordinary personal computer is free; the system is easily brought on-line; very little ongoing maintenance is required.<br />\n<br />\nTo assist in the archiving of our journal, we invite you to become a member of the LOCKSS community, to help collect and preserve titles produced by your faculty and by other scholars worldwide. To do so, please have someone on your staff visit the LOCKSS site for information on how this system operates. I look forward to hearing from you on the feasibility of providing this archiving support for this journal.<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email encourages the recipient to participate in the LOCKSS initiative and include this journal in the archive. It provides information about the LOCKSS initiative and ways to become involved.'),
('MANUAL_PAYMENT_NOTIFICATION', 'en_US', 'Manual Payment Notification', 'A manual payment needs to be processed for the journal {$contextName} and the user {$userFullName} (username &quot;{$userName}&quot;).<br />\n<br />\nThe item being paid for is &quot;{$itemName}&quot;.<br />\nThe cost is {$itemCost} ({$itemCurrencyCode}).<br />\n<br />\nThis email was generated by Open Journal Systems'' Manual Payment plugin.', 'This email template is used to notify a journal manager contact that a manual payment was requested.'),
('NOTIFICATION', 'en_US', 'New notification from {$siteTitle}', 'You have a new notification from {$siteTitle}:<br />\n<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n<br />\n{$principalContactSignature}', 'The email is sent to registered users that have selected to have this type of notification emailed to them.'),
('NOTIFICATION_CENTER_DEFAULT', 'en_US', 'A message regarding {$contextName}', 'Please enter your message.', 'The default (blank) message used in the Notification Center Message Listbuilder.'),
('NOTIFICATION_MAILLIST', 'en_US', 'New notification from {$siteTitle}', 'You have a new notification from {$siteTitle}:<br />\n--<br />\n{$notificationContents}<br />\n<br />\nLink: {$url}<br />\n--<br />\n<br />\nIf you wish to stop receiving notification emails, please go to {$unsubscribeLink}.<br />\n<br />\n{$principalContactSignature}', 'This email is sent to unregistered users on the notification mailing list.'),
('NOTIFICATION_MAILLIST_WELCOME', 'en_US', 'Welcome to the the {$siteTitle} mailing list!', 'You have signed up to receive notifications from {$siteTitle}.<br />\n<br />\nPlease click on this link to confirm your request and add your email address to the mailing list: {$confirmLink}<br />\n<br />\nIf you wish to stop receiving notification emails, please go to {$unsubscribeLink}.<br />\n<br />\n{$principalContactSignature}', 'This email is sent to an unregistered user who just registered with the notification mailing list.'),
('OPEN_ACCESS_NOTIFY', 'en_US', 'Issue Now Open Access', 'Readers:<br />\n<br />\n{$contextName} has just made available in an open access format the following issue. We invite you to review the Table of Contents here and then visit our web site ({$contextUrl}) to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}', 'This email is sent to registered readers who have requested to receive a notification email when an issue becomes open access.'),
('ORCID_COLLECT_AUTHOR_ID', 'en_US', 'Submission ORCID', 'Dear {$authorName},\n\nYou have been listed as a co-author on the manuscript submission "{$articleTitle}" to {$journalName}. \n\nTo confirm your authorship, please add your ORCID id to this submission by visiting the link provided below.\n\n{$authorOrcidUrl}\n\nIf you have any questions, please contact me.\n\n{$editorialContactSignature}\n\n\n', 'This email template is used to collect the ORCID id''s from co-authors.'),
('PASSWORD_RESET', 'en_US', 'Password Reset', 'Your password has been successfully reset for use with the {$siteTitle} web site. Please retain this username and password, as it is necessary for all work with the journal.<br />\n<br />\nYour username: {$username}<br />\nPassword: {$password}<br />\n<br />\n{$principalContactSignature}', 'This email is sent to a registered user when they have successfully reset their password following the process described in the PASSWORD_RESET_CONFIRM email.'),
('PASSWORD_RESET_CONFIRM', 'en_US', 'Password Reset Confirmation', 'We have received a request to reset your password for the {$siteTitle} web site.<br />\n<br />\nIf you did not make this request, please ignore this email and your password will not be changed. If you wish to reset your password, click on the below URL.<br />\n<br />\nReset my password: {$url}<br />\n<br />\n{$principalContactSignature}', 'This email is sent to a registered user when they indicate that they have forgotten their password or are unable to login. It provides a URL they can follow to reset their password.'),
('PAYPAL_INVESTIGATE_PAYMENT', 'en_US', 'Unusual PayPal Activity', 'Open Journal Systems has encountered unusual activity relating to PayPal payment support for the journal {$contextName}. This activity may need further investigation or manual intervention.<br />\n                       <br />\nThis email was generated by Open Journal Systems'' PayPal plugin.<br />\n<br />\nFull post information for the request:<br />\n{$postInfo}<br />\n<br />\nAdditional information (if supplied):<br />\n{$additionalInfo}<br />\n<br />\nServer vars:<br />\n{$serverVars}<br />\n', 'This email template is used to notify a journal''s primary contact that suspicious activity or activity requiring manual intervention was encountered by the PayPal plugin.'),
('PUBLISH_NOTIFY', 'en_US', 'New Issue Published', 'Readers:<br />\n<br />\n{$contextName} has just published its latest issue at {$contextUrl}. We invite you to review the Table of Contents here and then visit our web site to review articles and items of interest.<br />\n<br />\nThanks for the continuing interest in our work,<br />\n{$editorialContactSignature}', 'This email is sent to registered readers via the "Notify Users" link in the Editor''s User Home. It notifies readers of a new issue and invites them to visit the journal at a supplied URL.'),
('REVIEWER_REGISTER', 'en_US', 'Registration as Reviewer with {$contextName}', 'In light of your expertise, we have taken the liberty of registering your name in the reviewer database for {$contextName}. This does not entail any form of commitment on your part, but simply enables us to approach you with a submission to possibly review. On being invited to review, you will have an opportunity to see the title and abstract of the paper in question, and you''ll always be in a position to accept or decline the invitation. You can also ask at any point to have your name removed from this reviewer list.<br />\n<br />\nWe are providing you with a username and password, which is used in all interactions with the journal through its website. You may wish, for example, to update your profile, including your reviewing interests.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered reviewer to welcome them to the system and provide them with a record of their username and password.'),
('REVIEW_ACK', 'en_US', 'Article Review Acknowledgement', '{$reviewerName}:<br />\n<br />\nThank you for completing the review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We appreciate your contribution to the quality of the work that we publish.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to confirm receipt of a completed review and thank the reviewer for their contributions.'),
('REVIEW_CANCEL', 'en_US', 'Request for Review Cancelled', '{$reviewerName}:<br />\n<br />\nWe have decided at this point to cancel our request for you to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We apologize for any inconvenience this may cause you and hope that we will be able to call on you to assist with this journal''s review process in the future.<br />\n<br />\nIf you have any questions, please contact me.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by the Section Editor to a Reviewer who has a submission review in progress to notify them that the review has been cancelled.'),
('REVIEW_CONFIRM', 'en_US', 'Able to Review', 'Editors:<br />\n<br />\nI am able and willing to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and I plan to have the review completed by its due date, {$reviewDueDate}, if not before.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been accepted and will be completed by the specified date.'),
('REVIEW_DECLINE', 'en_US', 'Unable to Review', 'Editors:<br />\n<br />\nI am afraid that at this time I am unable to review the submission, &quot;{$submissionTitle},&quot; for {$contextName}. Thank you for thinking of me, and another time feel free to call on me.<br />\n<br />\n{$reviewerName}', 'This email is sent by a Reviewer to the Section Editor in response to a review request to notify the Section Editor that the review request has been declined.'),
('REVIEW_REMIND', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal''s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REMIND_AUTO', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nIf you do not have your username and password for the journal''s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer''s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_AUTO_ONECLICK', 'en_US', 'Automated Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and this email has been automatically generated and sent with the passing of that date. We would still be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent when a reviewer''s due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REMIND_ONECLICK', 'en_US', 'Submission Review Reminder', '{$reviewerName}:<br />\n<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have this review by {$reviewDueDate}, and would be pleased to receive it as soon as you are able to prepare it.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nPlease confirm your ability to complete this vital contribution to the work of the journal. I look forward to hearing from you.<br />\n<br />\n{$editorialContactSignature}', 'This email is sent by a Section Editor to remind a reviewer that their review is due.'),
('REVIEW_REQUEST', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission''s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal''s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED.)'),
('REVIEW_REQUEST_ATTACHED', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; and I am asking that you consider undertaking this important task for us. The Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST.)'),
('REVIEW_REQUEST_ATTACHED_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nThe Review Guidelines for this journal are appended below, and the submission is attached to this email. Your review of the submission, along with your recommendation, should be emailed to me by {$reviewDueDate}.<br />\n<br />\nPlease indicate in a return email by {$responseDueDate} whether you are able and willing to do the review.<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n<br />\nReview Guidelines<br />\n<br />\n{$reviewGuidelines}<br />\n', 'This email is sent by the Section Editor to a Reviewer to request that they accept or decline the task of reviewing a submission for a second or greater round of review. It includes the submission as an attachment. This message is used when the Email-Attachment Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_SUBSEQUENT.)'),
('REVIEW_REQUEST_ONECLICK', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript, &quot;{$submissionTitle},&quot; which has been submitted to {$contextName}. The submission''s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_ONECLICK_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review, and one-click reviewer access is enabled.'),
('REVIEW_REQUEST_REMIND_AUTO', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date.\n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission''s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal''s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email is automatically sent when a reviewer''s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is disabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_REMIND_AUTO_ONECLICK', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\nJust a gentle reminder of our request for your review of the submission, &quot;{$submissionTitle},&quot; for {$contextName}. We were hoping to have your response by {$responseDueDate}, and this email has been automatically generated and sent with the passing of that date. \n<br />\nI believe that you would serve as an excellent reviewer of the manuscript. The submission''s abstract is inserted below, and I hope that you will consider undertaking this important task for us.<br />\n<br />\nPlease log into the journal web site to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation.<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email is automatically sent when a reviewer''s confirmation due date elapses (see Review Options under Settings > Workflow > Review) and one-click reviewer access is enabled. Scheduled tasks must be enabled and configured (see the site configuration file).'),
('REVIEW_REQUEST_SUBSEQUENT', 'en_US', 'Article Review Request', '{$reviewerName}:<br />\n<br />\nThis regards the manuscript &quot;{$submissionTitle},&quot; which is under consideration by {$contextName}.<br />\n<br />\nFollowing the review of the previous version of the manuscript, the authors have now submitted a revised version of their paper. We would appreciate it if you could help evaluate it.<br />\n<br />\nPlease log into the journal web site by {$responseDueDate} to indicate whether you will undertake the review or not, as well as to access the submission and to record your review and recommendation. The web site is {$contextUrl}<br />\n<br />\nThe review itself is due {$reviewDueDate}.<br />\n<br />\nIf you do not have your username and password for the journal''s web site, you can use this link to reset your password (which will then be emailed to you along with your username). {$passwordResetUrl}<br />\n<br />\nSubmission URL: {$submissionReviewUrl}<br />\n<br />\nThank you for considering this request.<br />\n<br />\n{$editorialContactSignature}<br />\n<br />\n&quot;{$submissionTitle}&quot;<br />\n<br />\n{$submissionAbstract}', 'This email from the Section Editor to a Reviewer requests that the reviewer accept or decline the task of reviewing a submission for a second or greater round of review. It provides information about the submission such as the title and abstract, a review due date, and how to access the submission itself. This message is used when the Standard Review Process is selected in Management > Settings > Workflow > Review. (Otherwise see REVIEW_REQUEST_ATTACHED_SUBSEQUENT.)'),
('REVISED_VERSION_NOTIFY', 'en_US', 'Revised Version Uploaded', '{$editorialContactName}:<br />\n<br />\nA revised version of &quot;{$submissionTitle}&quot; has been uploaded by the author {$authorName}.<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\n<br />\n{$editorialContactSignature}', 'This email is automatically sent to the assigned editor when author uploads a revised version of an article.'),
('SUBMISSION_ACK', 'en_US', 'Submission Acknowledgement', '{$authorName}:<br />\n<br />\nThank you for submitting the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. With the online journal management system that we are using, you will be able to track its progress through the editorial process by logging in to the journal web site:<br />\n<br />\nSubmission URL: {$submissionUrl}<br />\nUsername: {$authorUsername}<br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to an author when he or she completes the process of submitting a manuscript to the journal. It provides information about tracking the submission through the process and thanks the author for the submission.'),
('SUBMISSION_ACK_NOT_USER', 'en_US', 'Submission Acknowledgement', 'Hello,<br />\n<br />\n{$submitterName} has submitted the manuscript, &quot;{$submissionTitle}&quot; to {$contextName}. <br />\n<br />\nIf you have any questions, please contact me. Thank you for considering this journal as a venue for your work.<br />\n<br />\n{$editorialContactSignature}', 'This email, when enabled, is automatically sent to the other authors who are not users within OJS specified during the submission process.'),
('SUBMISSION_UNSUITABLE', 'en_US', 'Unsuitable Submission', '{$authorName}:<br />\n<br />\nAn initial review of &quot;{$submissionTitle}&quot; has made it clear that this submission does not fit within the scope and focus of {$contextName}. I recommend that you consult the description of this journal under About, as well as its current contents, to learn more about the work that we publish. You might also consider submitting this manuscript to another, more suitable journal.<br />\n<br />\n{$editorialContactSignature}', NULL),
('SUBSCRIPTION_AFTER_EXPIRY', 'en_US', 'Subscription Expired', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal''s URL along with instructions for access.'),
('SUBSCRIPTION_AFTER_EXPIRY_LAST', 'en_US', 'Subscription Expired - Final Reminder', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription has expired.<br />\nPlease note that this is the final reminder that will be emailed to you.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo renew your subscription, please go to the journal website. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription has expired. It provides the journal''s URL along with instructions for access.'),
('SUBSCRIPTION_BEFORE_EXPIRY', 'en_US', 'Notice of Subscription Expiry', '{$subscriberName}:<br />\n<br />\nYour {$contextName} subscription is about to expire.<br />\n<br />\n{$subscriptionType}<br />\nExpiry date: {$expiryDate}<br />\n<br />\nTo ensure the continuity of your access to this journal, please go to the journal website and renew your subscription. You are able to log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a subscriber that their subscription will soon expire. It provides the journal''s URL along with instructions for access.'),
('SUBSCRIPTION_NOTIFY', 'en_US', 'Subscription Notification', '{$subscriberName}:<br />\n<br />\nYou have now been registered as a subscriber in our online journal management system for {$contextName}, with the following subscription:<br />\n<br />\n{$subscriptionType}<br />\n<br />\nTo access content that is available only to subscribers, simply log in to the system with your username, &quot;{$username}&quot;.<br />\n<br />\nOnce you have logged in to the system you can change your profile details and password at any point.<br />\n<br />\nPlease note that if you have an institutional subscription, there is no need for users at your institution to log in, since requests for subscription content will be automatically authenticated by the system.<br />\n<br />\nIf you have any questions, please feel free to contact me.<br />\n<br />\n{$subscriptionContactSignature}', 'This email notifies a registered reader that the Manager has created a subscription for them. It provides the journal''s URL along with instructions for access.'),
('SUBSCRIPTION_PURCHASE_INDL', 'en_US', 'Subscription Purchase: Individual', 'An individual subscription has been purchased online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an individual subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_PURCHASE_INSTL', 'en_US', 'Subscription Purchase: Institutional', 'An institutional subscription has been purchased online for {$contextName} with the following details. To activate this subscription, please use the provided Subscription URL and set the subscription status to ''Active''.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an institutional subscription has been purchased online. It provides summary information about the subscription and a quick access link to the purchased subscription.'),
('SUBSCRIPTION_RENEW_INDL', 'en_US', 'Subscription Renewal: Individual', 'An individual subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nUser:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an individual subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('SUBSCRIPTION_RENEW_INSTL', 'en_US', 'Subscription Renewal: Institutional', 'An institutional subscription has been renewed online for {$contextName} with the following details.<br />\n<br />\nSubscription Type:<br />\n{$subscriptionType}<br />\n<br />\nInstitution:<br />\n{$institutionName}<br />\n{$institutionMailingAddress}<br />\n<br />\nDomain (if provided):<br />\n{$domain}<br />\n<br />\nIP Ranges (if provided):<br />\n{$ipRanges}<br />\n<br />\nContact Person:<br />\n{$userDetails}<br />\n<br />\nMembership Information (if provided):<br />\n{$membership}<br />\n<br />\nTo view or edit this subscription, please use the following URL.<br />\n<br />\nSubscription URL: {$subscriptionUrl}<br />\n', 'This email notifies the Subscription Manager that an institutional subscription has been renewed online. It provides summary information about the subscription and a quick access link to the renewed subscription.'),
('USER_REGISTER', 'en_US', 'Journal Registration', '{$userFullName}<br />\n<br />\nYou have now been registered as a user with {$contextName}. We have included your username and password in this email, which are needed for all work with this journal through its website. At any point, you can ask to be removed from the journal''s list of users by contacting me.<br />\n<br />\nUsername: {$username}<br />\nPassword: {$password}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to welcome them to the system and provide them with a record of their username and password.'),
('USER_VALIDATE', 'en_US', 'Validate Your Account', '{$userFullName}<br />\n<br />\nYou have created an account with {$contextName}, but before you can start using it, you need to validate your email account. To do this, simply follow the link below:<br />\n<br />\n{$activateUrl}<br />\n<br />\nThank you,<br />\n{$principalContactSignature}', 'This email is sent to a newly registered user to validate their email account.');

-- --------------------------------------------------------

--
-- Table structure for table `event_log`
--

CREATE TABLE IF NOT EXISTS `event_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `ip_address` varchar(39) NOT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `message` text,
  `is_translated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `event_log_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_log_settings`
--

CREATE TABLE IF NOT EXISTS `event_log_settings` (
  `log_id` bigint(20) NOT NULL,
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `event_log_settings_pkey` (`log_id`,`setting_name`),
  KEY `event_log_settings_log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `filters`
--

CREATE TABLE IF NOT EXISTS `filters` (
  `filter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `filter_group_id` bigint(20) NOT NULL DEFAULT '0',
  `context_id` bigint(20) NOT NULL DEFAULT '0',
  `display_name` varchar(255) DEFAULT NULL,
  `class_name` varchar(255) DEFAULT NULL,
  `is_template` tinyint(4) NOT NULL DEFAULT '0',
  `parent_filter_id` bigint(20) NOT NULL DEFAULT '0',
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `filters`
--

INSERT INTO `filters` (`filter_id`, `filter_group_id`, `context_id`, `display_name`, `class_name`, `is_template`, `parent_filter_id`, `seq`) VALUES
(1, 1, 0, 'Extract metadata from a(n) Citation', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaCitationAdapter', 0, 0, 0),
(2, 2, 0, 'Inject metadata into a(n) Citation', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaCitationAdapter', 0, 0, 0),
(3, 6, 0, 'NLM 3.0 XML Citation Output', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter', 0, 0, 0),
(4, 7, 0, 'NLM Journal Publishing V3.0 ref-list', 'lib.pkp.plugins.metadata.nlm30.filter.PKPSubmissionNlm30XmlFilter', 0, 0, 0),
(5, 8, 0, 'NLM Journal Publishing V2.3 ref-list', 'lib.pkp.classes.filter.GenericSequencerFilter', 0, 0, 0),
(6, 7, 0, 'NLM 2.3: NLM 3.0', 'lib.pkp.plugins.metadata.nlm30.filter.PKPSubmissionNlm30XmlFilter', 0, 5, 1),
(7, 9, 0, 'NLM 2.3: NLM 3.0 to 2.3', 'lib.pkp.classes.xslt.XSLTransformationFilter', 0, 5, 2),
(8, 11, 0, 'MODS 3.4', 'lib.pkp.plugins.metadata.mods34.filter.Mods34DescriptionXmlFilter', 0, 0, 0),
(9, 12, 0, 'Extract metadata from a(n) Article', 'plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter', 0, 0, 0),
(10, 13, 0, 'Inject metadata into a(n) Article', 'plugins.metadata.mods34.filter.Mods34SchemaArticleAdapter', 0, 0, 0),
(11, 14, 0, 'Extract metadata from a(n) Article', 'plugins.metadata.dc11.filter.Dc11SchemaArticleAdapter', 0, 0, 0),
(12, 4, 0, 'PubMed', 'lib.pkp.plugins.citationLookup.pubmed.filter.PubmedNlm30CitationSchemaFilter', 1, 0, 0),
(13, 4, 0, 'ISBNdb', 'lib.pkp.classes.filter.GenericSequencerFilter', 1, 0, 0),
(14, 15, 0, 'ISBNdb (from NLM)', 'lib.pkp.plugins.citationLookup.isbndb.filter.IsbndbNlm30CitationSchemaIsbnFilter', 0, 13, 1),
(15, 16, 0, 'ISBNdb', 'lib.pkp.plugins.citationLookup.isbndb.filter.IsbndbIsbnNlm30CitationSchemaFilter', 0, 13, 2),
(16, 4, 0, 'WorldCat', 'lib.pkp.plugins.citationLookup.worldcat.filter.WorldcatNlm30CitationSchemaFilter', 1, 0, 0),
(17, 4, 0, 'CrossRef', 'lib.pkp.plugins.citationLookup.crossref.filter.CrossrefNlm30CitationSchemaFilter', 1, 0, 0),
(18, 3, 0, 'FreeCite', 'lib.pkp.plugins.citationParser.freecite.filter.FreeciteRawCitationNlm30CitationSchemaFilter', 1, 0, 0),
(19, 3, 0, 'ParaCite', 'lib.pkp.plugins.citationParser.paracite.filter.ParaciteRawCitationNlm30CitationSchemaFilter', 1, 0, 0),
(20, 3, 0, 'ParsCit', 'lib.pkp.plugins.citationParser.parscit.filter.ParscitRawCitationNlm30CitationSchemaFilter', 1, 0, 0),
(21, 3, 0, 'RegEx', 'lib.pkp.plugins.citationParser.regex.filter.RegexRawCitationNlm30CitationSchemaFilter', 1, 0, 0),
(22, 17, 0, 'mEDRA XML issue export', 'plugins.importexport.medra.filter.IssueMedraXmlFilter', 0, 0, 0),
(23, 18, 0, 'mEDRA XML article export', 'plugins.importexport.medra.filter.ArticleMedraXmlFilter', 0, 0, 0),
(24, 19, 0, 'mEDRA XML article export', 'plugins.importexport.medra.filter.GalleyMedraXmlFilter', 0, 0, 0),
(25, 20, 0, 'ArticlePubMedXmlFilter', 'plugins.importexport.pubmed.filter.ArticlePubMedXmlFilter', 0, 0, 0),
(26, 21, 0, 'User XML user export', 'lib.pkp.plugins.importexport.users.filter.PKPUserUserXmlFilter', 0, 0, 0),
(27, 22, 0, 'User XML user import', 'lib.pkp.plugins.importexport.users.filter.UserXmlPKPUserFilter', 0, 0, 0),
(28, 23, 0, 'Native XML user group export', 'lib.pkp.plugins.importexport.users.filter.UserGroupNativeXmlFilter', 0, 0, 0),
(29, 24, 0, 'Native XML user group import', 'lib.pkp.plugins.importexport.users.filter.NativeXmlUserGroupFilter', 0, 0, 0),
(30, 25, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(31, 26, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(32, 27, 0, 'DataCite XML export', 'plugins.importexport.datacite.filter.DataciteXmlFilter', 0, 0, 0),
(33, 28, 0, 'DOAJ XML export', 'plugins.importexport.doaj.filter.DOAJXmlFilter', 0, 0, 0),
(34, 29, 0, 'DOAJ JSON export', 'plugins.importexport.doaj.filter.DOAJJsonFilter', 0, 0, 0),
(35, 30, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.IssueCrossrefXmlFilter', 0, 0, 0),
(36, 31, 0, 'Crossref XML issue export', 'plugins.importexport.crossref.filter.ArticleCrossrefXmlFilter', 0, 0, 0),
(37, 32, 0, 'Native XML submission export', 'plugins.importexport.native.filter.ArticleNativeXmlFilter', 0, 0, 0),
(38, 33, 0, 'Native XML submission import', 'plugins.importexport.native.filter.NativeXmlArticleFilter', 0, 0, 0),
(39, 34, 0, 'Native XML issue export', 'plugins.importexport.native.filter.IssueNativeXmlFilter', 0, 0, 0),
(40, 35, 0, 'Native XML issue import', 'plugins.importexport.native.filter.NativeXmlIssueFilter', 0, 0, 0),
(41, 36, 0, 'Native XML issue galley export', 'plugins.importexport.native.filter.IssueGalleyNativeXmlFilter', 0, 0, 0),
(42, 37, 0, 'Native XML issue galley import', 'plugins.importexport.native.filter.NativeXmlIssueGalleyFilter', 0, 0, 0),
(43, 38, 0, 'Native XML author export', 'plugins.importexport.native.filter.AuthorNativeXmlFilter', 0, 0, 0),
(44, 39, 0, 'Native XML author import', 'plugins.importexport.native.filter.NativeXmlAuthorFilter', 0, 0, 0),
(45, 43, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlArticleFileFilter', 0, 0, 0),
(46, 44, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlArtworkFileFilter', 0, 0, 0),
(47, 45, 0, 'Native XML submission file import', 'plugins.importexport.native.filter.NativeXmlSupplementaryFileFilter', 0, 0, 0),
(48, 40, 0, 'Native XML submission file export', 'lib.pkp.plugins.importexport.native.filter.SubmissionFileNativeXmlFilter', 0, 0, 0),
(49, 41, 0, 'Native XML submission file export', 'plugins.importexport.native.filter.ArtworkFileNativeXmlFilter', 0, 0, 0),
(50, 42, 0, 'Native XML submission file export', 'plugins.importexport.native.filter.SupplementaryFileNativeXmlFilter', 0, 0, 0),
(51, 46, 0, 'Native XML representation export', 'plugins.importexport.native.filter.ArticleGalleyNativeXmlFilter', 0, 0, 0),
(52, 47, 0, 'Native XML representation import', 'plugins.importexport.native.filter.NativeXmlArticleGalleyFilter', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `filter_groups`
--

CREATE TABLE IF NOT EXISTS `filter_groups` (
  `filter_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `symbolic` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `input_type` varchar(255) DEFAULT NULL,
  `output_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`filter_group_id`),
  UNIQUE KEY `filter_groups_symbolic` (`symbolic`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=48 ;

--
-- Dumping data for table `filter_groups`
--

INSERT INTO `filter_groups` (`filter_group_id`, `symbolic`, `display_name`, `description`, `input_type`, `output_type`) VALUES
(1, 'citation=>nlm30', 'plugins.metadata.nlm30.citationAdapter.displayName', 'plugins.metadata.nlm30.citationAdapter.description', 'class::lib.pkp.classes.citation.Citation', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),
(2, 'nlm30=>citation', 'plugins.metadata.nlm30.citationAdapter.displayName', 'plugins.metadata.nlm30.citationAdapter.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'class::lib.pkp.classes.citation.Citation'),
(3, 'plaintext=>nlm30-element-citation', 'plugins.metadata.nlm30.citationParsers.displayName', 'plugins.metadata.nlm30.citationParsers.description', 'primitive::string', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),
(4, 'nlm30-element-citation=>nlm30-element-citation', 'plugins.metadata.nlm30.citationLookup.displayName', 'plugins.metadata.nlm30.citationLookup.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),
(5, 'nlm30-element-citation=>plaintext', 'plugins.metadata.nlm30.citationOutput.displayName', 'plugins.metadata.nlm30.citationOutput.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'primitive::string'),
(6, 'nlm30-element-citation=>nlm30-xml', 'plugins.metadata.nlm30Xml.citationOutput.displayName', 'plugins.metadata.nlm30Xml.citationOutput.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'xml::*'),
(7, 'submission=>nlm30-article-xml', 'plugins.metadata.nlm30.nlm30XmlOutput.displayName', 'plugins.metadata.nlm30.nlm30XmlOutput.description', 'class::lib.pkp.classes.submission.Submission', 'xml::*'),
(8, 'submission=>nlm23-article-xml', 'plugins.metadata.nlm30.nlm23XmlOutput.displayName', 'plugins.metadata.nlm30.nlm23XmlOutput.description', 'class::lib.pkp.classes.submission.Submission', 'xml::*'),
(9, 'nlm30-article-xml=>nlm23-article-xml', 'plugins.metadata.nlm30.nlm30ToNlm23Xml.displayName', 'plugins.metadata.nlm30.nlm30ToNlm23Xml.description', 'xml::*', 'xml::*'),
(10, 'submission=>reference-list', 'plugins.metadata.nlm30.refList.displayName', 'plugins.metadata.nlm30.refList.description', 'class::lib.pkp.classes.submission.Submission', 'class::lib.pkp.classes.citation.PlainTextReferencesList'),
(11, 'mods34=>mods34-xml', 'plugins.metadata.mods34.mods34XmlOutput.displayName', 'plugins.metadata.mods34.mods34XmlOutput.description', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(*)', 'xml::schema(lib/pkp/plugins/metadata/mods34/filter/mods34.xsd)'),
(12, 'article=>mods34', 'plugins.metadata.mods34.articleAdapter.displayName', 'plugins.metadata.mods34.articleAdapter.description', 'class::classes.article.Article', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)'),
(13, 'mods34=>article', 'plugins.metadata.mods34.articleAdapter.displayName', 'plugins.metadata.mods34.articleAdapter.description', 'metadata::plugins.metadata.mods34.schema.Mods34Schema(ARTICLE)', 'class::classes.article.Article'),
(14, 'article=>dc11', 'plugins.metadata.dc11.articleAdapter.displayName', 'plugins.metadata.dc11.articleAdapter.description', 'class::classes.article.Article', 'metadata::plugins.metadata.dc11.schema.Dc11Schema(ARTICLE)'),
(15, 'nlm30-element-citation=>isbn', 'plugins.citationLookup.isbndbExtraction.displayName', 'plugins.citationLookup.isbndbExtraction.description', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)', 'primitive::string'),
(16, 'isbn=>nlm30-element-citation', 'plugins.citationLookup.isbndbLookup.displayName', 'plugins.citationLookup.isbndbLookup.description', 'primitive::string', 'metadata::lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema(CITATION)'),
(17, 'issue=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.issue.Issue[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
(18, 'article=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.article.Article[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
(19, 'galley=>medra-xml', 'plugins.importexport.medra.displayName', 'plugins.importexport.medra.description', 'class::classes.article.ArticleGalley[]', 'xml::schema(http://www.medra.org/schema/onix/DOIMetadata/2.0/ONIX_DOIMetadata_2.0.xsd)'),
(20, 'article=>pubmed-xml', 'plugins.importexport.pubmed.displayName', 'plugins.importexport.pubmed.description', 'class::classes.article.Article[]', 'xml::dtd'),
(21, 'user=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::classes.user.User[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(22, 'user-xml=>user', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::classes.users.User[]'),
(23, 'usergroup=>user-xml', 'plugins.importexport.users.displayName', 'plugins.importexport.users.description', 'class::lib.pkp.classes.security.UserGroup[]', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)'),
(24, 'user-xml=>usergroup', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(lib/pkp/plugins/importexport/users/pkp-users.xsd)', 'class::lib.pkp.classes.security.UserGroup[]'),
(25, 'issue=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.issue.Issue', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(26, 'article=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.article.Article', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(27, 'galley=>datacite-xml', 'plugins.importexport.datacite.displayName', 'plugins.importexport.datacite.description', 'class::classes.article.ArticleGalley', 'xml::schema(http://schema.datacite.org/meta/kernel-4/metadata.xsd)'),
(28, 'article=>doaj-xml', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.article.Article[]', 'xml::schema(plugins/importexport/doaj/doajArticles.xsd)'),
(29, 'article=>doaj-json', 'plugins.importexport.doaj.displayName', 'plugins.importexport.doaj.description', 'class::classes.article.Article', 'primitive::string'),
(30, 'issue=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.issue.Issue[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(31, 'article=>crossref-xml', 'plugins.importexport.crossref.displayName', 'plugins.importexport.crossref.description', 'class::classes.article.Article[]', 'xml::schema(https://www.crossref.org/schemas/crossref4.3.6.xsd)'),
(32, 'article=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.Article[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(33, 'native-xml=>article', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.Article[]'),
(34, 'issue=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.Issue[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(35, 'native-xml=>issue', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.Issue[]'),
(36, 'issuegalley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.issue.IssueGalley[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(37, 'native-xml=>issuegalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.issue.IssueGalley[]'),
(38, 'author=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.Author[]', 'xml::schema(plugins/importexport/native/native.xsd)'),
(39, 'native-xml=>author', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.Author[]'),
(40, 'SubmissionFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SubmissionFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(41, 'SubmissionArtworkFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SubmissionArtworkFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(42, 'SupplementaryFile=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::lib.pkp.classes.submission.SupplementaryFile', 'xml::schema(plugins/importexport/native/native.xsd)'),
(43, 'native-xml=>SubmissionFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SubmissionFile'),
(44, 'native-xml=>SubmissionArtworkFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SubmissionArtworkFile'),
(45, 'native-xml=>SupplementaryFile', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::lib.pkp.classes.submission.SupplementaryFile'),
(46, 'article-galley=>native-xml', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'class::classes.article.ArticleGalley', 'xml::schema(plugins/importexport/native/native.xsd)'),
(47, 'native-xml=>ArticleGalley', 'plugins.importexport.native.displayName', 'plugins.importexport.native.description', 'xml::schema(plugins/importexport/native/native.xsd)', 'class::classes.article.ArticleGalley[]');

-- --------------------------------------------------------

--
-- Table structure for table `filter_settings`
--

CREATE TABLE IF NOT EXISTS `filter_settings` (
  `filter_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `filter_settings_pkey` (`filter_id`,`locale`,`setting_name`),
  KEY `filter_settings_id` (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `filter_settings`
--

INSERT INTO `filter_settings` (`filter_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(4, '', 'citationOutputFilterName', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter', 'string'),
(4, '', 'metadataSchemaName', 'lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema', 'string'),
(5, '', 'settingsMapping', 'a:2:{s:6:"apiKey";a:2:{i:0;s:11:"seq1_apiKey";i:1;s:11:"seq2_apiKey";}s:10:"isOptional";a:2:{i:0;s:15:"seq1_isOptional";i:1;s:15:"seq2_isOptional";}}', 'object'),
(6, '', 'citationOutputFilterName', 'lib.pkp.plugins.metadata.nlm30.filter.Nlm30CitationSchemaNlm30XmlFilter', 'string'),
(6, '', 'metadataSchemaName', 'lib.pkp.plugins.metadata.nlm30.schema.Nlm30CitationSchema', 'string'),
(7, '', 'xsl', 'lib/pkp/plugins/metadata/nlm30/filter/nlm30-to-23-ref-list.xsl', 'string'),
(7, '', 'xslType', '2', 'int'),
(12, '', 'phpVersionMin', '5.0.0', 'string'),
(13, '', 'settingsMapping', 'a:2:{s:6:"apiKey";a:2:{i:0;s:11:"seq1_apiKey";i:1;s:11:"seq2_apiKey";}s:10:"isOptional";a:2:{i:0;s:15:"seq1_isOptional";i:1;s:15:"seq2_isOptional";}}', 'object'),
(14, '', 'phpVersionMin', '5.0.0', 'string'),
(15, '', 'phpVersionMin', '5.0.0', 'string'),
(16, '', 'phpVersionMin', '5.0.0', 'string'),
(17, '', 'phpVersionMin', '5.0.0', 'string'),
(18, '', 'phpVersionMin', '5.0.0', 'string'),
(19, '', 'phpVersionMin', '5.0.0', 'string'),
(20, '', 'phpVersionMin', '5.0.0', 'string'),
(21, '', 'phpVersionMin', '5.0.0', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE IF NOT EXISTS `genres` (
  `genre_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `seq` bigint(20) DEFAULT NULL,
  `sortable` tinyint(4) NOT NULL DEFAULT '1',
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  `category` bigint(20) NOT NULL DEFAULT '1',
  `dependent` tinyint(4) NOT NULL DEFAULT '0',
  `supplementary` tinyint(4) DEFAULT '0',
  `entry_key` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `context_id`, `seq`, `sortable`, `enabled`, `category`, `dependent`, `supplementary`, `entry_key`) VALUES
(1, 1, 0, 0, 1, 1, 0, 0, 'SUBMISSION'),
(2, 1, 1, 0, 1, 3, 0, 1, 'RESEARCHINSTRUMENT'),
(3, 1, 2, 0, 1, 3, 0, 1, 'RESEARCHMATERIALS'),
(4, 1, 3, 0, 1, 3, 0, 1, 'RESEARCHRESULTS'),
(5, 1, 4, 0, 1, 3, 0, 1, 'TRANSCRIPTS'),
(6, 1, 5, 0, 1, 3, 0, 1, 'DATAANALYSIS'),
(7, 1, 6, 0, 1, 3, 0, 1, 'DATASET'),
(8, 1, 7, 0, 1, 3, 0, 1, 'SOURCETEXTS'),
(9, 1, 8, 0, 1, 1, 1, 1, 'MULTIMEDIA'),
(10, 1, 9, 0, 1, 2, 1, 0, 'IMAGE'),
(11, 1, 10, 0, 1, 1, 1, 0, 'STYLE'),
(12, 1, 11, 1, 1, 3, 0, 1, 'OTHER');

-- --------------------------------------------------------

--
-- Table structure for table `genre_settings`
--

CREATE TABLE IF NOT EXISTS `genre_settings` (
  `genre_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `genre_settings_pkey` (`genre_id`,`locale`,`setting_name`),
  KEY `genre_settings_genre_id` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre_settings`
--

INSERT INTO `genre_settings` (`genre_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Article Text', 'string'),
(2, 'en_US', 'name', 'Research Instrument', 'string'),
(3, 'en_US', 'name', 'Research Materials', 'string'),
(4, 'en_US', 'name', 'Research Results', 'string'),
(5, 'en_US', 'name', 'Transcripts', 'string'),
(6, 'en_US', 'name', 'Data Analysis', 'string'),
(7, 'en_US', 'name', 'Data Set', 'string'),
(8, 'en_US', 'name', 'Source Texts', 'string'),
(9, 'en_US', 'name', 'Multimedia', 'string'),
(10, 'en_US', 'name', 'Image', 'string'),
(11, 'en_US', 'name', 'HTML Stylesheet', 'string'),
(12, 'en_US', 'name', 'Other', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `institutional_subscriptions`
--

CREATE TABLE IF NOT EXISTS `institutional_subscriptions` (
  `institutional_subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `institution_name` varchar(255) NOT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_id`),
  KEY `institutional_subscriptions_subscription_id` (`subscription_id`),
  KEY `institutional_subscriptions_domain` (`domain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `institutional_subscription_ip`
--

CREATE TABLE IF NOT EXISTS `institutional_subscription_ip` (
  `institutional_subscription_ip_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) NOT NULL,
  `ip_string` varchar(40) NOT NULL,
  `ip_start` bigint(20) NOT NULL,
  `ip_end` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`institutional_subscription_ip_id`),
  KEY `institutional_subscription_ip_subscription_id` (`subscription_id`),
  KEY `institutional_subscription_ip_start` (`ip_start`),
  KEY `institutional_subscription_ip_end` (`ip_end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE IF NOT EXISTS `issues` (
  `issue_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `volume` smallint(6) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `year` smallint(6) DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT '0',
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `date_published` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `access_status` tinyint(4) NOT NULL DEFAULT '1',
  `open_access_date` datetime DEFAULT NULL,
  `show_volume` tinyint(4) NOT NULL DEFAULT '0',
  `show_number` tinyint(4) NOT NULL DEFAULT '0',
  `show_year` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '0',
  `style_file_name` varchar(90) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `issues_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_files`
--

CREATE TABLE IF NOT EXISTS `issue_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `issue_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `content_type` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `issue_files_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_galleys`
--

CREATE TABLE IF NOT EXISTS `issue_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `issue_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`galley_id`),
  KEY `issue_galleys_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `issue_galley_settings`
--

CREATE TABLE IF NOT EXISTS `issue_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `issue_galley_settings_galley_id` (`galley_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `issue_settings`
--

CREATE TABLE IF NOT EXISTS `issue_settings` (
  `issue_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `issue_settings_pkey` (`issue_id`,`locale`,`setting_name`),
  KEY `issue_settings_issue_id` (`issue_id`),
  KEY `issue_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `item_views`
--

CREATE TABLE IF NOT EXISTS `item_views` (
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` varchar(32) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_last_viewed` datetime DEFAULT NULL,
  UNIQUE KEY `item_views_pkey` (`assoc_type`,`assoc_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `journals`
--

CREATE TABLE IF NOT EXISTS `journals` (
  `journal_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`journal_id`),
  UNIQUE KEY `journals_path` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `journals`
--

INSERT INTO `journals` (`journal_id`, `path`, `seq`, `primary_locale`, `enabled`) VALUES
(1, 'research', 1, 'en_US', 1);

-- --------------------------------------------------------

--
-- Table structure for table `journal_settings`
--

CREATE TABLE IF NOT EXISTS `journal_settings` (
  `journal_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `journal_settings_pkey` (`journal_id`,`locale`,`setting_name`),
  KEY `journal_settings_journal_id` (`journal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `journal_settings`
--

INSERT INTO `journal_settings` (`journal_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'agenciesEnabledSubmission', '0', 'bool'),
(1, '', 'agenciesEnabledWorkflow', '1', 'bool'),
(1, '', 'agenciesRequired', '0', 'bool'),
(1, '', 'citationsEnabledSubmission', '0', 'bool'),
(1, '', 'citationsEnabledWorkflow', '1', 'bool'),
(1, '', 'citationsRequired', '0', 'bool'),
(1, '', 'contactEmail', 'admin@trident.com', 'string'),
(1, '', 'contactName', 'Administrator', 'string'),
(1, '', 'contactPhone', '', 'string'),
(1, '', 'copySubmissionAckAddress', '', 'string'),
(1, '', 'copySubmissionAckPrimaryContact', '0', 'bool'),
(1, '', 'coverageEnabledSubmission', '0', 'bool'),
(1, '', 'coverageEnabledWorkflow', '1', 'bool'),
(1, '', 'coverageRequired', '0', 'bool'),
(1, '', 'defaultReviewMode', '2', 'int'),
(1, '', 'disciplinesEnabledSubmission', '0', 'bool'),
(1, '', 'disciplinesEnabledWorkflow', '1', 'bool'),
(1, '', 'disciplinesRequired', '0', 'bool'),
(1, '', 'emailSignature', '<br/>\n________________________________________________________________________<br/>\n<a href="{$contextUrl}">{$contextName}</a>', 'string'),
(1, '', 'itemsPerPage', '25', 'int'),
(1, '', 'keywordsEnabledSubmission', '1', 'bool'),
(1, '', 'keywordsEnabledWorkflow', '1', 'bool'),
(1, '', 'keywordsRequired', '0', 'bool'),
(1, '', 'languagesEnabledSubmission', '0', 'bool'),
(1, '', 'languagesEnabledWorkflow', '1', 'bool'),
(1, '', 'languagesRequired', '0', 'bool'),
(1, '', 'mailingAddress', NULL, 'string'),
(1, '', 'membershipFee', '0', 'int'),
(1, '', 'navItems', 'N;', 'object'),
(1, '', 'numPageLinks', '10', 'int'),
(1, '', 'numWeeksPerReview', '4', 'int'),
(1, '', 'publicationFee', '0', 'int'),
(1, '', 'purchaseArticleFee', '0', 'int'),
(1, '', 'rightsEnabledSubmission', '0', 'bool'),
(1, '', 'rightsEnabledWorkflow', '1', 'bool'),
(1, '', 'rightsRequired', '0', 'bool'),
(1, '', 'rtAbstract', '1', 'bool'),
(1, '', 'rtAddComment', '1', 'bool'),
(1, '', 'rtCaptureCite', '1', 'bool'),
(1, '', 'rtDefineTerms', '1', 'bool'),
(1, '', 'rtEmailAuthor', '1', 'bool'),
(1, '', 'rtEmailOthers', '1', 'bool'),
(1, '', 'rtPrinterFriendly', '1', 'bool'),
(1, '', 'rtSupplementaryFiles', '1', 'bool'),
(1, '', 'rtViewMetadata', '1', 'bool'),
(1, '', 'sourceEnabledSubmission', '0', 'bool'),
(1, '', 'sourceEnabledWorkflow', '1', 'bool'),
(1, '', 'sourceRequired', '0', 'bool'),
(1, '', 'subjectEnabledSubmission', '0', 'bool'),
(1, '', 'subjectEnabledWorkflow', '1', 'bool'),
(1, '', 'subjectRequired', '0', 'bool'),
(1, '', 'supportedFormLocales', 'a:1:{i:0;s:5:"en_US";}', 'object'),
(1, '', 'supportedLocales', 'a:1:{i:0;s:5:"en_US";}', 'object'),
(1, '', 'supportedSubmissionLocales', 'a:1:{i:0;s:5:"en_US";}', 'object'),
(1, '', 'supportEmail', NULL, 'string'),
(1, '', 'supportName', NULL, 'string'),
(1, '', 'supportPhone', NULL, 'string'),
(1, '', 'themePluginPath', 'bootstrap3', 'string'),
(1, '', 'typeEnabledSubmission', '0', 'bool'),
(1, '', 'typeEnabledWorkflow', '1', 'bool'),
(1, '', 'typeRequired', '0', 'bool'),
(1, 'en_US', 'authorInformation', 'Interested in submitting to this journal? We recommend that you review the <a href="http://tridentjs.x10host.com/tridentOJS/index.php/research/about">About the Journal</a> page for the journal''s section policies, as well as the <a href="http://tridentjs.x10host.com/tridentOJS/index.php/research/about/submissions#authorGuidelines">Author Guidelines</a>. Authors need to <a href="http://tridentjs.x10host.com/tridentOJS/index.php/research/user/register">register</a> with the journal prior to submitting or, if already registered, can simply <a href="http://tridentjs.x10host.com/tridentOJS/index.php/index/login">log in</a> and begin the five-step process.', 'string'),
(1, 'en_US', 'authorSelfArchivePolicy', 'This journal permits and encourages authors to post items submitted to the journal on personal websites or institutional repositories both prior to and after publication, while providing bibliographic details that credit, if applicable, its publication in this journal.', 'string'),
(1, 'en_US', 'clockssLicense', 'This journal utilizes the CLOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href="http://clockss.org/">More...</a>', 'string'),
(1, 'en_US', 'copyeditInstructions', 'The copyediting stage is intended to improve the flow, clarity, grammar, wording, and formatting of the article. It represents the last chance for the author to make any substantial changes to the text because the next stage is restricted to typos and formatting corrections.\n\nThe file to be copyedited is in Word or .rtf format and therefore can easily be edited as a word processing document. The set of instructions displayed here proposes two approaches to copyediting. One is based on Microsoft Word''s Track Changes feature and requires that the copy editor, editor, and author have access to this program. A second system, which is software independent, has been borrowed, with permission, from the Harvard Educational Review. The journal editor is in a position to modify these instructions, so suggestions can be made to improve the process for this journal.\n\n\n<h4>Copyediting Systems</h4>\n\n<strong>1. Microsoft Word''s Track Changes</strong>\n\nUnder Tools in the menu bar, the feature Track Changes enables the copy editor to make insertions (text appears in color) and deletions (text appears crossed out in color or in the margins as deleted). The copy editor can posit queries to both the author (Author Queries) and to the editor (Editor Queries) by inserting these queries in square brackets. The copyedited version is then uploaded, and the editor is notified. The editor then reviews the text and notifies the author.\n\nThe editor and author should leave those changes with which they are satisfied. If further changes are necessary, the editor and author can make changes to the initial insertions or deletions, as well as make new insertions or deletions elsewhere in the text. Authors and editors should respond to each of the queries addressed to them, with responses placed inside the square brackets.\n\nAfter the text has been reviewed by editor and author, the copy editor will make a final pass over the text accepting the changes in preparation for the layout and galley stage.\n\n\n<strong>2. Harvard Educational Review</strong>\n\n<strong>Instructions for Making Electronic Revisions to the Manuscript</strong>\n\nPlease follow the following protocol for making electronic revisions to your manuscript:\n\n<strong>Responding to suggested changes.</strong>\n&nbsp; For each of the suggested changes that you accept, unbold the text.\n&nbsp; For each of the suggested changes that you do not accept, re-enter the original text and <strong>bold</strong> it.\n\n<strong>Making additions and deletions.</strong>\n&nbsp; Indicate additions by <strong>bolding</strong> the new text.\n&nbsp; Replace deleted sections with: <strong>[deleted text]</strong>.\n&nbsp; If you delete one or more sentence, please indicate with a note, e.g., <strong>[deleted 2 sentences]</strong>.\n\n<strong>Responding to Queries to the Author (QAs).</strong>\n&nbsp; Keep all QAs intact and bolded within the text. Do not delete them.\n&nbsp; To reply to a QA, add a comment after it. Comments should be delimited using:\n<strong>[Comment:]</strong>\n&nbsp; e.g., <strong>[Comment: Expanded discussion of methodology as you suggested]</strong>.\n\n<strong>Making comments.</strong>\n&nbsp; Use comments to explain organizational changes or major revisions\n&nbsp; e.g., <strong>[Comment: Moved the above paragraph from p. 5 to p. 7].</strong>\n&nbsp; Note: When referring to page numbers, please use the page numbers from the printed copy of the manuscript that was sent to you. This is important since page numbers may change as a document is revised electronically.\n\n<h4>An Illustration of an Electronic Revision</h4>\n\n<ol>\n<li><strong>Initial copyedit.</strong> The journal copy editor will edit the text to improve flow, clarity, grammar, wording, and formatting, as well as including author queries as necessary. Once the initial edit is complete, the copy editor will upload the revised document through the journal Web site and notify the author that the edited manuscript is available for review.</li>\n<li><strong>Author copyedit.</strong> Before making dramatic departures from the structure and organization of the edited manuscript, authors must check in with the editors who are co-chairing the piece. Authors should accept/reject any changes made during the initial copyediting, as appropriate, and respond to all author queries. When finished with the revisions, authors should rename the file from AuthorNameQA.doc to AuthorNameQAR.doc (e.g., from LeeQA.doc to LeeQAR.doc) and upload the revised document through the journal Web site as directed.</li>\n<li><strong>Final copyedit.</strong> The journal copy editor will verify changes made by the author and incorporate the responses to the author queries to create a final manuscript. When finished, the copy editor will upload the final document through the journal Web site and alert the layout editor to complete formatting.</li>\n</ol>', 'string'),
(1, 'en_US', 'description', '<p><strong>Descriptives research</strong>&nbsp;is used to describe characteristics of a&nbsp;<a title="Statistical population" href="https://en.wikipedia.org/wiki/Statistical_population">population</a>&nbsp;or phenomenon being studied. It does not answer questions about how/when/why the characteristics occurred. Rather it addresses the "what" question (what are the characteristics of Minnesota state population or situation being studied?)&nbsp;<sup id="cite_ref-1" class="reference"><a href="https://en.wikipedia.org/wiki/Descriptive_research#cite_note-1">[1]</a></sup>&nbsp;The characteristics used to describe the situation or population are usually some kind of categorical scheme also known as descriptive categories. For example, the&nbsp;<a title="Periodic table" href="https://en.wikipedia.org/wiki/Periodic_table">periodic table</a>&nbsp;categorizes the elements. Scientists use knowledge about the nature of electrons, protons and neutrons to devise this categorical scheme. We now take for granted the&nbsp;<a title="Periodic table" href="https://en.wikipedia.org/wiki/Periodic_table">periodic table</a>, yet it took descriptive research to devise it. Descriptive research generally precedes explanatory research. For example, over time the periodic table’s description of the elements allowed scientists to explain chemical reaction and make sound prediction when elements were combined. Hence, descriptive research cannot describe what caused a situation. Thus, descriptive research cannot be used as the basis of a&nbsp;<em><a title="Causality" href="https://en.wikipedia.org/wiki/Causality">causal relationship</a></em>, where one variable affects another. In other words, descriptive research can be said to have a low requirement for&nbsp;<a title="Internal validity" href="https://en.wikipedia.org/wiki/Internal_validity">internal validity</a>.</p>', 'string'),
(1, 'en_US', 'librarianInformation', 'We encourage research librarians to list this journal among their library''s electronic journal holdings. As well, it may be worth noting that this journal''s open source publishing system is suitable for libraries to host for their faculty members to use with journals they are involved in editing (see <a href="http://pkp.sfu.ca/ojs">Open Journal Systems</a>).', 'string'),
(1, 'en_US', 'lockssLicense', 'This journal utilizes the LOCKSS system to create a distributed archiving system among participating libraries and permits those libraries to create permanent archives of the journal for purposes of preservation and restoration. <a href="http://www.lockss.org/">More...</a>', 'string'),
(1, 'en_US', 'metaCitations', '1', 'string'),
(1, 'en_US', 'name', 'Research', 'string'),
(1, 'en_US', 'openAccessPolicy', 'This journal provides immediate open access to its content on the principle that making research freely available to the public supports a greater global exchange of knowledge.', 'string'),
(1, 'en_US', 'privacyStatement', '<p>The names and email addresses entered in this journal site will be used exclusively for the stated purposes of this journal and will not be made available for any other purpose or to any other party.</p>', 'string'),
(1, 'en_US', 'proofInstructions', '<p>The proofreading stage is intended to catch any errors in the galley''s spelling, grammar, and formatting. More substantial changes cannot be made at this stage, unless discussed with the Section Editor. In Layout, click on VIEW PROOF to see the HTML, PDF, and other available file formats used in publishing this item.</p>\n	<h4>For Spelling and Grammar Errors</h4>\n\n	<p>Copy the problem word or groups of words and paste them into the Proofreading Corrections box with "CHANGE-TO" instructions to the editor as follows:</p>\n\n	<pre>1. CHANGE...\n	then the others\n	TO...\n	than the others</pre>\n	<br />\n	<pre>2. CHANGE...\n	Malinowsky\n	TO...\n	Malinowski</pre>\n	<br />\n\n	<h4>For Formatting Errors</h4>\n\n	<p>Describe the location and nature of the problem in the Proofreading Corrections box after typing in the title "FORMATTING" as follows:</p>\n	<br />\n	<pre>3. FORMATTING\n	The numbers in Table 3 are not aligned in the third column.</pre>\n	<br />\n	<pre>4. FORMATTING\n	The paragraph that begins "This last topic..." is not indented.</pre>', 'string'),
(1, 'en_US', 'readerInformation', 'We encourage readers to sign up for the publishing notification service for this journal. Use the <a href="http://tridentjs.x10host.com/tridentOJS/index.php/research/user/register">Register</a> link at the top of the home page for the journal. This registration will result in the reader receiving the Table of Contents by email for each new issue of the journal. This list also allows the journal to claim a certain level of support or readership. See the journal''s <a href="http://tridentjs.x10host.com/tridentOJS/index.php/research/about/submissions#privacyStatement">Privacy Statement</a>, which assures readers that their name and email address will not be used for other purposes.', 'string'),
(1, 'en_US', 'refLinkInstructions', '<h4>To Add Reference Linking to the Layout Process</h4>\n	<p>When turning a submission into HTML or PDF, make sure that all hyperlinks in the submission are active.</p>\n	<h4>A. When the Author Provides a Link with the Reference</h4>\n	<ol>\n	<li>While the submission is still in its word processing format (e.g., Word), add the phrase VIEW ITEM to the end of the reference that has a URL.</li>\n	<li>Turn that phrase into a hyperlink by highlighting it and using Word''s Insert Hyperlink tool and the URL prepared in #2.</li>\n	</ol>\n	<h4>B. Enabling Readers to Search Google Scholar For References</h4>\n	<ol>\n		<li>While the submission is still in its word processing format (e.g., Word), copy the title of the work referenced in the References list (if it appears to be too common a title—e.g., "Peace"—then copy author and title).</li>\n		<li>Paste the reference''s title between the %22''s, placing a + between each word: http://scholar.google.com/scholar?q=%22PASTE+TITLE+HERE%22&hl=en&lr=&btnG=Search.</li>\n\n	<li>Add the phrase GS SEARCH to the end of each citation in the submission''s References list.</li>\n	<li>Turn that phrase into a hyperlink by highlighting it and using Word''s Insert Hyperlink tool and the URL prepared in #2.</li>\n	</ol>\n	<h4>C. Enabling Readers to Search for References with a DOI</h4>\n	<ol>\n	<li>While the submission is still in Word, copy a batch of references into CrossRef Text Query http://www.crossref.org/freeTextQuery/.</li>\n	<li>Paste each DOI that the Query provides in the following URL (between = and &): http://www.cmaj.ca/cgi/external_ref?access_num=PASTE DOI#HERE&link_type=DOI.</li>\n	<li>Add the phrase CrossRef to the end of each citation in the submission''s References list.</li>\n	<li>Turn that phrase into a hyperlink by highlighting the phrase and using Word''s Insert Hyperlink tool and the appropriate URL prepared in #2.</li>\n	</ol>', 'string'),
(1, 'en_US', 'submissionChecklist', 'a:5:{i:0;a:2:{s:7:"content";s:165:"The submission has not been previously published, nor is it before another journal for consideration (or an explanation has been provided in Comments to the Editor).";s:5:"order";s:1:"1";}i:1;a:2:{s:7:"content";s:82:"The submission file is in OpenOffice, Microsoft Word, or RTF document file format.";s:5:"order";s:1:"2";}i:2;a:2:{s:7:"content";s:60:"Where available, URLs for the references have been provided.";s:5:"order";s:1:"3";}i:3;a:2:{s:7:"content";s:239:"The text is single-spaced; uses a 12-point font; employs italics, rather than underlining (except with URL addresses); and all illustrations, figures, and tables are placed within the text at the appropriate points, rather than at the end.";s:5:"order";s:1:"4";}i:4;a:2:{s:7:"content";s:99:"The text adheres to the stylistic and bibliographic requirements outlined in the Author Guidelines.";s:5:"order";s:1:"5";}}', 'object');

-- --------------------------------------------------------

--
-- Table structure for table `library_files`
--

CREATE TABLE IF NOT EXISTS `library_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `original_file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `library_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `library_file_settings`
--

CREATE TABLE IF NOT EXISTS `library_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `library_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `library_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `metadata_descriptions`
--

CREATE TABLE IF NOT EXISTS `metadata_descriptions` (
  `metadata_description_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0',
  `schema_namespace` varchar(255) NOT NULL,
  `schema_name` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `seq` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`metadata_description_id`),
  KEY `metadata_descriptions_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `metadata_description_settings`
--

CREATE TABLE IF NOT EXISTS `metadata_description_settings` (
  `metadata_description_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `metadata_descripton_settings_pkey` (`metadata_description_id`,`locale`,`setting_name`),
  KEY `metadata_description_settings_id` (`metadata_description_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `metrics`
--

CREATE TABLE IF NOT EXISTS `metrics` (
  `load_id` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `pkp_section_id` bigint(20) DEFAULT NULL,
  `assoc_object_type` bigint(20) DEFAULT NULL,
  `assoc_object_id` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) DEFAULT NULL,
  `representation_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `day` varchar(8) DEFAULT NULL,
  `month` varchar(6) DEFAULT NULL,
  `file_type` tinyint(4) DEFAULT NULL,
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `metric_type` varchar(255) NOT NULL,
  `metric` int(11) NOT NULL,
  KEY `metrics_load_id` (`load_id`),
  KEY `metrics_metric_type_context_id` (`metric_type`,`context_id`),
  KEY `metrics_metric_type_submission_id_assoc_type` (`metric_type`,`submission_id`,`assoc_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `metrics`
--

INSERT INTO `metrics` (`load_id`, `context_id`, `pkp_section_id`, `assoc_object_type`, `assoc_object_id`, `submission_id`, `representation_id`, `assoc_type`, `assoc_id`, `day`, `month`, `file_type`, `country_id`, `region`, `city`, `metric_type`, `metric`) VALUES
('usage_events_20180218.log', 1, NULL, NULL, NULL, NULL, NULL, 256, 1, '20180218', '201802', NULL, NULL, NULL, NULL, 'ojs::counter', 12),
('usage_events_20180221.log', 1, NULL, NULL, NULL, NULL, NULL, 256, 1, '20180221', '201802', NULL, NULL, NULL, NULL, 'ojs::counter', 3);

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menus`
--

CREATE TABLE IF NOT EXISTS `navigation_menus` (
  `navigation_menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `area_name` varchar(255) DEFAULT '',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`navigation_menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `navigation_menus`
--

INSERT INTO `navigation_menus` (`navigation_menu_id`, `context_id`, `area_name`, `title`) VALUES
(1, 0, 'user', 'User'),
(2, 1, 'user', 'User'),
(3, 1, 'primary', 'Primary');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_items`
--

CREATE TABLE IF NOT EXISTS `navigation_menu_items` (
  `navigation_menu_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `url` varchar(255) DEFAULT '',
  `path` varchar(255) DEFAULT '',
  `type` varchar(255) DEFAULT '',
  PRIMARY KEY (`navigation_menu_item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `navigation_menu_items`
--

INSERT INTO `navigation_menu_items` (`navigation_menu_item_id`, `context_id`, `url`, `path`, `type`) VALUES
(1, 0, NULL, NULL, 'NMI_TYPE_USER_REGISTER'),
(2, 0, NULL, NULL, 'NMI_TYPE_USER_LOGIN'),
(3, 0, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(4, 0, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(5, 0, NULL, NULL, 'NMI_TYPE_USER_PROFILE'),
(6, 0, NULL, NULL, 'NMI_TYPE_ADMINISTRATION'),
(7, 0, NULL, NULL, 'NMI_TYPE_USER_LOGOUT'),
(8, 1, NULL, NULL, 'NMI_TYPE_USER_REGISTER'),
(9, 1, NULL, NULL, 'NMI_TYPE_USER_LOGIN'),
(10, 1, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(11, 1, NULL, NULL, 'NMI_TYPE_USER_DASHBOARD'),
(12, 1, NULL, NULL, 'NMI_TYPE_USER_PROFILE'),
(13, 1, NULL, NULL, 'NMI_TYPE_ADMINISTRATION'),
(14, 1, NULL, NULL, 'NMI_TYPE_USER_LOGOUT'),
(15, 1, NULL, NULL, 'NMI_TYPE_CURRENT'),
(16, 1, NULL, NULL, 'NMI_TYPE_ARCHIVES'),
(17, 1, NULL, NULL, 'NMI_TYPE_ANNOUNCEMENTS'),
(18, 1, NULL, NULL, 'NMI_TYPE_ABOUT'),
(19, 1, NULL, NULL, 'NMI_TYPE_ABOUT'),
(20, 1, NULL, NULL, 'NMI_TYPE_SUBMISSIONS'),
(21, 1, NULL, NULL, 'NMI_TYPE_EDITORIAL_TEAM'),
(22, 1, NULL, NULL, 'NMI_TYPE_CONTACT');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_assignments`
--

CREATE TABLE IF NOT EXISTS `navigation_menu_item_assignments` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `navigation_menu_id` bigint(20) NOT NULL,
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `seq` bigint(20) DEFAULT '0',
  PRIMARY KEY (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=54 ;

--
-- Dumping data for table `navigation_menu_item_assignments`
--

INSERT INTO `navigation_menu_item_assignments` (`navigation_menu_item_assignment_id`, `navigation_menu_id`, `navigation_menu_item_id`, `parent_id`, `seq`) VALUES
(1, 1, 1, 0, 0),
(2, 1, 2, 0, 1),
(3, 1, 3, 0, 2),
(4, 1, 4, 3, 0),
(5, 1, 5, 3, 1),
(6, 1, 6, 3, 2),
(7, 1, 7, 3, 3),
(39, 3, 15, 0, 0),
(40, 3, 16, 0, 1),
(41, 3, 17, 0, 2),
(42, 3, 18, 0, 3),
(43, 3, 19, 18, 4),
(44, 3, 20, 18, 5),
(45, 3, 21, 18, 6),
(46, 3, 22, 18, 7),
(47, 2, 8, 0, 0),
(48, 2, 9, 0, 1),
(49, 2, 10, 0, 2),
(50, 2, 11, 10, 0),
(51, 2, 12, 10, 1),
(52, 2, 13, 10, 2),
(53, 2, 14, 10, 3);

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_assignment_settings`
--

CREATE TABLE IF NOT EXISTS `navigation_menu_item_assignment_settings` (
  `navigation_menu_item_assignment_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_assignment_settings_pkey` (`navigation_menu_item_assignment_id`,`locale`,`setting_name`),
  KEY `assignment_settings_navigation_menu_item_assignment_id` (`navigation_menu_item_assignment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menu_item_assignment_settings`
--

INSERT INTO `navigation_menu_item_assignment_settings` (`navigation_menu_item_assignment_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'title', 'Register', 'string'),
(2, 'en_US', 'title', 'Login', 'string'),
(3, 'en_US', 'title', '{$loggedInUsername}', 'string'),
(4, 'en_US', 'title', 'Dashboard', 'string'),
(5, 'en_US', 'title', 'View Profile', 'string'),
(6, 'en_US', 'title', 'Administration', 'string'),
(7, 'en_US', 'title', 'Logout', 'string'),
(39, 'en_US', 'title', 'Current', 'string'),
(40, 'en_US', 'title', 'Archives', 'string'),
(41, 'en_US', 'title', 'Announcements', 'string'),
(42, 'en_US', 'title', 'About', 'string'),
(43, 'en_US', 'title', 'About the Journal', 'string'),
(44, 'en_US', 'title', 'Submissions', 'string'),
(45, 'en_US', 'title', 'Editorial Team', 'string'),
(46, 'en_US', 'title', 'Contact', 'string'),
(47, 'en_US', 'title', 'Register', 'string'),
(48, 'en_US', 'title', 'Login', 'string'),
(49, 'en_US', 'title', '{$loggedInUsername}', 'string'),
(50, 'en_US', 'title', 'Dashboard', 'string'),
(51, 'en_US', 'title', 'View Profile', 'string'),
(52, 'en_US', 'title', 'Administration', 'string'),
(53, 'en_US', 'title', 'Logout', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `navigation_menu_item_settings`
--

CREATE TABLE IF NOT EXISTS `navigation_menu_item_settings` (
  `navigation_menu_item_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `navigation_menu_item_settings_pkey` (`navigation_menu_item_id`,`locale`,`setting_name`),
  KEY `navigation_menu_item_settings_navigation_menu_id` (`navigation_menu_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `navigation_menu_item_settings`
--

INSERT INTO `navigation_menu_item_settings` (`navigation_menu_item_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'titleLocaleKey', 'navigation.register', 'string'),
(1, 'en_US', 'title', 'Register', 'string'),
(2, '', 'titleLocaleKey', 'navigation.login', 'string'),
(2, 'en_US', 'title', 'Login', 'string'),
(3, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(3, 'en_US', 'title', '{$loggedInUsername}', 'string'),
(4, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(4, 'en_US', 'title', 'Dashboard', 'string'),
(5, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(5, 'en_US', 'title', 'View Profile', 'string'),
(6, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(6, 'en_US', 'title', 'Administration', 'string'),
(7, '', 'titleLocaleKey', 'user.logOut', 'string'),
(7, 'en_US', 'title', 'Logout', 'string'),
(8, '', 'titleLocaleKey', 'navigation.register', 'string'),
(8, 'en_US', 'title', 'Register', 'string'),
(9, '', 'titleLocaleKey', 'navigation.login', 'string'),
(9, 'en_US', 'title', 'Login', 'string'),
(10, '', 'titleLocaleKey', '{$loggedInUsername}', 'string'),
(10, 'en_US', 'title', '{$loggedInUsername}', 'string'),
(11, '', 'titleLocaleKey', 'navigation.dashboard', 'string'),
(11, 'en_US', 'title', 'Dashboard', 'string'),
(12, '', 'titleLocaleKey', 'common.viewProfile', 'string'),
(12, 'en_US', 'title', 'View Profile', 'string'),
(13, '', 'titleLocaleKey', 'navigation.admin', 'string'),
(13, 'en_US', 'title', 'Administration', 'string'),
(14, '', 'titleLocaleKey', 'user.logOut', 'string'),
(14, 'en_US', 'title', 'Logout', 'string'),
(15, '', 'titleLocaleKey', 'navigation.current', 'string'),
(15, 'en_US', 'title', 'Current', 'string'),
(16, '', 'titleLocaleKey', 'navigation.archives', 'string'),
(16, 'en_US', 'title', 'Archives', 'string'),
(17, '', 'titleLocaleKey', 'manager.announcements', 'string'),
(17, 'en_US', 'title', 'Announcements', 'string'),
(18, '', 'titleLocaleKey', 'navigation.about', 'string'),
(18, 'en_US', 'title', 'About', 'string'),
(19, '', 'titleLocaleKey', 'about.aboutContext', 'string'),
(19, 'en_US', 'title', 'About the Journal', 'string'),
(20, '', 'titleLocaleKey', 'navigation.submissions', 'string'),
(20, 'en_US', 'title', 'Submissions', 'string'),
(21, '', 'titleLocaleKey', 'about.editorialTeam', 'string'),
(21, 'en_US', 'title', 'Editorial Team', 'string'),
(22, '', 'titleLocaleKey', 'about.contact', 'string'),
(22, 'en_US', 'title', 'Contact', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `note_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text,
  PRIMARY KEY (`note_id`),
  KEY `notes_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `notification_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `level` bigint(20) NOT NULL,
  `type` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_context_id_user_id` (`context_id`,`user_id`,`level`),
  KEY `notifications_context_id` (`context_id`,`level`),
  KEY `notifications_assoc` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`notification_id`, `context_id`, `user_id`, `level`, `type`, `date_created`, `date_read`, `assoc_type`, `assoc_id`) VALUES
(3, 1, 0, 2, 16777244, '2018-02-18 04:32:56', NULL, 256, 1);

-- --------------------------------------------------------

--
-- Table structure for table `notification_mail_list`
--

CREATE TABLE IF NOT EXISTS `notification_mail_list` (
  `notification_mail_list_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(90) NOT NULL,
  `confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `token` varchar(40) NOT NULL,
  `context` bigint(20) NOT NULL,
  PRIMARY KEY (`notification_mail_list_id`),
  UNIQUE KEY `notification_mail_list_email_context` (`email`,`context`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE IF NOT EXISTS `notification_settings` (
  `notification_id` bigint(20) NOT NULL,
  `locale` varchar(14) DEFAULT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `notification_settings_pkey` (`notification_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notification_subscription_settings`
--

CREATE TABLE IF NOT EXISTS `notification_subscription_settings` (
  `setting_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `user_id` bigint(20) NOT NULL,
  `context` bigint(20) NOT NULL,
  `setting_type` varchar(6) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `oai_resumption_tokens`
--

CREATE TABLE IF NOT EXISTS `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text,
  UNIQUE KEY `oai_resumption_tokens_pkey` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `plugin_settings`
--

CREATE TABLE IF NOT EXISTS `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`context_id`,`setting_name`),
  KEY `plugin_settings_plugin_name` (`plugin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plugin_settings`
--

INSERT INTO `plugin_settings` (`plugin_name`, `context_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
('acronplugin', 0, 'crontab', 'a:6:{i:0;a:3:{s:9:"className";s:43:"plugins.generic.usageStats.UsageStatsLoader";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:1:{i:0;s:9:"autoStage";}}i:1;a:3:{s:9:"className";s:42:"plugins.importexport.medra.MedraInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:2;a:3:{s:9:"className";s:48:"plugins.importexport.datacite.DataciteInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:3;a:3:{s:9:"className";s:40:"plugins.importexport.doaj.DOAJInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:4;a:3:{s:9:"className";s:48:"plugins.importexport.crossref.CrossrefInfoSender";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}i:5;a:3:{s:9:"className";s:35:"lib.pkp.classes.task.ReviewReminder";s:9:"frequency";a:1:{s:4:"hour";i:24;}s:4:"args";a:0:{}}}', 'object'),
('acronplugin', 0, 'enabled', '1', 'bool'),
('bootstrapthreethemeplugin', 1, 'bootstrapTheme', 'yeti', 'string'),
('bootstrapthreethemeplugin', 1, 'enabled', '1', 'bool'),
('defaultthemeplugin', 0, 'enabled', '1', 'bool'),
('defaultthemeplugin', 1, 'baseColour', '#1e6292', 'text'),
('defaultthemeplugin', 1, 'enabled', '1', 'bool'),
('developedbyblockplugin', 0, 'context', '1', 'int'),
('developedbyblockplugin', 0, 'enabled', '0', 'bool'),
('developedbyblockplugin', 0, 'seq', '0', 'int'),
('developedbyblockplugin', 1, 'context', '1', 'int'),
('developedbyblockplugin', 1, 'enabled', '0', 'bool'),
('developedbyblockplugin', 1, 'seq', '0', 'int'),
('dublincoremetaplugin', 1, 'enabled', '1', 'bool'),
('googlescholarplugin', 1, 'enabled', '1', 'bool'),
('htmlarticlegalleyplugin', 1, 'enabled', '1', 'bool'),
('informationblockplugin', 1, 'context', '1', 'int'),
('informationblockplugin', 1, 'enabled', '1', 'bool'),
('informationblockplugin', 1, 'seq', '3', 'int'),
('languagetoggleblockplugin', 0, 'context', '1', 'int'),
('languagetoggleblockplugin', 0, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 0, 'seq', '4', 'int'),
('languagetoggleblockplugin', 1, 'context', '1', 'int'),
('languagetoggleblockplugin', 1, 'enabled', '1', 'bool'),
('languagetoggleblockplugin', 1, 'seq', '2', 'int'),
('lensgalleyplugin', 1, 'enabled', '1', 'bool'),
('makesubmissionblockplugin', 1, 'context', '1', 'int'),
('makesubmissionblockplugin', 1, 'enabled', '1', 'bool'),
('makesubmissionblockplugin', 1, 'seq', '4', 'int'),
('pdfjsviewerplugin', 1, 'enabled', '1', 'bool'),
('resolverplugin', 1, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 1, 'context', '1', 'int'),
('subscriptionblockplugin', 1, 'enabled', '1', 'bool'),
('subscriptionblockplugin', 1, 'seq', '1', 'int'),
('tinymceplugin', 0, 'enabled', '1', 'bool'),
('tinymceplugin', 1, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'enabled', '1', 'bool'),
('usageeventplugin', 0, 'uniqueSiteId', '5a8953e0cfc25', 'string'),
('usagestatsplugin', 0, 'accessLogFileParseRegex', '/^(?P<ip>\\S+) \\S+ \\S+ \\[(?P<date>.*?)\\] "\\S+ (?P<url>\\S+).*?" (?P<returnCode>\\S+) \\S+ ".*?" "(?P<userAgent>.*?)"/', 'string'),
('usagestatsplugin', 0, 'chartType', 'bar', 'string'),
('usagestatsplugin', 0, 'createLogFiles', '1', 'bool'),
('usagestatsplugin', 0, 'datasetMaxCount', '4', 'string'),
('usagestatsplugin', 0, 'enabled', '1', 'bool'),
('usagestatsplugin', 0, 'optionalColumns', 'a:2:{i:0;s:4:"city";i:1;s:6:"region";}', 'object'),
('webfeedblockplugin', 1, 'enabled', '0', 'bool'),
('webfeedplugin', 1, 'displayItems', '1', 'bool'),
('webfeedplugin', 1, 'displayPage', 'homepage', 'string'),
('webfeedplugin', 1, 'enabled', '1', 'bool');

-- --------------------------------------------------------

--
-- Table structure for table `published_submissions`
--

CREATE TABLE IF NOT EXISTS `published_submissions` (
  `published_submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `issue_id` bigint(20) NOT NULL,
  `date_published` datetime DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `access_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`published_submission_id`),
  UNIQUE KEY `published_submissions_submission_id` (`submission_id`),
  KEY `published_submissions_issue_id` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `queries`
--

CREATE TABLE IF NOT EXISTS `queries` (
  `query_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `seq` double NOT NULL DEFAULT '0',
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `closed` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`query_id`),
  KEY `queries_assoc_id` (`assoc_type`,`assoc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `query_participants`
--

CREATE TABLE IF NOT EXISTS `query_participants` (
  `query_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `query_participants_pkey` (`query_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `queued_payments`
--

CREATE TABLE IF NOT EXISTS `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text,
  PRIMARY KEY (`queued_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_assignments`
--

CREATE TABLE IF NOT EXISTS `review_assignments` (
  `review_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `competing_interests` text,
  `recommendation` tinyint(4) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `date_response_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` tinyint(4) NOT NULL DEFAULT '0',
  `declined` tinyint(4) NOT NULL DEFAULT '0',
  `replaced` tinyint(4) NOT NULL DEFAULT '0',
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `review_round_id` bigint(20) DEFAULT NULL,
  `stage_id` tinyint(4) NOT NULL DEFAULT '1',
  `review_method` tinyint(4) NOT NULL DEFAULT '1',
  `round` tinyint(4) NOT NULL DEFAULT '1',
  `step` tinyint(4) NOT NULL DEFAULT '1',
  `review_form_id` bigint(20) DEFAULT NULL,
  `unconsidered` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `review_assignments_submission_id` (`submission_id`),
  KEY `review_assignments_reviewer_id` (`reviewer_id`),
  KEY `review_assignments_form_id` (`review_form_id`),
  KEY `review_assignments_reviewer_review` (`reviewer_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_files`
--

CREATE TABLE IF NOT EXISTS `review_files` (
  `review_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  UNIQUE KEY `review_files_pkey` (`review_id`,`file_id`),
  KEY `review_files_review_id` (`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_forms`
--

CREATE TABLE IF NOT EXISTS `review_forms` (
  `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `seq` double DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_elements`
--

CREATE TABLE IF NOT EXISTS `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `included` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`review_form_element_id`),
  KEY `review_form_elements_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_element_settings`
--

CREATE TABLE IF NOT EXISTS `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_responses`
--

CREATE TABLE IF NOT EXISTS `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text,
  KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_form_settings`
--

CREATE TABLE IF NOT EXISTS `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  KEY `review_form_settings_review_form_id` (`review_form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review_rounds`
--

CREATE TABLE IF NOT EXISTS `review_rounds` (
  `review_round_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `round` tinyint(4) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL,
  `status` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`review_round_id`),
  UNIQUE KEY `review_rounds_submission_id_stage_id_round_pkey` (`submission_id`,`stage_id`,`round`),
  KEY `review_rounds_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `review_round_files`
--

CREATE TABLE IF NOT EXISTS `review_round_files` (
  `submission_id` bigint(20) NOT NULL,
  `review_round_id` bigint(20) NOT NULL,
  `stage_id` tinyint(4) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL DEFAULT '1',
  UNIQUE KEY `review_round_files_pkey` (`submission_id`,`review_round_id`,`file_id`,`revision`),
  KEY `review_round_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rt_contexts`
--

CREATE TABLE IF NOT EXISTS `rt_contexts` (
  `context_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `abbrev` varchar(32) NOT NULL,
  `description` text,
  `cited_by` tinyint(4) NOT NULL DEFAULT '0',
  `author_terms` tinyint(4) NOT NULL DEFAULT '0',
  `define_terms` tinyint(4) NOT NULL DEFAULT '0',
  `geo_terms` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`context_id`),
  KEY `rt_contexts_version_id` (`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_searches`
--

CREATE TABLE IF NOT EXISTS `rt_searches` (
  `search_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `description` text,
  `url` text,
  `search_url` text,
  `search_post` text,
  `seq` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`search_id`),
  KEY `rt_searches_context_id` (`context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rt_versions`
--

CREATE TABLE IF NOT EXISTS `rt_versions` (
  `version_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `version_key` varchar(40) NOT NULL,
  `locale` varchar(14) DEFAULT 'en_US',
  `title` varchar(120) NOT NULL,
  `description` text,
  PRIMARY KEY (`version_id`),
  KEY `rt_versions_journal_id` (`journal_id`),
  KEY `rt_versions_version_key` (`version_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_tasks`
--

CREATE TABLE IF NOT EXISTS `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL,
  UNIQUE KEY `scheduled_tasks_pkey` (`class_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scheduled_tasks`
--

INSERT INTO `scheduled_tasks` (`class_name`, `last_run`) VALUES
('lib.pkp.classes.task.ReviewReminder', '2018-03-01 06:15:15'),
('plugins.generic.usageStats.UsageStatsLoader', '2018-03-01 06:15:14'),
('plugins.importexport.crossref.CrossrefInfoSender', '2018-03-01 06:15:15'),
('plugins.importexport.datacite.DataciteInfoSender', '2018-03-01 06:15:15'),
('plugins.importexport.doaj.DOAJInfoSender', '2018-03-01 06:15:15'),
('plugins.importexport.medra.MedraInfoSender', '2018-03-01 06:15:15');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `section_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `editor_restricted` tinyint(4) NOT NULL DEFAULT '0',
  `meta_indexed` tinyint(4) NOT NULL DEFAULT '0',
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT '1',
  `abstracts_not_required` tinyint(4) NOT NULL DEFAULT '0',
  `hide_title` tinyint(4) NOT NULL DEFAULT '0',
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `abstract_word_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `sections_journal_id` (`journal_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`section_id`, `journal_id`, `review_form_id`, `seq`, `editor_restricted`, `meta_indexed`, `meta_reviewed`, `abstracts_not_required`, `hide_title`, `hide_author`, `abstract_word_count`) VALUES
(1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `section_editors`
--

CREATE TABLE IF NOT EXISTS `section_editors` (
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `section_editors_pkey` (`context_id`,`section_id`,`user_id`),
  KEY `section_editors_context_id` (`context_id`),
  KEY `section_editors_section_id` (`section_id`),
  KEY `section_editors_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `section_settings`
--

CREATE TABLE IF NOT EXISTS `section_settings` (
  `section_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `section_settings_pkey` (`section_id`,`locale`,`setting_name`),
  KEY `section_settings_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `section_settings`
--

INSERT INTO `section_settings` (`section_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'abbrev', 'ART', 'string'),
(1, 'en_US', 'policy', '', 'string'),
(1, 'en_US', 'title', 'Articles', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT '0',
  `last_used` bigint(20) NOT NULL DEFAULT '0',
  `remember` tinyint(4) NOT NULL DEFAULT '0',
  `data` text,
  `domain` varchar(255) DEFAULT NULL,
  UNIQUE KEY `sessions_pkey` (`session_id`),
  KEY `sessions_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `ip_address`, `user_agent`, `created`, `last_used`, `remember`, `data`, `domain`) VALUES
('di21un0mbp1rmfcutihg95m5j4', 1, '122.52.138.200', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.186 Safari/537.36', 1519902914, 1519902933, 1, 'csrf|a:2:{s:9:"timestamp";i:1519902930;s:5:"token";s:32:"6d7b3bbe470214c9e7f213bbdf8529a8";}userId|s:1:"1";username|s:5:"admin";', 'tridentjs.x10host.com');

-- --------------------------------------------------------

--
-- Table structure for table `site`
--

CREATE TABLE IF NOT EXISTS `site` (
  `redirect` bigint(20) NOT NULL DEFAULT '0',
  `primary_locale` varchar(14) NOT NULL,
  `min_password_length` tinyint(4) NOT NULL DEFAULT '6',
  `installed_locales` varchar(255) NOT NULL DEFAULT 'en_US',
  `supported_locales` varchar(255) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site`
--

INSERT INTO `site` (`redirect`, `primary_locale`, `min_password_length`, `installed_locales`, `supported_locales`, `original_style_file_name`) VALUES
(0, 'en_US', 6, 'en_US', 'en_US', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE IF NOT EXISTS `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`setting_name`, `locale`, `setting_value`, `setting_type`) VALUES
('contactEmail', 'en_US', 'admin@trident.com', 'string'),
('contactName', 'en_US', 'Open Journal Systems', 'string'),
('showDescription', '', '1', 'bool'),
('showThumbnail', '', '1', 'bool'),
('showTitle', '', '1', 'bool'),
('themePluginPath', '', 'default', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `stage_assignments`
--

CREATE TABLE IF NOT EXISTS `stage_assignments` (
  `stage_assignment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_assigned` datetime NOT NULL,
  `recommend_only` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stage_assignment_id`),
  UNIQUE KEY `stage_assignment` (`submission_id`,`user_group_id`,`user_id`),
  KEY `stage_assignments_submission_id` (`submission_id`),
  KEY `stage_assignments_user_group_id` (`user_group_id`),
  KEY `stage_assignments_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `static_pages`
--

CREATE TABLE IF NOT EXISTS `static_pages` (
  `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  PRIMARY KEY (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `static_page_settings`
--

CREATE TABLE IF NOT EXISTS `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  KEY `static_page_settings_static_page_id` (`static_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE IF NOT EXISTS `submissions` (
  `submission_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `context_id` bigint(20) NOT NULL,
  `section_id` bigint(20) DEFAULT NULL,
  `language` varchar(10) DEFAULT 'en',
  `citations` text,
  `date_submitted` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_status_modified` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `submission_progress` tinyint(4) NOT NULL DEFAULT '1',
  `pages` varchar(255) DEFAULT NULL,
  `hide_author` tinyint(4) NOT NULL DEFAULT '0',
  `stage_id` bigint(20) NOT NULL DEFAULT '1',
  PRIMARY KEY (`submission_id`),
  KEY `submissions_section_id` (`section_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `submission_artwork_files`
--

CREATE TABLE IF NOT EXISTS `submission_artwork_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `caption` text,
  `credit` varchar(255) DEFAULT NULL,
  `copyright_owner` varchar(255) DEFAULT NULL,
  `copyright_owner_contact` text,
  `permission_terms` text,
  `permission_file_id` bigint(20) DEFAULT NULL,
  `chapter_id` bigint(20) DEFAULT NULL,
  `contact_author` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_comments`
--

CREATE TABLE IF NOT EXISTS `submission_comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `submission_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` text,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `submission_comments_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `submission_files`
--

CREATE TABLE IF NOT EXISTS `submission_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `revision` bigint(20) NOT NULL,
  `source_file_id` bigint(20) DEFAULT NULL,
  `source_revision` bigint(20) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `genre_id` bigint(20) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `file_stage` bigint(20) NOT NULL,
  `direct_sales_price` varchar(255) DEFAULT NULL,
  `sales_type` varchar(255) DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `user_group_id` bigint(20) DEFAULT NULL,
  `uploader_user_id` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`file_id`,`revision`),
  KEY `submission_files_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `submission_file_settings`
--

CREATE TABLE IF NOT EXISTS `submission_file_settings` (
  `file_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_file_settings_pkey` (`file_id`,`locale`,`setting_name`),
  KEY `submission_file_settings_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_galleys`
--

CREATE TABLE IF NOT EXISTS `submission_galleys` (
  `galley_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `locale` varchar(14) DEFAULT NULL,
  `submission_id` bigint(20) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `remote_url` varchar(2047) DEFAULT NULL,
  `is_approved` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`galley_id`),
  KEY `submission_galleys_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `submission_galley_settings`
--

CREATE TABLE IF NOT EXISTS `submission_galley_settings` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_galley_settings_pkey` (`galley_id`,`locale`,`setting_name`),
  KEY `submission_galley_settings_galley_id` (`galley_id`),
  KEY `submission_galley_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_keyword_list`
--

CREATE TABLE IF NOT EXISTS `submission_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `keyword_text` varchar(60) NOT NULL,
  PRIMARY KEY (`keyword_id`),
  UNIQUE KEY `submission_search_keyword_text` (`keyword_text`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_objects`
--

CREATE TABLE IF NOT EXISTS `submission_search_objects` (
  `object_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `submission_search_object_keywords`
--

CREATE TABLE IF NOT EXISTS `submission_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL,
  UNIQUE KEY `submission_search_object_keywords_pkey` (`object_id`,`pos`),
  KEY `submission_search_object_keywords_keyword_id` (`keyword_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_settings`
--

CREATE TABLE IF NOT EXISTS `submission_settings` (
  `submission_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `submission_settings_pkey` (`submission_id`,`locale`,`setting_name`),
  KEY `submission_settings_submission_id` (`submission_id`),
  KEY `submission_settings_name_value` (`setting_name`(50),`setting_value`(150))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_supplementary_files`
--

CREATE TABLE IF NOT EXISTS `submission_supplementary_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  PRIMARY KEY (`file_id`,`revision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `submission_tombstones`
--

CREATE TABLE IF NOT EXISTS `submission_tombstones` (
  `tombstone_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `submission_id` bigint(20) NOT NULL,
  `date_deleted` datetime NOT NULL,
  `journal_id` bigint(20) NOT NULL,
  `section_id` bigint(20) NOT NULL,
  `set_spec` varchar(255) NOT NULL,
  `set_name` varchar(255) NOT NULL,
  `oai_identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`tombstone_id`),
  KEY `submission_tombstones_journal_id` (`journal_id`),
  KEY `submission_tombstones_submission_id` (`submission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE IF NOT EXISTS `subscriptions` (
  `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `membership` varchar(40) DEFAULT NULL,
  `reference_number` varchar(40) DEFAULT NULL,
  `notes` text,
  PRIMARY KEY (`subscription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_types`
--

CREATE TABLE IF NOT EXISTS `subscription_types` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `journal_id` bigint(20) NOT NULL,
  `cost` double NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `non_expiring` tinyint(4) NOT NULL DEFAULT '0',
  `duration` smallint(6) DEFAULT NULL,
  `format` smallint(6) NOT NULL,
  `institutional` tinyint(4) NOT NULL DEFAULT '0',
  `membership` tinyint(4) NOT NULL DEFAULT '0',
  `disable_public_display` tinyint(4) NOT NULL,
  `seq` double NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscription_type_settings`
--

CREATE TABLE IF NOT EXISTS `subscription_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `subscription_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  KEY `subscription_type_settings_type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `temporary_files`
--

CREATE TABLE IF NOT EXISTS `temporary_files` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `temporary_files_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `temporary_files`
--

INSERT INTO `temporary_files` (`file_id`, `user_id`, `file_name`, `file_type`, `file_size`, `original_file_name`, `date_uploaded`) VALUES
(1, 1, 'zipFlgBp5', '', 429567, 'bootstrap3.zip', '2018-02-18 06:16:26'),
(2, 1, 'jpgDfLzje', '', 14351, 'ad3a9e5cbdae2b08f3dee52c0d3c1f59.jpg', '2018-02-18 06:21:47'),
(3, 1, 'pngJ0WrA3', '', 113745, 'Trident.png', '2018-02-18 06:22:51'),
(4, 1, 'pngU98CpI', '', 113745, 'Trident.png', '2018-02-18 06:24:45'),
(5, 1, 'pngLGZiGt', '', 113745, 'Trident.png', '2018-02-18 06:24:55'),
(6, 1, 'pngeGI0Y6', '', 3394, 'Trid.png', '2018-02-18 06:25:14'),
(7, 1, 'pngDqGDSg', '', 37693, 'Percy_jackson_trident_2_by_narwhalsabound-d7k8x1l.png', '2018-02-18 06:28:35'),
(8, 1, 'jpgNpD4Q2', '', 4773, 'Trident.jpg', '2018-02-18 06:28:59');

-- --------------------------------------------------------

--
-- Table structure for table `usage_stats_temporary_records`
--

CREATE TABLE IF NOT EXISTS `usage_stats_temporary_records` (
  `assoc_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL,
  `day` bigint(20) NOT NULL,
  `entry_time` bigint(20) NOT NULL,
  `metric` bigint(20) NOT NULL DEFAULT '1',
  `country_id` varchar(2) DEFAULT NULL,
  `region` varchar(2) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `load_id` varchar(255) NOT NULL,
  `file_type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `suffix` varchar(255) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `initials` varchar(5) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `url` varchar(2047) DEFAULT NULL,
  `phone` varchar(32) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` tinyint(4) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `disabled_reason` text,
  `inline_help` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username` (`username`),
  UNIQUE KEY `users_email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `salutation`, `first_name`, `middle_name`, `last_name`, `suffix`, `gender`, `initials`, `email`, `url`, `phone`, `mailing_address`, `billing_address`, `country`, `locales`, `date_last_email`, `date_registered`, `date_validated`, `date_last_login`, `must_change_password`, `auth_id`, `auth_str`, `disabled`, `disabled_reason`, `inline_help`) VALUES
(1, 'admin', '$2y$10$DwsPwQjHBueBiudnM4WKFurM..URdrHe.MeO0VQTfn0uxHTLgTp52', '', 'admin', '', 'admin', '', '', 'a', 'admin@trident.com', NULL, NULL, NULL, NULL, NULL, '', NULL, '2018-02-18 04:29:50', NULL, '2018-03-01 06:15:29', 0, NULL, NULL, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE IF NOT EXISTS `user_groups` (
  `user_group_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `is_default` tinyint(4) NOT NULL DEFAULT '0',
  `show_title` tinyint(4) NOT NULL DEFAULT '1',
  `permit_self_registration` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_group_id`),
  KEY `user_groups_user_group_id` (`user_group_id`),
  KEY `user_groups_context_id` (`context_id`),
  KEY `user_groups_role_id` (`role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`user_group_id`, `context_id`, `role_id`, `is_default`, `show_title`, `permit_self_registration`) VALUES
(1, 0, 1, 1, 0, 0),
(2, 1, 16, 1, 0, 0),
(3, 1, 16, 1, 0, 0),
(4, 1, 16, 1, 0, 0),
(5, 1, 17, 1, 0, 0),
(6, 1, 17, 1, 0, 0),
(7, 1, 4097, 1, 0, 0),
(8, 1, 4097, 1, 0, 0),
(9, 1, 4097, 1, 0, 0),
(10, 1, 4097, 1, 0, 0),
(11, 1, 4097, 1, 0, 0),
(12, 1, 4097, 1, 0, 0),
(13, 1, 4097, 1, 0, 0),
(14, 1, 65536, 1, 0, 1),
(15, 1, 65536, 1, 0, 0),
(16, 1, 4096, 1, 0, 1),
(17, 1, 1048576, 1, 0, 1),
(18, 1, 2097152, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_settings`
--

CREATE TABLE IF NOT EXISTS `user_group_settings` (
  `user_group_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_group_settings_pkey` (`user_group_id`,`locale`,`setting_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_settings`
--

INSERT INTO `user_group_settings` (`user_group_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'en_US', 'name', 'Site Admin', 'string'),
(2, '', 'abbrevLocaleKey', 'default.groups.abbrev.manager', 'string'),
(2, '', 'nameLocaleKey', 'default.groups.name.manager', 'string'),
(2, 'en_US', 'abbrev', 'JM', 'string'),
(2, 'en_US', 'name', 'Journal manager', 'string'),
(3, '', 'abbrevLocaleKey', 'default.groups.abbrev.editor', 'string'),
(3, '', 'nameLocaleKey', 'default.groups.name.editor', 'string'),
(3, 'en_US', 'abbrev', 'JE', 'string'),
(3, 'en_US', 'name', 'Journal editor', 'string'),
(4, '', 'abbrevLocaleKey', 'default.groups.abbrev.productionEditor', 'string'),
(4, '', 'nameLocaleKey', 'default.groups.name.productionEditor', 'string'),
(4, 'en_US', 'abbrev', 'ProdE', 'string'),
(4, 'en_US', 'name', 'Production editor', 'string'),
(5, '', 'abbrevLocaleKey', 'default.groups.abbrev.sectionEditor', 'string'),
(5, '', 'nameLocaleKey', 'default.groups.name.sectionEditor', 'string'),
(5, 'en_US', 'abbrev', 'SecE', 'string'),
(5, 'en_US', 'name', 'Section editor', 'string'),
(6, '', 'abbrevLocaleKey', 'default.groups.abbrev.guestEditor', 'string'),
(6, '', 'nameLocaleKey', 'default.groups.name.guestEditor', 'string'),
(6, 'en_US', 'abbrev', 'GE', 'string'),
(6, 'en_US', 'name', 'Guest editor', 'string'),
(7, '', 'abbrevLocaleKey', 'default.groups.abbrev.copyeditor', 'string'),
(7, '', 'nameLocaleKey', 'default.groups.name.copyeditor', 'string'),
(7, 'en_US', 'abbrev', 'CE', 'string'),
(7, 'en_US', 'name', 'Copyeditor', 'string'),
(8, '', 'abbrevLocaleKey', 'default.groups.abbrev.designer', 'string'),
(8, '', 'nameLocaleKey', 'default.groups.name.designer', 'string'),
(8, 'en_US', 'abbrev', 'Design', 'string'),
(8, 'en_US', 'name', 'Designer', 'string'),
(9, '', 'abbrevLocaleKey', 'default.groups.abbrev.funding', 'string'),
(9, '', 'nameLocaleKey', 'default.groups.name.funding', 'string'),
(9, 'en_US', 'abbrev', 'FC', 'string'),
(9, 'en_US', 'name', 'Funding coordinator', 'string'),
(10, '', 'abbrevLocaleKey', 'default.groups.abbrev.indexer', 'string'),
(10, '', 'nameLocaleKey', 'default.groups.name.indexer', 'string'),
(10, 'en_US', 'abbrev', 'IND', 'string'),
(10, 'en_US', 'name', 'Indexer', 'string'),
(11, '', 'abbrevLocaleKey', 'default.groups.abbrev.layoutEditor', 'string'),
(11, '', 'nameLocaleKey', 'default.groups.name.layoutEditor', 'string'),
(11, 'en_US', 'abbrev', 'LE', 'string'),
(11, 'en_US', 'name', 'Layout Editor', 'string'),
(12, '', 'abbrevLocaleKey', 'default.groups.abbrev.marketing', 'string'),
(12, '', 'nameLocaleKey', 'default.groups.name.marketing', 'string'),
(12, 'en_US', 'abbrev', 'MS', 'string'),
(12, 'en_US', 'name', 'Marketing and sales coordinator', 'string'),
(13, '', 'abbrevLocaleKey', 'default.groups.abbrev.proofreader', 'string'),
(13, '', 'nameLocaleKey', 'default.groups.name.proofreader', 'string'),
(13, 'en_US', 'abbrev', 'PR', 'string'),
(13, 'en_US', 'name', 'Proofreader', 'string'),
(14, '', 'abbrevLocaleKey', 'default.groups.abbrev.author', 'string'),
(14, '', 'nameLocaleKey', 'default.groups.name.author', 'string'),
(14, 'en_US', 'abbrev', 'AU', 'string'),
(14, 'en_US', 'name', 'Author', 'string'),
(15, '', 'abbrevLocaleKey', 'default.groups.abbrev.translator', 'string'),
(15, '', 'nameLocaleKey', 'default.groups.name.translator', 'string'),
(15, 'en_US', 'abbrev', 'Trans', 'string'),
(15, 'en_US', 'name', 'Translator', 'string'),
(16, '', 'abbrevLocaleKey', 'default.groups.abbrev.externalReviewer', 'string'),
(16, '', 'nameLocaleKey', 'default.groups.name.externalReviewer', 'string'),
(16, 'en_US', 'abbrev', 'R', 'string'),
(16, 'en_US', 'name', 'Reviewer', 'string'),
(17, '', 'abbrevLocaleKey', 'default.groups.abbrev.reader', 'string'),
(17, '', 'nameLocaleKey', 'default.groups.name.reader', 'string'),
(17, 'en_US', 'abbrev', 'Read', 'string'),
(17, 'en_US', 'name', 'Reader', 'string'),
(18, '', 'abbrevLocaleKey', 'default.groups.abbrev.subscriptionManager', 'string'),
(18, '', 'nameLocaleKey', 'default.groups.name.subscriptionManager', 'string'),
(18, 'en_US', 'abbrev', 'SubM', 'string'),
(18, 'en_US', 'name', 'Subscription Manager', 'string');

-- --------------------------------------------------------

--
-- Table structure for table `user_group_stage`
--

CREATE TABLE IF NOT EXISTS `user_group_stage` (
  `context_id` bigint(20) NOT NULL,
  `user_group_id` bigint(20) NOT NULL,
  `stage_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_group_stage_pkey` (`context_id`,`user_group_id`,`stage_id`),
  KEY `user_group_stage_context_id` (`context_id`),
  KEY `user_group_stage_user_group_id` (`user_group_id`),
  KEY `user_group_stage_stage_id` (`stage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_stage`
--

INSERT INTO `user_group_stage` (`context_id`, `user_group_id`, `stage_id`) VALUES
(1, 3, 1),
(1, 3, 3),
(1, 3, 4),
(1, 3, 5),
(1, 4, 4),
(1, 4, 5),
(1, 5, 1),
(1, 5, 3),
(1, 5, 4),
(1, 5, 5),
(1, 6, 1),
(1, 6, 3),
(1, 6, 4),
(1, 6, 5),
(1, 7, 4),
(1, 8, 5),
(1, 9, 1),
(1, 9, 3),
(1, 10, 5),
(1, 11, 5),
(1, 12, 4),
(1, 13, 5),
(1, 14, 1),
(1, 14, 3),
(1, 14, 4),
(1, 14, 5),
(1, 15, 1),
(1, 15, 3),
(1, 15, 4),
(1, 15, 5),
(1, 16, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_interests`
--

CREATE TABLE IF NOT EXISTS `user_interests` (
  `user_id` bigint(20) NOT NULL,
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  UNIQUE KEY `u_e_pkey` (`user_id`,`controlled_vocab_entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_settings`
--

CREATE TABLE IF NOT EXISTS `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(14) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL,
  UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  KEY `user_settings_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_user_groups`
--

CREATE TABLE IF NOT EXISTS `user_user_groups` (
  `user_group_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  UNIQUE KEY `user_user_groups_pkey` (`user_group_id`,`user_id`),
  KEY `user_user_groups_user_group_id` (`user_group_id`),
  KEY `user_user_groups_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_user_groups`
--

INSERT INTO `user_user_groups` (`user_group_id`, `user_id`) VALUES
(1, 1),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `versions`
--

CREATE TABLE IF NOT EXISTS `versions` (
  `major` int(11) NOT NULL DEFAULT '0',
  `minor` int(11) NOT NULL DEFAULT '0',
  `revision` int(11) NOT NULL DEFAULT '0',
  `build` int(11) NOT NULL DEFAULT '0',
  `date_installed` datetime NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `product_type` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL,
  `product_class_name` varchar(80) DEFAULT NULL,
  `lazy_load` tinyint(4) NOT NULL DEFAULT '0',
  `sitewide` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `versions_pkey` (`product_type`,`product`,`major`,`minor`,`revision`,`build`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `versions`
--

INSERT INTO `versions` (`major`, `minor`, `revision`, `build`, `date_installed`, `current`, `product_type`, `product`, `product_class_name`, `lazy_load`, `sitewide`) VALUES
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.metadata', 'openurl10', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.metadata', 'nlm30', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.metadata', 'mods34', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.metadata', 'dc11', '', 0, 0),
(1, 1, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.blocks', 'subscription', 'SubscriptionBlockPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.blocks', 'makeSubmission', 'MakeSubmissionBlockPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.blocks', 'information', 'InformationBlockPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.blocks', 'developedBy', 'DevelopedByBlockPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.blocks', 'languageToggle', 'LanguageToggleBlockPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.citationLookup', 'pubmed', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.citationLookup', 'isbndb', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.citationLookup', 'worldcat', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.citationLookup', 'crossref', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.citationParser', 'freecite', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.citationParser', 'paracite', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.citationParser', 'parscit', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.citationParser', 'regex', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.gateways', 'resolver', '', 0, 0),
(1, 2, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'customBlockManager', 'CustomBlockManagerPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'dublinCoreMeta', 'DublinCoreMetaPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'webFeed', 'WebFeedPlugin', 1, 0),
(0, 1, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'citationStyleLanguage', 'CitationStyleLanguagePlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'recommendByAuthor', 'RecommendByAuthorPlugin', 1, 1),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'googleScholar', 'GoogleScholarPlugin', 1, 0),
(1, 2, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'openAIRE', 'OpenAIREPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'htmlArticleGalley', 'HtmlArticleGalleyPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'pdfJsViewer', 'PdfJsViewerPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'usageEvent', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'driver', 'DRIVERPlugin', 1, 0),
(1, 2, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'acron', 'AcronPlugin', 1, 1),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'tinymce', 'TinyMCEPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'googleAnalytics', 'GoogleAnalyticsPlugin', 1, 0),
(1, 2, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'staticPages', 'StaticPagesPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'orcidProfile', 'OrcidProfilePlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'lensGalley', 'LensGalleyPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.generic', 'usageStats', '', 0, 1),
(2, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.importexport', 'medra', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.importexport', 'pubmed', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.importexport', 'users', '', 0, 0),
(2, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.importexport', 'datacite', '', 0, 0),
(1, 1, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.importexport', 'doaj', '', 0, 0),
(2, 1, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.importexport', 'crossref', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.importexport', 'native', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.oaiMetadataFormats', 'rfc1807', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.oaiMetadataFormats', 'dc', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.oaiMetadataFormats', 'marcxml', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.oaiMetadataFormats', 'marc', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.paymethod', 'manual', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.paymethod', 'paypal', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.pubIds', 'doi', 'DOIPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.pubIds', 'urn', 'URNPubIdPlugin', 1, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.reports', 'articles', '', 0, 0),
(1, 1, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.reports', 'counterReport', '', 0, 0),
(2, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.reports', 'reviewReport', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.reports', 'views', '', 0, 0),
(1, 0, 0, 0, '2018-02-18 04:29:50', 1, 'plugins.themes', 'default', 'DefaultThemePlugin', 1, 0),
(3, 1, 0, 1, '2018-02-18 04:29:44', 1, 'core', 'ojs2', '', 0, 1),
(1, 1, 0, 0, '2018-02-18 06:19:18', 1, 'plugins.themes', 'bootstrap3', 'BootstrapThreeThemePlugin', 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
