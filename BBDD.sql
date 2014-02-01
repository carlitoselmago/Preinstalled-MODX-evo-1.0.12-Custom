-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-01-2014 a las 10:52:02
-- Versión del servidor: 5.6.12-log
-- Versión de PHP: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `modx`
--
CREATE DATABASE IF NOT EXISTS `modx` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `modx`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_active_users`
--

CREATE TABLE IF NOT EXISTS `modx_active_users` (
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `id` int(10) DEFAULT NULL,
  `action` varchar(10) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about active users.';

--
-- Volcado de datos para la tabla `modx_active_users`
--

INSERT INTO `modx_active_users` (`internalKey`, `username`, `lasthit`, `id`, `action`, `ip`) VALUES
(1, 'admin', 1390560692, NULL, '8', '::1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_categories`
--

CREATE TABLE IF NOT EXISTS `modx_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc' AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `modx_categories`
--

INSERT INTO `modx_categories` (`id`, `category`) VALUES
(1, 'Js'),
(2, 'Manager and Admin'),
(3, 'Search'),
(4, 'Navigation'),
(5, 'Content'),
(6, 'Forms'),
(7, 'Login'),
(8, 'media'),
(9, 'SEO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_documentgroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_documentgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_document_groups`
--

CREATE TABLE IF NOT EXISTS `modx_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `document` (`document`),
  KEY `document_group` (`document_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_event_log`
--

CREATE TABLE IF NOT EXISTS `modx_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs' AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `modx_event_log`
--

INSERT INTO `modx_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(1, 0, 1389612796, 2, 1, 0, 'Plugin - ManagerManager - Create Template Variable', '<h3 style="color:red">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border="0" cellpadding="1" cellspacing="0">\n	                <tr><td colspan="2">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan="2"><b style="color:red;">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan="2"><b>PHP error debug</b></td></tr><tr><td colspan="2"><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;"><!-- Begin ManagerManager output --><script src="http://localhost/web//assets/js/jquery.min.js" type="text/javascript"></script>\n		\n			<script type="text/javascript">\n			var $j = jQuery.noConflict();\n			$j("select[name=type] option").each( function() {\n												var $this = $j(this);\n												if( !($this.text().match("deprecated")==null )) {\n													$this.remove();	\n												}\n														  });\n			</script>	\n		<!-- End ManagerManager output --></div></td></tr><tr><td valign="top">ErrorType[num] : </td><td>NOTICE[8]</td></tr><tr><td>File : </td><td>C:\\wamp\\www\\web\\assets\\plugins\\managermanager\\mm.inc.php</td></tr><tr><td>Line : </td><td>78</td></tr><tr><td>Source : </td><td>Plugin</td></tr><tr><td colspan="2"><b>Basic info</b></td></tr><tr><td valign="top" style="white-space:nowrap;">REQUEST_URI : </td><td>/web/manager/index.php</td></tr><tr><td valign="top">Manager action : </td><td>300 - Create Template Variable</td></tr><tr><td>Current Plugin : </td><td>ManagerManager(OnTVFormRender)</td></tr><tr><td>Referer : </td><td>http://localhost/web/manager/index.php?a=300</td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36</td></tr><tr><td>IP : </td><td>::1</td></tr><tr><td colspan="2"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0136 s (9 Requests)</td></tr><tr><td>PHP : </td><td>0.0515 s</td></tr><tr><td>Total : </td><td>0.0651 s</td></tr><tr><td>Memory : </td><td>3.1060943603516 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign="top">1</td><td>include_once()<br />manager/index.php on line 898</td><tr><td valign="top">2</td><td>include()<br />manager/processors/save_tmplvars.processor.php on line 78</td><tr><td valign="top">3</td><td>DocumentParser->invokeEvent()<br />manager/actions/mutate_tmplvars.dynamic.php on line 520</td><tr><td valign="top">4</td><td>DocumentParser->evalPlugin()<br />manager/includes/document.parser.class.inc.php on line 3334</td></table>\n'),
(2, 0, 1389631678, 3, 1, 0, 'Important System Files have been modified.', 'You have enabled the setting to check important system files to detect possible website script attacks. This doesn''t necessarily mean that your site has been compromised, however, you should review the changed files.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php)'),
(3, 0, 1389631679, 3, 1, 0, 'phpmailer', 'Could not instantiate mail function.'),
(4, 0, 1389636038, 3, 0, 0, 'Plugin - PHx', '<h3 style="color:red">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border="0" cellpadding="1" cellspacing="0">\n	                <tr><td colspan="2">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan="2"><b style="color:red;">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan="2"><b>PHP error debug</b></td></tr><tr><td colspan="2"><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;">Error : include_once(C:/wamp/www/web/assets/plugins/phx/phx.parser.class.inc.php): failed to open stream: No such file or directory</div></td></tr><tr><td valign="top">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>C:\\wamp\\www\\bonesquiz\\manager\\includes\\document.parser.class.inc.php(969) : eval()''d code</td></tr><tr><td>Line : </td><td>15</td></tr><tr><td colspan="2"><b>Basic info</b></td></tr><tr><td valign="top" style="white-space:nowrap;">REQUEST_URI : </td><td>/bonesquiz/</td></tr><tr><td valign="top">Resource : </td><td>[1]<a href="http://localhost/bonesquiz/home" target="_blank">Home</a></td></tr><tr><td>Current Plugin : </td><td>PHx(OnParseDocument)</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36</td></tr><tr><td>IP : </td><td>::1</td></tr><tr><td colspan="2"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0127 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0163 s</td></tr><tr><td>Total : </td><td>0.0291 s</td></tr><tr><td>Memory : </td><td>1.4894409179688 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign="top">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign="top">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign="top">3</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 1658</td><tr><td valign="top">4</td><td>DocumentParser->invokeEvent()<br />manager/includes/document.parser.class.inc.php on line 1434</td><tr><td valign="top">5</td><td>DocumentParser->evalPlugin()<br />manager/includes/document.parser.class.inc.php on line 3334</td><tr><td valign="top">6</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 969</td><tr><td valign="top">7</td><td>include_once()<br />manager/includes/document.parser.class.inc.php(969) : eval()''d code on line 15</td></table>\n'),
(5, 0, 1389636039, 3, 0, 0, 'phpmailer', 'Could not instantiate mail function.'),
(6, 0, 1389636061, 3, 0, 0, 'Plugin - PHx', '<h3 style="color:red">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border="0" cellpadding="1" cellspacing="0">\n	                <tr><td colspan="2">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan="2"><b style="color:red;">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan="2"><b>PHP error debug</b></td></tr><tr><td colspan="2"><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;">Error : include_once(C:/wamp/www/web/assets/plugins/phx/phx.parser.class.inc.php): failed to open stream: No such file or directory</div></td></tr><tr><td valign="top">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>C:\\wamp\\www\\bonesquiz\\manager\\includes\\document.parser.class.inc.php(969) : eval()''d code</td></tr><tr><td>Line : </td><td>15</td></tr><tr><td colspan="2"><b>Basic info</b></td></tr><tr><td valign="top" style="white-space:nowrap;">REQUEST_URI : </td><td>/bonesquiz/</td></tr><tr><td valign="top">Resource : </td><td>[1]<a href="http://localhost/bonesquiz/home" target="_blank">Home</a></td></tr><tr><td>Current Plugin : </td><td>PHx(OnParseDocument)</td></tr><tr><td>Referer : </td><td>http://localhost/bonesquiz/manager/index.php?a=1&amp;amp;f=menu</td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36</td></tr><tr><td>IP : </td><td>::1</td></tr><tr><td colspan="2"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0157 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0149 s</td></tr><tr><td>Total : </td><td>0.0306 s</td></tr><tr><td>Memory : </td><td>1.4886932373047 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign="top">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign="top">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign="top">3</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 1658</td><tr><td valign="top">4</td><td>DocumentParser->invokeEvent()<br />manager/includes/document.parser.class.inc.php on line 1434</td><tr><td valign="top">5</td><td>DocumentParser->evalPlugin()<br />manager/includes/document.parser.class.inc.php on line 3334</td><tr><td valign="top">6</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 969</td><tr><td valign="top">7</td><td>include_once()<br />manager/includes/document.parser.class.inc.php(969) : eval()''d code on line 15</td></table>\n'),
(7, 0, 1389636062, 3, 0, 0, 'phpmailer', 'Could not instantiate mail function.'),
(8, 0, 1390560543, 3, 0, 0, 'Plugin - PHx', '<h3 style="color:red">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border="0" cellpadding="1" cellspacing="0">\n	                <tr><td colspan="2">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan="2"><b style="color:red;">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan="2"><b>PHP error debug</b></td></tr><tr><td colspan="2"><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;">Error : include_once(C:/wamp/www/web/assets/plugins/phx/phx.parser.class.inc.php): failed to open stream: No such file or directory</div></td></tr><tr><td valign="top">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>C:\\wamp\\www\\vozfiles2\\manager\\includes\\document.parser.class.inc.php(969) : eval()''d code</td></tr><tr><td>Line : </td><td>15</td></tr><tr><td colspan="2"><b>Basic info</b></td></tr><tr><td valign="top" style="white-space:nowrap;">REQUEST_URI : </td><td>/vozfiles2/</td></tr><tr><td valign="top">Resource : </td><td>[1]<a href="http://localhost/vozfiles2/home" target="_blank">Home</a></td></tr><tr><td>Current Plugin : </td><td>PHx(OnParseDocument)</td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1700.76 Safari/537.36</td></tr><tr><td>IP : </td><td>::1</td></tr><tr><td colspan="2"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0048 s (5 Requests)</td></tr><tr><td>PHP : </td><td>0.0738 s</td></tr><tr><td>Total : </td><td>0.0786 s</td></tr><tr><td>Memory : </td><td>1.4897308349609 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table><tr><td valign="top">1</td><td>DocumentParser->executeParser()<br />index.php on line 140</td><tr><td valign="top">2</td><td>DocumentParser->prepareResponse()<br />manager/includes/document.parser.class.inc.php on line 1568</td><tr><td valign="top">3</td><td>DocumentParser->parseDocumentSource()<br />manager/includes/document.parser.class.inc.php on line 1658</td><tr><td valign="top">4</td><td>DocumentParser->invokeEvent()<br />manager/includes/document.parser.class.inc.php on line 1434</td><tr><td valign="top">5</td><td>DocumentParser->evalPlugin()<br />manager/includes/document.parser.class.inc.php on line 3334</td><tr><td valign="top">6</td><td>eval()<br />manager/includes/document.parser.class.inc.php on line 969</td><tr><td valign="top">7</td><td>include_once()<br />manager/includes/document.parser.class.inc.php(969) : eval()''d code on line 15</td></table>\n'),
(9, 0, 1390560544, 3, 0, 0, 'phpmailer', 'Could not instantiate mail function.'),
(10, 0, 1390560560, 3, 1, 0, 'Important System Files have been modified.', 'You have enabled the setting to check important system files to detect possible website script attacks. This doesn''t necessarily mean that your site has been compromised, however, you should review the changed files.(index.php, .htaccess, manager/index.php, manager/includes/config.inc.php)'),
(11, 0, 1390560561, 3, 1, 0, 'phpmailer', 'Could not instantiate mail function.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_keyword_xref`
--

CREATE TABLE IF NOT EXISTS `modx_keyword_xref` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cross reference bewteen keywords and content';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_manager_log`
--

CREATE TABLE IF NOT EXISTS `modx_manager_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.' AUTO_INCREMENT=328 ;

--
-- Volcado de datos para la tabla `modx_manager_log`
--

INSERT INTO `modx_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`) VALUES
(1, 1389612195, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(2, 1389612196, 1, 'admin', 17, '-', '-', 'Editing settings'),
(3, 1389612203, 1, 'admin', 30, '-', '-', 'Saving settings'),
(4, 1389612403, 1, 'admin', 17, '-', '-', 'Editing settings'),
(5, 1389612530, 1, 'admin', 76, '-', '-', 'Element management'),
(6, 1389612533, 1, 'admin', 101, '-', 'New snippet', 'Create new plugin'),
(7, 1389612564, 1, 'admin', 103, '-', '-', 'Saving plugin'),
(8, 1389612564, 1, 'admin', 76, '-', '-', 'Element management'),
(9, 1389612576, 1, 'admin', 102, '9', 'New snippet', 'Edit plugin'),
(10, 1389612583, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(11, 1389612583, 1, 'admin', 76, '-', '-', 'Element management'),
(12, 1389612628, 1, 'admin', 102, '9', 'New snippet', 'Edit plugin'),
(13, 1389612639, 1, 'admin', 3, '1', 'MODX CMS Install Success', 'Viewing data for resource'),
(14, 1389612641, 1, 'admin', 76, '-', '-', 'Element management'),
(15, 1389612645, 1, 'admin', 3, '1', 'MODX CMS Install Success', 'Viewing data for resource'),
(16, 1389612647, 1, 'admin', 27, '1', '-', 'Editing resource'),
(17, 1389612659, 1, 'admin', 5, '1', '-', 'Saving resource'),
(18, 1389612660, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(19, 1389612664, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(20, 1389612666, 1, 'admin', 17, '-', '-', 'Editing settings'),
(21, 1389612706, 1, 'admin', 30, '-', '-', 'Saving settings'),
(22, 1389612711, 1, 'admin', 76, '-', '-', 'Element management'),
(23, 1389612713, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template'),
(24, 1389612726, 1, 'admin', 20, '3', '-', 'Saving template'),
(25, 1389612726, 1, 'admin', 76, '-', '-', 'Element management'),
(26, 1389612728, 1, 'admin', 19, '-', 'New template', 'Creating a new template'),
(27, 1389612736, 1, 'admin', 20, '-', '-', 'Saving template'),
(28, 1389612736, 1, 'admin', 76, '-', '-', 'Element management'),
(29, 1389612741, 1, 'admin', 17, '-', '-', 'Editing settings'),
(30, 1389612756, 1, 'admin', 30, '-', '-', 'Saving settings'),
(31, 1389612759, 1, 'admin', 76, '-', '-', 'Element management'),
(32, 1389612763, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(33, 1389612782, 1, 'admin', 302, '-', '-', 'Save Template Variable'),
(34, 1389612782, 1, 'admin', 76, '-', '-', 'Element management'),
(35, 1389612784, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(36, 1389612799, 1, 'admin', 76, '-', 'New Template Variable', 'Element management'),
(37, 1389612800, 1, 'admin', 301, '1', 'imagen', 'Edit Template Variable'),
(38, 1389612803, 1, 'admin', 76, '-', '-', 'Element management'),
(39, 1389612805, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(40, 1389612816, 1, 'admin', 302, '-', '-', 'Save Template Variable'),
(41, 1389612816, 1, 'admin', 76, '-', '-', 'Element management'),
(42, 1389612817, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(43, 1389612825, 1, 'admin', 302, '-', '-', 'Save Template Variable'),
(44, 1389612825, 1, 'admin', 76, '-', '-', 'Element management'),
(45, 1389612826, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(46, 1389612836, 1, 'admin', 302, '-', '-', 'Save Template Variable'),
(47, 1389612836, 1, 'admin', 76, '-', '-', 'Element management'),
(48, 1389612855, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(49, 1389612858, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(50, 1389612861, 1, 'admin', 76, '-', '-', 'Element management'),
(51, 1389612862, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(52, 1389612876, 1, 'admin', 302, '-', '-', 'Save Template Variable'),
(53, 1389612876, 1, 'admin', 76, '-', '-', 'Element management'),
(54, 1389612878, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(55, 1389612889, 1, 'admin', 302, '-', '-', 'Save Template Variable'),
(56, 1389612889, 1, 'admin', 76, '-', '-', 'Element management'),
(57, 1389612890, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(58, 1389612899, 1, 'admin', 302, '-', '-', 'Save Template Variable'),
(59, 1389612899, 1, 'admin', 76, '-', '-', 'Element management'),
(60, 1389612900, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(61, 1389612907, 1, 'admin', 302, '-', '-', 'Save Template Variable'),
(62, 1389612907, 1, 'admin', 76, '-', '-', 'Element management'),
(63, 1389612909, 1, 'admin', 301, '8', 'imagen8', 'Edit Template Variable'),
(64, 1389612912, 1, 'admin', 302, '8', '-', 'Save Template Variable'),
(65, 1389612912, 1, 'admin', 76, '-', '-', 'Element management'),
(66, 1389612915, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(67, 1389612922, 1, 'admin', 302, '-', '-', 'Save Template Variable'),
(68, 1389612922, 1, 'admin', 76, '-', '-', 'Element management'),
(69, 1389612924, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(70, 1389612931, 1, 'admin', 302, '-', '-', 'Save Template Variable'),
(71, 1389612931, 1, 'admin', 76, '-', '-', 'Element management'),
(72, 1389612933, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(73, 1389612940, 1, 'admin', 83, '-', '-', 'Exporting a resource to HTML'),
(74, 1389612940, 1, 'admin', 17, '-', '-', 'Editing settings'),
(75, 1389612984, 1, 'admin', 118, '-', '-', 'Call settings ajax include'),
(76, 1389613001, 1, 'admin', 30, '-', '-', 'Saving settings'),
(77, 1389613065, 1, 'admin', 76, '-', '-', 'Element management'),
(78, 1389613067, 1, 'admin', 23, '-', 'New snippet', 'Creating a new Snippet'),
(79, 1389613082, 1, 'admin', 24, '-', '-', 'Saving Snippet'),
(80, 1389613082, 1, 'admin', 76, '-', '-', 'Element management'),
(81, 1389613308, 1, 'admin', 101, '-', 'New snippet', 'Create new plugin'),
(82, 1389613361, 1, 'admin', 103, '-', '-', 'Saving plugin'),
(83, 1389613361, 1, 'admin', 76, '-', '-', 'Element management'),
(84, 1389613363, 1, 'admin', 100, '-', '-', 'Previewing resource'),
(85, 1389613366, 1, 'admin', 76, '-', '-', 'Element management'),
(86, 1389613372, 1, 'admin', 23, '-', 'New snippet', 'Creating a new Snippet'),
(87, 1389613397, 1, 'admin', 24, '-', '-', 'Saving Snippet'),
(88, 1389613397, 1, 'admin', 76, '-', '-', 'Element management'),
(89, 1389613400, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
(90, 1389613401, 1, 'admin', 107, '-', 'New Module', 'Create new module'),
(91, 1389613418, 1, 'admin', 109, '-', '-', 'Saving module'),
(92, 1389613418, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
(93, 1389613422, 1, 'admin', 112, '2', 'YAMS', 'Execute module'),
(94, 1389613454, 1, 'admin', 76, '-', '-', 'Element management'),
(95, 1389613457, 1, 'admin', 102, '4', 'New snippet', 'Edit plugin'),
(96, 1389613485, 1, 'admin', 76, '-', '-', 'Element management'),
(97, 1389613487, 1, 'admin', 78, '1', 'mm_rules', 'Editing Chunk (HTML Snippet)'),
(98, 1389613491, 1, 'admin', 76, '-', '-', 'Element management'),
(99, 1389613492, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(100, 1389613511, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(101, 1389613511, 1, 'admin', 76, '-', '-', 'Element management'),
(102, 1389613513, 1, 'admin', 78, '2', 'mm_rules_YAMS', 'Editing Chunk (HTML Snippet)'),
(103, 1389613516, 1, 'admin', 79, '2', '-', 'Saving Chunk (HTML Snippet)'),
(104, 1389613516, 1, 'admin', 76, '-', '-', 'Element management'),
(105, 1389613517, 1, 'admin', 76, '-', '-', 'Element management'),
(106, 1389613528, 1, 'admin', 76, '-', '-', 'Element management'),
(107, 1389614296, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(108, 1389614303, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(109, 1389614304, 1, 'admin', 76, '-', '-', 'Element management'),
(110, 1389614396, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(111, 1389614643, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(112, 1389614643, 1, 'admin', 76, '-', '-', 'Element management'),
(113, 1389614644, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(114, 1389614664, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(115, 1389614664, 1, 'admin', 76, '-', '-', 'Element management'),
(116, 1389614670, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(117, 1389614697, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(118, 1389614697, 1, 'admin', 76, '-', '-', 'Element management'),
(119, 1389614706, 1, 'admin', 16, '4', 'GENERICO', 'Editing template'),
(120, 1389614736, 1, 'admin', 20, '4', '-', 'Saving template'),
(121, 1389614736, 1, 'admin', 76, '-', '-', 'Element management'),
(122, 1389614741, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(123, 1389614743, 1, 'admin', 27, '1', '-', 'Editing resource'),
(124, 1389614748, 1, 'admin', 5, '1', '-', 'Saving resource'),
(125, 1389614749, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(126, 1389614819, 1, 'admin', 76, '-', '-', 'Element management'),
(127, 1389614822, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(128, 1389614839, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(129, 1389614839, 1, 'admin', 76, '-', '-', 'Element management'),
(130, 1389614841, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(131, 1389614849, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(132, 1389614849, 1, 'admin', 76, '-', '-', 'Element management'),
(133, 1389614856, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(134, 1389614864, 1, 'admin', 76, '-', '-', 'Element management'),
(135, 1389614866, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(136, 1389614869, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(137, 1389614869, 1, 'admin', 76, '-', '-', 'Element management'),
(138, 1389614872, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(139, 1389614881, 1, 'admin', 76, '-', '-', 'Element management'),
(140, 1389614884, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(141, 1389614888, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(142, 1389614888, 1, 'admin', 76, '-', '-', 'Element management'),
(143, 1389614890, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(144, 1389614899, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(145, 1389614899, 1, 'admin', 76, '-', '-', 'Element management'),
(146, 1389614970, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(147, 1389615178, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(148, 1389615178, 1, 'admin', 76, '-', '-', 'Element management'),
(149, 1389615180, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(150, 1389615186, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(151, 1389615186, 1, 'admin', 76, '-', '-', 'Element management'),
(152, 1389615715, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(153, 1389615980, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(154, 1389615980, 1, 'admin', 76, '-', '-', 'Element management'),
(155, 1389615990, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(156, 1389615992, 1, 'admin', 27, '1', '-', 'Editing resource'),
(157, 1389615994, 1, 'admin', 27, '1', '-', 'Editing resource'),
(158, 1389615995, 1, 'admin', 5, '1', '-', 'Saving resource'),
(159, 1389615996, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(160, 1389615999, 1, 'admin', 17, '-', '-', 'Editing settings'),
(161, 1389616010, 1, 'admin', 30, '-', '-', 'Saving settings'),
(162, 1389616022, 1, 'admin', 76, '-', '-', 'Element management'),
(163, 1389616034, 1, 'admin', 27, '1', '-', 'Editing resource'),
(164, 1389616039, 1, 'admin', 5, '1', '-', 'Saving resource'),
(165, 1389616041, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(166, 1389616062, 1, 'admin', 27, '1', '-', 'Editing resource'),
(167, 1389616068, 1, 'admin', 5, '1', '-', 'Saving resource'),
(168, 1389616070, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(169, 1389616075, 1, 'admin', 76, '-', '-', 'Element management'),
(170, 1389616078, 1, 'admin', 78, '9', 'img_EMBED', 'Editing Chunk (HTML Snippet)'),
(171, 1389616081, 1, 'admin', 79, '9', '-', 'Saving Chunk (HTML Snippet)'),
(172, 1389616081, 1, 'admin', 76, '-', '-', 'Element management'),
(173, 1389616085, 1, 'admin', 27, '1', '-', 'Editing resource'),
(174, 1389616089, 1, 'admin', 5, '1', '-', 'Saving resource'),
(175, 1389616091, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(176, 1389616101, 1, 'admin', 76, '-', '-', 'Element management'),
(177, 1389616106, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(178, 1389616126, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(179, 1389616126, 1, 'admin', 76, '-', '-', 'Element management'),
(180, 1389616139, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(181, 1389616156, 1, 'admin', 76, '-', '-', 'Element management'),
(182, 1389616257, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(183, 1389616260, 1, 'admin', 76, '-', '-', 'Element management'),
(184, 1389616262, 1, 'admin', 16, '4', 'GENERICO', 'Editing template'),
(185, 1389616274, 1, 'admin', 20, '4', '-', 'Saving template'),
(186, 1389616274, 1, 'admin', 76, '-', '-', 'Element management'),
(187, 1389616275, 1, 'admin', 27, '1', '-', 'Editing resource'),
(188, 1389616291, 1, 'admin', 5, '1', '-', 'Saving resource'),
(189, 1389616293, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(190, 1389616421, 1, 'admin', 76, '-', '-', 'Element management'),
(191, 1389616423, 1, 'admin', 16, '4', 'GENERICO', 'Editing template'),
(192, 1389616427, 1, 'admin', 20, '4', '-', 'Saving template'),
(193, 1389616427, 1, 'admin', 76, '-', '-', 'Element management'),
(194, 1389616490, 1, 'admin', 101, '-', 'New snippet', 'Create new plugin'),
(195, 1389616537, 1, 'admin', 103, '-', '-', 'Saving plugin'),
(196, 1389616537, 1, 'admin', 76, '-', '-', 'Element management'),
(197, 1389616538, 1, 'admin', 100, '-', '-', 'Previewing resource'),
(198, 1389616551, 1, 'admin', 100, '-', '-', 'Previewing resource'),
(199, 1389616563, 1, 'admin', 76, '-', '-', 'Element management'),
(200, 1389616566, 1, 'admin', 102, '10', 'New snippet', 'Edit plugin'),
(201, 1389616568, 1, 'admin', 103, '10', '-', 'Saving plugin'),
(202, 1389616568, 1, 'admin', 76, '-', '-', 'Element management'),
(203, 1389616588, 1, 'admin', 27, '1', '-', 'Editing resource'),
(204, 1389616590, 1, 'admin', 26, '-', '-', 'Refreshing site'),
(205, 1389616599, 1, 'admin', 27, '1', '-', 'Editing resource'),
(206, 1389616606, 1, 'admin', 5, '1', '-', 'Saving resource'),
(207, 1389616608, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(208, 1389616624, 1, 'admin', 76, '-', '-', 'Element management'),
(209, 1389616637, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(210, 1389616661, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(211, 1389616661, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(212, 1389616844, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(213, 1389616844, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(214, 1389616857, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(215, 1389616857, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(216, 1389616859, 1, 'admin', 27, '1', '-', 'Editing resource'),
(217, 1389616871, 1, 'admin', 5, '1', '-', 'Saving resource'),
(218, 1389616873, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(219, 1389616884, 1, 'admin', 27, '1', '-', 'Editing resource'),
(220, 1389616893, 1, 'admin', 5, '1', '-', 'Saving resource'),
(221, 1389616894, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(222, 1389627983, 1, 'admin', 76, '-', '-', 'Element management'),
(223, 1389628005, 1, 'admin', 102, '8', 'TransAlias', 'Edit plugin'),
(224, 1389628036, 1, 'admin', 103, '8', '-', 'Saving plugin'),
(225, 1389628036, 1, 'admin', 76, '-', '-', 'Element management'),
(226, 1389628169, 1, 'admin', 23, '-', 'New snippet', 'Creating a new Snippet'),
(227, 1389628198, 1, 'admin', 24, '-', '-', 'Saving Snippet'),
(228, 1389628198, 1, 'admin', 76, '-', '-', 'Element management'),
(229, 1389628232, 1, 'admin', 23, '-', 'New snippet', 'Creating a new Snippet'),
(230, 1389628242, 1, 'admin', 24, '-', '-', 'Saving Snippet'),
(231, 1389628242, 1, 'admin', 76, '-', '-', 'Element management'),
(232, 1389628306, 1, 'admin', 23, '-', 'New snippet', 'Creating a new Snippet'),
(233, 1389628317, 1, 'admin', 24, '-', '-', 'Saving Snippet'),
(234, 1389628317, 1, 'admin', 76, '-', '-', 'Element management'),
(235, 1389628327, 1, 'admin', 76, '-', '-', 'Element management'),
(236, 1389628433, 1, 'admin', 76, '-', '-', 'Element management'),
(237, 1389628435, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(238, 1389630471, 1, 'admin', 76, '-', '-', 'Element management'),
(239, 1389630472, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(240, 1389630576, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(241, 1389630576, 1, 'admin', 76, '-', '-', 'Element management'),
(242, 1389630580, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(243, 1389630602, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(244, 1389630602, 1, 'admin', 76, '-', '-', 'Element management'),
(245, 1389631214, 1, 'admin', 78, '10', 'firma', 'Editing Chunk (HTML Snippet)'),
(246, 1389631222, 1, 'admin', 79, '10', '-', 'Saving Chunk (HTML Snippet)'),
(247, 1389631222, 1, 'admin', 76, '-', '-', 'Element management'),
(248, 1389631232, 1, 'admin', 78, '10', 'firma', 'Editing Chunk (HTML Snippet)'),
(249, 1389631240, 1, 'admin', 79, '10', '-', 'Saving Chunk (HTML Snippet)'),
(250, 1389631240, 1, 'admin', 76, '-', '-', 'Element management'),
(251, 1389631242, 1, 'admin', 78, '10', 'firma', 'Editing Chunk (HTML Snippet)'),
(252, 1389631244, 1, 'admin', 76, '-', '-', 'Element management'),
(253, 1389631246, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(254, 1389631250, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(255, 1389631250, 1, 'admin', 76, '-', '-', 'Element management'),
(256, 1389631258, 1, 'admin', 78, '10', 'firma', 'Editing Chunk (HTML Snippet)'),
(257, 1389631296, 1, 'admin', 79, '10', '-', 'Saving Chunk (HTML Snippet)'),
(258, 1389631296, 1, 'admin', 76, '-', '-', 'Element management'),
(259, 1389631314, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(260, 1389631327, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(261, 1389631327, 1, 'admin', 76, '-', '-', 'Element management'),
(262, 1389631449, 1, 'admin', 17, '-', '-', 'Editing settings'),
(263, 1389631482, 1, 'admin', 30, '-', '-', 'Saving settings'),
(264, 1389631713, 1, 'admin', 83, '-', '-', 'Exporting a resource to HTML'),
(265, 1389631714, 1, 'admin', 17, '-', '-', 'Editing settings'),
(266, 1389631730, 1, 'admin', 30, '-', '-', 'Saving settings'),
(267, 1389631732, 1, 'admin', 27, '1', '-', 'Editing resource'),
(268, 1389632009, 1, 'admin', 4, '-', '-', 'Creating a resource'),
(269, 1389632011, 1, 'admin', 5, '-', '-', 'Saving resource'),
(270, 1389632012, 1, 'admin', 3, '2', 'test', 'Viewing data for resource'),
(271, 1389632022, 1, 'admin', 27, '2', '-', 'Editing resource'),
(272, 1389632075, 1, 'admin', 17, '-', '-', 'Editing settings'),
(273, 1389632087, 1, 'admin', 30, '-', '-', 'Saving settings'),
(274, 1389632090, 1, 'admin', 26, '-', '-', 'Refreshing site'),
(275, 1389632136, 1, 'admin', 17, '-', '-', 'Editing settings'),
(276, 1389632146, 1, 'admin', 112, '2', 'YAMS', 'Execute module'),
(277, 1389632151, 1, 'admin', 76, '-', '-', 'Element management'),
(278, 1389632154, 1, 'admin', 102, '10', 'New snippet', 'Edit plugin'),
(279, 1389632162, 1, 'admin', 76, '-', '-', 'Element management'),
(280, 1389632165, 1, 'admin', 102, '10', 'New snippet', 'Edit plugin'),
(281, 1389632168, 1, 'admin', 103, '10', '-', 'Saving plugin'),
(282, 1389632168, 1, 'admin', 76, '-', '-', 'Element management'),
(283, 1389632185, 1, 'admin', 76, '-', '-', 'Element management'),
(284, 1389632189, 1, 'admin', 16, '3', 'minimal', 'Editing template'),
(285, 1389632191, 1, 'admin', 76, '-', '-', 'Element management'),
(286, 1389632194, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(287, 1389632311, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(288, 1389632311, 1, 'admin', 76, '-', '-', 'Element management'),
(289, 1389632340, 1, 'admin', 16, '4', 'GENERICO', 'Editing template'),
(290, 1389632345, 1, 'admin', 20, '4', '-', 'Saving template'),
(291, 1389632345, 1, 'admin', 76, '-', '-', 'Element management'),
(292, 1389632467, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(293, 1389632506, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(294, 1389632507, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(295, 1389632591, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(296, 1389632591, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(297, 1389632654, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(298, 1389632654, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(299, 1389632683, 1, 'admin', 79, '3', '-', 'Saving Chunk (HTML Snippet)'),
(300, 1389632683, 1, 'admin', 78, '3', 'head', 'Editing Chunk (HTML Snippet)'),
(301, 1389632687, 1, 'admin', 6, '2', '-', 'Deleting resource'),
(302, 1389632688, 1, 'admin', 3, '2', 'test', 'Viewing data for resource'),
(303, 1389632690, 1, 'admin', 64, '-', '-', 'Removing deleted content'),
(304, 1389636048, 1, 'admin', 17, '-', '-', 'Editing settings'),
(305, 1389636058, 1, 'admin', 30, '-', '-', 'Saving settings'),
(306, 1389636065, 1, 'admin', 17, '-', '-', 'Editing settings'),
(307, 1389636075, 1, 'admin', 30, '-', '-', 'Saving settings'),
(308, 1389636079, 1, 'admin', 27, '1', '-', 'Editing resource'),
(309, 1389636082, 1, 'admin', 5, '1', '-', 'Saving resource'),
(310, 1389636083, 1, 'admin', 3, '1', 'Home', 'Viewing data for resource'),
(311, 1389639400, 1, 'admin', 76, '-', '-', 'Element management'),
(312, 1389639408, 1, 'admin', 23, '-', 'New snippet', 'Creating a new Snippet'),
(313, 1389639594, 1, 'admin', 24, '-', '-', 'Saving Snippet'),
(314, 1389639594, 1, 'admin', 76, '-', '-', 'Element management'),
(315, 1389639625, 1, 'admin', 76, '-', '-', 'Element management'),
(316, 1389639639, 1, 'admin', 27, '1', '-', 'Editing resource'),
(317, 1390560559, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(318, 1390560563, 1, 'admin', 17, '-', '-', 'Editing settings'),
(319, 1390560569, 1, 'admin', 76, '-', '-', 'Element management'),
(320, 1390560574, 1, 'admin', 17, '-', '-', 'Editing settings'),
(321, 1390560588, 1, 'admin', 30, '-', '-', 'Saving settings'),
(322, 1390560593, 1, 'admin', 76, '-', '-', 'Element management'),
(323, 1390560596, 1, 'admin', 23, '-', 'New snippet', 'Creating a new Snippet'),
(324, 1390560646, 1, 'admin', 24, '-', '-', 'Saving Snippet'),
(325, 1390560646, 1, 'admin', 76, '-', '-', 'Element management'),
(326, 1390560690, 1, 'admin', 26, '-', '-', 'Refreshing site'),
(327, 1390560692, 1, 'admin', 8, '-', '-', 'Logged out');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_manager_users`
--

CREATE TABLE IF NOT EXISTS `modx_manager_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `modx_manager_users`
--

INSERT INTO `modx_manager_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'uncrypt>4ad231bc51776f6a8acded64de13ce7e816b09aa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_membergroup_access`
--

CREATE TABLE IF NOT EXISTS `modx_membergroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_membergroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_membergroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_member_groups`
--

CREATE TABLE IF NOT EXISTS `modx_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_content`
--

CREATE TABLE IF NOT EXISTS `modx_site_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `haskeywords` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to keywords',
  `hasmetatags` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to meta tags',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `modx_site_content`
--

INSERT INTO `modx_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `haskeywords`, `hasmetatags`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Home', '', '', 'home', '', 1, 0, 0, 0, 0, '', '', 1, 4, 0, 1, 0, 1, 1130304721, 1, 1389636082, 0, 0, 0, 1130304721, 1, 'Base Install', 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_content_metatags`
--

CREATE TABLE IF NOT EXISTS `modx_site_content_metatags` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `metatag_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `metatag_id` (`metatag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reference table between meta tags and content';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_htmlsnippets`
--

CREATE TABLE IF NOT EXISTS `modx_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.' AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `modx_site_htmlsnippets`
--

INSERT INTO `modx_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`) VALUES
(1, 'mm_rules', 'Default ManagerManager rules.', 0, 1, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\n\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\nif($modx->db->getValue("SELECT COUNT(id) FROM " . $modx->getFullTableName(''site_tmplvars'') . " WHERE name=''documentTags''")) {\n    mm_widget_tags(''documentTags'','' ''); // Give blog tag editing capabilities to the ''documentTags (3)'' TV\n}\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\n', 0),
(2, 'mm_rules_YAMS', '', 0, 1, 0, 'require( $modx->config[''base_path''] . ''assets/modules/yams/yams.mm_rules.inc.php'' );', 0),
(3, 'head', '', 0, 5, 0, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n\r\n<head>\r\n<!--\r\n{{firma}}\r\n-->\r\n		\r\n	\r\n<meta name="viewport" content="width=device-width, initial-scale=1"/>\r\n<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />\r\n<base href="[(site_url)]" />\r\n<title>[(site_name)] - [*pagetitle*]</title>\r\n<meta name="description" content="{{description_SEO}}" />\r\n<meta name="keywords" content="{{keywords_SEO}}" />\r\n<meta http-equiv="content-language" content="es" />\r\n<link rel="start" href="[(base_url)][~[*id*]~]" title="META Tags Tips - [*pagetitle*]" />\r\n<link rel="image_src" href="[!if? &is=`[*imagen1*]:empty` &then=`[[if? &is=`[*imagen*]:empty` &then=`{{img_EMBED}}` &else=`[[MiniPhoto? &file=`[*imagen*]` &width=`625` &height=`352` ]]`]]` &else=`[[MiniPhoto? &file=`[*imagen1*]` &width=`625` &height=`352` ]]` !]" />\r\n\r\n<!--FACEBOOK METATAGS-->\r\n<meta property="og:title" content="[*pagetitle*]" />\r\n<meta property="og:site_name" content="[(site_name)]" />\r\n<meta property="og:description" content="[*phx:input=`[*content*]`:notags:limit=`110`*]" />\r\n<meta property="og:image" content="[!if? &is=`[*imagen1*]:empty` &then=`[[if? &is=`[*imagen*]:empty` &then=`{{img_EMBED}}` &else=`[[MiniPhoto? &file=`[*imagen*]` &width=`625` &height=`352` ]]`]]` &else=`[[MiniPhoto? &file=`[*imagen1*]` &width=`625` &height=`352` ]]` !]" />\r\n<meta property="og:image:width" content="625" />\r\n<meta property="og:image:height" content="352" />\r\n[[if? &is=`[*imagen2*]:!empty` &then=`\r\n<meta property="og:image" content="[[MiniPhoto? &file=`[*imagen2*]` &width=`625` &height=`352` ]]" />\r\n<meta property="og:image:width" content="625" />\r\n<meta property="og:image:height" content="352" />\r\n`]]\r\n[[if? &is=`[*imagen3*]:!empty` &then=`\r\n<meta property="og:image" content="[[MiniPhoto? &file=`[*imagen3*]` &width=`625` &height=`352` ]]" />\r\n<meta property="og:image:width" content="625" />\r\n<meta property="og:image:height" content="352" />\r\n`]]\r\n[[if? &is=`[*imagen4*]:!empty` &then=`\r\n<meta property="og:image" content="[[MiniPhoto? &file=`[*imagen4*]` &width=`625` &height=`352` ]]" />\r\n<meta property="og:image:width" content="625" />\r\n<meta property="og:image:height" content="352" />\r\n`]]\r\n[[if? &is=`[*imagen5*]:!empty` &then=`\r\n<meta property="og:image" content="[[MiniPhoto? &file=`[*imagen5*]` &width=`625` &height=`352` ]]" />\r\n<meta property="og:image:width" content="625" />\r\n<meta property="og:image:height" content="352" />\r\n`]]\r\n\r\n<!--END FACEBOOK METATAGS-->\r\n	\r\n<!--FAVICON-->\r\n<!--FILL WITH http://realfavicongenerator.net/-->\r\n<!--END FAVICON-->\r\n\r\n<!--CSS-->\r\n<link href="css/estilos.css" rel="stylesheet" type="text/css" />\r\n\r\n<!--JS-->\r\n<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>\r\n<script type="text/javascript" src="js/general.js"></script>\r\n	\r\n	\r\n{{googleAnalytics}}', 0),
(4, 'footer', '', 0, 5, 0, '<div id="footer">\r\n\r\n</div><!--FIN FOOTER-->\r\n\r\n\r\n\r\n</body>\r\n</html>', 0),
(5, 'cabecera', '', 0, 5, 0, '<div id="header">\r\n</div><!--FIN HEADER-->', 0),
(6, 'googleAnalytics', '', 0, 9, 0, '', 0),
(7, 'description_SEO', '', 0, 9, 0, '', 0),
(8, 'keywords_SEO', '', 0, 9, 0, '', 0),
(9, 'img_EMBED', '', 0, 9, 0, 'assets/images/logo.png', 0),
(10, 'firma', '', 0, 2, 0, '▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬\r\n\r\n    ▌  CODED BY AWESOMENESSS   ▌\r\n\r\n  http://developer.awesomenesss.eu\r\n\r\n▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_keywords`
--

CREATE TABLE IF NOT EXISTS `modx_site_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site keyword list' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_metatags`
--

CREATE TABLE IF NOT EXISTS `modx_site_metatags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT 'tag name',
  `tagvalue` varchar(255) NOT NULL DEFAULT '',
  `http_equiv` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - use http_equiv tag style, 0 - use name',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site meta tags' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_modules`
--

CREATE TABLE IF NOT EXISTS `modx_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Modules' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `modx_site_modules`
--

INSERT INTO `modx_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 2, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '', 'include_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/docmanager.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_frontend.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_backend.class.php'');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[''theme''] = $dm->getTheme();\n$dm->ph[''ajax.endpoint''] = MODX_SITE_URL.''assets/modules/docmanager/tv.ajax.php'';\n$dm->ph[''datepicker.offset''] = $modx->config[''datepicker_offset''];\n$dm->ph[''datetime.format''] = $modx->config[''datetime_format''];\n\nif (isset($_POST[''tabAction''])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(''main.tpl'', $dm->ph);\n}'),
(2, 'YAMS', 'Yet Another Multilingual Solution', 0, 0, 0, 0, 0, '', 0, '', 0, 0, '151094d1f944ddcfd865e33ed83b6e2c', 0, '', 'require_once( $modx->config[''base_path''] . ''assets/modules/yams/yams.module.inc.php'' );');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_module_access`
--

CREATE TABLE IF NOT EXISTS `modx_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_module_depobj`
--

CREATE TABLE IF NOT EXISTS `modx_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_plugins`
--

CREATE TABLE IF NOT EXISTS `modx_site_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.' AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `modx_site_plugins`
--

INSERT INTO `modx_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`) VALUES
(1, 'CodeMirror', '<strong>1.2b</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirrir 3.13', 0, 2, 0, '$_CM_BASE = ''assets/plugins/codemirror/'';\r\n\r\n$_CM_URL = $modx->config[''site_url''] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .''codemirror.plugin.php'');\r\n\r\n', 0, '&theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light; &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;false &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;true', 0, ''),
(2, 'FileSource', '<strong>0.1</strong> Save snippet and plugins to file', 0, 2, 0, 'require MODX_BASE_PATH.''assets/plugins/filesource/plugin.filesource.php'';', 0, '', 0, ''),
(3, 'Forgot Manager Login', '<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation', 0, 2, 0, 'require MODX_BASE_PATH.''assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php'';', 0, '', 0, ''),
(4, 'ManagerManager', '<strong>0.3.11</strong> Customize the MODx Manager to offer bespoke admin functions for end users.', 0, 2, 0, '$js_default_url_local = $modx->config[''site_url'']. ''/assets/js/jquery.min.js'';\n$js_default_url_remote = ''http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js'';\n$asset_path = $modx->config[''base_path''] . ''assets/plugins/managermanager/mm.inc.php'';\ninclude($asset_path);\n', 0, '&config_chunk=Configuration Chunk;text;mm_rules; &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &which_jquery=jQuery source;list;local (assets/js),remote (google code),manual url (specify below);local (assets/js) &js_src_type=jQuery URL override;text;', 0, ''),
(5, 'Quick Manager+', '<strong>1.5.6</strong> Enables QuickManager+ front end content editing support', 0, 2, 0, '// In manager\nif (isset($_SESSION[''mgrValidated''])) {\n\n    $show = TRUE;\n\n    if ($disabled  != '''') {\n        $arr = explode(",", $disabled );\n        if (in_array($modx->documentIdentifier, $arr)) {\n            $show = FALSE;\n        }\n    }\n\n    if ($show) {\n        // Replace [*#tv*] with QM+ edit TV button placeholders\n        if ($tvbuttons == ''true'') {\n            $e = $modx->Event;\n            if ($e->name == ''OnParseDocument'') {\n                 $output = &$modx->documentOutput;\n                 $output = preg_replace(''~\\[\\*#(.*?)\\*\\]~'', ''<!-- ''.$tvbclass.'' $1 -->[*$1*]'', $output);\n                 $modx->documentOutput = $output;\n             }\n         }\n        // In manager\n        if (isset($_SESSION[''mgrValidated''])) {\n            include_once($modx->config[''base_path''].''assets/plugins/qm/qm.inc.php'');\n            $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass);\n        }\n    }\n}', 0, '&jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &1=undefined;; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv', 1, ''),
(6, 'Search Highlight', '<strong>1.5</strong> Used with AjaxSearch to show search terms highlighted on page linked from search results', 0, 3, 0, '/*\n  ------------------------------------------------------------------------\n  Plugin: Search_Highlight v1.5\n  ------------------------------------------------------------------------\n  Changes:\n  18/03/10 - Remove possibility of XSS attempts being passed in the URL\n           - look-behind assertion improved\n  29/03/09 - Removed urldecode calls;\n           - Added check for magic quotes - if set, remove slashes\n           - Highlights terms searched for when target is a HTML entity\n  18/07/08 - advSearch parameter and pcre modifier added\n  10/02/08 - Strip_tags added to avoid sql injection and XSS. Use of $_REQUEST\n  01/03/07 - Added fies/updates from forum from users mikkelwe/identity\n  (better highlight replacement, additional div around term/removal message)\n  ------------------------------------------------------------------------\n  Description: When a user clicks on the link from the AjaxSearch results\n    the target page will have the terms highlighted.\n  ------------------------------------------------------------------------\n  Created By:  Susan Ottwell (sottwell@sottwell.com)\n               Kyle Jaebker (kjaebker@muddydogpaws.com)\n\n  Refactored by Coroico (www.evo.wangba.fr) and TS\n  ------------------------------------------------------------------------\n  Based off the the code by Susan Ottwell (www.sottwell.com)\n    http://modxcms.com/forums/index.php/topic,1237.0.html\n  ------------------------------------------------------------------------\n  CSS:\n    The classes used for the highlighting are the same as the AjaxSearch\n  ------------------------------------------------------------------------\n  Notes:\n    To add a link to remove the highlighting and to show the searchterms\n    put the following on your page where you would like this to appear:\n\n      <!--search_terms-->\n\n    Example output for this:\n\n      Search Terms: the, template\n      Remove Highlighting\n\n    Set the following variables to change the text:\n\n      $termText - the text before the search terms\n      $removeText - the text for the remove link\n  ------------------------------------------------------------------------\n*/\nglobal $database_connection_charset;\n// Conversion code name between html page character encoding and Mysql character encoding\n// Some others conversions should be added if needed. Otherwise Page charset = Database charset\n$pageCharset = array(\n  ''utf8'' => ''UTF-8'',\n  ''latin1'' => ''ISO-8859-1'',\n  ''latin2'' => ''ISO-8859-2''\n);\n\nif (isset($_REQUEST[''searched'']) && isset($_REQUEST[''highlight''])) {\n\n  // Set these to customize the text for the highlighting key\n  // --------------------------------------------------------\n     $termText = ''<div class="searchTerms">Search Terms: '';\n     $removeText = ''Remove Highlighting'';\n  // --------------------------------------------------------\n\n  $highlightText = $termText;\n  $advsearch = ''oneword'';\n\n  $dbCharset = $database_connection_charset;\n  $pgCharset = array_key_exists($dbCharset,$pageCharset) ? $pageCharset[$dbCharset] : $dbCharset;\n\n  // magic quotes check\n  if (get_magic_quotes_gpc()){\n    $searched = strip_tags(stripslashes($_REQUEST[''searched'']));\n    $highlight = strip_tags(stripslashes($_REQUEST[''highlight'']));\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags(stripslashes($_REQUEST[''advsearch'']));\n  }\n  else {\n    $searched = strip_tags($_REQUEST[''searched'']);\n    $highlight = strip_tags($_REQUEST[''highlight'']);\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags($_REQUEST[''advsearch'']);\n  }\n\n  if ($advsearch != ''nowords'') {\n\n    $searchArray = array();\n    if ($advsearch == ''exactphrase'') $searchArray[0] = $searched;\n    else $searchArray = explode('' '', $searched);\n\n    $searchArray = array_unique($searchArray);\n    $nbterms = count($searchArray);\n    $searchTerms = array();\n    for($i=0;$i<$nbterms;$i++){\n      // Consider all possible combinations\n      $word_ents = array();\n      $word_ents[] = $searchArray[$i];\n      $word_ents[] = htmlentities($searchArray[$i], ENT_NOQUOTES, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_COMPAT, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_QUOTES, $pgCharset);\n      // Avoid duplication\n      $word_ents = array_unique($word_ents);\n      foreach($word_ents as $word) $searchTerms[]= array(''term'' => $word, ''class'' => $i+1);\n    }\n\n    $output = $modx->documentOutput; // get the parsed document\n    $body = explode("<body", $output); // break out the head\n\n    $highlightClass = explode('' '',$highlight); // break out the highlight classes\n    /* remove possibility of XSS attempts being passed in URL */\n    foreach ($highlightClass as $key => $value) {\n       $highlightClass[$key] = preg_match(''/[^A-Za-z0-9_-]/ms'', $value) == 1 ? '''' : $value;\n    }\n\n    $pcreModifier = ($pgCharset == ''UTF-8'') ? ''iu'' : ''i'';\n    $lookBehind = ''/(?<!&|&[\\w#]|&[\\w#]\\w|&[\\w#]\\w\\w|&[\\w#]\\w\\w\\w|&[\\w#]\\w\\w\\w\\w|&[\\w#]\\w\\w\\w\\w\\w)'';  // avoid a match with a html entity\n    $lookAhead = ''(?=[^>]*<)/''; // avoid a match with a html tag\n\n    $nbterms = count($searchTerms);\n    for($i=0;$i<$nbterms;$i++){\n      $word = $searchTerms[$i][''term''];\n      $class = $highlightClass[0].'' ''.$highlightClass[$searchTerms[$i][''class'']];\n\n      $highlightText .= ($i > 0) ? '', '' : '''';\n      $highlightText .= ''<span class="''.$class.''">''.$word.''</span>'';\n\n      $pattern = $lookBehind . preg_quote($word, ''/'') . $lookAhead . $pcreModifier;\n      $replacement = ''<span class="'' . $class . ''">${0}</span>'';\n      $body[1] = preg_replace($pattern, $replacement, $body[1]);\n    }\n\n    $output = implode("<body", $body);\n\n    $removeUrl = $modx->makeUrl($modx->documentIdentifier);\n    $highlightText .= ''<br /><a href="''.$removeUrl.''" class="ajaxSearch_removeHighlight">''.$removeText.''</a></div>'';\n\n    $output = str_replace(''<!--search_terms-->'',$highlightText,$output);\n    $modx->documentOutput = $output;\n  }\n}', 0, '', 1, ''),
(7, 'TinyMCE Rich Text Editor', '<strong>3.5.8</strong> Javascript WYSIWYG Editor', 0, 2, 0, 'require MODX_BASE_PATH.''assets/plugins/tinymce/plugin.tinymce.php'';\n', 0, '&customparams=Custom Parameters;textarea;valid_elements : "*[*]", &mce_formats=Block Formats;text;p,h1,h2,h3,h4,h5,h6,div,blockquote,code,pre &entity_encoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &mce_path_options=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &mce_resizing=Advanced Resizing;list;true,false;true &disabledButtons=Disabled Buttons;text; &link_list=Link List;list;enabled,disabled;enabled &webtheme=Web Theme;list;simple,editor,creative,custom;simple &webPlugins=Web Plugins;text;style,advimage,advlink,searchreplace,contextmenu,paste,fullscreen,xhtmlxtras,media &webButtons1=Web Buttons 1;text;undo,redo,selectall,|,pastetext,pasteword,|,search,replace,|,hr,charmap,|,image,link,unlink,anchor,media,|,cleanup,removeformat,|,fullscreen,code,help &webButtons2=Web Buttons 2;text;bold,italic,underline,strikethrough,sub,sup,|,|,blockquote,bullist,numlist,outdent,indent,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,|,styleprops &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;95% &height=Height;text;500', 0, ''),
(8, 'TransAlias', '<strong>1.0.2</strong> Human readible URL translation supporting multiple languages and overrides', 0, 2, 0, 'require MODX_BASE_PATH.''assets/plugins/transalias/plugin.transalias.php'';', 0, '&table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;common &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;lowercase alphanumeric &remove_periods=Remove Periods;list;Yes,No;Yes &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string;', 0, ' '),
(9, 'multigrid', '', 0, 0, 0, ' include(MODX_BASE_PATH.''assets/plugins/multigrid/MultiGrid.plugin.php'');', 0, '&tvids=TV IDs;text; &tpl=Template;text; &role=Role;text; &columnNames=Column Names;text;', 0, ' '),
(10, 'YAMS', 'Yet Another Multilingual Solution Plugin', 0, 0, 0, 'require( $modx->config[''base_path''] . ''assets/modules/yams/yams.plugin.inc.php'');', 0, '', 1, ' '),
(11, 'PHx', '', 0, 0, 0, '//<?php\r\n/**\r\n * phx \r\n * \r\n * (Placeholders Xtended) Adds the capability of output modifiers when using placeholders, template variables and settings tags\r\n *\r\n * @category    plugin\r\n * @version     2.2.0\r\n * @author      Armand "bS" Pondman (apondman@zerobarrier.nl)\r\n * @internal    @properties &phxdebug=Log events;int;0 &phxmaxpass=Max. Passes;int;50\r\n * @internal    @events OnParseDocument\r\n * @internal    @modx_category Manager and Admin\r\n */\r\n\r\ninclude_once $modx->config[''rb_base_dir''] . "plugins/phx/phx.parser.class.inc.php";\r\n\r\n$e = &$modx->Event;\r\n\r\n$PHx = new PHxParser($phxdebug,$phxmaxpass);\r\n\r\nswitch($e->name) {\r\n	case ''OnParseDocument'':\r\n		$PHx->OnParseDocument();\r\n		break;\r\n\r\n}', 0, '', 0, ' ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_plugin_events`
--

CREATE TABLE IF NOT EXISTS `modx_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';

--
-- Volcado de datos para la tabla `modx_site_plugin_events`
--

INSERT INTO `modx_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 23, 0),
(1, 29, 0),
(1, 35, 0),
(1, 41, 0),
(1, 47, 0),
(1, 73, 0),
(2, 34, 0),
(2, 35, 0),
(2, 36, 0),
(2, 40, 0),
(2, 41, 0),
(2, 42, 0),
(3, 80, 0),
(3, 81, 0),
(3, 93, 0),
(4, 28, 0),
(4, 29, 0),
(4, 53, 0),
(5, 3, 0),
(5, 13, 0),
(5, 28, 0),
(5, 31, 0),
(5, 92, 0),
(6, 3, 0),
(7, 85, 0),
(7, 87, 0),
(7, 88, 0),
(8, 100, 0),
(9, 29, 1),
(10, 3, 1),
(10, 92, 1),
(10, 30, 1),
(10, 20, 1),
(10, 91, 1),
(10, 90, 1),
(10, 1000, 1),
(11, 92, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_snippets`
--

CREATE TABLE IF NOT EXISTS `modx_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.' AUTO_INCREMENT=24 ;

--
-- Volcado de datos para la tabla `modx_site_snippets`
--

INSERT INTO `modx_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`) VALUES
(1, 'AjaxSearch', '<strong>1.9.3b</strong> Ajax and non-Ajax search that supports results highlighting', 0, 3, 0, 'return require MODX_BASE_PATH.''assets/snippets/ajaxSearch/snippet.ajaxSearch.php'';', 0, '', ''),
(2, 'Breadcrumbs', '<strong>1.0.3</strong> Configurable breadcrumb page-trail navigation', 0, 4, 0, 'return require MODX_BASE_PATH.''assets/snippets/breadcrumbs/snippet.breadcrumbs.php'';', 0, '', ''),
(3, 'Ditto', '<strong>2.1.1</strong> Summarizes and lists pages to create blogs, catalogs, PR archives, bio listings and more', 0, 5, 0, 'return require MODX_BASE_PATH.''assets/snippets/ditto/snippet.ditto.php'';', 0, '', ''),
(4, 'eForm', '<strong>1.4.4.7</strong> Robust form parser/processor with validation, multiple sending options, chunk/page support for forms and reports, and file uploads', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/eform/snippet.eform.php'';', 0, '', ''),
(5, 'FirstChildRedirect', '<strong>1.0</strong> Automatically redirects to the first child of a Container Resource', 0, 4, 0, 'return require MODX_BASE_PATH.''assets/snippets/firstchildredirect/snippet.firstchildredirect.php'';', 0, '', ''),
(6, 'if', '<strong>1.2</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 4, 0, 'return require MODX_BASE_PATH.''assets/snippets/if/snippet.if.php'';', 0, '', ''),
(7, 'Jot', '<strong>1.1.4</strong> User comments with moderation and email subscription', 0, 5, 0, '/*####\n#\n# Author: Armand "bS" Pondman (apondman@zerobarrier.nl)\n#\n# Latest Version: http://modxcms.com/Jot-998.html\n# Jot Demo Site: http://projects.zerobarrier.nl/modx/\n# Documentation: http://wiki.modxcms.com/index.php/Jot (wiki)\n#\n####*/\n\n$jotPath = $modx->config[''base_path''] . ''assets/snippets/jot/'';\ninclude_once($jotPath.''jot.class.inc.php'');\n\n$Jot = new CJot;\n$Jot->VersionCheck("1.1.4");\n$Jot->Set("path",$jotPath);\n$Jot->Set("action", $action);\n$Jot->Set("postdelay", $postdelay);\n$Jot->Set("docid", $docid);\n$Jot->Set("tagid", $tagid);\n$Jot->Set("subscribe", $subscribe);\n$Jot->Set("moderated", $moderated);\n$Jot->Set("captcha", $captcha);\n$Jot->Set("badwords", $badwords);\n$Jot->Set("bw", $bw);\n$Jot->Set("sortby", $sortby);\n$Jot->Set("numdir", $numdir);\n$Jot->Set("customfields", $customfields);\n$Jot->Set("guestname", $guestname);\n$Jot->Set("canpost", $canpost);\n$Jot->Set("canview", $canview);\n$Jot->Set("canedit", $canedit);\n$Jot->Set("canmoderate", $canmoderate);\n$Jot->Set("trusted", $trusted);\n$Jot->Set("pagination", $pagination);\n$Jot->Set("placeholders", $placeholders);\n$Jot->Set("subjectSubscribe", $subjectSubscribe);\n$Jot->Set("subjectModerate", $subjectModerate);\n$Jot->Set("subjectAuthor", $subjectAuthor);\n$Jot->Set("notify", $notify);\n$Jot->Set("notifyAuthor", $notifyAuthor);\n$Jot->Set("validate", $validate);\n$Jot->Set("title", $title);\n$Jot->Set("authorid", $authorid);\n$Jot->Set("css", $css);\n$Jot->Set("cssFile", $cssFile);\n$Jot->Set("cssRowAlt", $cssRowAlt);\n$Jot->Set("cssRowMe", $cssRowMe);\n$Jot->Set("cssRowAuthor", $cssRowAuthor);\n$Jot->Set("tplForm", $tplForm);\n$Jot->Set("tplComments", $tplComments);\n$Jot->Set("tplModerate", $tplModerate);\n$Jot->Set("tplNav", $tplNav);\n$Jot->Set("tplNotify", $tplNotify);\n$Jot->Set("tplNotifyModerator", $tplNotifyModerator);\n$Jot->Set("tplNotifyAuthor", $tplNotifyAuthor);\n$Jot->Set("tplSubscribe", $tplSubscribe);\n$Jot->Set("debug", $debug);\n$Jot->Set("output", $output);\nreturn $Jot->Run();', 0, '', ''),
(8, 'ListIndexer', '<strong>1.0.1</strong> A flexible way to show the most recent Resources and other Resource lists', 0, 4, 0, 'return require MODX_BASE_PATH.''assets/snippets/listindexer/snippet.listindexer.php'';', 0, '', ''),
(9, 'MemberCheck', '<strong>1.1</strong> Show chunks based on a logged in Web User''s group membership', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/membercheck/snippet.membercheck.php'';', 0, '', ''),
(10, 'Personalize', '<strong>2.1</strong> Personalize snippet', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/personalize/snippet.personalize.php'';', 0, '', ''),
(11, 'Reflect', '<strong>2.1.0</strong> Generates date-based archives using Ditto', 0, 5, 0, '/*\n * Author: \n *      Mark Kaplan for MODx CMF\n * \n * Note: \n *      If Reflect is not retrieving its own documents, make sure that the\n *          Ditto call feeding it has all of the fields in it that you plan on\n *       calling in your Reflect template. Furthermore, Reflect will ONLY\n *          show what is currently in the Ditto result set.\n *       Thus, if pagination is on it will ONLY show that page''s items.\n*/\n \n\n// ---------------------------------------------------\n//  Includes\n// ---------------------------------------------------\n\n$reflect_base = isset($reflect_base) ? $modx->config[''base_path''].$reflect_base : $modx->config[''base_path'']."assets/snippets/reflect/";\n/*\n    Param: ditto_base\n    \n    Purpose:\n    Location of Ditto files\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    [(base_path)]assets/snippets/ditto/\n*/\n\n$config = (isset($config)) ? $config : "default";\n/*\n    Param: config\n\n    Purpose:\n    Load a custom configuration\n\n    Options:\n    "default" - default blank config file\n    CONFIG_NAME - Other configs installed in the configs folder or in any folder within the MODx base path via @FILE\n\n    Default:\n    "default"\n    \n    Related:\n    - <extenders>\n*/\n\nrequire($reflect_base."configs/default.config.php");\nrequire($reflect_base."default.templates.php");\nif ($config != "default") {\n    require((substr($config, 0, 5) != "@FILE") ? $reflect_base."configs/$config.config.php" : $modx->config[''base_path''].trim(substr($config, 5)));\n}\n\n// ---------------------------------------------------\n//  Parameters\n// ---------------------------------------------------\n\n$id = isset($id) ? $id."_" : false;\n/*\n    Param: id\n\n    Purpose:\n    Unique ID for this Ditto instance for connection with other scripts (like Reflect) and unique URL parameters\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    "" - blank\n*/\n$getDocuments = isset($getDocuments) ? $getDocuments : 0;\n/*\n    Param: getDocuments\n\n    Purpose:\n    Force Reflect to get documents\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    0 - off\n*/\n$showItems = isset($showItems) ? $showItems : 1;\n/*\n    Param: showItems\n\n    Purpose:\n    Show individual items in the archive\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$groupByYears = isset($groupByYears)? $groupByYears : 1;\n/*\n    Param: groupByYears\n\n    Purpose:\n    Group the archive by years\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$targetID = isset($targetID) ? $targetID : $modx->documentObject[''id''];\n/*\n    Param: targetID\n\n    Purpose:\n    ID for archive links to point to\n\n    Options:\n    Any MODx document with a Ditto call setup with extenders=`dateFilter`\n    \n    Default:\n    Current MODx Document\n*/\n$dateSource = isset($dateSource) ? $dateSource : "createdon";\n/*\n    Param: dateSource\n\n    Purpose:\n    Date source to display for archive items\n\n    Options:\n    # - Any UNIX timestamp from MODx fields or TVs such as createdon, pub_date, or editedon\n    \n    Default:\n    "createdon"\n    \n    Related:\n    - <dateFormat>\n*/\n$dateFormat = isset($dateFormat) ? $dateFormat : "%d-%b-%y %H:%M";  \n/*\n    Param: dateFormat\n\n    Purpose:\n    Format the [+date+] placeholder in human readable form\n\n    Options:\n    Any PHP valid strftime option\n\n    Default:\n    "%d-%b-%y %H:%M"\n    \n    Related:\n    - <dateSource>\n*/\n$yearSortDir = isset($yearSortDir) ? $yearSortDir : "DESC";\n/*\n    Param: yearSortDir\n\n    Purpose:\n    Direction to sort documents\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "DESC"\n    \n    Related:\n    - <monthSortDir>\n*/\n$monthSortDir = isset($monthSortDir) ? $monthSortDir : "ASC";\n/*\n    Param: monthSortDir\n\n    Purpose:\n    Direction to sort the months\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "ASC"\n    \n    Related:\n    - <yearSortDir>\n*/\n$start = isset($start)? intval($start) : 0;\n/*\n    Param: start\n\n    Purpose:\n    Number of documents to skip in the results\n    \n    Options:\n    Any number\n\n    Default:\n    0\n*/  \n$phx = (isset($phx))? $phx : 1;\n/*\n    Param: phx\n\n    Purpose:\n    Use PHx formatting\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n\n// ---------------------------------------------------\n//  Initialize Ditto\n// ---------------------------------------------------\n$placeholder = ($id != false && $getDocuments == 0) ? true : false;\nif ($placeholder === false) {\n    $rID = "reflect_".rand(1,1000);\n    $itemTemplate = isset($tplItem) ? $tplItem: "@CODE:".$defaultTemplates[''item''];\n    $dParams = array(\n        "id" => "$rID",\n        "save" => "3",  \n        "summarize" => "all",\n        "tpl" => $itemTemplate,\n    );\n    \n    $source = $dittoSnippetName;\n    $params = $dittoSnippetParameters;\n        // TODO: Remove after 3.0\n        \n    if (isset($params)) {\n        $givenParams = explode("|",$params);\n        foreach ($givenParams as $parameter) {\n            $p = explode(":",$parameter);\n            $dParams[$p[0]] = $p[1];\n        }\n    }\n    /*\n        Param: params\n\n        Purpose:\n        Pass parameters to the Ditto instance used to retreive the documents\n\n        Options:\n        Any valid ditto parameters in the format name:value \n        with multiple parameters separated by a pipe (|)\n        \n        Note:\n        This parameter is only needed for config, start, and phx as you can\n        now simply use the parameter as if Reflect was Ditto\n\n        Default:\n        [NULL]\n    */\n    \n    $reflectParameters = array(''reflect_base'',''config'',''id'',''getDocuments'',''showItems'',''groupByYears'',''targetID'',''yearSortDir'',''monthSortDir'',''start'',''phx'',''tplContainer'',''tplYear'',''tplMonth'',''tplMonthInner'',''tplItem'',''save'');\n    $params =& $modx->event->params;\n    if(is_array($params)) {\n        foreach ($params as $param=>$value) {\n            if (!in_array($param,$reflectParameters) && substr($param,-3) != ''tpl'') {\n                $dParams[$param] = $value;\n            }\n        }\n    }\n\n    $source = isset($source) ? $source : "Ditto";\n    /*\n        Param: source\n\n        Purpose:\n        Name of the Ditto snippet to use\n\n        Options:\n        Any valid snippet name\n\n        Default:\n        "Ditto"\n    */\n    $snippetOutput = $modx->runSnippet($source,$dParams);\n    $ditto = $modx->getPlaceholder($rID."_ditto_object");\n    $resource = $modx->getPlaceholder($rID."_ditto_resource");\n} else {\n    $ditto = $modx->getPlaceholder($id."ditto_object");\n    $resource = $modx->getPlaceholder($id."ditto_resource");\n}\nif (!is_object($ditto) || !isset($ditto) || !isset($resource)) {\n    return !empty($snippetOutput) ? $snippetOutput : "The Ditto object is invalid. Please check it.";\n}\n\n// ---------------------------------------------------\n//  Templates\n// ---------------------------------------------------\n\n$templates[''tpl''] = isset($tplContainer) ? $ditto->template->fetch($tplContainer): $defaultTemplates[''tpl''];\n/*\n    Param: tplContainer\n\n    Purpose:\n    Container template for the archive\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year''] = isset($tplYear) ? $ditto->template->fetch($tplYear): $defaultTemplates[''year''];\n/*\n    Param: tplYear\n\n    Purpose:\n    Template for the year item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year_inner''] = isset($tplYearInner) ? $ditto->template->fetch($tplYearInner): $defaultTemplates[''year_inner''];\n/*\n    Param: tplYearInner\n\n    Purpose:\n    Template for the year item (the ul to hold the year template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month''] = isset($tplMonth) ? $ditto->template->fetch($tplMonth): $defaultTemplates[''month''];\n/*\n    Param: tplMonth\n\n    Purpose:\n    Template for the month item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month_inner''] = isset($tplMonthInner) ? $ditto->template->fetch($tplMonthInner): $defaultTemplates[''month_inner''];\n/*\n    Param: tplMonthInner\n\n    Purpose:\n    Template for the month item  (the ul to hold the month template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''item''] = isset($tplItem) ? $ditto->template->fetch($tplItem): $defaultTemplates[''item''];\n/*\n    Param: tplItem\n\n    Purpose:\n    Template for the individual item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n\n$ditto->addField("date","display","custom");\n    // force add the date field if receiving data from a Ditto instance\n\n// ---------------------------------------------------\n//  Reflect\n// ---------------------------------------------------\n\nif (function_exists("reflect") === FALSE) {\nfunction reflect($templatesDocumentID, $showItems, $groupByYears, $resource, $templatesDateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir) {\n    global $modx;\n    $cal = array();\n    $output = '''';\n    $ph = array(''year''=>'''',''month''=>'''',''item''=>'''',''out''=>'''');\n    $build = array();\n    $stop = count($resource);\n\n    // loop and fetch all the results\n    for ($i = $start; $i < $stop; $i++) {\n        $date = getdate($resource[$i][$templatesDateSource]);\n        $year = $date["year"];\n        $month = $date["mon"];\n        $cal[$year][$month][] = $resource[$i];\n    }\n    if ($yearSortDir == "DESC") {\n        krsort($cal);\n    } else {\n        ksort($cal);\n    }\n    foreach ($cal as $year=>$months) {\n        if ($monthSortDir == "ASC") {\n            ksort($months);\n        } else {\n            krsort($months);\n        }\n        $build[$year] = $months;\n    }\n    \n    foreach ($build as $year=>$months) {\n        $r_year = '''';\n        $r_month = '''';\n        $r_month_2 = '''';\n        $year_count = 0;\n        $items = array();\n        \n        foreach ($months as $mon=>$month) {\n            $month_text = strftime("%B", mktime(10, 10, 10, $mon, 10, $year));\n            $month_url = $ditto->buildURL("month=".$mon."&year=".$year."&day=false&start=0",$templatesDocumentID,$id);\n            $month_count = count($month);\n            $year_count += $month_count;\n            $r_month = $ditto->template->replace(array("year"=>$year,"month"=>$month_text,"url"=>$month_url,"count"=>$month_count),$templates[''month'']);\n            if ($showItems) {\n                foreach ($month as $item) {\n                    $items[$year][$mon][''items''][] = $ditto->render($item, $templates[''item''], false, $templatesDateSource, $dateFormat, array(),$phx);\n                }\n                $r_month_2 = $ditto->template->replace(array(''wrapper'' => implode('''',$items[$year][$mon][''items''])),$templates[''month_inner'']);\n                $items[$year][$mon] = $ditto->template->replace(array(''wrapper'' => $r_month_2),$r_month);\n            } else {\n                $items[$year][$mon] = $r_month;\n            }\n        }\n        if ($groupByYears) {\n            $year_url = $ditto->buildURL("year=".$year."&month=false&day=false&start=0",$templatesDocumentID,$id);\n            $r_year =  $ditto->template->replace(array("year"=>$year,"url"=>$year_url,"count"=>$year_count),$templates[''year'']);\n            $var = $ditto->template->replace(array(''wrapper''=>implode('''',$items[$year])),$templates[''year_inner'']);\n            $output .= $ditto->template->replace(array(''wrapper''=>$var),$r_year);\n        } else {\n            $output .= implode('''',$items[$year]);\n        }\n    }\n\n    $output = $ditto->template->replace(array(''wrapper''=>$output),$templates[''tpl'']);\n    $modx->setPlaceholder($id.''reset'',$ditto->buildURL(''year=false&month=false&day=false'',$templatesDocumentID,$id));\n\nreturn $output;\n    \n}\n}\n\nreturn reflect($targetID, $showItems, $groupByYears, $resource, $dateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir);', 0, '', ''),
(12, 'UltimateParent', '<strong>2.0</strong> Travels up the document tree from a specified document and returns its "ultimate" non-root parent', 0, 4, 0, 'return require MODX_BASE_PATH.''assets/snippets/ultimateparent/snippet.ultimateparent.php'';', 0, '', ''),
(13, 'Wayfinder', '<strong>2.0.1</strong> Completely template-driven and highly flexible menu builder', 0, 4, 0, 'return require MODX_BASE_PATH.''assets/snippets/wayfinder/snippet.wayfinder.php'';', 0, '', ''),
(14, 'WebChangePwd', '<strong>1.0</strong> Allows Web User to change their password from the front-end of the website', 0, 7, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&tpl			- (Optional)\n#		Chunk name or document id to use as a template\n#				  \n#	Note: Templats design:\n#			section 1: change pwd template\n#			section 2: notification template \n#\n# Examples:\n#\n#	[[WebChangePwd? &tpl=`ChangePwd`]] \n\n# Set Snippet Paths \n$snipPath  = (($modx->insideManager())? "../":"");\n$snipPath .= "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->insideManager()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$isPostBack		= count($_POST) && isset($_POST[''cmdwebchngpwd'']);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/webchangepwd.inc.php";\n\n# Return\nreturn $output;\n\n\n\n', 0, '', ''),
(15, 'WebLogin', '<strong>1.1</strong> Allows webusers to login to protected pages in the website, supporting multiple user groups', 0, 7, 0, '# Created By Raymond Irving 2004\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&loginhomeid 	- (Optional)\n#		redirects the user to first authorized page in the list.\n#		If no id was specified then the login home page id or \n#		the current document id will be used\n#\n#	&logouthomeid 	- (Optional)\n#		document id to load when user logs out	\n#\n#	&pwdreqid 	- (Optional)\n#		document id to load after the user has submited\n#		a request for a new password\n#\n#	&pwdactid 	- (Optional)\n#		document id to load when the after the user has activated\n#		their new password\n#\n#	&logintext		- (Optional) \n#		Text to be displayed inside login button (for built-in form)\n#\n#	&logouttext 	- (Optional)\n#		Text to be displayed inside logout link (for built-in form)\n#	\n#	&tpl			- (Optional)\n#		Chunk name or document id to as a template\n#				  \n#	Note: Templats design:\n#			section 1: login template\n#			section 2: logout template \n#			section 3: password reminder template \n#\n#			See weblogin.tpl for more information\n#\n# Examples:\n#\n#	[[WebLogin? &loginhomeid=`8` &logouthomeid=`1`]] \n#\n#	[[WebLogin? &loginhomeid=`8,18,7,5` &tpl=`Login`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->insideManager()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n# deprecated params - only for backward compatibility\nif(isset($loginid)) $loginhomeid=$loginid;\nif(isset($logoutid)) $logouthomeid = $logoutid;\nif(isset($template)) $tpl = $template;\n\n# Snippet customize settings\n$liHomeId	= isset($loginhomeid)? explode(",",$loginhomeid):array($modx->config[''login_home''],$modx->documentIdentifier);\n$loHomeId	= isset($logouthomeid)? $logouthomeid:$modx->documentIdentifier;\n$pwdReqId	= isset($pwdreqid)? $pwdreqid:0;\n$pwdActId	= isset($pwdactid)? $pwdactid:0;\n$loginText	= isset($logintext)? $logintext:''Login'';\n$logoutText	= isset($logouttext)? $logouttext:''Logout'';\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$webLoginMode = isset($_REQUEST[''webloginmode''])? $_REQUEST[''webloginmode'']: '''';\n$isLogOut		= $webLoginMode==''lo'' ? 1:0;\n$isPWDActivate	= $webLoginMode==''actp'' ? 1:0;\n$isPostBack		= count($_POST) && (isset($_POST[''cmdweblogin'']) || isset($_POST[''cmdweblogin_x'']));\n$txtPwdRem 		= isset($_REQUEST[''txtpwdrem''])? $_REQUEST[''txtpwdrem'']: 0;\n$isPWDReminder	= $isPostBack && $txtPwdRem==''1'' ? 1:0;\n\n$site_id = isset($site_id)? $site_id: '''';\n$cookieKey = substr(md5($site_id."Web-User"),0,15);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once ($modx->config[''site_manager_path''] . "includes/crypt.class.inc.php");\n\nif ($isPWDActivate || $isPWDReminder || $isLogOut || $isPostBack) {\n	# include the logger class\n	include_once $modx->config[''site_manager_path''] . "includes/log.class.inc.php";\n	include_once $snipPath."weblogin/weblogin.processor.inc.php";\n}\n\ninclude_once $snipPath."weblogin/weblogin.inc.php";\n\n# Return\nreturn $output;\n', 0, '&loginhomeid=Login Home Id;string; &logouthomeid=Logout Home Id;string; &logintext=Login Button Text;string; &logouttext=Logout Button Text;string; &tpl=Template;string;', ''),
(16, 'WebSignup', '<strong>1.1</strong> Basic Web User account creation/signup system', 0, 7, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Usage:     \n#    Allows a web user to signup for a new web account from the website\n#    This snippet provides a basic set of form fields for the signup form\n#    You can customize this snippet to create your own signup form\n#\n# Params:    \n#\n#    &tpl        - (Optional) Chunk name or document id to use as a template\n#    &groups     - Web users groups to be assigned to users\n#    &useCaptcha - (Optional) Determine to use (1) or not to use (0) captcha\n#                  on signup form - if not defined, will default to system\n#                  setting. GD is required for this feature. If GD is not \n#                  available, useCaptcha will automatically be set to false;\n#                  \n#    Note: Templats design:\n#        section 1: signup template\n#        section 2: notification template \n#\n# Examples:\n#\n#    [[WebSignup? &tpl=`SignupForm` &groups=`NewsReaders,WebUsers`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->insideManager()) {\n    return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl = isset($tpl)? $tpl:"";\n$useCaptcha = isset($useCaptcha)? $useCaptcha : $modx->config[''use_captcha''] ;\n// Override captcha if no GD\nif ($useCaptcha && !gd_info()) $useCaptcha = 0;\n\n# setup web groups\n$groups = isset($groups) ? explode('','',$groups):array();\nfor($i=0;$i<count($groups);$i++) $groups[$i] = trim($groups[$i]);\n\n# System settings\n$isPostBack        = count($_POST) && isset($_POST[''cmdwebsignup'']);\n\n$output = '''';\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/websignup.inc.php";\n\n# Return\nreturn $output;', 0, '&tpl=Template;string;', ''),
(17, 'MiniPhoto', '', 0, 8, 0, '\r\n/************************************************\r\n*Added &aspectratio option 6-3-2012 by Carlos Carbonell\r\n*\r\n*Snippet to resize on the fly an image for galleris, etc.\r\n*Supports jpg, gif, png and others.\r\n*\r\n*Use [[MiniPhoto? &file=`assets/images/photo.jpg` &width=`200` &height=`150` &quality=`93` &dir=`mini` &isclip=`1` &interlace=`0` &bgcolor=`ffffff`]]\r\n*\r\n*New image: assets/images/mini/photo.jpg\r\n*With width=200, height=150, quality=93\r\n*\r\n*file - path to big image (is mandatory)\r\n*width - width of mini photo\r\n*height - height of mini photo\r\n*quality - quality of mini photo\r\n*dir - dir for mini photo\r\n*aspectratio - 1 for auto calculating aspect ratio if width or height are not defined (1 default, 0 bypass)\r\n\r\n*isclip - clip image by minimal side (default 1). If set 0, then image has been diminishing by long side, and space has been filling with &bgcolor\r\n*interlace - set interlpase for .jpg (progressive mode)\r\n*bgcolor - for space when isclip set 0 (hex RBG format `rrggbb`)\r\n*\r\n*For example with Ditto:\r\n*<img src="[[MiniPhoto? &file=`[+tvphoto+]` &width=`108` &height=`81`]]" width="108" height="81" alt="" class="photo left" />\r\n*\r\n*Where tvphoto is tv parameter (photo) for image.\r\n*************************************************/\r\n\r\n// Path to snippet\r\n$miniphoto_path = ''assets/snippets/miniphoto/'';\r\n\r\n// URL to "no photo" file\r\n$nophoto = $miniphoto_path.''nophoto.png'';\r\n\r\n// Parametr "file" (path to photo) is mandatory\r\nif (!isset($file)) return $nophoto;\r\n\r\n// Quality of mini photo\r\n$quality = isset($quality) ? $quality : 93;\r\n\r\n// Aspect ratio of mini photo\r\n$aspectratio = isset($aspectratio) ? $aspectratio : 1;\r\n\r\n$isclip = isset($isclip) ? $isclip : 1;\r\n\r\n$interlace = isset($interlace) ? $interlace : 0;\r\n\r\n$bgcolor = isset($bgcolor) ? $bgcolor : ''ffffff'';\r\n\r\n// Dir for mini photo\r\n$dir = isset($dir) && $dir ? $dir : $width.''x''.$height.''/'';\r\nif ($dir{strlen($dir)-1} != ''/'') $dir .= ''/'';\r\n\r\n// Path to mini photo\r\n$p_dir = dirname(($p = strpos($file, ''://'')) ? substr($file, strpos($file, ''/'', $p + 3) + 1) : ($file{0} == ''/'' ? substr($file, 1) : $file)).''/'';\r\n$p_img = $p_dir.basename($file);\r\n$mp_dir = $p_dir.$dir;\r\n$mp_img = $mp_dir.basename($file);\r\n\r\nif (file_exists($modx->config[''base_path''].$mp_img)) {\r\n    //return ''/''.$mp_img;\r\n	return $mp_img;\r\n}\r\n\r\nreturn include($miniphoto_path.''miniphoto.inc.php'');\r\n', 0, '', ' '),
(18, 'YAMS', 'Gets multi-language content.', 0, 2, 0, '\r\n// The following line needs to be placed between the opening and closing php\r\n  // markers\r\n  require( $modx->config[''base_path''] . ''assets/modules/yams/yams.snippet.inc.php'' );\r\n', 0, '', ' '),
(19, 'cache_custom', 'Crea porciones de caché a medida', 0, 0, 0, '\r\ninclude_once "funciones_cache_manager.php";\r\n\r\n/*VARS\r\n\r\n	$la_id : id del documento donde hemos puesto el fragmento a modo de chunk\r\n	$nombre : el nombre único con el que se grabará el archivo de la caché\r\n	$plazo_cache : tiempo en milisegundos de vida de la cache\r\n    $id_pagina_dinamica : id a procesar respectoa  una página dinámica\r\n\r\n*/\r\n\r\n$carpeta_cache="cache";\r\n$extension_cache="php";\r\n//$plazo_cache=24*3600; //UN DÍA\r\n$ahora_unixtime=time();\r\n\r\n$cache_uri=$carpeta_cache."/".limpiar_nombre($nombre).".".$extension_cache;\r\n\r\nif (file_exists($cache_uri)) {\r\n	//SI EXISTE LA CACHE\r\n	\r\n	if ((filemtime($cache_uri)+$plazo_cache) < $ahora_unixtime){\r\n		//SI LA CACHE HA EXPIRADO EN EL TIEMPO CREAMOS CACHE\r\n		//CREAMOS CACHE\r\n		if ($id_pagina_dinamica){ $id_a_pasar=$id_pagina_dinamica; } else { $id_a_pasar=""; }\r\n		if (crear_cache($la_id,$cache_uri,$id_a_pasar)){\r\n		\r\n		} else {\r\n			echo "ERROR AL ESCRIBIR CACHE";\r\n		}\r\n		\r\n	} else {\r\n		// LEEMOS Y UTILIZAMOS CONTENIDO DE LA CACHE	\r\n		$cache_leida=file_get_contents($cache_uri);\r\n		if ($cache_leida){\r\n			echo $cache_leida;\r\n		} else {\r\n			echo "ERROR AL LEER EL ARCHIVO DE CACHE";\r\n		}\r\n		\r\n	}\r\n} else {\r\n	//CREAMOS CACHE\r\n	if ($id_pagina_dinamica){ $id_a_pasar=$id_pagina_dinamica; } else { $id_a_pasar=""; }\r\n	if (crear_cache($la_id,$cache_uri,$id_a_pasar)){\r\n		\r\n	} else {\r\n		echo "ERROR AL ESCRIBIR CACHE";\r\n	}\r\n}\r\n\r\n\r\n	\r\n\r\nunset($la_id);\r\nunset($nombre);\r\nunset($plazo_cache);\r\nunset($id_pagina_dinamica);\r\n', 0, '', ' '),
(20, 'videoresizer', '', 0, 8, 0, '\r\n////////////////////////////////////////////////////////////////////////////////////////////////////////////////////\r\n//  	\r\n//	Snippet Name: videoresizer\r\n//	\r\n//	Snippet variables: id , width, height, my_tv (all required)\r\n//	--Requires Getfield Snippet--\r\n//\r\n//	Example:  [[videoresizer? &id=`[*id*]` &width=`300` &height=`350` &my_tv=`video`]]\r\n//                 \r\n////////////////////////////////////////////////////////////////////////////////////////////////////////////////////\r\n\r\n$video=$modx->runSnippet("getField", array(''docid''=>$id,''field'' =>$my_tv));\r\n\r\n$embed = preg_replace(''/(width)=("[^"]*")/i'', ''width=''.$width, $video);\r\n$embed = preg_replace(''/(height)=("[^"]*")/i'', ''height=''.$height, $embed);\r\n\r\necho $embed;\r\n', 0, '', ' '),
(21, 'get_to_var', '', 0, 4, 0, '\r\n$get_to_var_value= $_GET[$variable];\r\n// define the placeholder and set it''s value\r\n$modx->setPlaceholder(''var_got'',$get_to_var_value);\r\necho $get_to_var_value;\r\n', 0, '', ' '),
(22, 'WebLoginPE', '<strong>1.2.0</strong> A progressively enhanced, complete Web User management snippet.', 0, 0, 0, '\r\n	/**\r\n	 * WebLoginPE Snippet 1.3.1\r\n	 * v1.3.1 Bugfix by Soshite @ MODx CMS Forums & Various Other Forum Members\r\n	 *\r\n	 * @package WebLoginPE\r\n	 * @author Scotty Delicious\r\n	 * @version 1.3.1\r\n	 *\r\n	 * See the "docs" folder for detailed usage and parameter instructions.\r\n	 */\r\n\r\n	$type = isset($type) ? $type : ''simple'';\r\n	$regType = isset($regType) ? $regType : ''instant'';\r\n	$notify = isset($notify) ? $notify : '''';\r\n	$groups = isset($groups) ? $groups : '''';\r\n	$regRequired = isset($regRequired) ? $regRequired : '''';\r\n	$customTable = isset($customTable) ? $customTable : ''web_user_attributes_extended'';\r\n	$customFields = isset($customFields) ? $customFields : '''';\r\n	$prefixTable = isset($prefixTable) ? $prefixTable : 1;\r\n	$lang = isset($lang) ? $lang : ''en'';\r\n	$userImageSettings = isset($userImage) ? $userImage : ''105000,100,100'';\r\n	$dateFormat = isset($dateFormat) ? $dateFormat : ''%A %B %d, %Y at %I:%M %p'';\r\n	$disableServices = isset($disableServices) ? explode('','', str_replace('', '','','',$disableServices)) : array();\r\n	$tableCheck = isset($tableCheck) ? $tableCheck : 1;\r\n	\r\n	include_once MODX_BASE_PATH.''assets/snippets/webloginpe/webloginpe.class.php'';\r\n	include MODX_BASE_PATH.''assets/snippets/webloginpe/webloginpe.templates.php'';\r\n	if (file_exists(MODX_BASE_PATH.''assets/snippets/webloginpe/lang/''.$lang.''.php''))\r\n	{\r\n		include_once MODX_BASE_PATH.''assets/snippets/webloginpe/lang/''.$lang.''.php'';\r\n	}\r\n	else\r\n	{\r\n		include_once MODX_BASE_PATH.''assets/snippets/webloginpe/lang/en.php'';\r\n		$modx->setPlaceholder(''wlpe.message'', $wlpe_lang[105]);\r\n		print ''[+wlpe.message+]'';\r\n	}\r\n	\r\n	$wlpe = new WebLoginPE($wlpe_lang, $dateFormat, $userImageSettings, $type);\r\n	$wlpe->CustomTable($customTable, $customFields, $prefixTable, $tableCheck);\r\n\r\n	$liHomeId = isset($liHomeId) ? explode('','', $liHomeId) : '''';\r\n	$loHomeId = isset($loHomeId) ? $loHomeId : '''';\r\n	$regHomeId = isset($regHomeId) ? $regHomeId : '''';\r\n	$regSuccessId = isset($regSuccessId) ? $regSuccessId : '''';\r\n	$regSuccessPause = isset($regSuccessPause) ? $regSuccessPause : 5;\r\n	$profileHomeId = isset($profileHomeId) ? $profileHomeId : '''';\r\n	$inputHandler = isset($inputHandler) ? explode(''||'', $inputHandler) : array();\r\n	$usersList = isset($usersList) ? $usersList : '''';\r\n	\r\n	if ($regType == ''verify''){$wlpeRegisterTpl = $wlpeRegisterVerifyTpl;}else{$wlpeRegisterTpl = $wlpeRegisterInstantTpl;}\r\n	\r\n	$displayLoginFormTpl = isset($loginFormTpl) ? $wlpe->Template($loginFormTpl) : $wlpeDefaultFormTpl;\r\n	$displaySuccessTpl = isset($successTpl) ? $wlpe->Template($successTpl) : $wlpeDefaultSuccessTpl;\r\n	$displayRegisterTpl = isset($registerTpl) ? $wlpe->Template($registerTpl) : $wlpeRegisterTpl;\r\n	$displayRegSuccessTpl = isset($registerSuccessTpl) ? $wlpe->Template($registerSuccessTpl) : $wlpeDefaultFormTpl;\r\n	$displayProfileTpl = isset($profileTpl) ? $wlpe->Template($profileTpl) : $wlpeProfileTpl;\r\n	$displayViewProfileTpl = isset($viewProfileTpl) ? $wlpe->Template($viewProfileTpl) : $wlpeViewProfileTpl;\r\n	$displayUsersOuterTpl = isset($usersOuterTpl) ? $wlpe->Template($usersOuterTpl) : $wlpeUsersOuterTpl;\r\n	$displayUsersTpl = isset($usersTpl) ? $wlpe->Template($usersTpl) : $wlpeUsersTpl;\r\n	$displayManageOuterTpl = isset($manageOuterTpl) ? $wlpe->Template($manageOuterTpl) : $wlpeUsersOuterTpl;\r\n	$displayManageTpl = isset($manageTpl) ? $wlpe->Template($manageTpl) : $wlpeManageTpl;\r\n	$displayManageProfileTpl = isset($manageProfileTpl) ? $wlpe->Template($manageProfileTpl) : $wlpeManageProfileTpl;\r\n	$displayManageDeleteTpl = isset($manageDeleteTpl) ? $wlpe->Template($manageDeleteTpl) : $wlpeManageDeleteTpl;\r\n	$displayProfileDeleteTpl = isset($profileDeleteTpl) ? $wlpe->Template($profileDeleteTpl) : $wlpeProfileDeleteTpl;\r\n	$displayActivateTpl = isset($activateTpl) ? $wlpe->Template($activateTpl) : $wlpeActivateTpl;\r\n	$displayResetTpl = isset($resetTpl) ? $wlpe->Template($resetTpl) : $wlpeResetTpl;\r\n	$notifyTpl = isset($notifyTpl) ? $wlpe->Template($notifyTpl) : $wlpeNotifyTpl;\r\n	$notifySubject = isset($notifySubject) ? $notifySubject : ''New Web User for ''.$modx->config[''site_name''].''.'';\r\n	$messageTpl = isset($messageTpl) ? $wlpe->Template($messageTpl) : $wlpeMessageTpl;\r\n	$tosChunk = isset($tosChunk) ? $wlpe->Template($tosChunk) : $wlpeTos;\r\n	$modx->setPlaceholder(''tos'', $tosChunk);\r\n	\r\n	$loadJquery = isset($loadJquery) ? $loadJquery : false;\r\n	$customJs = isset($customJs) ? $customJs : '''';\r\n	\r\n	if (isset($pruneDays))\r\n	{\r\n		$wlpe->PruneUsers($pruneDays);\r\n	}\r\n		\r\n	if ($loadJquery == ''true'' || $loadJquery == true || $loadJquery == 1 || $loadJquery == ''1'') \r\n	{\r\n		$wlpe->RegisterScripts($customJs);\r\n	}\r\n	else if (!empty($customJs))\r\n	{\r\n		$modx->regClientStartupScript($customJs);\r\n	}\r\n	\r\n	$wlpe->ActiveUsers();\r\n	$wlpe->PlaceHolders($inputHandler, $messageTpl);\r\n	\r\n	$modx->regClientStartupScript(''assets/snippets/webloginpe/js/ieButtonFix.js'');\r\n\r\n	$service = $_REQUEST[''service''];\r\n	if (empty($service) || $service == '''')\r\n	{\r\n		$service = $_REQUEST[''serviceButtonValue''];\r\n	}\r\n	\r\n	if ($type == ''register'')\r\n	{\r\n		if (in_array(''register'', $disableServices)){return;}\r\n		switch ($service) \r\n		{\r\n			case ''register'' :\r\n				if (in_array(''register'', $disableServices)){return;}\r\n				$registration = $wlpe->Register($regType, $groups, $regRequired, $notify, $notifyTpl, $notifySubject);\r\n				\r\n				if (isset($regSuccessId) && $regSuccessId !== '''')\r\n				{\r\n					if ($registration == ''success'')\r\n					{\r\n						$url = rtrim($modx->config[''site_url''], ''/'').$modx->makeURL($regSuccessId);\r\n						header(''Refresh: ''.$regSuccessPause.'';URL=''.$url);\r\n						return $displayRegSuccessTpl;\r\n					}\r\n					return $displayRegisterTpl;\r\n					\r\n				}\r\n				if ($registration == ''success'')\r\n				{\r\n					return $displayRegSuccessTpl;\r\n				}\r\n				return $displayRegisterTpl;\r\n				break;\r\n				\r\n			case ''cancel'':\r\n				if ($loHomeId == '''') $loHomeId = $modx->config[''site_start''];\r\n				$url = $modx->makeURL($loHomeId);\r\n		        $modx->sendRedirect($url,0,''REDIRECT_REFRESH'');\r\n				break;\r\n			\r\n			case ''login'' :\r\n				$wlpe->Login($type, $liHomeId);\r\n\r\n				if ($modx->getLoginUserID())\r\n				{\r\n					return $displaySuccessTpl;\r\n				}\r\n				return $displayLoginFormTpl;\r\n				break;\r\n\r\n			case ''logout'' :\r\n				$wlpe->Logout($type, $loHomeId);\r\n				return $displayLoginFormTpl;\r\n				break;\r\n			\r\n			default :\r\n				return $displayRegisterTpl;\r\n		}\r\n		return;\r\n	}\r\n	\r\n	else if ($type == ''profile'')\r\n	{\r\n		if (in_array(''profile'', $disableServices)){return;}\r\n		switch ($service) \r\n		{\r\n			case ''saveprofile'' :\r\n				if (in_array(''saveprofile'', $disableServices)){return;}\r\n				$wlpe->SaveUserProfile();\r\n				$wlpe->PlaceHolders($inputHandler, $messageTpl);\r\n				return $displayProfileTpl;\r\n				break;\r\n				\r\n			case ''cancel'':\r\n				if ($loHomeId == '''') $loHomeId = $modx->config[''site_start''];\r\n				$url = $modx->makeURL($loHomeId);\r\n		        $modx->sendRedirect($url,0,''REDIRECT_REFRESH'');\r\n				break;\r\n				\r\n			case ''logout'':\r\n				if ($loHomeId == '''') $loHomeId = $modx->config[''site_start''];\r\n				$wlpe->Logout($type, $loHomeId);\r\n				break;\r\n				\r\n			case ''deleteprofile'':\r\n				if (in_array(''deleteprofile'', $disableServices)){return;}\r\n				return $displayProfileDeleteTpl;\r\n				break;\r\n			\r\n			case ''confirmdeleteprofile'':\r\n				if (in_array(''confirmdeleteprofile'', $disableServices)){return;}\r\n				$wlpe->RemoveUserProfile();\r\n				return ''[+wlpe.message+]'';\r\n				break;\r\n				\r\n			default :\r\n				return $displayProfileTpl;\r\n				break;\r\n		}\r\n		return;\r\n	}\r\n	\r\n	else if ($type == ''users'')\r\n	{\r\n		if (in_array(''users'', $disableServices)){return;}\r\n		switch ($service)\r\n		{\r\n			case ''viewprofile'':\r\n				if (in_array(''viewprofile'', $disableServices)){return;}\r\n				$wlpe->ViewUserProfile($_REQUEST[''username''],$inputHandler);\r\n				return $displayViewProfileTpl;\r\n				break;\r\n				\r\n			case ''messageuser'':\r\n				if (in_array(''messageuser'', $disableServices)){return;}\r\n				$wlpe->SendMessageToUser();\r\n				return $displayViewProfileTpl;\r\n				break;\r\n			\r\n			default :\r\n				$userpage = $wlpe->ViewAllUsers($displayUsersTpl, $displayUsersOuterTpl, $usersList);\r\n				return $userpage;\r\n		}\r\n		return;\r\n	}\r\n	\r\n	else if ($type == ''manager'')\r\n	{\r\n		if (in_array(''manager'', $disableServices)){return;}\r\n		switch ($service)\r\n		{\r\n			case ''editprofile'':\r\n				if (in_array(''editprofile'', $disableServices)){return;}\r\n				$wlpe->ViewUserProfile($_REQUEST[''username''],$inputHandler);\r\n				return $displayManageProfileTpl;\r\n				break;\r\n				\r\n			case ''saveuserprofile'' :\r\n				if (in_array(''saveuserprofile'', $disableServices)){return;}\r\n				$wlpe->SaveUserProfile($_POST[''internalKey'']);\r\n				$manageUsersPage = $wlpe->ViewAllUsers($displayManageTpl, $displayManageOuterTpl, $usersList);\r\n				return $manageUsersPage;\r\n				break;\r\n				\r\n			case ''messageuser'':\r\n				if (in_array(''messageuser'', $disableServices)){return;}\r\n				$wlpe->SendMessageToUser();\r\n				return $displayViewProfileTpl;\r\n				break;\r\n				\r\n			case ''deleteuser'':\r\n				if (in_array(''deleteuser'', $disableServices)){return;}\r\n				$_SESSION[''editInternalKey''] = $_POST[''internalKey''];\r\n				return $displayManageDeleteTpl;\r\n				break;\r\n\r\n			case ''confirmdeleteuser'':\r\n				if (in_array(''confirmdeleteuser'', $disableServices)){return;}\r\n				$wlpe->RemoveUserProfileManager($_SESSION[''editInternalKey'']);\r\n				$manageUsersPage = $wlpe->ViewAllUsers($displayManageTpl, $displayManageOuterTpl, $usersList);\r\n				unset($_SESSION[''editInternalKey'']);\r\n				return $manageUsersPage;\r\n				break;\r\n			\r\n			default :\r\n				$manageUsersPage = $wlpe->ViewAllUsers($displayManageTpl, $displayManageOuterTpl, $usersList);\r\n				return $manageUsersPage;\r\n		}\r\n		return;\r\n	}\r\n	\r\n	else if ($type == ''simple'')\r\n	{\r\n		switch ($service) \r\n		{\r\n\r\n			case ''login'' :\r\n				$wlpe->Login($type, $liHomeId);\r\n\r\n				if ($modx->getLoginUserID())\r\n				{\r\n					return $displaySuccessTpl;\r\n				}\r\n				return $displayLoginFormTpl;\r\n				break;\r\n\r\n			case ''logout'' :\r\n				$wlpe->Logout($type, $loHomeId);\r\n				return $displayLoginFormTpl;\r\n				break;\r\n\r\n			case ''profile'' :\r\n				if (in_array(''profile'', $disableServices)){return;}\r\n				if (empty($profileHomeId))\r\n				{\r\n					return $displayProfileTpl;\r\n				}\r\n				$url = $modx->makeURL($profileHomeId);\r\n		        $modx->sendRedirect($url,0,''REDIRECT_REFRESH'');\r\n		        return;\r\n				break;\r\n				\r\n			case ''saveprofilesimple'' :\r\n				if (in_array(''saveprofile'', $disableServices)){return;}\r\n				$wlpe->SaveUserProfile();\r\n				$wlpe->PlaceHolders($inputHandler, $messageTpl);\r\n				return $displayProfileTpl;\r\n				break;\r\n			\r\n			case ''deleteprofilesimple'':\r\n				if (in_array(''deleteprofile'', $disableServices)){return;}\r\n				return $displayProfileDeleteTpl;\r\n				break;\r\n\r\n			case ''confirmdeleteprofilesimple'':\r\n				if (in_array(''confirmdeleteprofile'', $disableServices)){return;}\r\n				$wlpe->RemoveUserProfile();\r\n				return ''[+wlpe.message+]'';\r\n				break;\r\n\r\n			case ''registernew'' :\r\n				if (in_array(''register'', $disableServices)){return;}\r\n				if (empty($regHomeId))\r\n				{\r\n					return $displayRegisterTpl;\r\n				}\r\n				$url = $modx->makeURL($regHomeId);\r\n		        $modx->sendRedirect($url,0,''REDIRECT_REFRESH'');\r\n		        return;\r\n				break;\r\n				\r\n			case ''register'':\r\n				if (in_array(''register'', $disableServices)){return;}\r\n				$registration = $wlpe->Register($regType, $groups, $regRequired, $notify, $notifyTpl, $notifySubject);\r\n				\r\n				if (isset($regSuccessId) && $regSuccessId !== '''')\r\n				{\r\n					if ($registration == ''success'')\r\n					{\r\n						$url = rtrim($modx->config[''site_url''], ''/'').$modx->makeURL($regSuccessId);\r\n						header(''Refresh: ''.$regSuccessPause.'';URL=''.$url);\r\n						return $displayRegSuccessTpl;\r\n					}\r\n					return $displayRegisterTpl;\r\n					\r\n				}\r\n				if ($registration == ''success'')\r\n				{\r\n					return $displayRegSuccessTpl;\r\n				}\r\n				return $displayRegisterTpl;\r\n				break;\r\n\r\n			case ''forgot'' :\r\n				if (in_array(''forgot'', $disableServices)){return;}\r\n				return $displayResetTpl;\r\n				break;\r\n			\r\n			case ''resetpassword'' :\r\n				if (in_array(''resetpassword'', $disableServices)){return;}\r\n				$wlpe->ResetPassword();\r\n				if (isset($wlpe->Report)) \r\n				{\r\n					if (isset($_POST[''email'']))\r\n					{\r\n						return $displayResetTpl;\r\n					}\r\n					else\r\n					{\r\n						return $displayActivateTpl;\r\n					}\r\n				}\r\n				return;\r\n				break;\r\n			\r\n			case ''activate'' :\r\n				if (in_array(''activate'', $disableServices)){return;}\r\n				return $displayActivateTpl;\r\n				break;\r\n			\r\n			case ''activated'':\r\n                if (in_array(''activated'', $disableServices)){return;}\r\n                $wlpe->ActivateUser();\r\n                // pixelchutes 1:57 AM 9/19/2007\r\n                // Here we check for an error, then reload the activation template if necessary\r\n                // Do NOT reload if wlpe->Report indicates success\r\n                 // Added strip_tags() around string which means an error is not thrown regarding a modifier from closing\r\n                // html tag e.g. if $wlpe_lang[104] contains "</div>" this will fail as "/d" treated as modifier\r\n                if ( isset( $wlpe->Report ) && !preg_match( "/".strip_tags($wlpe_lang[104])."/i", $wlpe->Report ) )\r\n                {\r\n                    return $displayActivateTpl;\r\n                }                \r\n                return $displayLoginFormTpl;\r\n                break;\r\n			\r\n			default :\r\n				\r\n				if ($modx->getLoginUserID())\r\n				{\r\n					return $displaySuccessTpl;\r\n				}\r\n				else\r\n				{\r\n					$wlpe->AutoLogin();\r\n					return $displayLoginFormTpl;\r\n				}\r\n\r\n		}// [END] Switch : $service for simple.\r\n	}\r\n	\r\n	else if ($type == ''taconite'')\r\n	{\r\n		switch ($service) \r\n		{\r\n\r\n			case ''login'' :\r\n				$wlpe->Login($type, $liHomeId);\r\n\r\n				if (isset($wlpe->Report)) \r\n				{\r\n					return $wlpe->Report;\r\n				}\r\n				return;\r\n				break;\r\n\r\n			case ''logout'' :\r\n				$wlpe->Logout($type, $loHomeId);				\r\n				return;\r\n				break;\r\n\r\n			case ''register'' :\r\n				if (in_array(''register'', $disableServices)){return;}\r\n				$wlpe->Register($regType, $groups, $regRequired, $notify, $notifyTpl, $notifySubject);\r\n				return $wlpe->Report;\r\n				break;\r\n			\r\n			case ''resetpassword'' :\r\n				if (in_array(''resetpassword'', $disableServices)){return;}\r\n				$wlpe->ResetPassword();\r\n				return $wlpe->Report;\r\n				break;\r\n				\r\n			case ''activated'':\r\n				if (in_array(''activated'', $disableServices)){return;}\r\n				$wlpe->ActivateUser();\r\n				return $wlpe->Report;\r\n				break;\r\n					\r\n			default :\r\n				if ($modx->getLoginUserID())\r\n				{\r\n					return;\r\n				}\r\n				else\r\n				{\r\n					$wlpe->AutoLogin();\r\n				}\r\n		}// [END] Switch : $service for taconite.\r\n	}\r\n	\r\n	else\r\n	{\r\n		return;\r\n	}\r\n', 0, '', ' '),
(23, 'GetField', '', 0, 0, 0, '\r\n/*\r\n==================================================\r\n	GetField\r\n==================================================\r\n\r\nReturns any document field or template variable from any document or any of its parents.\r\n\r\nAuthor: Grzegorz Adamiak [grad]\r\nVersion: 1.3 beta @2006-11-08 14:40:04\r\nLicense: LGPL\r\nMODx: 0.9.2.1+\r\n\r\nSee GetField.txt for instructions and version history.\r\n--------------------------------------------------\r\n*/\r\n\r\n/* Parameters\r\n----------------------------------------------- */\r\n\r\n# $docid [ int ]\r\n# ID of the document for which to get a field content.\r\n# Default: current document\r\n\r\n$gfIntDocId = (isset($docid)) ? $docid : $modx->documentIdentifier;\r\n\r\n# $field [ string ]\r\n# Name of the field for which to get the content:\r\n# - any of the document object fields (http://modxcms.com/the-document-object.html)\r\n# - template variable\r\n# Default: ''pagetitle''\r\n\r\n$gfStrDocField = (isset($field)) ? trim($field) : ''pagetitle'';\r\n\r\n# $parent [ 0 | 1 ]\r\n# If set to 1, the snippet will return value for the document parent.\r\n# Default: 0\r\n\r\n$gfBoolParent = (isset($parent)) ? $parent : 0;\r\n\r\n# $parentLevel [ int ]\r\n# Specifies how high in the document tree to search for the parent of the document:\r\n# - $parentLevel = 0 - returns the ultimate parent (right under site root)\r\n# - $parentLevel = 1 - returns the direct parent\r\n# Default: 0\r\n\r\n$gfIntParentLevel = (isset($parentLevel) && is_int((int) $parentLevel)) ? $parentLevel : 0;\r\n\r\n# $topid [ int ]\r\n# Id of the topmost document in the document tree under which to search for a parent. Used only with $parent set to 1.\r\n# Default: 0\r\n\r\n$gfIntTopDocId = (isset($topid) && is_int((int) $topid)) ? $topid : 0;\r\n\r\n/* Do not edit the code below!\r\n----------------------------------------------- */\r\n\r\n# Include logic\r\ninclude_once(''assets/snippets/getfield/getfield.inc.php'');\r\n\r\n# Get parent document ID\r\nif ($gfBoolParent)\r\n	$gfIntDocId = gfGetParentId($modx, $gfIntDocId, $gfIntTopDocId, $gfIntParentLevel);\r\n\r\n# Get content of the field\r\n$output = gfGetFieldContent($modx,$gfIntDocId,$gfStrDocField);\r\n\r\nunset($gfIntDocId, $gfStrDocField, $gfBoolParent, $gfIntParentLevel, $gfIntTopDocId);\r\n\r\nreturn $output;\r\n\r\n', 0, '', ' ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_templates`
--

CREATE TABLE IF NOT EXISTS `modx_site_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.' AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `modx_site_templates`
--

INSERT INTO `modx_site_templates` (`id`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`) VALUES
(3, 'minimal', 'Default minimal empty template (content returned only)', 0, 0, '', 0, '[*content*]', 0),
(4, 'GENERICO', '', 0, 0, '', 0, '{{head}}\r\n</head>\r\n<body>\r\n[*content*]\r\n	[+content:notags:limit=`85`+]\r\n{{footer}}', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_tmplvars`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Template Variables' AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `modx_site_tmplvars`
--

INSERT INTO `modx_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`) VALUES
(1, 'image', 'imagen', 'imagen', '', 0, 8, 0, '', 0, '', '', ''),
(2, 'image', 'imagen1', 'imagen1', '', 0, 8, 0, '', 0, '', '', ''),
(3, 'image', 'imagen2', 'imagen2', '', 0, 8, 0, '', 0, '', '', ''),
(4, 'image', 'imagen3', 'imagen3', '', 0, 8, 0, '', 0, '', '', ''),
(5, 'image', 'imagen4', 'imagen4', '', 0, 8, 0, '', 0, '', '', ''),
(6, 'image', 'imagen6', 'imagen6', '', 0, 8, 0, '', 0, '', '', ''),
(7, 'image', 'imagen7', 'imagen7', '', 0, 8, 0, '', 0, '', '', ''),
(8, 'image', 'imagen8', 'imagen8', '', 0, 8, 0, '', 0, '', '', ''),
(9, 'image', 'imagen9', 'imagen9', '', 0, 8, 0, '', 0, '', '', ''),
(10, 'image', 'imagen10', 'imagen10', '', 0, 8, 0, '', 0, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_tmplvar_access`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_tmplvar_contentvalues`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table' AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_site_tmplvar_templates`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';

--
-- Volcado de datos para la tabla `modx_site_tmplvar_templates`
--

INSERT INTO `modx_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(1, 4, 0),
(2, 4, 0),
(3, 4, 0),
(4, 4, 0),
(5, 4, 0),
(6, 4, 0),
(7, 4, 0),
(8, 4, 0),
(9, 4, 0),
(10, 4, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_system_eventnames`
--

CREATE TABLE IF NOT EXISTS `modx_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='System Event Names.' AUTO_INCREMENT=1001 ;

--
-- Volcado de datos para la tabla `modx_system_eventnames`
--

INSERT INTO `modx_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnDocPublished', 5, ''),
(2, 'OnDocUnPublished', 5, ''),
(3, 'OnWebPagePrerender', 5, ''),
(4, 'OnWebLogin', 3, ''),
(5, 'OnBeforeWebLogout', 3, ''),
(6, 'OnWebLogout', 3, ''),
(7, 'OnWebSaveUser', 3, ''),
(8, 'OnWebDeleteUser', 3, ''),
(9, 'OnWebChangePassword', 3, ''),
(10, 'OnWebCreateGroup', 3, ''),
(11, 'OnManagerLogin', 2, ''),
(12, 'OnBeforeManagerLogout', 2, ''),
(13, 'OnManagerLogout', 2, ''),
(14, 'OnManagerSaveUser', 2, ''),
(15, 'OnManagerDeleteUser', 2, ''),
(16, 'OnManagerChangePassword', 2, ''),
(17, 'OnManagerCreateGroup', 2, ''),
(18, 'OnBeforeCacheUpdate', 4, ''),
(19, 'OnCacheUpdate', 4, ''),
(20, 'OnLoadWebPageCache', 4, ''),
(21, 'OnBeforeSaveWebPageCache', 4, ''),
(22, 'OnChunkFormPrerender', 1, 'Chunks'),
(23, 'OnChunkFormRender', 1, 'Chunks'),
(24, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(25, 'OnChunkFormSave', 1, 'Chunks'),
(26, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(27, 'OnChunkFormDelete', 1, 'Chunks'),
(28, 'OnDocFormPrerender', 1, 'Documents'),
(29, 'OnDocFormRender', 1, 'Documents'),
(30, 'OnBeforeDocFormSave', 1, 'Documents'),
(31, 'OnDocFormSave', 1, 'Documents'),
(32, 'OnBeforeDocFormDelete', 1, 'Documents'),
(33, 'OnDocFormDelete', 1, 'Documents'),
(34, 'OnPluginFormPrerender', 1, 'Plugins'),
(35, 'OnPluginFormRender', 1, 'Plugins'),
(36, 'OnBeforePluginFormSave', 1, 'Plugins'),
(37, 'OnPluginFormSave', 1, 'Plugins'),
(38, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(39, 'OnPluginFormDelete', 1, 'Plugins'),
(40, 'OnSnipFormPrerender', 1, 'Snippets'),
(41, 'OnSnipFormRender', 1, 'Snippets'),
(42, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(43, 'OnSnipFormSave', 1, 'Snippets'),
(44, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(45, 'OnSnipFormDelete', 1, 'Snippets'),
(46, 'OnTempFormPrerender', 1, 'Templates'),
(47, 'OnTempFormRender', 1, 'Templates'),
(48, 'OnBeforeTempFormSave', 1, 'Templates'),
(49, 'OnTempFormSave', 1, 'Templates'),
(50, 'OnBeforeTempFormDelete', 1, 'Templates'),
(51, 'OnTempFormDelete', 1, 'Templates'),
(52, 'OnTVFormPrerender', 1, 'Template Variables'),
(53, 'OnTVFormRender', 1, 'Template Variables'),
(54, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(55, 'OnTVFormSave', 1, 'Template Variables'),
(56, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(57, 'OnTVFormDelete', 1, 'Template Variables'),
(58, 'OnUserFormPrerender', 1, 'Users'),
(59, 'OnUserFormRender', 1, 'Users'),
(60, 'OnBeforeUserFormSave', 1, 'Users'),
(61, 'OnUserFormSave', 1, 'Users'),
(62, 'OnBeforeUserFormDelete', 1, 'Users'),
(63, 'OnUserFormDelete', 1, 'Users'),
(64, 'OnWUsrFormPrerender', 1, 'Web Users'),
(65, 'OnWUsrFormRender', 1, 'Web Users'),
(66, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
(67, 'OnWUsrFormSave', 1, 'Web Users'),
(68, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
(69, 'OnWUsrFormDelete', 1, 'Web Users'),
(70, 'OnSiteRefresh', 1, ''),
(71, 'OnFileManagerUpload', 1, ''),
(72, 'OnModFormPrerender', 1, 'Modules'),
(73, 'OnModFormRender', 1, 'Modules'),
(74, 'OnBeforeModFormDelete', 1, 'Modules'),
(75, 'OnModFormDelete', 1, 'Modules'),
(76, 'OnBeforeModFormSave', 1, 'Modules'),
(77, 'OnModFormSave', 1, 'Modules'),
(78, 'OnBeforeWebLogin', 3, ''),
(79, 'OnWebAuthentication', 3, ''),
(80, 'OnBeforeManagerLogin', 2, ''),
(81, 'OnManagerAuthentication', 2, ''),
(82, 'OnSiteSettingsRender', 1, 'System Settings'),
(83, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(84, 'OnUserSettingsRender', 1, 'System Settings'),
(85, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(86, 'OnMiscSettingsRender', 1, 'System Settings'),
(87, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(88, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(89, 'OnManagerPageInit', 2, ''),
(90, 'OnWebPageInit', 5, ''),
(101, 'OnLoadDocumentObject', 5, ''),
(91, 'OnLoadWebDocument', 5, ''),
(92, 'OnParseDocument', 5, ''),
(93, 'OnManagerLoginFormRender', 2, ''),
(94, 'OnWebPageComplete', 5, ''),
(95, 'OnLogPageHit', 5, ''),
(96, 'OnBeforeManagerPageInit', 2, ''),
(97, 'OnBeforeEmptyTrash', 1, 'Documents'),
(98, 'OnEmptyTrash', 1, 'Documents'),
(99, 'OnManagerLoginFormPrerender', 2, ''),
(100, 'OnStripAlias', 1, 'Documents'),
(200, 'OnCreateDocGroup', 1, 'Documents'),
(201, 'OnManagerWelcomePrerender', 2, ''),
(202, 'OnManagerWelcomeHome', 2, ''),
(203, 'OnManagerWelcomeRender', 2, ''),
(204, 'OnBeforeDocDuplicate', 1, 'Documents'),
(205, 'OnDocDuplicate', 1, 'Documents'),
(206, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(207, 'OnManagerPreFrameLoader', 2, ''),
(208, 'OnManagerFrameLoader', 2, ''),
(209, 'OnManagerTreeInit', 2, ''),
(210, 'OnManagerTreePrerender', 2, ''),
(211, 'OnManagerTreeRender', 2, ''),
(212, 'OnManagerNodePrerender', 2, ''),
(213, 'OnManagerNodeRender', 2, ''),
(999, 'OnPageUnauthorized', 1, ''),
(1000, 'OnPageNotFound', 1, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_system_settings`
--

CREATE TABLE IF NOT EXISTS `modx_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

--
-- Volcado de datos para la tabla `modx_system_settings`
--

INSERT INTO `modx_system_settings` (`setting_name`, `setting_value`) VALUES
('manager_theme', 'MODxRE'),
('settings_version', '1.0.12'),
('show_meta', '0'),
('server_offset_time', '0'),
('server_protocol', 'http'),
('manager_language', 'spanish-utf8'),
('modx_charset', 'UTF-8'),
('site_name', 'Web'),
('site_start', '1'),
('error_page', '1'),
('unauthorized_page', '1'),
('site_status', '1'),
('site_unavailable_message', 'The site is currently unavailable'),
('track_visitors', '0'),
('top_howmany', '10'),
('auto_template_logic', 'sibling'),
('default_template', '4'),
('old_template', '4'),
('publish_default', '1'),
('cache_default', '1'),
('search_default', '1'),
('friendly_urls', '1'),
('friendly_url_prefix', ''),
('friendly_url_suffix', ''),
('friendly_alias_urls', '1'),
('use_alias_path', '1'),
('use_udperms', '1'),
('udperms_allowroot', '0'),
('failed_login_attempts', '3'),
('blocked_minutes', '60'),
('use_captcha', '0'),
('captcha_words', 'MODX,Access,Better,BitCode,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Tattoo,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('emailsender', 'ccarbonell@gmail.com'),
('email_method', 'mail'),
('smtp_auth', '0'),
('smtp_host', ''),
('smtp_port', '25'),
('smtp_username', ''),
('emailsubject', 'Tu información de usuario'),
('number_of_logs', '100'),
('number_of_messages', '30'),
('number_of_results', '20'),
('use_editor', '1'),
('use_browser', '1'),
('rb_base_dir', 'C:/wamp/www/vozfiles2/assets/'),
('rb_base_url', 'assets/'),
('which_editor', 'TinyMCE'),
('fe_editor_lang', 'spanish-utf8'),
('fck_editor_toolbar', 'standard'),
('fck_editor_autolang', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('strip_image_paths', '1'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('upload_flash', 'fla,flv,swf'),
('upload_files', 'aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip'),
('upload_maxsize', '1048576'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('filemanager_path', 'C:/wamp/www/vozfiles2/'),
('theme_refresher', ''),
('manager_layout', '4'),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('auto_menuindex', '1'),
('session.cookie.lifetime', '604800'),
('mail_check_timeperiod', '60'),
('manager_direction', 'ltr'),
('tinymce_editor_theme', 'editor'),
('tinymce_custom_plugins', 'style,advimage,advlink,searchreplace,print,contextmenu,paste,fullscreen,nonbreaking,xhtmlxtras,visualchars,media'),
('tinymce_custom_buttons1', 'undo,redo,selectall,separator,pastetext,pasteword,separator,search,replace,separator,nonbreaking,hr,charmap,separator,image,link,unlink,anchor,media,separator,cleanup,removeformat,separator,fullscreen,print,code,help'),
('tinymce_custom_buttons2', 'bold,italic,underline,strikethrough,sub,sup,separator,bullist,numlist,outdent,indent,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,styleselect,formatselect,separator,styleprops'),
('tree_show_protected', '0'),
('rss_url_news', 'http://feeds.feedburner.com/modx-announce'),
('rss_url_security', 'http://feeds.feedburner.com/modxsecurity'),
('validate_referer', '1'),
('datepicker_offset', '-10'),
('xhtml_urls', '1'),
('allow_duplicate_alias', '0'),
('automatic_alias', '1'),
('datetime_format', 'dd-mm-YYYY'),
('warning_visibility', '1'),
('remember_last_tab', '0'),
('enable_bindings', '1'),
('seostrict', '0'),
('cache_type', '1'),
('maxImageWidth', '1600'),
('maxImageHeight', '1200'),
('thumbWidth', '150'),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('jpegQuality', '90'),
('denyZipDownload', '0'),
('denyExtensionRename', '0'),
('showHiddenFiles', '0'),
('docid_incrmnt_method', '0'),
('make_folders', '1'),
('site_id', '52d3cc991f6ce'),
('site_unavailable_page', ''),
('reload_site_unavailable', ''),
('siteunavailable_message_default', 'Este sitio no está disponible en este momento.'),
('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\nmanager/includes/config.inc.php'),
('error_reporting', '1'),
('send_errormail', '3'),
('pwd_hash_algo', 'UNCRYPT'),
('reload_captcha_words', ''),
('captcha_words_default', 'MODX,Aceso,Mejor,BitCode,Chunk,Cache,Desc,Diseno,Excel,Disfruta,URLs,TechView,Gerald,Griff,Humphrey,Vacacion,Intel,Integracion,Joystick,Join(),Oscope,Genetico,Luz,Parecido,Marit,Maaike,Nicho,Holanda,Ordinancia,Oscillo,Parser,Fusion,Query,Pregunta,Regalia,Correcto,Snippet,Sentinela,Template,Thespian,Unidad,Enterprise,Verily,Tatuaje,Veri,Website,WideWeb,Yap,Amarillo,Zebra,Zigoto'),
('reload_emailsubject', ''),
('emailsubject_default', 'Tus detalles de entrada'),
('reload_signupemail_message', ''),
('signupemail_message', 'Hola [+uid+] \r\n\r\nAquí tienes los detalles de inicio de sesión para el Administrador de Contenido de [+sname+]:\r\n\r\nNombre de usuario: [+uid+]\r\nContraseña: [+pwd+]\r\n\r\nUna vez que has ingresado al Administrador de Contenido de ([+surl+]), puedes cambiar tu contraseña.\r\n\r\nSaludos,\r\nEl Administrador'),
('system_email_signup_default', 'Hola [+uid+] \r\n\r\nAquí tienes los detalles de inicio de sesión para el Administrador de Contenido de [+sname+]:\r\n\r\nNombre de usuario: [+uid+]\r\nContraseña: [+pwd+]\r\n\r\nUna vez que has ingresado al Administrador de Contenido de ([+surl+]), puedes cambiar tu contraseña.\r\n\r\nSaludos,\r\nEl Administrador'),
('reload_websignupemail_message', ''),
('websignupemail_message', 'Hola [+uid+] \r\n\r\nAquí tienes los detalles de ingreso para [+sname+]:\r\n\r\nNombre de usuario: [+uid+]\r\nContraseña: [+pwd+]\r\n\r\nUna vez que ingreses a [+sname+] ([+surl+]), puedes cambiar tu contraseña.\r\n\r\nSaludos,\r\nEl Administrador'),
('system_email_websignup_default', 'Hola [+uid+] \r\n\r\nAquí tienes los detalles de ingreso para [+sname+]:\r\n\r\nNombre de usuario: [+uid+]\r\nContraseña: [+pwd+]\r\n\r\nUna vez que ingreses a [+sname+] ([+surl+]), puedes cambiar tu contraseña.\r\n\r\nSaludos,\r\nEl Administrador'),
('reload_system_email_webreminder_message', ''),
('webpwdreminder_message', 'Hola [+uid+]\r\n\r\nPara activar tu contraseña nueva haz clic en el siguiente enlace:\r\n\r\n[+surl+]\r\n\r\nSi tienes éxito puedes usar la siguiente contraseña para ingresar:\r\n\r\nContraseña:[+pwd+]\r\n\r\nSi no solicitaste este email entonces por favor ignóralo.\r\n\r\nSaludos,\r\nEl Administrador'),
('system_email_webreminder_default', 'Hola [+uid+]\r\n\r\nPara activar tu contraseña nueva haz clic en el siguiente enlace:\r\n\r\n[+surl+]\r\n\r\nSi tienes éxito puedes usar la siguiente contraseña para ingresar:\r\n\r\nContraseña:[+pwd+]\r\n\r\nSi no solicitaste este email entonces por favor ignóralo.\r\n\r\nSaludos,\r\nEl Administrador'),
('tree_page_click', '27'),
('resource_tree_node_name', 'pagetitle'),
('rb_webuser', '0'),
('clean_uploaded_filename', '0'),
('mce_editor_skin', 'default'),
('mce_template_docs', ''),
('mce_template_chunks', ''),
('mce_entermode', 'p'),
('mce_element_format', 'xhtml'),
('mce_schema', 'html4'),
('tinymce_custom_buttons3', ''),
('tinymce_custom_buttons4', ''),
('tinymce_css_selectors', 'left=justifyleft;right=justifyright'),
('sys_files_checksum', 'a:4:{s:31:"C:/wamp/www/vozfiles2/index.php";s:32:"cd008df3faa7d7ecbce5b05480fa8c34";s:31:"C:/wamp/www/vozfiles2/.htaccess";s:32:"0e994f4434ab3078273858572ad10776";s:39:"C:/wamp/www/vozfiles2/manager/index.php";s:32:"ef228d1a7e707d376ab4e2ec314c7f6c";s:53:"C:/wamp/www/vozfiles2/manager/includes/config.inc.php";s:32:"ab12cb83e2e95055aec045473d9577dc";}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_user_attributes`
--

CREATE TABLE IF NOT EXISTS `modx_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.' AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `modx_user_attributes`
--

INSERT INTO `modx_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`) VALUES
(1, 1, 'Default admin account', 1, 'ccarbonell@gmail.com', '', '', 0, 0, 0, 2, 1389612195, 1390560559, 0, 'lrkggf2fl32st84qggc8vomhi3', 0, 0, '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_user_messages`
--

CREATE TABLE IF NOT EXISTS `modx_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_user_roles`
--

CREATE TABLE IF NOT EXISTS `modx_user_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `manage_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'manage site meta tags and keywords',
  `edit_doc_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'edit document meta tags and keywords',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.' AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `modx_user_roles`
--

INSERT INTO `modx_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `file_manager`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `manage_metatags`, `edit_doc_metatags`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`) VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_user_settings`
--

CREATE TABLE IF NOT EXISTS `modx_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_webgroup_access`
--

CREATE TABLE IF NOT EXISTS `modx_webgroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_webgroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_webgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_web_groups`
--

CREATE TABLE IF NOT EXISTS `modx_web_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_web_users`
--

CREATE TABLE IF NOT EXISTS `modx_web_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_web_user_attributes`
--

CREATE TABLE IF NOT EXISTS `modx_web_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modx_web_user_settings`
--

CREATE TABLE IF NOT EXISTS `modx_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`webuser`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
