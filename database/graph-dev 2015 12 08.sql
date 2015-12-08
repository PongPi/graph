-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 08, 2015 at 04:56 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `graph-dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesstokens`
--

CREATE TABLE IF NOT EXISTS `accesstokens` (
`id` int(10) unsigned NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `expires` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accesstokens`
--

INSERT INTO `accesstokens` (`id`, `token`, `user_id`, `client_id`, `expires`) VALUES
(8, 'iqV6GvGe5c2pvOOuRj2kQIHJnDZNq3hegOKRL0ZOQBAd9U0dghMQacbAbRe8N97PIFcwQTwAiC9m3HZinGwtDMBlW8L3yqlqiV9vLljWNzqydH3K0aZkgLP85bBY3JFk7qnnGFxZ5JaAZUDZSf6U50FRFX4VUUxrU1ZlqkjA7K3h4h7Ce9CPNmE9eZR2dRmhlD1FES9HgL3thtOYCLdJA9qUUlEGXDP5P9sRoTewvqUA61Dtrz8RCsuAUWvH3Nm', 1, 1, 1449591636209);

-- --------------------------------------------------------

--
-- Table structure for table `apps`
--

CREATE TABLE IF NOT EXISTS `apps` (
`id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `version` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL DEFAULT 'inactive',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_fields`
--

CREATE TABLE IF NOT EXISTS `app_fields` (
`id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `type` varchar(150) NOT NULL DEFAULT 'html',
  `app_id` int(10) unsigned NOT NULL,
  `relatable_id` int(10) unsigned NOT NULL,
  `relatable_type` varchar(150) NOT NULL DEFAULT 'posts',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE IF NOT EXISTS `app_settings` (
`id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `app_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
`id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `secret` varchar(150) NOT NULL,
  `redirection_uri` varchar(2000) DEFAULT NULL,
  `logo` varchar(2000) DEFAULT NULL,
  `status` varchar(150) NOT NULL DEFAULT 'development',
  `type` varchar(150) NOT NULL DEFAULT 'ua',
  `description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `uuid`, `name`, `slug`, `secret`, `redirection_uri`, `logo`, `status`, `type`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'b984962a-30a9-46fc-b44b-4fd4ea2d001d', 'Ghost Admin', 'ghost-admin', '760c48a0aaaf', NULL, NULL, 'enabled', 'ua', NULL, '2015-12-07 00:02:39', 1, '2015-12-07 00:02:39', 1),
(2, '8a9fd1f0-9a0d-406c-83f2-fb885cdda8fe', 'Ghost Frontend', 'ghost-frontend', 'da0ea8b6fb96', NULL, NULL, 'enabled', 'ua', NULL, '2015-12-07 00:02:39', 1, '2015-12-07 00:02:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_trusted_domains`
--

CREATE TABLE IF NOT EXISTS `client_trusted_domains` (
`id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `trusted_domain` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
`id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `action_type` varchar(150) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `uuid`, `name`, `object_type`, `action_type`, `object_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '16673fdb-cac0-49dd-81ad-b934db8538e6', 'Export database', 'db', 'exportContent', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(2, '36f0795f-7329-4a50-9153-101b0f363315', 'Import database', 'db', 'importContent', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(3, '65ef4494-06c3-447d-b2b8-d3506b3683d2', 'Delete all content', 'db', 'deleteAllContent', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(4, '96615975-52e9-41c7-a311-9c4d6a5d4d74', 'Send mail', 'mail', 'send', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(5, 'c582fc47-990b-41f9-85db-2323664ccccd', 'Browse notifications', 'notification', 'browse', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(6, 'abf1b790-3cfa-4708-a07e-7a60ae98a3a9', 'Add notifications', 'notification', 'add', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(7, 'b2228128-ee68-4f2b-b0fd-a830e013cb13', 'Delete notifications', 'notification', 'destroy', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(8, 'b3b55b04-a141-405a-8821-55ddcd259d3a', 'Browse posts', 'post', 'browse', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(9, '4e504c81-5165-41cc-850b-10b0e88abf9d', 'Read posts', 'post', 'read', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(10, 'f66b2cab-5c9a-4d1b-8828-1fd5f55a1448', 'Edit posts', 'post', 'edit', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(11, '7499a7a7-172c-4e71-99c0-926f6f9f1127', 'Add posts', 'post', 'add', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(12, 'aff8dd7f-d12d-4a2f-b37a-36e043ddb03b', 'Delete posts', 'post', 'destroy', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(13, 'b2b512d6-8376-4d12-93d6-96b61aa37b9b', 'Browse settings', 'setting', 'browse', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(14, '5c361207-bd67-4c48-a383-73745456b26d', 'Read settings', 'setting', 'read', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(15, 'ac5614bd-3ffd-48f9-a11b-d68b95874ec2', 'Edit settings', 'setting', 'edit', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(16, 'e7831cf6-3a16-475d-8c6c-8c25ea7f9c75', 'Generate slugs', 'slug', 'generate', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(17, '2bb85c45-e565-4c0c-9102-e3f7198dd7ef', 'Browse tags', 'tag', 'browse', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(18, '261dab89-2e24-4d12-a9eb-3641c85e46b0', 'Read tags', 'tag', 'read', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(19, 'b940ca49-8d59-42c9-98ef-333681b97769', 'Edit tags', 'tag', 'edit', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(20, 'ec6c11f0-7195-4ac3-b0b4-7e5e7cb0e06e', 'Add tags', 'tag', 'add', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(21, 'e3ec3f15-a93c-4916-9752-0d1ab678c7bb', 'Delete tags', 'tag', 'destroy', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(22, '476d22a9-1c62-46bb-bbdf-c49c715297f9', 'Browse themes', 'theme', 'browse', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(23, 'f731553e-b678-436b-953e-844874195fd6', 'Edit themes', 'theme', 'edit', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(24, '5400aeb1-0439-44e5-a2cf-632c3659b574', 'Browse users', 'user', 'browse', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(25, 'c963253e-f877-4bf5-9cd1-583843ece11d', 'Read users', 'user', 'read', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(26, '3cc547a5-ae62-4c6e-acc0-502ef6e3464c', 'Edit users', 'user', 'edit', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(27, '5768e8e7-2cd8-420f-9ced-fd325356d6bc', 'Add users', 'user', 'add', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(28, 'b2f901b1-9a16-431e-b505-04ab4b20d8ac', 'Delete users', 'user', 'destroy', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(29, '4a5edc09-ac82-444f-a2a9-493d0ed9cb9f', 'Assign a role', 'role', 'assign', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1),
(30, '3a7eb28d-0618-4097-aa01-73e57c64518d', 'Browse roles', 'role', 'browse', NULL, '2015-12-07 00:02:40', 1, '2015-12-07 00:02:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions_apps`
--

CREATE TABLE IF NOT EXISTS `permissions_apps` (
`id` int(10) unsigned NOT NULL,
  `app_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions_roles`
--

CREATE TABLE IF NOT EXISTS `permissions_roles` (
`id` int(10) unsigned NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions_roles`
--

INSERT INTO `permissions_roles` (`id`, `role_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 2, 8),
(32, 2, 9),
(33, 2, 10),
(34, 2, 11),
(35, 2, 12),
(36, 2, 13),
(37, 2, 14),
(38, 2, 16),
(39, 2, 17),
(40, 2, 18),
(41, 2, 19),
(42, 2, 20),
(43, 2, 21),
(44, 2, 24),
(45, 2, 25),
(46, 2, 26),
(47, 2, 27),
(48, 2, 28),
(49, 2, 29),
(50, 2, 30),
(51, 3, 8),
(52, 3, 9),
(53, 3, 11),
(54, 3, 13),
(55, 3, 14),
(56, 3, 16),
(57, 3, 17),
(58, 3, 18),
(59, 3, 20),
(60, 3, 24),
(61, 3, 25),
(62, 3, 30);

-- --------------------------------------------------------

--
-- Table structure for table `permissions_users`
--

CREATE TABLE IF NOT EXISTS `permissions_users` (
`id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `markdown` mediumtext,
  `html` mediumtext,
  `image` text,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `page` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(150) NOT NULL DEFAULT 'draft',
  `language` varchar(6) NOT NULL DEFAULT 'en_US',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `published_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `uuid`, `title`, `slug`, `markdown`, `html`, `image`, `featured`, `page`, `status`, `language`, `meta_title`, `meta_description`, `author_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `published_at`, `published_by`) VALUES
(1, '0d112f04-00bf-49b9-b804-5ba7507f0601', 'Welcome to Ghost', 'welcome-to-ghost', 'You''re live! Nice. We''ve put together a little post to introduce you to the Ghost editor and get you started. You can manage your content by signing in to the admin area at `<your blog URL>/ghost/`. When you arrive, you can select this post from a list on the left and see a preview of it on the right. Click the little pencil icon at the top of the preview to edit this post and read the next section!\n\n## Getting Started\n\nGhost uses something called Markdown for writing. Essentially, it''s a shorthand way to manage your post formatting as you write!\n\nWriting in Markdown is really easy. In the left hand panel of Ghost, you simply write as you normally would. Where appropriate, you can use *shortcuts* to **style** your content. For example, a list:\n\n* Item number one\n* Item number two\n    * A nested item\n* A final item\n\nor with numbers!\n\n1. Remember to buy some milk\n2. Drink the milk\n3. Tweet that I remembered to buy the milk, and drank it\n\n### Links\n\nWant to link to a source? No problem. If you paste in a URL, like http://ghost.org - it''ll automatically be linked up. But if you want to customise your anchor text, you can do that too! Here''s a link to [the Ghost website](http://ghost.org). Neat.\n\n### What about Images?\n\nImages work too! Already know the URL of the image you want to include in your article? Simply paste it in like this to make it show up:\n\n![The Ghost Logo](https://ghost.org/images/ghost.png)\n\nNot sure which image you want to use yet? That''s ok too. Leave yourself a descriptive placeholder and keep writing. Come back later and drag and drop the image in to upload:\n\n![A bowl of bananas]\n\n\n### Quoting\n\nSometimes a link isn''t enough, you want to quote someone on what they''ve said. Perhaps you''ve started using a new blogging platform and feel the sudden urge to share their slogan? A quote might be just the way to do it!\n\n> Ghost - Just a blogging platform\n\n### Working with Code\n\nGot a streak of geek? We''ve got you covered there, too. You can write inline `<code>` blocks really easily with back ticks. Want to show off something more comprehensive? 4 spaces of indentation gets you there.\n\n    .awesome-thing {\n        display: block;\n        width: 100%;\n    }\n\n### Ready for a Break? \n\nThrow 3 or more dashes down on any new line and you''ve got yourself a fancy new divider. Aw yeah.\n\n---\n\n### Advanced Usage\n\nThere''s one fantastic secret about Markdown. If you want, you can write plain old HTML and it''ll still work! Very flexible.\n\n<input type="text" placeholder="I''m an input field!" />\n\nThat should be enough to get you started. Have fun - and let us know what you think :)', '<p>You''re live! Nice. We''ve put together a little post to introduce you to the Ghost editor and get you started. You can manage your content by signing in to the admin area at <code>&lt;your blog URL&gt;/ghost/</code>. When you arrive, you can select this post from a list on the left and see a preview of it on the right. Click the little pencil icon at the top of the preview to edit this post and read the next section!</p>\n\n<h2 id="gettingstarted">Getting Started</h2>\n\n<p>Ghost uses something called Markdown for writing. Essentially, it''s a shorthand way to manage your post formatting as you write!</p>\n\n<p>Writing in Markdown is really easy. In the left hand panel of Ghost, you simply write as you normally would. Where appropriate, you can use <em>shortcuts</em> to <strong>style</strong> your content. For example, a list:</p>\n\n<ul>\n<li>Item number one</li>\n<li>Item number two\n<ul><li>A nested item</li></ul></li>\n<li>A final item</li>\n</ul>\n\n<p>or with numbers!</p>\n\n<ol>\n<li>Remember to buy some milk  </li>\n<li>Drink the milk  </li>\n<li>Tweet that I remembered to buy the milk, and drank it</li>\n</ol>\n\n<h3 id="links">Links</h3>\n\n<p>Want to link to a source? No problem. If you paste in a URL, like <a href="http://ghost.org">http://ghost.org</a> - it''ll automatically be linked up. But if you want to customise your anchor text, you can do that too! Here''s a link to <a href="http://ghost.org">the Ghost website</a>. Neat.</p>\n\n<h3 id="whataboutimages">What about Images?</h3>\n\n<p>Images work too! Already know the URL of the image you want to include in your article? Simply paste it in like this to make it show up:</p>\n\n<p><img src="https://ghost.org/images/ghost.png" alt="The Ghost Logo" /></p>\n\n<p>Not sure which image you want to use yet? That''s ok too. Leave yourself a descriptive placeholder and keep writing. Come back later and drag and drop the image in to upload:</p>\n\n<h3 id="quoting">Quoting</h3>\n\n<p>Sometimes a link isn''t enough, you want to quote someone on what they''ve said. Perhaps you''ve started using a new blogging platform and feel the sudden urge to share their slogan? A quote might be just the way to do it!</p>\n\n<blockquote>\n  <p>Ghost - Just a blogging platform</p>\n</blockquote>\n\n<h3 id="workingwithcode">Working with Code</h3>\n\n<p>Got a streak of geek? We''ve got you covered there, too. You can write inline <code>&lt;code&gt;</code> blocks really easily with back ticks. Want to show off something more comprehensive? 4 spaces of indentation gets you there.</p>\n\n<pre><code>.awesome-thing {\n    display: block;\n    width: 100%;\n}\n</code></pre>\n\n<h3 id="readyforabreak">Ready for a Break?</h3>\n\n<p>Throw 3 or more dashes down on any new line and you''ve got yourself a fancy new divider. Aw yeah.</p>\n\n<hr />\n\n<h3 id="advancedusage">Advanced Usage</h3>\n\n<p>There''s one fantastic secret about Markdown. If you want, you can write plain old HTML and it''ll still work! Very flexible.</p>\n\n<p><input type="text" placeholder="I''m an input field!" /></p>\n\n<p>That should be enough to get you started. Have fun - and let us know what you think :)</p>', NULL, 0, 0, 'published', 'en_US', NULL, NULL, 1, '2015-12-07 00:02:39', 1, '2015-12-07 00:02:39', 1, '2015-12-07 00:02:39', 1),
(2, '0ae5a252-d61b-4aff-b90b-438d24f516d7', 'THUÃ VI XINH Xáº®N, ÄÃNG YÃŠU TRONG Háº¬U TRÆ¯á»œNG CHá»¤P áº¢NH THá»œI TRANG', 'thuu-vi-xinh-xan-dang-yeu-trong-hau-truong-chup-anh-thoi-trang', '(Stardaily.vn) ThuÃ½ Vi vá»«a cÃ³ buá»•i chá»¥p áº£nh Ä‘á»™c quyá»n cho Stardaily.vn\n\nCÃ³ thá»ƒ báº¡n quan tÃ¢m\n\n \n[HOT] ThuÃ½ Vi láº§n Ä‘áº§u lÃ m cÃ´ dÃ¢u, xinh tÆ°Æ¡i trong trang phá»¥c cÆ°á»›i\n\n(Stardaily.vn) Sau khi gÃ¢y sá»‘t vá»›i loáº¡t áº£nh trong chuyáº¿n Ä‘i tá»« thiá»‡n, má»›i Ä‘Ã¢y, ThuÃ½ Vi láº¡i khiáº¿n cá»™ng Ä‘á»“ng máº¡ng xÃ´n xao vá»›i má»™t bá»™ áº£nh cÆ°á»›i "khuyáº¿t" chÃº rá»ƒ.\n\nChiá»u qua (06/12) ThuÃ½ Vi Ä‘Ã£ cÃ³ máº·t táº¡i TP.HCM vÃ  tham gia vÃ o buá»•i chá»¥p hÃ¬nh Ä‘Æ°á»£c thá»±c hiá»‡n bá»Ÿi Stardaily.vn. ThuÃ½ Vi xinh xáº¯n, dá»… thÆ°Æ¡ng Ä‘Ãºng vá»›i lá»©a tuá»•i cá»§a mÃ¬nh.\n\n\n\nHáº­u trÆ°á»ng chá»¥p áº£nh ThuÃ½ Vi - Stardaily.vn\n\n\nThÃºy Vi cÃ³ máº·t táº¡i studio tá»« sá»›m. CÃ´ nÃ ng nhanh chÃ³ng makeup Ä‘á»ƒ bÆ°á»›c vÃ o buá»•i chá»¥p hÃ¬nh.\n\n\nCÃ³ máº·t á»Ÿ TP.HCM tá»« sÃ¡ng sá»›m nhÆ°ng ThuÃ½ Vi váº«n giá»¯ Ä‘Æ°á»£c tinh tháº§n thoáº£i mÃ¡i, ráº¡ng rá»¡.\n\n\nEkip thá»±c hiá»‡n cho ThuÃ½ Vi bá»™ áº£nh mang cÃ¡ch cÃ¡ch lá»‹ch sá»±, tráº» trung Ä‘Ãºng vá»›i Ä‘á»™ tuá»•i cá»§a cÃ´ nÃ ng.\n\n\nThuÃ½ Vi "lá»™t xÃ¡c" vá»›i style hoÃ n toÃ n má»›i, khÃ¡c hoÃ n toÃ n vá»›i nhá»¯ng hÃ¬nh áº£nh trÆ°á»›c Ä‘Ã¢y cá»§a cÃ´ nÃ ng. CÃ¹ng Ä‘Ã³n xem trá»n bá»™ áº£nh cá»§a ThuÃ½ Vi táº¡i Stardaily.vn trong thá»i gian tá»›i.\n\nTáº®C KÃˆ', '<p>(Stardaily.vn) ThuÃ½ Vi vá»«a cÃ³ buá»•i chá»¥p áº£nh Ä‘á»™c quyá»n cho Stardaily.vn</p>\n\n<p>CÃ³ thá»ƒ báº¡n quan tÃ¢m</p>\n\n<p>[HOT] ThuÃ½ Vi láº§n Ä‘áº§u lÃ m cÃ´ dÃ¢u, xinh tÆ°Æ¡i trong trang phá»¥c cÆ°á»›i</p>\n\n<p>(Stardaily.vn) Sau khi gÃ¢y sá»‘t vá»›i loáº¡t áº£nh trong chuyáº¿n Ä‘i tá»« thiá»‡n, má»›i Ä‘Ã¢y, ThuÃ½ Vi láº¡i khiáº¿n cá»™ng Ä‘á»“ng máº¡ng xÃ´n xao vá»›i má»™t bá»™ áº£nh cÆ°á»›i "khuyáº¿t" chÃº rá»ƒ.</p>\n\n<p>Chiá»u qua (06/12) ThuÃ½ Vi Ä‘Ã£ cÃ³ máº·t táº¡i TP.HCM vÃ  tham gia vÃ o buá»•i chá»¥p hÃ¬nh Ä‘Æ°á»£c thá»±c hiá»‡n bá»Ÿi Stardaily.vn. ThuÃ½ Vi xinh xáº¯n, dá»… thÆ°Æ¡ng Ä‘Ãºng vá»›i lá»©a tuá»•i cá»§a mÃ¬nh.</p>\n\n<p>Háº­u trÆ°á»ng chá»¥p áº£nh ThuÃ½ Vi - Stardaily.vn</p>\n\n<p>ThÃºy Vi cÃ³ máº·t táº¡i studio tá»« sá»›m. CÃ´ nÃ ng nhanh chÃ³ng makeup Ä‘á»ƒ bÆ°á»›c vÃ o buá»•i chá»¥p hÃ¬nh.</p>\n\n<p>CÃ³ máº·t á»Ÿ TP.HCM tá»« sÃ¡ng sá»›m nhÆ°ng ThuÃ½ Vi váº«n giá»¯ Ä‘Æ°á»£c tinh tháº§n thoáº£i mÃ¡i, ráº¡ng rá»¡.</p>\n\n<p>Ekip thá»±c hiá»‡n cho ThuÃ½ Vi bá»™ áº£nh mang cÃ¡ch cÃ¡ch lá»‹ch sá»±, tráº» trung Ä‘Ãºng vá»›i Ä‘á»™ tuá»•i cá»§a cÃ´ nÃ ng.</p>\n\n<p>ThuÃ½ Vi "lá»™t xÃ¡c" vá»›i style hoÃ n toÃ n má»›i, khÃ¡c hoÃ n toÃ n vá»›i nhá»¯ng hÃ¬nh áº£nh trÆ°á»›c Ä‘Ã¢y cá»§a cÃ´ nÃ ng. CÃ¹ng Ä‘Ã³n xem trá»n bá»™ áº£nh cá»§a ThuÃ½ Vi táº¡i Stardaily.vn trong thá»i gian tá»›i.</p>\n\n<p>Táº®C KÃˆ</p>', '/content/images/2015/12/nguyen_hinh2_5Gic3cS.jpg', 1, 0, 'published', 'en_US', '', NULL, 1, '2015-12-07 22:12:25', 1, '2015-12-07 23:17:24', 1, '2015-12-07 22:13:45', 1),
(3, '658a44a9-be4e-4238-bf79-2552362e1439', 'ZICO (BLOCK B): "TÃ”I KHÃ”NG Há»€ NHÃI G-DRAGON"', 'zico-block-b-toi-khong-he-nhai-g-dragon', 'Stardaily.vn) Thá»§ lÄ©nh Block B Ä‘Ã£ cÃ³ nhá»¯ng chia sáº» tháº³ng tháº¯n trong buá»•i há»p bÃ¡o ra máº¯t album má»›i.\n\nCÃ³ thá»ƒ báº¡n quan tÃ¢m\n\n \nHÃ© lá»™ khoáº£n thÃ¹ lao cá»±c cao cá»§a YoonA (SNSD) khi Ä‘Ã³ng phim táº¡i Trung Quá»‘c\n\n(Stardaily.vn) Má»i ngÆ°á»i ráº¥t báº¥t ngá» trÆ°á»›c sá»‘ tiá»n mÃ  thÃ nh viÃªn SNSD nháº­n Ä‘Æ°á»£c.\n\nHÃ´m nay (7/12), trÆ°á»Ÿng nhÃ³m Block B Zico Ä‘Ã£ cÃ³ buá»•i há»p bÃ¡o ra máº¯t album má»›i "Gallery" táº¡i thá»§ Ä‘Ã´ Seoul. Táº¡i Ä‘Ã¢y anh Ä‘Ã£ tháº³ng tháº¯n tráº£ lá»i cÃ¡c cÃ¢u há»i cá»§a bÃ¡o giá»›i vá» viá»‡c Ä‘áº¡o nhÃ¡i phong cÃ¡ch cá»§a thá»§ lÄ©nh BIGBANG G-Dragon.\n\n\nZico (BLOCK B) vÃ  G-Dragon (BIGBANG)\n\nTá»« lÃ¢u, Zico luÃ´n Ä‘Æ°á»£c Ä‘em ra so sÃ¡nh vá»›i G-Dragon do cáº£ hai Ä‘á»u cÃ¹ng lÃ  rapper, nháº¡c sá»¹ vÃ  sáº£n xuáº¥t nháº¡c. NhÆ°ng vÃ¬ trÆ°á»Ÿng nhÃ³m BIGBANG ná»•i tiáº¿ng hÆ¡n nÃªn anh thÆ°á»ng hay bá»‹ gá»i lÃ  báº¯t chÆ°á»›c phong cÃ¡ch cá»§a G-Dragon. Vá» váº¥n Ä‘á» nÃ y, Zico Ä‘Ã£ lÃªn tiáº¿ng ráº±ng: "Cháº³ng cÃ³ nghÄ©a lÃ½ gÃ¬ khi nÃ³i tÃ´i báº¯t chÆ°á»›c anh áº¥y. Phong cÃ¡ch vÃ  thá»ƒ loáº¡i nháº¡c cá»§a chÃºng tÃ´i cÅ©ng ráº¥t khÃ¡c nhau. Máº·c dÃ¹ tÃ´i ráº¥t vinh dá»± khi Ä‘Æ°á»£c so sÃ¡nh vá»›i ngÃ´i sao ná»•i tiáº¿ng nhÆ°ng tháº­t ra thÃ¬ cáº£ tÃ´i vÃ  G-Dragon Ä‘á»u hÆ°á»›ng tá»›i nhá»¯ng má»¥c tiÃªu hoÃ n toÃ n khÃ´ng giá»‘ng nhau."\n\nThÃ nh viÃªn BLOCK B cÅ©ng chia sáº» ráº±ng nhá»¯ng Ã½ kiáº¿n nÃ y Ä‘á»u báº¯t nguá»“n tá»« anti-fan cá»§a anh, khÃ´ng pháº£i tá»« fan cá»§a G-Dragon nÃªn anh cÅ©ng cháº³ng máº£y may chÃº Ã½ Ä‘áº¿n. DÃ¹ lÃ  album Ä‘áº§u tiÃªn nhÆ°ng ca khÃºc chá»§ Ä‘á» "Eureka" cÃ³ sá»± gÃ³p máº·t gÃ³p máº·t cá»§a Zion.T cÅ©ng "leo tháº³ng" trÃªn cÃ¡c báº£ng xáº¿p háº¡ng Ã¢m nháº¡c HÃ n Quá»‘c.\n\n\n\n"Eureka" - Zico ft. Zion.T\n\n \n\nJung', '<p>Stardaily.vn) Thá»§ lÄ©nh Block B Ä‘Ã£ cÃ³ nhá»¯ng chia sáº» tháº³ng tháº¯n trong buá»•i há»p bÃ¡o ra máº¯t album má»›i.</p>\n\n<p>CÃ³ thá»ƒ báº¡n quan tÃ¢m</p>\n\n<p>HÃ© lá»™ khoáº£n thÃ¹ lao cá»±c cao cá»§a YoonA (SNSD) khi Ä‘Ã³ng phim táº¡i Trung Quá»‘c</p>\n\n<p>(Stardaily.vn) Má»i ngÆ°á»i ráº¥t báº¥t ngá» trÆ°á»›c sá»‘ tiá»n mÃ  thÃ nh viÃªn SNSD nháº­n Ä‘Æ°á»£c.</p>\n\n<p>HÃ´m nay (7/12), trÆ°á»Ÿng nhÃ³m Block B Zico Ä‘Ã£ cÃ³ buá»•i há»p bÃ¡o ra máº¯t album má»›i "Gallery" táº¡i thá»§ Ä‘Ã´ Seoul. Táº¡i Ä‘Ã¢y anh Ä‘Ã£ tháº³ng tháº¯n tráº£ lá»i cÃ¡c cÃ¢u há»i cá»§a bÃ¡o giá»›i vá» viá»‡c Ä‘áº¡o nhÃ¡i phong cÃ¡ch cá»§a thá»§ lÄ©nh BIGBANG G-Dragon.</p>\n\n<p>Zico (BLOCK B) vÃ  G-Dragon (BIGBANG)</p>\n\n<p>Tá»« lÃ¢u, Zico luÃ´n Ä‘Æ°á»£c Ä‘em ra so sÃ¡nh vá»›i G-Dragon do cáº£ hai Ä‘á»u cÃ¹ng lÃ  rapper, nháº¡c sá»¹ vÃ  sáº£n xuáº¥t nháº¡c. NhÆ°ng vÃ¬ trÆ°á»Ÿng nhÃ³m BIGBANG ná»•i tiáº¿ng hÆ¡n nÃªn anh thÆ°á»ng hay bá»‹ gá»i lÃ  báº¯t chÆ°á»›c phong cÃ¡ch cá»§a G-Dragon. Vá» váº¥n Ä‘á» nÃ y, Zico Ä‘Ã£ lÃªn tiáº¿ng ráº±ng: "Cháº³ng cÃ³ nghÄ©a lÃ½ gÃ¬ khi nÃ³i tÃ´i báº¯t chÆ°á»›c anh áº¥y. Phong cÃ¡ch vÃ  thá»ƒ loáº¡i nháº¡c cá»§a chÃºng tÃ´i cÅ©ng ráº¥t khÃ¡c nhau. Máº·c dÃ¹ tÃ´i ráº¥t vinh dá»± khi Ä‘Æ°á»£c so sÃ¡nh vá»›i ngÃ´i sao ná»•i tiáº¿ng nhÆ°ng tháº­t ra thÃ¬ cáº£ tÃ´i vÃ  G-Dragon Ä‘á»u hÆ°á»›ng tá»›i nhá»¯ng má»¥c tiÃªu hoÃ n toÃ n khÃ´ng giá»‘ng nhau."</p>\n\n<p>ThÃ nh viÃªn BLOCK B cÅ©ng chia sáº» ráº±ng nhá»¯ng Ã½ kiáº¿n nÃ y Ä‘á»u báº¯t nguá»“n tá»« anti-fan cá»§a anh, khÃ´ng pháº£i tá»« fan cá»§a G-Dragon nÃªn anh cÅ©ng cháº³ng máº£y may chÃº Ã½ Ä‘áº¿n. DÃ¹ lÃ  album Ä‘áº§u tiÃªn nhÆ°ng ca khÃºc chá»§ Ä‘á» "Eureka" cÃ³ sá»± gÃ³p máº·t gÃ³p máº·t cá»§a Zion.T cÅ©ng "leo tháº³ng" trÃªn cÃ¡c báº£ng xáº¿p háº¡ng Ã¢m nháº¡c HÃ n Quá»‘c.</p>\n\n<p>"Eureka" - Zico ft. Zion.T</p>\n\n<p>Jung</p>', '/content/images/2015/12/restmb_jhidxmake.jpg', 0, 0, 'published', 'en_US', NULL, NULL, 1, '2015-12-07 23:14:18', 1, '2015-12-07 23:17:02', 1, '2015-12-07 23:16:19', 1),
(4, '780038ce-04a2-4bb6-b6a0-50e78b31f700', 'Lá»œI THÃš Tá»˜I NGá»ŒT NGÃ€O', 'loi-thu-toi-ngot-ngao', '(Stardaily.vn) ÄÃ¨n Ä‘á» cá»§a anh Ä‘Ã£ tÃºyt cÃ²i, cÃ³ káº» Ä‘em tÃ¬nh yÃªu cá»§a anh Ä‘i máº¥t, anh muá»‘n láº¥y láº¡i cÃ³ Ä‘Æ°á»£c khÃ´ng háº£ cÃ´ bÃ©?\n\nCÃ³ thá»ƒ báº¡n quan tÃ¢m\n\n \nGá»­i em, ngÆ°á»i yÃªu tÆ°Æ¡ng lai\n\n(Stardaily.vn) - NgÆ°á»i anh sáº¯p yÃªu Ã , em Ä‘ang yÃªu ai, em Ä‘ang bÃªn ai hay má»™t mÃ¬nh thÃ¬ chuáº©n bá»‹ Ä‘i nhÃ©, dá»± lÃ  anh sáº¯p yÃªu em rá»“i Ä‘áº¥y.\n\nGá»­i cÃ´ bÃ© Ä‘ang giá»¯ trÃ¡i tim cá»§a anh mÃ  khÃ´ng chá»‹u tráº£.\n\nCÃ¡i lÃºc em cháº¡m váº¡ch vÃ ng ranh giá»›i con tim, anh chÃ­nh xÃ¡c Ä‘Ã£ cáº£nh bÃ¡o em ráº±ng khÃ´ng Ä‘Æ°á»£c tiáº¿n vÃ o sÃ¢u hÆ¡n rá»“i. Váº­y mÃ  cÃ´ bÃ© con láº¡i cháº³ng chá»‹u nghe lá»i anh gÃ¬ cáº£, cá»© há»“n nhiÃªn Ä‘i vÃ o mÃ  láº¥y cáº¯p trÃ¡i tim Ä‘ang vÃ¹i ngá»§ cá»§a anh.\n\n\nÄÃ¨n Ä‘á» cá»§a anh Ä‘Ã£ tÃºyt cÃ²i, cÃ³ káº» Ä‘em tÃ¬nh yÃªu cá»§a anh Ä‘i máº¥t, anh muá»‘n láº¥y láº¡i cÃ³ Ä‘Æ°á»£c khÃ´ng háº£ cÃ´ bÃ©?\n\nÄá»«ng nghÄ© mÃ¬nh ngÃ¢y thÆ¡ mÃ  khÃ´ng cÃ³ tá»™i bÃ© nhÃ©, chá»‰ lÃ  cÃ´ bÃ© Ä‘Ã£ khiáº¿n tim anh xuyáº¿n xao Ä‘áº­p khÃ´ng ngá»«ng nghá»‰ má»—i khi nhÃ¬n tháº¥y bÃ©. CÃ´ bÃ© cÆ°á»i lÃ m chi tÆ°Æ¡i quÃ¡, Ä‘áº¹p Ä‘áº¿n ná»•i anh chá»‰ muá»‘n thá»i gian Ä‘á»©ng láº¡i Ä‘á»ƒ hÃ¬nh bÃ³ng áº¥y táº¡c mÃ£i trong tÃ¢m trÃ­, bÃ© lÃ m cho cuá»™c sá»‘ng cá»§a anh Ä‘áº£o lá»™n má»—i khi khÃ´ng nhÃ¬n tháº¥y Ä‘Ã´i máº¯t bá»“ cÃ¢u tháº£ há»“n trong náº¯ng. CÃ¡i tá»™i áº¥y náº·ng láº¯m, theo luáº­t phÃ¡p cá»§a toÃ  Ã¡n tÃ¬nh yÃªu, bÃ© pháº£i á»Ÿ bÃªn cáº¡nh mÃ  chÄƒm sÃ³c trÃ¡i tim non ná»›t cá»§a anh cho Ä‘áº¿n khi bÃ¬nh phá»¥c má»›i Ä‘Æ°á»£c tha.\n\nÄá»«ng nghÄ© anh Ä‘Ã¹a cÃ´ bÃ©, em sáº½ lÃ m anh Ä‘au Ä‘áº¥y, tháº­t tÃ¢m, anh thÃ­ch bÃ© láº¯m !!!!!\n\nAnh thÃ­ch giá»ng nÃ³i Ãªm nhÆ° ru cá»§a bÃ© má»—i khi trÃ² chuyá»‡n, thÃ­ch cÃ¡i tÃ­nh con nÃ­t lÃ­u lo nhÆ° sÃ¡o má»—i khi bÃªn cáº¡nh, thÃ­ch cáº£ nhá»¯ng khi há»n giáº­n nÅ©ng ná»‹u lÃ m trÃ² cá»§a em. Anh thÃ­ch con ngÆ°á»i chÃ¢n tháº­t há»“n nhiÃªn trong sÃ¡ng áº¥y, anh tháº¥y cuá»™c sá»‘ng cá»§a mÃ¬nh Ä‘áº¹p hÆ¡n tá»« khi bÃ© bÆ°á»›c vÃ o. Váº­y mÃ  anh Ä‘Ã£ sá»£ hÃ£i phÃ¢n váº¡ch ngÄƒn cÃ¡ch rÃµ rÃ ng, cÃ´ bÃ© con nhÆ° em cÃ³ thá»ƒ dá»… dÃ ng Ä‘i vÃ o nhÆ° váº­y, anh quáº£ lÃ  tháº¥t báº¡i khi cáº¥t cÃ´ng xÃ¢y cÃ¡i tÆ°á»ng thÃ nh áº¥y rá»“i.\n\n\nÄÃ£ bao Ä‘Ãªm trÃ´i, cháº­p chá»n trong má»™ng má»‹, bÃ© Ä‘áº¿n rá»“i Ä‘i, cÄƒn phÃ²ng áº¥m Ã¡p rá»™n rÃ ng rá»“i láº¡i trá»‘ng tráº£i láº¡nh láº½o. Mong nhá»› cÃ´ bÃ© nhiá»u hÆ¡n, chá»‰ muá»‘n bÃ© á»Ÿ bÃªn cáº¡nh anh mÃ£i thÃ´i, sá»£ bÃ© xa anh láº¡i láº¡c Ä‘Æ°á»ng mÃ  khÃ´ng tÃ¬m tháº¥y lá»‘i, sá»£ tÃ¬nh yÃªu cá»§a anh khiáº¿n bÃ© hoáº£ng mÃ  bá» cháº¡y máº¥t.\n\nCháº§m cháº­m thÃ´i, anh muá»‘n kháº½ khÃ n vÃ o tháº¿ giá»›i cá»§a bÃ© mÃ  láº¥y láº¡i trÃ¡i tim mÃ¬nh. Ã€, mÃ  tÃªn siÃªu Ä‘áº¡o chÃ­ch nhÆ° anh, khÃ´ng dá»… Ä‘i ra vá»›i tay khÃ´ng Ä‘Ã¢u, láº§n nÃ y Ä‘Ã¨n Ä‘á» báº­t lÃªn, anh cáº£nh bÃ¡o trÆ°á»›c sáº½ trá»™m luÃ´n cáº£ trÃ¡i tim cá»§a bÃ© Ä‘áº¥y nhÃ©.\n\nCÃ´ bÃ© con nhÆ° em cháº¡y khÃ´ng thoÃ¡t trÆ°á»›c tÃ¬nh yÃªu to lá»›n cá»§a anh Ä‘Ã¢uâ€¦\n\nAnh chÃ¢n thÃ nh tháº­t Ä‘áº¥y, náº¿u bÃ© sá»£ anh chá»‰ lÃ  vu vÆ¡ nhá»¯ng lá»i nÃ³i giÃ³ bay thÃ¬ hÃ£y láº¡i gáº§n Ä‘Ã¢y, anh sáº½ hÃ nh Ä‘á»™ng cho bÃ© xem. Muá»‘n yÃªu vÃ  Ä‘Æ°á»£c yÃªu nhiá»u hÆ¡n ná»¯a, muá»‘n má»™t háº¡nh phÃºc chá»‰ dÃ nh cho riÃªng chÃºng ta mÃ  thÃ´i bÃ© Ã .\n\nNáº¿u nhÆ° váº«n cÃ²n bÄƒn khoÄƒn, anh nháº¥t Ä‘á»‹nh sáº½ chá» cÃ´ bÃ©. CÃ²n náº¿u Ä‘Ã£ dáº¹p bá» nhá»¯ng ngáº§n ngáº¡i thÃ¬ cÃ´ bÃ©, hÃ£y Ä‘Æ°a Ä‘Ã´i tay Ä‘Ã¢y Ä‘á»ƒ anh náº¯m nhÃ©.', '<p>(Stardaily.vn) ÄÃ¨n Ä‘á» cá»§a anh Ä‘Ã£ tÃºyt cÃ²i, cÃ³ káº» Ä‘em tÃ¬nh yÃªu cá»§a anh Ä‘i máº¥t, anh muá»‘n láº¥y láº¡i cÃ³ Ä‘Æ°á»£c khÃ´ng háº£ cÃ´ bÃ©?</p>\n\n<p>CÃ³ thá»ƒ báº¡n quan tÃ¢m</p>\n\n<p>Gá»­i em, ngÆ°á»i yÃªu tÆ°Æ¡ng lai</p>\n\n<p>(Stardaily.vn) - NgÆ°á»i anh sáº¯p yÃªu Ã , em Ä‘ang yÃªu ai, em Ä‘ang bÃªn ai hay má»™t mÃ¬nh thÃ¬ chuáº©n bá»‹ Ä‘i nhÃ©, dá»± lÃ  anh sáº¯p yÃªu em rá»“i Ä‘áº¥y.</p>\n\n<p>Gá»­i cÃ´ bÃ© Ä‘ang giá»¯ trÃ¡i tim cá»§a anh mÃ  khÃ´ng chá»‹u tráº£.</p>\n\n<p>CÃ¡i lÃºc em cháº¡m váº¡ch vÃ ng ranh giá»›i con tim, anh chÃ­nh xÃ¡c Ä‘Ã£ cáº£nh bÃ¡o em ráº±ng khÃ´ng Ä‘Æ°á»£c tiáº¿n vÃ o sÃ¢u hÆ¡n rá»“i. Váº­y mÃ  cÃ´ bÃ© con láº¡i cháº³ng chá»‹u nghe lá»i anh gÃ¬ cáº£, cá»© há»“n nhiÃªn Ä‘i vÃ o mÃ  láº¥y cáº¯p trÃ¡i tim Ä‘ang vÃ¹i ngá»§ cá»§a anh.</p>\n\n<p>ÄÃ¨n Ä‘á» cá»§a anh Ä‘Ã£ tÃºyt cÃ²i, cÃ³ káº» Ä‘em tÃ¬nh yÃªu cá»§a anh Ä‘i máº¥t, anh muá»‘n láº¥y láº¡i cÃ³ Ä‘Æ°á»£c khÃ´ng háº£ cÃ´ bÃ©?</p>\n\n<p>Äá»«ng nghÄ© mÃ¬nh ngÃ¢y thÆ¡ mÃ  khÃ´ng cÃ³ tá»™i bÃ© nhÃ©, chá»‰ lÃ  cÃ´ bÃ© Ä‘Ã£ khiáº¿n tim anh xuyáº¿n xao Ä‘áº­p khÃ´ng ngá»«ng nghá»‰ má»—i khi nhÃ¬n tháº¥y bÃ©. CÃ´ bÃ© cÆ°á»i lÃ m chi tÆ°Æ¡i quÃ¡, Ä‘áº¹p Ä‘áº¿n ná»•i anh chá»‰ muá»‘n thá»i gian Ä‘á»©ng láº¡i Ä‘á»ƒ hÃ¬nh bÃ³ng áº¥y táº¡c mÃ£i trong tÃ¢m trÃ­, bÃ© lÃ m cho cuá»™c sá»‘ng cá»§a anh Ä‘áº£o lá»™n má»—i khi khÃ´ng nhÃ¬n tháº¥y Ä‘Ã´i máº¯t bá»“ cÃ¢u tháº£ há»“n trong náº¯ng. CÃ¡i tá»™i áº¥y náº·ng láº¯m, theo luáº­t phÃ¡p cá»§a toÃ  Ã¡n tÃ¬nh yÃªu, bÃ© pháº£i á»Ÿ bÃªn cáº¡nh mÃ  chÄƒm sÃ³c trÃ¡i tim non ná»›t cá»§a anh cho Ä‘áº¿n khi bÃ¬nh phá»¥c má»›i Ä‘Æ°á»£c tha.</p>\n\n<p>Äá»«ng nghÄ© anh Ä‘Ã¹a cÃ´ bÃ©, em sáº½ lÃ m anh Ä‘au Ä‘áº¥y, tháº­t tÃ¢m, anh thÃ­ch bÃ© láº¯m !!!!!</p>\n\n<p>Anh thÃ­ch giá»ng nÃ³i Ãªm nhÆ° ru cá»§a bÃ© má»—i khi trÃ² chuyá»‡n, thÃ­ch cÃ¡i tÃ­nh con nÃ­t lÃ­u lo nhÆ° sÃ¡o má»—i khi bÃªn cáº¡nh, thÃ­ch cáº£ nhá»¯ng khi há»n giáº­n nÅ©ng ná»‹u lÃ m trÃ² cá»§a em. Anh thÃ­ch con ngÆ°á»i chÃ¢n tháº­t há»“n nhiÃªn trong sÃ¡ng áº¥y, anh tháº¥y cuá»™c sá»‘ng cá»§a mÃ¬nh Ä‘áº¹p hÆ¡n tá»« khi bÃ© bÆ°á»›c vÃ o. Váº­y mÃ  anh Ä‘Ã£ sá»£ hÃ£i phÃ¢n váº¡ch ngÄƒn cÃ¡ch rÃµ rÃ ng, cÃ´ bÃ© con nhÆ° em cÃ³ thá»ƒ dá»… dÃ ng Ä‘i vÃ o nhÆ° váº­y, anh quáº£ lÃ  tháº¥t báº¡i khi cáº¥t cÃ´ng xÃ¢y cÃ¡i tÆ°á»ng thÃ nh áº¥y rá»“i.</p>\n\n<p>ÄÃ£ bao Ä‘Ãªm trÃ´i, cháº­p chá»n trong má»™ng má»‹, bÃ© Ä‘áº¿n rá»“i Ä‘i, cÄƒn phÃ²ng áº¥m Ã¡p rá»™n rÃ ng rá»“i láº¡i trá»‘ng tráº£i láº¡nh láº½o. Mong nhá»› cÃ´ bÃ© nhiá»u hÆ¡n, chá»‰ muá»‘n bÃ© á»Ÿ bÃªn cáº¡nh anh mÃ£i thÃ´i, sá»£ bÃ© xa anh láº¡i láº¡c Ä‘Æ°á»ng mÃ  khÃ´ng tÃ¬m tháº¥y lá»‘i, sá»£ tÃ¬nh yÃªu cá»§a anh khiáº¿n bÃ© hoáº£ng mÃ  bá» cháº¡y máº¥t.</p>\n\n<p>Cháº§m cháº­m thÃ´i, anh muá»‘n kháº½ khÃ n vÃ o tháº¿ giá»›i cá»§a bÃ© mÃ  láº¥y láº¡i trÃ¡i tim mÃ¬nh. Ã€, mÃ  tÃªn siÃªu Ä‘áº¡o chÃ­ch nhÆ° anh, khÃ´ng dá»… Ä‘i ra vá»›i tay khÃ´ng Ä‘Ã¢u, láº§n nÃ y Ä‘Ã¨n Ä‘á» báº­t lÃªn, anh cáº£nh bÃ¡o trÆ°á»›c sáº½ trá»™m luÃ´n cáº£ trÃ¡i tim cá»§a bÃ© Ä‘áº¥y nhÃ©.</p>\n\n<p>CÃ´ bÃ© con nhÆ° em cháº¡y khÃ´ng thoÃ¡t trÆ°á»›c tÃ¬nh yÃªu to lá»›n cá»§a anh Ä‘Ã¢uâ€¦</p>\n\n<p>Anh chÃ¢n thÃ nh tháº­t Ä‘áº¥y, náº¿u bÃ© sá»£ anh chá»‰ lÃ  vu vÆ¡ nhá»¯ng lá»i nÃ³i giÃ³ bay thÃ¬ hÃ£y láº¡i gáº§n Ä‘Ã¢y, anh sáº½ hÃ nh Ä‘á»™ng cho bÃ© xem. Muá»‘n yÃªu vÃ  Ä‘Æ°á»£c yÃªu nhiá»u hÆ¡n ná»¯a, muá»‘n má»™t háº¡nh phÃºc chá»‰ dÃ nh cho riÃªng chÃºng ta mÃ  thÃ´i bÃ© Ã .</p>\n\n<p>Náº¿u nhÆ° váº«n cÃ²n bÄƒn khoÄƒn, anh nháº¥t Ä‘á»‹nh sáº½ chá» cÃ´ bÃ©. CÃ²n náº¿u Ä‘Ã£ dáº¹p bá» nhá»¯ng ngáº§n ngáº¡i thÃ¬ cÃ´ bÃ©, hÃ£y Ä‘Æ°a Ä‘Ã´i tay Ä‘Ã¢y Ä‘á»ƒ anh náº¯m nhÃ©.</p>', '/content/images/2015/12/04.jpg', 0, 0, 'published', 'en_US', NULL, NULL, 1, '2015-12-08 21:21:30', 1, '2015-12-08 21:22:15', 1, '2015-12-08 21:22:15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts_tags`
--

CREATE TABLE IF NOT EXISTS `posts_tags` (
`id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_tags`
--

INSERT INTO `posts_tags` (`id`, `post_id`, `tag_id`, `sort_order`) VALUES
(1, 1, 1, 0),
(2, 2, 2, 0),
(3, 2, 3, 1),
(4, 2, 4, 2),
(5, 2, 5, 3),
(6, 2, 6, 4),
(7, 2, 7, 5),
(8, 2, 8, 6),
(9, 2, 9, 7),
(10, 2, 10, 8),
(11, 2, 11, 9),
(12, 2, 12, 10),
(13, 3, 2, 0),
(14, 3, 7, 1),
(15, 4, 25, 0);

-- --------------------------------------------------------

--
-- Table structure for table `refreshtokens`
--

CREATE TABLE IF NOT EXISTS `refreshtokens` (
`id` int(10) unsigned NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `expires` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `refreshtokens`
--

INSERT INTO `refreshtokens` (`id`, `token`, `user_id`, `client_id`, `expires`) VALUES
(1, 'bbcBuBUsAj1XamuTb0ooBRp8Nd8EFakaXHuG8opviCXtKNpNPg2NXNpGWz4rqUjhl6PlkiwqoWOFCzC1VSA0C1vTpVhzYmkUc002HwSloSmuM4juVW3cxBzJy3mZw3iXvuErWQxuwsd1tbj4XVaoGQ5JpJC8Weno4SfDKt3Bui9DEujJzECTeWvgra3aScDwrIA15c4EVlZpqcHkr8fhAHJM05pAH6zLDcG0AxhWE1b1GM7f9j5dp59iBHH9eRe', 1, 1, 1450192836210);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
`id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `uuid`, `name`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '4e56496a-4e9f-4b4d-ada7-5d58b88b9f57', 'Administrator', 'Administrators', '2015-12-07 00:02:39', 1, '2015-12-07 00:02:39', 1),
(2, 'd924d3b9-ec1f-479e-956c-16bb53330ef7', 'Editor', 'Editors', '2015-12-07 00:02:39', 1, '2015-12-07 00:02:39', 1),
(3, '4bba16ab-eb7d-488e-9f9a-b533192cbb51', 'Author', 'Authors', '2015-12-07 00:02:39', 1, '2015-12-07 00:02:39', 1),
(4, '3b99fdde-624e-4b3b-ae54-f7d43b499d4d', 'Owner', 'Blog Owner', '2015-12-07 00:02:39', 1, '2015-12-07 00:02:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
`id` int(10) unsigned NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_users`
--

INSERT INTO `roles_users` (`id`, `role_id`, `user_id`) VALUES
(1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
`id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `type` varchar(150) NOT NULL DEFAULT 'core',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `uuid`, `key`, `value`, `type`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'e54c0952-f9ab-493c-b50c-096c5acb0de6', 'databaseVersion', '004', 'core', '2015-12-07 00:02:41', 1, '2015-12-07 00:02:41', 1),
(2, '2ff3d4ca-fd60-4a97-a4b4-ad9c2e566a50', 'dbHash', 'ad37aa83-a7fc-45e5-9bb8-cbdf9801440a', 'core', '2015-12-07 00:02:41', 1, '2015-12-07 00:02:41', 1),
(3, '03f6a3a3-9461-4f98-8608-1024c1fb0127', 'cover', '', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(4, 'd8ac62b3-5efb-4d36-b436-08cb91abe21b', 'permalinks', '/:slug/', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(5, '9331a7d6-dedd-4cf4-b904-c3b06fa4b20e', 'ghost_head', '', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(6, 'c4deb7f3-36d7-4304-81b6-cdc81b5cedc6', 'nextUpdateCheck', '1449658516', 'core', '2015-12-07 00:02:41', 1, '2015-12-08 17:55:17', 1),
(7, 'a4721734-8bce-4d3c-894b-e923a52d6239', 'description', 'Thoughts, stories and ideas.', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(8, '87d78c55-39d4-43b4-a6a8-9647cd4320d6', 'logo', '', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(9, '081fff65-17c0-4c2f-a513-8b753aeabe8a', 'defaultLang', 'en_US', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(10, 'd2d5f898-fc62-45b1-b951-ec7d2c6ffe21', 'displayUpdateNotification', '0.5.0', 'core', '2015-12-07 00:02:41', 1, '2015-12-08 17:55:17', 1),
(11, '65c02ed5-10dc-4b2b-8942-d4785fe801ae', 'forceI18n', 'true', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(12, 'b0602a44-506c-4b19-8feb-8805db6e1b0d', 'postsPerPage', '5', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(13, '4a8797e7-f6f7-4bfc-9cfc-f2f95c731c59', 'title', 'Graph News', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(14, 'e9e3f991-1e1f-41be-aa5b-2553478a742a', 'ghost_foot', '', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(15, '082314ee-6310-4025-b8a0-39e1ab6297bd', 'labs', '{"publicAPI":true}', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(16, '743af30a-224d-48fb-85c8-ba4daa696bb6', 'navigation', '[{"label":"Home", "url":"/"}]', 'blog', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(17, 'cc15ffa0-5c48-4142-87ba-02f1e46d2bc7', 'activeApps', '[]', 'app', '2015-12-07 00:02:41', 1, '2015-12-07 00:02:41', 1),
(18, '8e9f84ff-7097-4c32-9752-2ffc9cff689d', 'installedApps', '[]', 'app', '2015-12-07 00:02:41', 1, '2015-12-08 22:54:25', 1),
(19, 'b745976c-f1eb-4051-9299-410a45258a06', 'isPrivate', 'false', 'private', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(20, 'c0932adb-e092-46e0-9375-4896b1598af5', 'password', 'null', 'private', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1),
(21, '5a9f873d-9f5b-4c9a-81ba-8a4ffd29ed1e', 'activeTheme', 'wbkd', 'theme', '2015-12-07 00:02:41', 1, '2015-12-08 20:24:51', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
`id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image` text,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `parent_id` int(11) DEFAULT NULL,
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `uuid`, `name`, `slug`, `description`, `image`, `hidden`, `parent_id`, `meta_title`, `meta_description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'c8a66a06-f353-4bec-9a60-6a11dfac81a0', 'Getting Started', 'getting-started', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 00:02:39', 1, '2015-12-07 00:02:39', 1),
(2, '2bd96ff9-0b63-4bc4-b59d-ffca50bf8620', 'TIN SAO', 'tin-sao', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 22:59:15', 1, '2015-12-08 20:14:01', 1),
(3, '591359c1-903c-4161-ba21-568ace55d9cd', 'XEM', 'xem', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:14:25', 1),
(4, 'a8e4abbe-8341-4e6b-9d2b-7ff1743c1530', 'NHáº C', 'nhac', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:14:50', 1),
(5, '2e242778-123d-4913-a564-413d6054e46b', 'Sá»NG', 'song', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:15:43', 1),
(6, '4a14b65f-f261-4a54-8204-92df4704dd20', 'Äáº¸P', 'dep', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:15:51', 1),
(7, '7cd77a5c-7aac-433e-a38f-2b5100457326', 'YÃŠU', 'yeu', '', NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:17:02', 1),
(8, 'fdc1fb33-b107-4559-8765-745c36a4df36', 'CÆ¯á»œI', 'cuoi', '', NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:17:36', 1),
(9, '09cffbf8-1ecf-471f-a3ff-b49fd674c333', 'THá»‚ THAO', 'the-thao', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:17:53', 1),
(10, '04b8211a-a61f-457b-be26-a60323141335', 'XÃ•A', 'phuot', '', NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:16:40', 1),
(11, '5a08148c-4698-412e-acd9-0e12fdfa8ca2', 'Há»ŒC', 'hoc', '', NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:17:44', 1),
(12, '36f464cc-868f-4877-b807-6325891fa067', '12 CHÃ’M SAO', '12-chom-sao', '', NULL, 0, NULL, NULL, NULL, '2015-12-07 23:04:40', 1, '2015-12-08 20:18:21', 1),
(13, '63bf02c7-0e12-4d55-8e17-f0fbe2b52b3a', 'SAO VIá»†T', 'sao-viet', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-08 20:13:16', 1, '2015-12-08 20:13:33', 1),
(14, '3aebb22b-2f39-4ad8-83e0-3ab571c806cb', 'SAO NGOáº I', 'sao-ngoai', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-08 20:13:47', 1, '2015-12-08 20:13:47', 1),
(15, '09e1a81b-7461-4963-90af-af81fde6efdc', 'TV SHOW', 'tv-show', '', NULL, 0, NULL, NULL, NULL, '2015-12-08 20:14:35', 1, '2015-12-08 20:14:37', 1),
(16, 'c454bf7b-97a2-4dce-808f-4da15dadcbb5', 'PHIM', 'phim', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-08 20:14:38', 1, '2015-12-08 20:14:38', 1),
(17, '3c3cc405-338e-42c4-a5e4-bd71244229a4', 'VIá»†T NAM', 'viet-nam', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-08 20:15:02', 1, '2015-12-08 20:15:02', 1),
(18, '94f56920-031f-4fbe-8e2a-4780f12d2d07', 'CHÃ‚U Ã', 'chau-a', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-08 20:15:11', 1, '2015-12-08 20:15:11', 1),
(19, 'da7f11c8-8832-4215-9bca-557ae3dde7c4', 'Ã‚U - Má»¸', 'au-my', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-08 20:15:14', 1, '2015-12-08 20:15:14', 1),
(21, '886e8f9d-b489-48c0-a201-56b3e07e39ad', 'THá»œI TRANG', 'thoi-trang', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-08 20:16:06', 1, '2015-12-08 20:16:06', 1),
(22, 'c2ae0283-0971-45d6-a0b3-d1bb092e1160', 'PHONG CÃCH', 'phong-cach', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-08 20:16:10', 1, '2015-12-08 20:16:10', 1),
(23, 'e0964bf4-0c04-4594-a262-88056faae28e', 'LÃ€M Äáº¸P +', 'lam-dep', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-08 20:16:19', 1, '2015-12-08 20:16:19', 1),
(24, 'e20e0a7d-d6da-40c7-a032-0f3783b8e30d', 'NGON', 'ngon', '', NULL, 0, NULL, NULL, NULL, '2015-12-08 20:16:46', 1, '2015-12-08 20:16:50', 1),
(25, '5ac2ea94-cbf6-49b2-b00e-b03167910bb8', '365 NGÃ€Y YÃŠU', '365-ngay-yeu', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-08 20:17:14', 1, '2015-12-08 20:17:14', 1),
(26, 'bd63f4eb-5602-461b-898d-3f1e9c429e0e', 'BÃ KÃP YÃŠU', 'bi-kip-yeu', NULL, NULL, 0, NULL, NULL, NULL, '2015-12-08 20:17:22', 1, '2015-12-08 20:17:22', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(254) NOT NULL,
  `image` text,
  `cover` text,
  `bio` varchar(200) DEFAULT NULL,
  `website` text,
  `location` text,
  `accessibility` text,
  `status` varchar(150) NOT NULL DEFAULT 'active',
  `language` varchar(6) NOT NULL DEFAULT 'en_US',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `tour` text,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `slug`, `password`, `email`, `image`, `cover`, `bio`, `website`, `location`, `accessibility`, `status`, `language`, `meta_title`, `meta_description`, `tour`, `last_login`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '7b685fba-35ec-44eb-adac-8c12ff5f276a', 'eroshaly', 'eroshaly', '$2a$10$8UVMOWF0AR.9cnxm.yKXlehp478Hxw6Wv2Lg7uhwgRJpKgA.RUtFq', 'eroshaly@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'en_US', NULL, NULL, NULL, '2015-12-07 00:10:36', '2015-12-07 00:02:41', 1, '2015-12-07 00:10:36', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesstokens`
--
ALTER TABLE `accesstokens`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `accesstokens_token_unique` (`token`), ADD KEY `accesstokens_user_id_foreign` (`user_id`), ADD KEY `accesstokens_client_id_foreign` (`client_id`);

--
-- Indexes for table `apps`
--
ALTER TABLE `apps`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `apps_name_unique` (`name`), ADD UNIQUE KEY `apps_slug_unique` (`slug`);

--
-- Indexes for table `app_fields`
--
ALTER TABLE `app_fields`
 ADD PRIMARY KEY (`id`), ADD KEY `app_fields_app_id_foreign` (`app_id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `app_settings_key_unique` (`key`), ADD KEY `app_settings_app_id_foreign` (`app_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `clients_name_unique` (`name`), ADD UNIQUE KEY `clients_slug_unique` (`slug`);

--
-- Indexes for table `client_trusted_domains`
--
ALTER TABLE `client_trusted_domains`
 ADD PRIMARY KEY (`id`), ADD KEY `client_trusted_domains_client_id_foreign` (`client_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions_apps`
--
ALTER TABLE `permissions_apps`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions_roles`
--
ALTER TABLE `permissions_roles`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions_users`
--
ALTER TABLE `permissions_users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `posts_tags`
--
ALTER TABLE `posts_tags`
 ADD PRIMARY KEY (`id`), ADD KEY `posts_tags_post_id_foreign` (`post_id`), ADD KEY `posts_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `refreshtokens_token_unique` (`token`), ADD KEY `refreshtokens_user_id_foreign` (`user_id`), ADD KEY `refreshtokens_client_id_foreign` (`client_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_users`
--
ALTER TABLE `roles_users`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `users_slug_unique` (`slug`), ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesstokens`
--
ALTER TABLE `accesstokens`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `apps`
--
ALTER TABLE `apps`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_fields`
--
ALTER TABLE `app_fields`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `client_trusted_domains`
--
ALTER TABLE `client_trusted_domains`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `permissions_apps`
--
ALTER TABLE `permissions_apps`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions_roles`
--
ALTER TABLE `permissions_roles`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `permissions_users`
--
ALTER TABLE `permissions_users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `posts_tags`
--
ALTER TABLE `posts_tags`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `roles_users`
--
ALTER TABLE `roles_users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accesstokens`
--
ALTER TABLE `accesstokens`
ADD CONSTRAINT `accesstokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
ADD CONSTRAINT `accesstokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `app_fields`
--
ALTER TABLE `app_fields`
ADD CONSTRAINT `app_fields_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`);

--
-- Constraints for table `app_settings`
--
ALTER TABLE `app_settings`
ADD CONSTRAINT `app_settings_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`);

--
-- Constraints for table `client_trusted_domains`
--
ALTER TABLE `client_trusted_domains`
ADD CONSTRAINT `client_trusted_domains_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `posts_tags`
--
ALTER TABLE `posts_tags`
ADD CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
ADD CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
ADD CONSTRAINT `refreshtokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
ADD CONSTRAINT `refreshtokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
