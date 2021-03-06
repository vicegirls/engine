# SQLiteManager Dump
# Version: 1.2.4
# http://www.sqlitemanager.org/
# 
# Host: localhost
# Generation Time: Friday 06th 2012f January 2012 03:11 pm
# SQLite Version: 3.6.15
# PHP Version: 5.3.0
# Database: tuxxedo.sqlite3
# --------------------------------------------------------

#
# Table structure for table: datastore
#
CREATE TABLE 'datastore' (
'name' VARCHAR(128) NOT NULL PRIMARY KEY,
'data' TEXT NOT NULL
);

#
# Dumping data for table: datastore
#
INSERT INTO `datastore` (`name`, `data`) VALUES('languages', 'a:1:{i:1;a:6:{s:2:"id";s:1:"1";s:5:"title";s:7:"English";s:9:"developer";s:28:"Tuxxedo Software Development";s:8:"isotitle";s:2:"en";s:7:"default";s:1:"1";s:7:"charset";s:5:"UTF-8";}}');
INSERT INTO `datastore` (`name`, `data`) VALUES('optioncategories', 'a:4:{i:0;s:8:"datetime";i:1;s:8:"language";i:2;s:7:"session";i:3;s:5:"style";}');
INSERT INTO `datastore` (`name`, `data`) VALUES('options', 'a:11:{s:13:"cookie_domain";s:0:"";s:14:"cookie_expires";i:1800;s:11:"cookie_path";s:0:"";s:13:"cookie_prefix";s:8:"tuxxedo_";s:13:"cookie_secure";b:0;s:11:"date_format";s:14:"H:i:s, j/n - Y";s:13:"date_timezone";s:3:"UTC";s:20:"date_timezone_offset";i:0;s:11:"language_id";i:1;s:8:"style_id";i:1;s:13:"style_storage";s:8:"database";}');
INSERT INTO `datastore` (`name`, `data`) VALUES('permissions', 'a:1:{s:13:"administrator";i:1;}');
INSERT INTO `datastore` (`name`, `data`) VALUES('phrasegroups', 'a:2:{s:6:"global";a:2:{s:2:"id";s:1:"1";s:7:"phrases";i:0;}s:12:"datamanagers";a:2:{s:2:"id";s:1:"2";s:7:"phrases";i:45;}}');
INSERT INTO `datastore` (`name`, `data`) VALUES('styleinfo', 'a:1:{i:1;a:6:{s:2:"id";s:1:"1";s:4:"name";s:7:"Default";s:9:"developer";s:28:"Tuxxedo Software Development";s:8:"styledir";s:7:"default";s:12:"defaultstyle";s:1:"1";s:11:"templateids";s:11:"1,2,3,4,5,6";}}');
INSERT INTO `datastore` (`name`, `data`) VALUES('usergroups', 'a:2:{i:1;a:4:{s:2:"id";s:1:"1";s:5:"title";s:14:"Administrators";s:11:"permissions";i:1;s:5:"users";i:1;}i:2;a:4:{s:2:"id";s:1:"2";s:5:"title";s:13:"Regular users";s:11:"permissions";i:0;s:5:"users";i:0;}}');
INSERT INTO `datastore` (`name`, `data`) VALUES('timezones', 'a:402:{s:14:"Pacific/Midway";s:3:"-11";s:12:"Pacific/Niue";s:3:"-11";s:17:"Pacific/Pago Pago";s:3:"-11";s:12:"Pacific/Apia";s:3:"-11";s:16:"Pacific/Johnston";s:3:"-10";s:17:"Pacific/Rarotonga";s:3:"-10";s:16:"Pacific/Honolulu";s:3:"-10";s:15:"Pacific/Fakaofo";s:3:"-10";s:12:"America/Adak";s:3:"-10";s:14:"Pacific/Tahiti";s:3:"-10";s:17:"Pacific/Marquesas";s:4:"-9.5";s:17:"America/Anchorage";s:2:"-9";s:14:"America/Juneau";s:2:"-9";s:12:"America/Nome";s:2:"-9";s:15:"Pacific/Gambier";s:2:"-9";s:15:"America/Yakutat";s:2:"-9";s:17:"America/Vancouver";s:2:"-8";s:19:"America/Los Angeles";s:2:"-8";s:14:"America/Dawson";s:2:"-8";s:18:"America/Whitehorse";s:2:"-8";s:16:"Pacific/Pitcairn";s:2:"-8";s:15:"America/Tijuana";s:2:"-8";s:16:"America/Edmonton";s:2:"-7";s:16:"America/Shiprock";s:2:"-7";s:14:"America/Denver";s:2:"-7";s:14:"America/Inuvik";s:2:"-7";s:19:"America/Yellowknife";s:2:"-7";s:13:"America/Boise";s:2:"-7";s:18:"America/Hermosillo";s:2:"-7";s:16:"America/Mazatlan";s:2:"-7";s:20:"America/Dawson Creek";s:2:"-7";s:21:"America/Cambridge Bay";s:2:"-7";s:15:"America/Phoenix";s:2:"-7";s:17:"America/Chihuahua";s:2:"-7";s:15:"America/Chicago";s:2:"-6";s:14:"America/Cancun";s:2:"-6";s:17:"America/Guatemala";s:2:"-6";s:17:"Pacific/Galapagos";s:2:"-6";s:18:"America/Costa Rica";s:2:"-6";s:19:"America/El Salvador";s:2:"-6";s:16:"America/Winnipeg";s:2:"-6";s:17:"America/New Salem";s:2:"-6";s:14:"America/Center";s:2:"-6";s:19:"America/Rainy River";s:2:"-6";s:20:"America/Rankin Inlet";s:2:"-6";s:21:"America/Swift Current";s:2:"-6";s:14:"America/Regina";s:2:"-6";s:14:"America/Belize";s:2:"-6";s:17:"America/Monterrey";s:2:"-6";s:19:"America/Tegucigalpa";s:2:"-6";s:17:"America/Tell City";s:2:"-6";s:15:"America/Managua";s:2:"-6";s:14:"America/Merida";s:2:"-6";s:19:"America/Mexico City";s:2:"-6";s:12:"America/Knox";s:2:"-6";s:17:"America/Menominee";s:2:"-6";s:17:"America/Vincennes";s:2:"-5";s:13:"America/Vevay";s:2:"-5";s:15:"America/Winamac";s:2:"-5";s:15:"America/Iqaluit";s:2:"-5";s:15:"America/Jamaica";s:2:"-5";s:18:"America/Petersburg";s:2:"-5";s:15:"America/Marengo";s:2:"-5";s:18:"America/Grand Turk";s:2:"-5";s:15:"America/Detroit";s:2:"-5";s:17:"America/Guayaquil";s:2:"-5";s:14:"America/Havana";s:2:"-5";s:20:"America/Indianapolis";s:2:"-5";s:18:"America/Louisville";s:2:"-5";s:18:"America/Monticello";s:2:"-5";s:22:"America/Port-au-Prince";s:2:"-5";s:19:"America/Pangnirtung";s:2:"-5";s:19:"America/Thunder Bay";s:2:"-5";s:15:"America/Toronto";s:2:"-5";s:14:"Pacific/Easter";s:2:"-5";s:14:"America/Panama";s:2:"-5";s:15:"America/Nipigon";s:2:"-5";s:12:"America/Lima";s:2:"-5";s:16:"America/Montreal";s:2:"-5";s:14:"America/Nassau";s:2:"-5";s:16:"America/New York";s:2:"-5";s:14:"America/Cayman";s:2:"-5";s:16:"America/Resolute";s:2:"-5";s:16:"America/Atikokan";s:2:"-5";s:14:"America/Bogota";s:2:"-5";s:15:"America/Caracas";s:4:"-4.5";s:19:"America/Puerto Rico";s:2:"-4";s:19:"America/Porto Velho";s:2:"-4";s:21:"America/Port of Spain";s:2:"-4";s:20:"America/Blanc-Sablon";s:2:"-4";s:17:"America/Boa Vista";s:2:"-4";s:14:"America/Guyana";s:2:"-4";s:15:"America/Antigua";s:2:"-4";s:16:"America/Barbados";s:2:"-4";s:16:"America/Anguilla";s:2:"-4";s:13:"America/Aruba";s:2:"-4";s:18:"America/Martinique";s:2:"-4";s:18:"America/Montserrat";s:2:"-4";s:15:"America/Moncton";s:2:"-4";s:15:"America/Marigot";s:2:"-4";s:14:"America/Manaus";s:2:"-4";s:14:"America/La Paz";s:2:"-4";s:15:"America/Tortola";s:2:"-4";s:18:"America/St Vincent";s:2:"-4";s:13:"America/Thule";s:2:"-4";s:15:"America/Halifax";s:2:"-4";s:21:"America/Santo Domingo";s:2:"-4";s:16:"America/Eirunepe";s:2:"-4";s:14:"America/Cuiaba";s:2:"-4";s:16:"America/Dominica";s:2:"-4";s:15:"America/Curacao";s:2:"-4";s:16:"America/St Kitts";s:2:"-4";s:18:"America/Guadeloupe";s:2:"-4";s:21:"America/St Barthelemy";s:2:"-4";s:16:"America/St Lucia";s:2:"-4";s:17:"America/Glace Bay";s:2:"-4";s:20:"America/Campo Grande";s:2:"-4";s:15:"America/Grenada";s:2:"-4";s:17:"America/Goose Bay";s:2:"-4";s:16:"Atlantic/Bermuda";s:2:"-4";s:17:"America/St Thomas";s:2:"-4";s:18:"America/Rio Branco";s:2:"-4";s:16:"America/St Johns";s:4:"-3.5";s:13:"America/Salta";s:2:"-3";s:16:"America/San Juan";s:2:"-3";s:16:"America/San Luis";s:2:"-3";s:18:"America/Paramaribo";s:2:"-3";s:16:"America/Santarem";s:2:"-3";s:13:"America/Jujuy";s:2:"-3";s:14:"America/Recife";s:2:"-3";s:16:"America/Miquelon";s:2:"-3";s:16:"America/Santiago";s:2:"-3";s:16:"America/La Rioja";s:2:"-3";s:20:"America/Rio Gallegos";s:2:"-3";s:15:"America/Mendoza";s:2:"-3";s:17:"America/Sao Paulo";s:2:"-3";s:15:"America/Cayenne";s:2:"-3";s:14:"America/Maceio";s:2:"-3";s:13:"America/Bahia";s:2:"-3";s:16:"America/Asuncion";s:2:"-3";s:17:"America/Araguaina";s:2:"-3";s:15:"America/Godthab";s:2:"-3";s:16:"Atlantic/Stanley";s:2:"-3";s:17:"America/Fortaleza";s:2:"-3";s:15:"America/Ushuaia";s:2:"-3";s:13:"America/Belem";s:2:"-3";s:17:"America/Catamarca";s:2:"-3";s:18:"Antarctica/Rothera";s:2:"-3";s:17:"Antarctica/Palmer";s:2:"-3";s:15:"America/Tucuman";s:2:"-2";s:22:"Atlantic/South Georgia";s:2:"-2";s:15:"America/Cordoba";s:2:"-2";s:20:"America/Buenos Aires";s:2:"-2";s:15:"America/Noronha";s:2:"-2";s:18:"America/Montevideo";s:2:"-2";s:20:"America/Scoresbysund";s:2:"-1";s:19:"Atlantic/Cape Verde";s:2:"-1";s:15:"Atlantic/Azores";s:2:"-1";s:18:"Atlantic/St Helena";s:1:"0";s:13:"Europe/Dublin";s:1:"0";s:16:"Atlantic/Madeira";s:1:"0";s:15:"Atlantic/Canary";s:1:"0";s:14:"Atlantic/Faroe";s:1:"0";s:13:"Africa/Bamako";s:1:"0";s:18:"Atlantic/Reykjavik";s:1:"0";s:13:"Europe/Jersey";s:1:"0";s:13:"Europe/London";s:1:"0";s:14:"Africa/Abidjan";s:1:"0";s:13:"Africa/Bissau";s:1:"0";s:13:"Africa/Banjul";s:1:"0";s:3:"UTC";s:1:"0";s:13:"Europe/Lisbon";s:1:"0";s:18:"Europe/Isle of Man";s:1:"0";s:12:"Africa/Accra";s:1:"0";s:17:"Africa/Casablanca";s:1:"0";s:15:"Europe/Guernsey";s:1:"0";s:14:"Africa/Conakry";s:1:"0";s:18:"Africa/Ouagadougou";s:1:"0";s:17:"Africa/Nouakchott";s:1:"0";s:15:"Africa/Monrovia";s:1:"0";s:12:"Africa/Dakar";s:1:"0";s:20:"America/Danmarkshavn";s:1:"0";s:11:"Africa/Lome";s:1:"0";s:15:"Africa/El Aaiun";s:1:"0";s:15:"Africa/Sao Tome";s:1:"0";s:15:"Africa/Freetown";s:1:"0";s:13:"Europe/Monaco";s:1:"1";s:11:"Europe/Oslo";s:1:"1";s:12:"Europe/Malta";s:1:"1";s:13:"Europe/Madrid";s:1:"1";s:17:"Europe/Luxembourg";s:1:"1";s:12:"Europe/Paris";s:1:"1";s:16:"Europe/Podgorica";s:1:"1";s:13:"Europe/Skopje";s:1:"1";s:16:"Europe/Stockholm";s:1:"1";s:15:"Europe/Sarajevo";s:1:"1";s:12:"Africa/Tunis";s:1:"1";s:13:"Europe/Prague";s:1:"1";s:11:"Europe/Rome";s:1:"1";s:13:"Africa/Malabo";s:1:"1";s:16:"Europe/Ljubljana";s:1:"1";s:15:"Europe/Belgrade";s:1:"1";s:13:"Europe/Berlin";s:1:"1";s:14:"Europe/Andorra";s:1:"1";s:16:"Europe/Amsterdam";s:1:"1";s:13:"Africa/Niamey";s:1:"1";s:17:"Europe/Bratislava";s:1:"1";s:15:"Europe/Brussels";s:1:"1";s:15:"Africa/Ndjamena";s:1:"1";s:16:"Europe/Gibraltar";s:1:"1";s:13:"Europe/Tirane";s:1:"1";s:17:"Europe/Copenhagen";s:1:"1";s:15:"Europe/Budapest";s:1:"1";s:17:"Africa/Porto-Novo";s:1:"1";s:17:"Europe/San Marino";s:1:"1";s:13:"Europe/Warsaw";s:1:"1";s:18:"Africa/Brazzaville";s:1:"1";s:19:"Arctic/Longyearbyen";s:1:"1";s:13:"Europe/Zagreb";s:1:"1";s:12:"Africa/Lagos";s:1:"1";s:15:"Africa/Kinshasa";s:1:"1";s:13:"Europe/Zurich";s:1:"1";s:14:"Africa/Algiers";s:1:"1";s:13:"Africa/Bangui";s:1:"1";s:13:"Europe/Vienna";s:1:"1";s:12:"Europe/Vaduz";s:1:"1";s:12:"Africa/Ceuta";s:1:"1";s:13:"Africa/Douala";s:1:"1";s:14:"Europe/Vatican";s:1:"1";s:13:"Africa/Luanda";s:1:"1";s:17:"Africa/Libreville";s:1:"1";s:15:"Europe/Helsinki";s:1:"2";s:16:"Europe/Bucharest";s:1:"2";s:17:"Africa/Lubumbashi";s:1:"2";s:15:"Europe/Chisinau";s:1:"2";s:15:"Africa/Blantyre";s:1:"2";s:12:"Africa/Cairo";s:1:"2";s:13:"Africa/Harare";s:1:"2";s:15:"Africa/Gaborone";s:1:"2";s:14:"Africa/Tripoli";s:1:"2";s:16:"Africa/Bujumbura";s:1:"2";s:15:"Africa/Windhoek";s:1:"2";s:13:"Europe/Athens";s:1:"2";s:19:"Africa/Johannesburg";s:1:"2";s:14:"Africa/Mbabane";s:1:"2";s:13:"Africa/Kigali";s:1:"2";s:18:"Europe/Kaliningrad";s:1:"2";s:14:"Europe/Vilnius";s:1:"2";s:11:"Europe/Riga";s:1:"2";s:14:"Asia/Jerusalem";s:1:"2";s:17:"Europe/Zaporozhye";s:1:"2";s:11:"Asia/Beirut";s:1:"2";s:9:"Asia/Gaza";s:1:"2";s:14:"Europe/Tallinn";s:1:"2";s:13:"Asia/Damascus";s:1:"2";s:12:"Europe/Sofia";s:1:"2";s:17:"Europe/Simferopol";s:1:"2";s:12:"Asia/Nicosia";s:1:"2";s:12:"Europe/Minsk";s:1:"2";s:11:"Europe/Kiev";s:1:"2";s:13:"Africa/Maputo";s:1:"2";s:15:"Europe/Uzhgorod";s:1:"2";s:13:"Africa/Maseru";s:1:"2";s:15:"Europe/Istanbul";s:1:"2";s:16:"Europe/Mariehamn";s:1:"2";s:13:"Africa/Lusaka";s:1:"2";s:10:"Asia/Amman";s:1:"2";s:13:"Europe/Moscow";s:1:"3";s:14:"Indian/Mayotte";s:1:"3";s:19:"Indian/Antananarivo";s:1:"3";s:13:"Indian/Comoro";s:1:"3";s:16:"Europe/Volgograd";s:1:"3";s:9:"Asia/Aden";s:1:"3";s:11:"Asia/Riyadh";s:1:"3";s:14:"Africa/Nairobi";s:1:"3";s:16:"Antarctica/Syowa";s:1:"3";s:10:"Asia/Qatar";s:1:"3";s:12:"Asia/Baghdad";s:1:"3";s:11:"Asia/Kuwait";s:1:"3";s:16:"Africa/Mogadishu";s:1:"3";s:15:"Africa/Khartoum";s:1:"3";s:13:"Africa/Asmara";s:1:"3";s:18:"Africa/Addis Ababa";s:1:"3";s:20:"Africa/Dar es Salaam";s:1:"3";s:15:"Africa/Djibouti";s:1:"3";s:14:"Africa/Kampala";s:1:"3";s:12:"Asia/Bahrain";s:1:"3";s:11:"Asia/Tehran";s:3:"3.5";s:14:"Indian/Reunion";s:1:"4";s:11:"Asia/Muscat";s:1:"4";s:11:"Indian/Mahe";s:1:"4";s:13:"Europe/Samara";s:1:"4";s:9:"Asia/Baku";s:1:"4";s:10:"Asia/Dubai";s:1:"4";s:12:"Asia/Tbilisi";s:1:"4";s:12:"Asia/Yerevan";s:1:"4";s:10:"Asia/Kabul";s:3:"4.5";s:9:"Asia/Oral";s:1:"5";s:12:"Asia/Karachi";s:1:"5";s:16:"Indian/Kerguelen";s:1:"5";s:11:"Asia/Aqtobe";s:1:"5";s:10:"Asia/Aqtau";s:1:"5";s:16:"Indian/Mauritius";s:1:"5";s:13:"Asia/Ashgabat";s:1:"5";s:15:"Indian/Maldives";s:1:"5";s:14:"Asia/Samarkand";s:1:"5";s:13:"Asia/Dushanbe";s:1:"5";s:13:"Asia/Tashkent";s:1:"5";s:18:"Asia/Yekaterinburg";s:1:"5";s:12:"Asia/Colombo";s:3:"5.5";s:12:"Asia/Kolkata";s:3:"5.5";s:14:"Asia/Kathmandu";s:4:"5.75";s:13:"Indian/Chagos";s:1:"6";s:11:"Asia/Almaty";s:1:"6";s:16:"Asia/Novosibirsk";s:1:"6";s:17:"Antarctica/Vostok";s:1:"6";s:12:"Asia/Bishkek";s:1:"6";s:9:"Asia/Omsk";s:1:"6";s:14:"Asia/Qyzylorda";s:1:"6";s:17:"Antarctica/Mawson";s:1:"6";s:12:"Asia/Thimphu";s:1:"6";s:12:"Indian/Cocos";s:3:"6.5";s:12:"Asia/Rangoon";s:3:"6.5";s:16:"Indian/Christmas";s:1:"7";s:16:"Asia/Krasnoyarsk";s:1:"7";s:16:"Asia/Ho Chi Minh";s:1:"7";s:16:"Antarctica/Davis";s:1:"7";s:10:"Asia/Dhaka";s:1:"7";s:12:"Asia/Jakarta";s:1:"7";s:9:"Asia/Hovd";s:1:"7";s:15:"Asia/Phnom Penh";s:1:"7";s:12:"Asia/Bangkok";s:1:"7";s:14:"Asia/Vientiane";s:1:"7";s:14:"Asia/Pontianak";s:1:"7";s:14:"Asia/Chongqing";s:1:"8";s:11:"Asia/Urumqi";s:1:"8";s:16:"Antarctica/Casey";s:1:"8";s:16:"Asia/Ulaanbaatar";s:1:"8";s:15:"Asia/Choibalsan";s:1:"8";s:11:"Asia/Brunei";s:1:"8";s:14:"Asia/Hong Kong";s:1:"8";s:12:"Asia/Kuching";s:1:"8";s:17:"Asia/Kuala Lumpur";s:1:"8";s:13:"Asia/Shanghai";s:1:"8";s:10:"Asia/Macau";s:1:"8";s:11:"Asia/Manila";s:1:"8";s:13:"Asia/Makassar";s:1:"8";s:15:"Australia/Perth";s:1:"8";s:12:"Asia/Kashgar";s:1:"8";s:11:"Asia/Harbin";s:1:"8";s:14:"Asia/Singapore";s:1:"8";s:11:"Asia/Taipei";s:1:"8";s:12:"Asia/Irkutsk";s:1:"8";s:15:"Australia/Eucla";s:4:"8.75";s:10:"Asia/Tokyo";s:1:"9";s:10:"Asia/Seoul";s:1:"9";s:14:"Asia/Pyongyang";s:1:"9";s:12:"Asia/Yakutsk";s:1:"9";s:13:"Pacific/Palau";s:1:"9";s:13:"Asia/Jayapura";s:1:"9";s:9:"Asia/Dili";s:1:"9";s:16:"Australia/Darwin";s:3:"9.5";s:25:"Antarctica/DumontDUrville";s:2:"10";s:12:"Pacific/Guam";s:2:"10";s:14:"Pacific/Saipan";s:2:"10";s:16:"Asia/Vladivostok";s:2:"10";s:20:"Pacific/Port Moresby";s:2:"10";s:18:"Australia/Brisbane";s:2:"10";s:18:"Australia/Lindeman";s:2:"10";s:12:"Pacific/Truk";s:2:"10";s:13:"Asia/Sakhalin";s:2:"10";s:21:"Australia/Broken Hill";s:4:"10.5";s:18:"Australia/Adelaide";s:4:"10.5";s:14:"Pacific/Kosrae";s:2:"11";s:16:"Australia/Currie";s:2:"11";s:19:"Australia/Melbourne";s:2:"11";s:12:"Asia/Magadan";s:2:"11";s:14:"Pacific/Ponape";s:2:"11";s:13:"Pacific/Efate";s:2:"11";s:16:"Australia/Sydney";s:2:"11";s:19:"Pacific/Guadalcanal";s:2:"11";s:19:"Australia/Lord Howe";s:2:"11";s:16:"Australia/Hobart";s:2:"11";s:14:"Pacific/Noumea";s:2:"11";s:15:"Pacific/Norfolk";s:4:"11.5";s:14:"Pacific/Tarawa";s:2:"12";s:17:"Pacific/Kwajalein";s:2:"12";s:12:"Pacific/Wake";s:2:"12";s:14:"Pacific/Wallis";s:2:"12";s:12:"Pacific/Fiji";s:2:"12";s:14:"Pacific/Majuro";s:2:"12";s:14:"Asia/Kamchatka";s:2:"12";s:16:"Pacific/Funafuti";s:2:"12";s:13:"Pacific/Nauru";s:2:"12";s:11:"Asia/Anadyr";s:2:"12";s:16:"Pacific/Auckland";s:2:"13";s:17:"Pacific/Enderbury";s:2:"13";s:18:"Antarctica/McMurdo";s:2:"13";s:17:"Pacific/Tongatapu";s:2:"13";s:21:"Antarctica/South Pole";s:2:"13";s:15:"Pacific/Chatham";s:5:"13.75";s:18:"Pacific/Kiritimati";s:2:"14";}');
# --------------------------------------------------------


#
# Table structure for table: languages
#
CREATE TABLE 'languages' 
(
	'id' INTEGER PRIMARY KEY AUTOINCREMENT, 
	'title' VARCHAR(128) NOT NULL, 
	'developer' VARCHAR(128) NOT NULL, 
	'isotitle' VARCHAR(5) NOT NULL, 
	'default' TINYINT(1) NOT NULL, 
	'charset' VARCHAR(12) NOT NULL
);

#
# Dumping data for table: languages
#
INSERT INTO 'languages' ('id', 'title', 'developer', 'isotitle', 'default', 'charset') VALUES ('1', 'English', 'Tuxxedo Software Development', 'en', '1', 'UTF-8');
# --------------------------------------------------------


#
# Table structure for table: optioncategories
#
CREATE TABLE 'optioncategories' (
'name' VARCHAR(128)  PRIMARY KEY
);
CREATE UNIQUE INDEX optioncategories_name ON 'optioncategories'('name');

#
# Dumping data for table: optioncategories
#
INSERT INTO 'optioncategories' ('name') VALUES ('session');
INSERT INTO 'optioncategories' ('name') VALUES ('datetime');
INSERT INTO 'optioncategories' ('name') VALUES ('language');
INSERT INTO 'optioncategories' ('name') VALUES ('style');
# --------------------------------------------------------


#
# Table structure for table: options
#
CREATE TABLE 'options' (
'option' VARCHAR(128) NOT NULL,
'value' MEDIUMTEXT NOT NULL,
'defaultvalue' MEDIUMTEXT NOT NULL,
'type' CHAR(1) NOT NULL DEFAULT '''s''',
'category' VARCHAR(128)  DEFAULT 'core'
);
CREATE UNIQUE INDEX options_option ON 'options' ('option');

#
# Dumping data for table: options
#
INSERT INTO 'options' ('option', 'value', 'defaultvalue', 'type', 'category') VALUES ('style_id', '1', '1', 'i', 'style');
INSERT INTO 'options' ('option', 'value', 'defaultvalue', 'type', 'category') VALUES ('cookie_domain', '', '', 's', 'session');
INSERT INTO 'options' ('option', 'value', 'defaultvalue', 'type', 'category') VALUES ('cookie_path', '', '', 's', 'session');
INSERT INTO 'options' ('option', 'value', 'defaultvalue', 'type', 'category') VALUES ('cookie_expires', '1800', '1800', 'i', 'session');
INSERT INTO 'options' ('option', 'value', 'defaultvalue', 'type', 'category') VALUES ('cookie_prefix', 'tuxxedo_', 'tuxxedo_', 's', 'session');
INSERT INTO 'options' ('option', 'value', 'defaultvalue', 'type', 'category') VALUES ('date_format', 'H:i:s, j/n - Y', 'H:i:s, j/n - Y', 's', 'datetime');
INSERT INTO 'options' ('option', 'value', 'defaultvalue', 'type', 'category') VALUES ('date_timezone', 'UTC', 'UTC', 's', 'core');
INSERT INTO 'options' ('option', 'value', 'defaultvalue', 'type', 'category') VALUES ('date_timezone_offset', '0', '0', 'i', 'datetime');
INSERT INTO 'options' ('option', 'value', 'defaultvalue', 'type', 'category') VALUES ('language_id', '1', '1', 'i', 'language');
INSERT INTO 'options' ('option', 'value', 'defaultvalue', 'type', 'category') VALUES ('style_storage', 'filesystem', 'filesystem', 's', 'style');
INSERT INTO 'options' ('option', 'value', 'defaultvalue', 'type', 'category') VALUES ('cookie_secure', '', '', 'b', 'session');
# --------------------------------------------------------


#
# Table structure for table: permissions
#
CREATE TABLE 'permissions' (
	'name' varchar(255) NOT NULL  PRIMARY KEY,
	'bits' int(11) NOT NULL 
);
CREATE UNIQUE INDEX permissions_name ON 'permissions' ('name');

#
# Dumping data for table: permissions
#
INSERT INTO 'permissions' ('name', 'bits') VALUES ('administrator', '1');
# --------------------------------------------------------


#
# Table structure for table: phrasegroups
#
CREATE TABLE 'phrasegroups' (
	'id' INTEGER NOT NULL PRIMARY KEY,
	'title' varchar(128) NOT NULL ,
	'language' int(11) NOT NULL 
);

#
# Dumping data for table: phrasegroups
#
INSERT INTO 'phrasegroups' ('id', 'title', 'language') VALUES ('1', 'global', '1');
INSERT INTO 'phrasegroups' ('id', 'title', 'language') VALUES ('2', 'datamanagers', '1');
# --------------------------------------------------------


#
# Table structure for table: phrases
#
CREATE TABLE 'phrases' (
	'id' INTEGER NOT NULL PRIMARY KEY,
	'title' varchar(128) NOT NULL ,
	'translation' text NOT NULL ,
	'languageid' int(11) NOT NULL ,
	'phrasegroup' varchar(128) NOT NULL 
);

#
# Dumping data for table: phrases
#
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('1', 'dm_style_name', 'Style name', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('2', 'dm_style_developer', 'Style developer', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('3', 'dm_style_styledir', 'Style directory', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('4', 'dm_user_email', 'Email address', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('5', 'dm_user_name', 'Name', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('6', 'dm_user_password', 'Password hash', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('7', 'dm_user_usergroupid', 'Usergroup identifier', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('8', 'dm_user_salt', 'Password salt', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('9', 'dm_user_timezone', 'Timezone', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('10', 'dm_user_username', 'Username', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('11', 'dm_user_style_id', 'Style identifier', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('12', 'dm_user_language_id', 'Language identifier', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('13', 'dm_usergroup_title', 'Usergroup title', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('14', 'dm_usergroup_type', 'Usergroup type', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('15', 'dm_usergroup_permissions', 'Permission mask', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('16', 'dm_session_sessionid', 'Session identifier', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('17', 'dm_session_userid', 'User identifier', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('18', 'dm_session_location', 'User location', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('19', 'dm_session_useragent', 'User agent string', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('20', 'dm_session_lastactivity', 'Last activity', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('21', 'dm_usergroup_id', 'Usergroup identifier', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('22', 'dm_style_id', 'Style identifier', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('23', 'dm_style_defaultstyle', 'Default style setting', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('24', 'dm_user_id', 'User identifier', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('25', 'dm_user_timezone_offset', 'User timezone offset', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('26', 'dm_user_permissions', 'User permissions', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('27', 'dm_template_id', 'Template identifier', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('28', 'dm_template_title', 'Template title', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('29', 'dm_template_source', 'Template source', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('30', 'dm_template_compiledsource', 'Template compiled source', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('31', 'dm_template_defaultsource', 'Template default source', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('32', 'dm_template_styleid', 'Template style identifier', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('33', 'dm_template_revision', 'Template revision', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('34', 'dm_template_changed', 'Template customization status', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('35', 'dm_permission_name', 'Permission name', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('36', 'dm_permission_bits', 'Permission bitmask', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('37', 'dm_option_option', 'Option name', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('38', 'dm_option_value', 'Option value', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('39', 'dm_option_defaultvalue', 'Option default value', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('40', 'dm_option_type', 'Option data type', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('41', 'validation_failed', 'Failed validation of datamanager fields', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('42', 'dm_option_category', 'Option category', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('43', 'dm_optioncategory_name', 'Option category name', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('44', 'dm_datastore_name', 'Datastore cache name', '1', 'datamanagers');
INSERT INTO 'phrases' ('id', 'title', 'translation', 'languageid', 'phrasegroup') VALUES ('45', 'dm_datastore_data', 'Datastore cache data', '1', 'datamanagers');
# --------------------------------------------------------


#
# Table structure for table: sessions
#
CREATE TABLE 'sessions' (
	'sessionid' varchar(32) NOT NULL ,
	'userid' int(11) NOT NULL ,
	'location' tinytext NOT NULL ,
	'useragent' varchar(255) NOT NULL ,
	'lastactivity' int(11) NOT NULL 
);
CREATE UNIQUE INDEX sessions_session ON 'sessions' ('sessionid');

#
# Dumping data for table: sessions
#
# --------------------------------------------------------


#
# Table structure for table: sqlite_sequence
#
CREATE TABLE sqlite_sequence(name,seq);

#
# Dumping data for table: sqlite_sequence
#
INSERT INTO 'sqlite_sequence' ('name', 'seq') VALUES ('languages', '1');
# --------------------------------------------------------


#
# Table structure for table: styles
#
CREATE TABLE 'styles' (
'id' INTEGER NOT NULL PRIMARY KEY,
'name' VARCHAR(128) NOT NULL,
'developer' VARCHAR(128) NOT NULL,
'styledir' VARCHAR(128) NOT NULL,
'defaultstyle' TINYINT(1) NOT NULL DEFAULT "0",
'templateids' MEDIUMTEXT NOT NULL
);

#
# Dumping data for table: styles
#
INSERT INTO 'styles' ('id', 'name', 'developer', 'styledir', 'defaultstyle', 'templateids') VALUES ('1', 'Default', 'Tuxxedo Software Development', 'default', '1', '1,2,3,4,5');
# --------------------------------------------------------


#
# Table structure for table: templates
#
CREATE TABLE 'templates' (
'id' INTEGER NOT NULL PRIMARY KEY,
'title' VARCHAR(128) NOT NULL,
'source' TEXT NOT NULL,
'compiledsource' TEXT NOT NULL,
'defaultsource' TEXT NOT NULL,
'styleid' INT(11) NOT NULL,
'changed' VARCHAR(1) NOT NULL,
'revision' INT(4) NOT NULL DEFAULT '1'
);

#
# Dumping data for table: templates
#
INSERT INTO 'templates' ('id', 'title', 'source', 'compiledsource', 'defaultsource', 'styleid', 'changed', 'revision') VALUES ('1', 'header', '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>Tuxxedo Engine</title>

		<style type="text/css">
		*
		{
			font-family: 		"Helvetica Neue", Helvetica, Trebuchet MS, Verdana, Tahoma, Arial, sans-serif; 		}
		a
		{
			color:			#021420; 			font-weight:		bold; 		}
		body
		{
			background-color: 	#021420; 			font-size: 		82%; 			color: 			#3B7286; 			padding: 		0px 30px; 		}
		h1
		{
			color: 			#FFFFFF; 		}
		input, .link-button
		{
			background-color:	#EAEAEA;	
			border:			0px; 			border-radius: 		4px; 			padding:		3px 10px; 		}
			input[type=password], input[type=text]
			{
				background-color:	#FFFFFF; 				border:			1px solid #EAEAEA; 			}
		.box
		{
			background-color: 	#D2D2D2; 			border: 		3px solid
		}
			.box .inner
			{
				background-color: 	#FFFFFF; 				border-radius: 		4px; 				padding: 		6px; 			}
		.wrapper
		{
			margin:			0px auto; 			width:			80%; 		}
		</style>
	</head>
	<body>
		<div class="wrapper">', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">
<html dir=\"ltr\" xmlns=\"http://www.w3.org/1999/xhtml\" xml:lang=\"en\" lang=\"en\">
	<head>
		<title>Tuxxedo Engine</title>

		<style type=\"text/css\">
		*
		{
			font-family: 		\"Helvetica Neue\", Helvetica, Trebuchet MS, Verdana, Tahoma, Arial, sans-serif; 		}
		a
		{
			color:			#021420; 			font-weight:		bold; 		}
		body
		{
			background-color: 	#021420; 			font-size: 		82%; 			color: 			#3B7286; 			padding: 		0px 30px; 		}
		h1
		{
			color: 			#FFFFFF; 		}
		input, .link-button
		{
			background-color:	#EAEAEA;	
			border:			0px; 			border-radius: 		4px; 			padding:		3px 10px; 		}
			input[type=password], input[type=text]
			{
				background-color:	#FFFFFF; 				border:			1px solid #EAEAEA; 			}
		.box
		{
			background-color: 	#D2D2D2; 			border: 		3px solid
		}
			.box .inner
			{
				background-color: 	#FFFFFF; 				border-radius: 		4px; 				padding: 		6px; 			}
		.wrapper
		{
			margin:			0px auto; 			width:			80%; 		}
		</style>
	</head>
	<body>
		<div class=\"wrapper\">', '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html dir="ltr" xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>Tuxxedo Engine</title>

		<style type="text/css">
		*
		{
			font-family: 		"Helvetica Neue", Helvetica, Trebuchet MS, Verdana, Tahoma, Arial, sans-serif; 		}
		a
		{
			color:			#021420; 			font-weight:		bold; 		}
		body
		{
			background-color: 	#021420; 			font-size: 		82%; 			color: 			#3B7286; 			padding: 		0px 30px; 		}
		h1
		{
			color: 			#FFFFFF; 		}
		input, .link-button
		{
			background-color:	#EAEAEA;	
			border:			0px; 			border-radius: 		4px; 			padding:		3px 10px; 		}
			input[type=password], input[type=text]
			{
				background-color:	#FFFFFF; 				border:			1px solid #EAEAEA; 			}
		.box
		{
			background-color: 	#D2D2D2; 			border: 		3px solid
		}
			.box .inner
			{
				background-color: 	#FFFFFF; 				border-radius: 		4px; 				padding: 		6px; 			}
		.wrapper
		{
			margin:			0px auto; 			width:			80%; 		}
		</style>
	</head>
	<body>
		<div class="wrapper">', '1', '0', '2');
INSERT INTO 'templates' ('id', 'title', 'source', 'compiledsource', 'defaultsource', 'styleid', 'changed', 'revision') VALUES ('2', 'footer', '		</div>
	</body>
</html>', '		</div>
	</body>
</html>', '		</div>
	</body>
</html>', '1', '0', '2');
INSERT INTO 'templates' ('id', 'title', 'source', 'compiledsource', 'defaultsource', 'styleid', 'changed', 'revision') VALUES ('3', 'redirect', '{$header}

<h1>Redirecting ...</h1>
<div class="box">
	<div class="inner">
		{$message}

		<p>
			<em>
				If you are not redirected within a few seconds, then 
				click <a href="{$location}">here</a> to be redirected 
				manually.
			</em>
		</p>
	</div>
</div>

<script type="text/javascript">
<!--
setTimeout(''location.href="{$location}";'', {$timeout} * 1000); // -->
</script>

{$footer}', '{$header}

<h1>Redirecting ...</h1>
<div class=\"box\">
	<div class=\"inner\">
		{$message}

		<p>
			<em>
				If you are not redirected within a few seconds, then 
				click <a href=\"{$location}\">here</a> to be redirected 
				manually.
			</em>
		</p>
	</div>
</div>

<script type=\"text/javascript\">
<!--
setTimeout(''location.href=\"{$location}\";'', {$timeout} * 1000); // -->
</script>

{$footer}', '{$header}

<h1>Redirecting ...</h1>
<div class="box">
	<div class="inner">
		{$message}

		<p>
			<em>
				If you are not redirected within a few seconds, then 
				click <a href="{$location}">here</a> to be redirected 
				manually.
			</em>
		</p>
	</div>
</div>

<script type="text/javascript">
<!--
setTimeout(''location.href="{$location}";'', {$timeout} * 1000); // -->
</script>

{$footer}', '1', '0', '2');
INSERT INTO 'templates' ('id', 'title', 'source', 'compiledsource', 'defaultsource', 'styleid', 'changed', 'revision') VALUES ('4', 'error', '{$header}

<h1>Error</h1>
<div class="box">
	<div class="inner">
		{$message}

		<if expression="isset($error_list)">
		<ul>
			{$error_list}
		</ul>
		</if>
	</div>
</div>

<if expression="isset($go_back) && $go_back">
<br />

<div class="box">
	<div class="inner">
		<input type="button" onclick="history.back(-1);" value="Go back" />
	</div>
</div>
</if>

{$footer}', '{$header}

<h1>Error</h1>
<div class=\"box\">
	<div class=\"inner\">
		{$message}

		" . ((isset($error_list)) ? ("
		<ul>
			{$error_list}
		</ul>
		") : '''') . "
	</div>
</div>

" . ((isset($go_back) && $go_back) ? ("
<br />

<div class=\"box\">
	<div class=\"inner\">
		<input type=\"button\" onclick=\"history.back(-1);\" value=\"Go back\" />
	</div>
</div>
") : '''') . "

{$footer}', '{$header}

<h1>Error</h1>
<div class="box">
	<div class="inner">
		{$message}

		<if expression="isset($error_list)">
		<ul>
			{$error_list}
		</ul>
		</if>
	</div>
</div>

<if expression="isset($go_back) && $go_back">
<br />

<div class="box">
	<div class="inner">
		<input type="button" onclick="history.back(-1);" value="Go back" />
	</div>
</div>
</if>

{$footer}', '1', '0', '2');
INSERT INTO 'templates' ('id', 'title', 'source', 'compiledsource', 'defaultsource', 'styleid', 'changed', 'revision') VALUES ('5', 'index', '{$header}

<h1>Tuxxedo Engine</h1>
<div class="box">
	<div class="inner">
		Thank you for choosing Tuxxedo Engine, version {$version} is installed 
		and ready to use.

		<p>
			To begin developing, head over to the DevTools component, this component 
			is as the name sounds, designed to ease development of Engine based 
			applications. If you are interested in how Engine is developed, head over to 
			our blog and our project site.
		</p>

		<p>
			Remember to checkout the ''configuration.php'' file, to define the application 
			variables. Debugging mode can also be enabled/disabled here. The debug mode 
			should always be enabled when working on a development server to give to 
			more expressive error messages, and always turned off when the application 
			is deployed to production servers.
		</p>

		<a class="link-button" href="./dev/tools/">DevTools</a> 
		<a class="link-button" href="http://www.tuxxedo.net/devblog/">Blog</a> 
		<a class="link-button" href="http://code.google.com/p/tuxxedo">Project</a>
	</div>
</div>

{$footer}', '{$header}

<h1>Tuxxedo Engine</h1>
<div class=\"box\">
	<div class=\"inner\">
		Thank you for choosing Tuxxedo Engine, version {$version} is installed 
		and ready to use.

		<p>
			To begin developing, head over to the DevTools component, this component 
			is as the name sounds, designed to ease development of Engine based 
			applications. If you are interested in how Engine is developed, head over to 
			our blog and our project site.
		</p>

		<p>
			Remember to checkout the ''configuration.php'' file, to define the application 
			variables. Debugging mode can also be enabled/disabled here. The debug mode 
			should always be enabled when working on a development server to give to 
			more expressive error messages, and always turned off when the application 
			is deployed to production servers.
		</p>

		<a class=\"link-button\" href=\"./dev/tools/\">DevTools</a> 
		<a class=\"link-button\" href=\"http://www.tuxxedo.net/devblog/\">Blog</a> 
		<a class=\"link-button\" href=\"http://code.google.com/p/tuxxedo\">Project</a>
	</div>
</div>

{$footer}', '{$header}

<h1>Tuxxedo Engine</h1>
<div class="box">
	<div class="inner">
		Thank you for choosing Tuxxedo Engine, version {$version} is installed 
		and ready to use.

		<p>
			To begin developing, head over to the DevTools component, this component 
			is as the name sounds, designed to ease development of Engine based 
			applications. If you are interested in how Engine is developed, head over to 
			our blog and our project site.
		</p>

		<p>
			Remember to checkout the ''configuration.php'' file, to define the application 
			variables. Debugging mode can also be enabled/disabled here. The debug mode 
			should always be enabled when working on a development server to give to 
			more expressive error messages, and always turned off when the application 
			is deployed to production servers.
		</p>

		<a class="link-button" href="./dev/tools/">DevTools</a> 
		<a class="link-button" href="http://www.tuxxedo.net/devblog/">Blog</a> 
		<a class="link-button" href="http://code.google.com/p/tuxxedo">Project</a>
	</div>
</div>

{$footer}', '1', '0', '2');
INSERT INTO 'templates' ('id', 'title', 'source', 'compiledsource', 'defaultsource', 'styleid', 'changed', 'revision') VALUES ('6', 'error_listbit', '<li>{$error}</li>', '<li>{$error}</
li>', '<li>{$error}</li>', '1', '0', '1');
# --------------------------------------------------------


#
# Table structure for table: usergroups
#
CREATE TABLE 'usergroups' (
	'id' INTEGER NOT NULL PRIMARY KEY,
	'title' varchar(127) NOT NULL ,
	'permissions' int(11) NOT NULL 
);

#
# Dumping data for table: usergroups
#
INSERT INTO 'usergroups' ('id', 'title', 'permissions') VALUES ('1', 'Administrators', '1');
INSERT INTO 'usergroups' ('id', 'title', 'permissions') VALUES ('2', 'Regular users', '0');
# --------------------------------------------------------


#
# Table structure for table: users
#
CREATE TABLE 'users' (
'id' INTEGER NOT NULL PRIMARY KEY,
'username' VARCHAR(255) NOT NULL,
'email' VARCHAR(255) NOT NULL,
'name' VARCHAR(255) NOT NULL,
'password' VARCHAR(40) NOT NULL,
'usergroupid' INT(11) NOT NULL,
'salt' VARCHAR(8) NOT NULL,
'style_id' INT(5),
'language_id' INT(5),
'timezone' TINYTEXT NOT NULL,
'timezone_offset' SMALLINT(6) NOT NULL,
'permissions' INT(11) NOT NULL DEFAULT '0'
);
CREATE UNIQUE INDEX users_email ON 'users' ('email');
CREATE UNIQUE INDEX users_id ON 'users' ('id');
CREATE UNIQUE INDEX users_username ON 'users' ('username');

#
# Dumping data for table: users
#
INSERT INTO 'users' ('id', 'username', 'email', 'name', 'password', 'usergroupid', 'salt', 'style_id', 'language_id', 'timezone', 'timezone_offset', 'permissions') VALUES ('1', 'Tuxxedo', 'blackhole@tuxxedo.net', 'Tuxxedo Test Account', 'cc95587719affd4460394d1a0311d1c11040fe69', '1', '%-C?;_wj', NULL, NULL, 'UTC', '0', '0');
# --------------------------------------------------------


#
# User Defined Function properties: IF
#
/*
function sqliteIf($compare, $good, $bad){
    if ($compare) {
        return $good;
    } else { 
        return $bad;
    }
}
*/

#
# User Defined Function properties: md5rev
#
/*
function md5_and_reverse($string) { return strrev(md5($string)); }
*/
