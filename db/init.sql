-- types

CREATE TYPE passType AS ENUM('PASS','LOA','CONTRACTOR','OTHER');
CREATE TYPE passCategory AS ENUM('A','B','C','L');
CREATE TYPE passStatus AS ENUM('ACTIVE', 'REVOKED', 'EXPIRED');
CREATE TYPE presentEnum AS ENUM ('PRESENT', 'NOT_PRESENT', 'NOT_SIGNED_OUT', 'UNKNOWN');
CREATE TYPE welfareCheckStatus AS ENUM('PENDING','DONE','CANCELLED');
CREATE TYPE visitorStatus AS ENUM('OK','NOT_OK','LEFT_SITE');

-- tables

CREATE TABLE visitors(
    visitorId SERIAL PRIMARY KEY NOT NULL,
    name VARCHAR(50) NOT NULL,
    company VARCHAR(50) NOT NULL,
    imageLink VARCHAR(255),
    createdDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastUpdatedDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE sites(
    id SERIAL PRIMARY KEY NOT NULL,
    siteId INT NOT NULL,
    sapId VARCHAR(10) UNIQUE,
    sapRetailNo INT ,
    country VARCHAR(255) NOT NULL,
    siteName VARCHAR(255) NOT NULL,
    town VARCHAR(255),
    channelOfTrade VARCHAR(10),
    installationCount INT DEFAULT 1,
    createdDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastUpdatedDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- This script initialises the Sites table for the Control of Works DB
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14501, 'C0GR', 11800602, 'UK', 'Abington Avenue SF Connect', 'NORTHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14460, 'C0MV', 11800822, 'UK', 'Acle SF Connect', 'NORWICH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10102, 'C0FA', 11800549, 'UK', 'Addington SF Connect', 'SOUTH CROYDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15276, 'C0PP', 11800924, 'UK', 'Adel SF Connect', 'LEEDS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15284, 'C0QC', 11800947, 'UK', 'Airport City SF Connect', 'MANCHESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13037, 'C0OX', 11800896, 'UK', 'Alfold SF Connect', 'ALFOLD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10968, 'C05D', 11800192, 'UK', 'Annick Connect', 'DREGHORN');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14063, 'C0JD', 11800696, 'UK', 'Annandale Water SFConnect MWSA', 'LOCKERBIE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15061, 'C0OE', 11800877, 'UK', 'Ashington SF Connect', 'ASHINGTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13434, 'C0BF', 11800410, 'UK', 'Ashford SF Connect', 'ASHFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11262, 'C0CZ', 11800466, 'UK', 'Ashchurch SF Connect', 'TEWKESBURY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15223, 'C0PC', 11800911, 'UK', 'Aviemore SF Connect', 'AVIEMORE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15246, 'C0PI', 11800917, 'UK', 'Aylsham SF Connect', 'NORWICH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10466, 'C0FC', 11800551, 'UK', 'Bagshot SF Connect', 'BAGSHOT');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14382, 'C0EX', 11800536, 'UK', 'Bankhead SF Connect', 'GLENROTHES');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14977, 'C0MA', 11800801, 'UK', 'Barnwood SF Connect', 'GLOUCESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14409, 'C0PV', 11800930, 'UK', 'Great Torrington SF Connect', 'TORRINGTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15082, 'C0QX', 11800968, 'UK', 'Barnet Service Station', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15028, 'C0MP', 11800816, 'UK', 'Bearsden SF Connect', 'GLASGOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15319, 'C0QG', 11800951, 'UK', 'Beckington SF Connect', 'BATH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13785, 'C0BN', 11800418, 'UK', 'Bedford SF Connect', 'BEDFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12459, 'C05I', 11800197, 'UK', 'Benson SF Connect', 'OXFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13843, 'C0NF', 11800842, 'UK', 'Besthorpe SF Connect', 'ATTLEBOROUGH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10491, 'C0DG', 11800483, 'UK', 'Bessborough SF Connect', 'HARROW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10576, 'C0BD', 11800408, 'UK', 'Blackbird Hill SF Connect', 'WEMBLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13845, 'C0GS', 11800603, 'UK', 'Blue Boys SF Connect', 'TONBRIDGE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13001, 'C0E8', 11800511, 'UK', 'Boreham SF Connect', 'CHELMSFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15179, 'C0OC', 11800875, 'UK', 'Bordesley SF Connect', 'REDDITCH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15159, 'C0NO', 11800851, 'UK', 'Bovey SF Connect', 'NEWTON ABBOT');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12021, 'C0E2', 11800505, 'UK', 'Brackley SF Connect', 'BRACKLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10654, 'C0CS', 11800459, 'UK', 'Brampton Hut SF Connect', 'HUNTINGDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10023, 'C0BO', 11800419, 'UK', 'Bracknell SF Connect', 'BRACKNELL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11029, 'C0FD', 11800552, 'UK', 'Branchton SF Connect', 'GREENOCK');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15158, 'C0NN', 11800850, 'UK', 'Braintree SF Connect', 'BRAINTREE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10569, 'C0E0', 11800503, 'UK', 'Bradwell Abbey SF Connect', 'MILTON KEYNES');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14687, 'C0MJ', 11800810, 'UK', 'Branstons SF Connect', 'LEICESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12926, 'C0BI', 11800413, 'UK', 'Brands Hill SF Connect', 'SLOUGH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10572, 'C0BV', 11800426, 'UK', 'Breakspear Way SF Connect', 'HEMEL HEMPSTEAD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13744, 'C08B', 11800298, 'UK', 'Brentwood SF Connect', 'BRENTWOOD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13080, 'C0AH', 11800376, 'UK', 'Bretton SF Connect', 'PETERBOROUGH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12973, 'C07G', 11800267, 'UK', 'The Buck SF Connect', 'ANDOVER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13517, 'C0AP', 11800384, 'UK', 'Buckingham SF Connect', 'BUCKINGHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13747, 'C0AU', 11800389, 'UK', 'Buckland SF Connect', 'NEAR FARINGDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15283, 'C0QB', 11800946, 'UK', 'Holsworthy SF Connect', 'HOLSWORTHY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13034, 'C07M', 11800273, 'UK', 'Budbrooke North Connect', 'WARWICK');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13036, 'C07T', 11800280, 'UK', 'Budbrooke South SF Connect', 'WARWICK');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11007, 'C064', 11800219, 'UK', 'Bullionfield SF Connect', 'DUNDEE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13097, 'C0BP', 11800420, 'UK', 'Bury Street SF Connect', 'RUISLIP');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12924, 'C0D7', 11800474, 'UK', 'Bush Centre SF Connect', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10469, 'C0BA', 11800405, 'UK', 'By-Pass SF Connect', 'SIDCUP');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13650, 'C0BB', 11800406, 'UK', 'Byron SF Connect', 'NORTH FINCHLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10057, 'C0DF', 11800482, 'UK', 'Cambridge Road SF Connect', 'CARSHALTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15009, 'C0MO', 11800815, 'UK', 'Canonmills SF Connect', 'EDINBURGH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11010, 'C05W', 11800211, 'UK', 'Canniesburn SF Connect', 'GLASGOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10475, 'C0B8', 11800403, 'UK', 'Chalfonts Way SF Connect', 'AMERSHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15057, 'C0OD', 11800876, 'UK', 'Chatham SF Connect', 'CHATHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10617, 'C03X', 11800140, 'UK', 'Chelmsford SF Connect', 'CHELMSFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10113, 'C0FF', 11800554, 'UK', 'Cheriton SF Connect', 'FOLKESTONE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13253, 'C0CA', 11800441, 'UK', 'Chicheley Park SF Connect', 'NEWPORT PAGNELL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10587, 'C0C3', 11800434, 'UK', 'Chigwell SF Connect', 'LOUGHTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15199, 'C0OR', 11800890, 'UK', 'Chippenham SF Connect', 'CHIPPENHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14893, 'C0LJ', 11800774, 'UK', 'Christchurch SF Connect', 'CHRISTCHURCH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10228, 'C0OS', 11800891, 'UK', 'Cheadle Hulme SF Connect', 'CHEADLE HULME');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14706, 'C0PB', 11800910, 'UK', 'Garstang SF Connect', 'PRESTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10117, 'C0EI', 11800521, 'UK', 'Church View SF Connect', 'TUNBRIDGE WELLS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13120, 'C0F9', 11800548, 'UK', 'Clarendon SF Connect', 'BOREHAMWOOD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15002, 'C0LV', 11800786, 'UK', 'Clacket Lane East Connect MWSA', 'WESTERHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15003, 'C0LZ', 11800790, 'UK', 'Clacket Lane West Connect MWSA', 'WESTERHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15204, 'C0PF', 11800914, 'UK', 'Clevedon SF Connect', 'CLEVEDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15006, 'C0MB', 11800802, 'UK', 'Cockfosters SF Connect', 'ENFIELD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11079, 'C0CF', 11800446, 'UK', 'Colston SF Connect', 'AIRDRIE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14795, 'C0JV', 11800714, 'UK', 'Colchester SF Connect', 'COLCHESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15316, 'C0QO', 11800959, 'UK', 'Cosford SF Connect', 'WOLVERHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11705, 'C059', 11800188, 'UK', 'County Oak Connect', 'CRAWLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14694, 'C0IR', 11800674, 'UK', 'Craiglinn SF Connect', 'GLASGOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12923, 'C0FH', 11800556, 'UK', 'Cranford SF Connect', 'HOUNSLOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12446, 'C0FG', 11800555, 'UK', 'Cranfield SF Connect', 'WICKFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15312, 'C0QT', 11800964, 'UK', 'Crowthorne SF Connect', 'CROWTHORNE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14891, 'C0LI', 11800773, 'UK', 'Croft Road SF Connect', 'CROWBOROUGH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10472, 'C0JS', 11800711, 'UK', 'Crownwood SF Connect', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10503, 'C0CB', 11800442, 'UK', 'Cromwell Road South SF Connect', 'HAMMERSMITH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15115, 'C0OU', 11800893, 'UK', 'Crondall SF Connect', 'FARNHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15279, 'C0QA', 11800945, 'UK', 'Cross Keys SF Connect', 'TAUNTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10960, 'C09P', 11800348, 'UK', 'Culter SF Connect', 'ABERDEEN');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12523, 'C062', 11800217, 'UK', 'Deer Park SF Connect', 'LIVINGSTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15305, 'C0QP', 11800960, 'UK', 'Desborough SF Connect', 'Desborough');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10467, 'C0FI', 11800557, 'UK', 'Downham SF Connect', 'BROMLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14911, 'C0MY', 11800825, 'UK', 'Droitwich SF Connect', 'DROITWICH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12051, 'C05G', 11800195, 'UK', 'Earlsgate SF Connect', 'GRANGEMOUTH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12941, 'C0B9', 11800404, 'UK', 'East Mayne SF Connect', 'BASILDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15198, 'C0ON', 11800886, 'UK', 'Eastwood SF Connect', 'COLCHESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10728, 'C0ME', 11800805, 'UK', 'Egerton SF Connect', 'MELTON MOWBRAY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10522, 'C0E1', 11800504, 'UK', 'Egham Hill SF Connect', 'EGHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13983, 'C0LN', 11800778, 'UK', 'Ely SF Connect', 'Ely');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13262, 'C06N', 11800238, 'UK', 'Emerson Valley SF Connect', 'MILTON KEYNES');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14776, 'C0MI', 11800809, 'UK', 'Emsworth SF Connect', 'EMSWORTH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11014, 'C05X', 11800212, 'UK', 'Esplanade SF Connect', 'ABERDEEN');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10126, 'C0DI', 11800485, 'UK', 'Ewell SF Connect', 'EWELL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15169, 'C0NZ', 11800862, 'UK', 'Fairway SF Connect', 'DERBY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15150, 'C0NL', 11800848, 'UK', 'Falcondale SF Connect', 'BRISTOL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10568, 'C0CC', 11800443, 'UK', 'Family Farm SF Connect', 'BICESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13943, 'C0D5', 11800472, 'UK', 'Farnham SF Connect', 'FARNHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10101, 'C0EH', 11800520, 'UK', 'Findon Valley SF Connect', 'WORTHING');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10516, 'C0FJ', 11800558, 'UK', 'Finchley Lane SF Connect', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13267, 'C0MK', 11800811, 'UK', 'Flying Red Horse SF Connect', 'UXBRIDGE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13268, 'C0B2', 11800397, 'UK', 'Flyover SF Connect', 'HAMMERSMITH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14978, 'C0LT', 11800784, 'UK', 'Foley SF Connect', 'WALSALL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13181, 'C06U', 11800245, 'UK', 'Fortune Connect', 'BASILDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15060, 'C0NH', 11800844, 'UK', 'Formby SF Connect', 'LIVERPOOL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14015, 'C08K', 11800307, 'UK', 'Forth View SF Connect', 'SOUTH QUEENSFERRY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14894, 'C0LG', 11800771, 'UK', 'Four Marks SF Connect', 'ALTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10670, 'C04R', 11800170, 'UK', 'Fourways SF Connect', 'CORBY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11223, 'C0HK', 11800631, 'UK', 'Four Acres SF Connect', 'SALISBURY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13189, 'C0FK', 11800559, 'UK', 'Garlinge SF Connect', 'MARGATE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14377, 'C0ET', 11800532, 'UK', 'Gatwick South SF Connect', 'LONDON GATWICK AIRPORT');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10596, 'C04Y', 11800177, 'UK', 'Gerrards Cross SF Connect', 'GERRARDS CROSS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10067, 'C0QF', 11800950, 'UK', 'Midhurst SF Connect', 'MIDHURST');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14493, 'C0OW', 11800895, 'UK', 'Gledrid SF Connect', 'NR OSWESTRY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10036, 'C0E7', 11800510, 'UK', 'Goddington SF Connect', 'ORPINGTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13031, 'C0FL', 11800560, 'UK', 'Godstone Road SF Connect', 'WHYTELEAFE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10476, 'C08A', 11800297, 'UK', 'Gordon SF Connect', 'WOKING');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12944, 'C0MM', 11800813, 'UK', 'Reading East Connect MWSA', 'READING');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13196, 'C0MN', 11800814, 'UK', 'Reading West Connect MWSA', 'READING');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12938, 'C0DJ', 11800486, 'UK', 'Greengate SF Connect', 'ILFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14033, 'C091', 11800324, 'UK', 'Greenock Road Service Station', 'PAISLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13202, 'C07E', 11800265, 'UK', 'Grove Road SF Connect', 'BASINGSTOKE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10452, 'C0BQ', 11800421, 'UK', 'Gunnersbury Park SF Connect', 'NORTH EALING');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10668, 'C0G0', 11800575, 'UK', 'Guyscliffe SF Connect', 'WARWICK');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13206, 'C07P', 11800276, 'UK', 'Haberden SF Connect', 'BURY ST EDMUNDS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10463, 'C04T', 11800172, 'UK', 'Hampton Court SF Connect', 'EAST MOLESEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15224, 'C0PE', 11800913, 'UK', 'Hardwicke SF Connect', 'GLOUCESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10996, 'C0F6', 11800545, 'UK', 'Harthill North SF Connect MWSA', 'SHOTTS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10448, 'C0DH', 11800484, 'UK', 'Harlow Gate SF Connect', 'HARLOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10995, 'C0F7', 11800546, 'UK', 'Harthill South SF Connect MWSA', 'SHOTTS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10559, 'C0GG', 11800591, 'UK', 'Harlow SF Connect', 'HARLOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10664, 'C0CL', 11800452, 'UK', 'Harborough SF Connect', 'NORTHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15163, 'C0NV', 11800858, 'UK', 'Heaton Mersey SF Connect', 'STOCKPORT');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10103, 'C05Q', 11800205, 'UK', 'Highfield SF Connect', 'BANSTEAD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10534, 'C0BK', 11800415, 'UK', 'Highway SF Connect', 'ENFIELD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10125, 'C0AC', 11800371, 'UK', 'Hilden SF Connect', 'HILDENBOROUGH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10120, 'C053', 11800182, 'UK', 'Hillside SF Connect', 'REDHILL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14892, 'C0LK', 11800775, 'UK', 'Hindhead SF Connect', 'HINDHEAD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15049, 'C0NB', 11800838, 'UK', 'Holborough SF Connect', 'SNODLAND');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15249, 'C0PJ', 11800918, 'UK', 'Honiton SF Connect', 'HONITON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13028, 'C0DQ', 11800493, 'UK', 'Hornbill SF Connect', 'BRACKNELL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13932, 'C0CX', 11800464, 'UK', 'Hornchurch SF Connect', 'HORNCHURCH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13488, 'C0FN', 11800562, 'UK', 'Hove SF Connect', 'HOVE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15213, 'C0OZ', 11800898, 'UK', 'Hutton Mount SF Connect', 'BRENTWOOD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10557, 'C0DA', 11800477, 'UK', 'Hyperion SF Connect', 'NEWMARKET');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10648, 'C05P', 11800204, 'UK', 'Icknield Way SF Connect', 'THETFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15212, 'C0OY', 11800897, 'UK', 'Ingrave SF Connect', 'BRENTWOOD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11022, 'C0CR', 11800458, 'UK', 'Ingliston SF Connect', 'NEWBRIDGE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15290, 'C0QZ', 11800970, 'UK', 'Ivanhoe Service Station', 'DARLINGTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15164, 'C0NW', 11800859, 'UK', 'Jorvik SF Connect', 'YORK');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10441, 'C057', 11800186, 'UK', 'Kellys Corner SF Connect', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12956, 'C0DE', 11800481, 'UK', 'Kempton Park SF Connect', 'SUNBURY on THAMES');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13286, 'C07O', 11800275, 'UK', 'Kensington SF Connect', 'BIRMINGHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13666, 'C0CQ', 11800457, 'UK', 'Kettering East SF Connect', 'KETTERING');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13288, 'C0CV', 11800462, 'UK', 'Kettering West SF Connect', 'KETTERING');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10176, 'C0JE', 11800697, 'UK', 'Killington Lake MWSA Connect', 'KENDAL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10530, 'C0C2', 11800433, 'UK', 'Kilsmore Way SF Connect', 'WALTHAM CROSS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11023, 'C068', 11800223, 'UK', 'Kingsway West SF Connect', 'DUNDEE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14826, 'C0K1', 11800720, 'UK', 'Leatherhead SF Connect', 'LEATHERHEAD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12007, 'C044', 11800147, 'UK', 'Lee SF Connect', 'LEWISHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15352, 'C0QL', 11800956, 'UK', 'Lenham SF Connect', 'MAIDSTONE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14832, 'C0K4', 11800723, 'UK', 'St Leonards SF Connect', 'RINGWOOD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13302, 'C07B', 11800262, 'UK', 'Lightwater SF Connect', 'LIGHTWATER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15178, 'C0OB', 11800874, 'UK', 'Linlithgow SF Connect', 'LINLITHGOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10460, 'C0FM', 11800561, 'UK', 'Hillingdon SF Connect', 'HILLINGDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11004, 'C06B', 11800226, 'UK', 'Longman SF Connect', 'INVERNESS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11246, 'C0GL', 11800966, 'UK', 'Longfleet Service Station', 'POOLE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10597, 'C0DY', 11800501, 'UK', 'London Road SF Connect', 'WESTCLIFF-ON-SEA');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15062, 'C0NK', 11800847, 'UK', 'London Bridge SF Connect', 'YORK');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14881, 'C0NI', 11800845, 'UK', 'Lower Wick SF Connect', 'WORCESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14112, 'C0OK', 11800883, 'UK', 'Lynn Hill SF Connect', 'EAST DEREHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15185, 'C0OJ', 11800882, 'UK', 'Malling SF Connect', 'LEWES');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11314, 'C09Y', 11800357, 'UK', 'Malpas SF Connect', 'NEWPORT');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13346, 'C07W', 11800283, 'UK', 'Martlesham Heath Services', 'IPSWICH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15196, 'C0OM', 11800885, 'UK', 'Market Harborough SF Connect', 'MARKET HARBOROUGH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15301, 'C0QJ', 11800954, 'UK', 'Coate SF Connect', 'SWINDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10611, 'C05T', 11800208, 'UK', 'Mayflower SF Connect', 'BILLERICAY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13356, 'C0GH', 11800592, 'UK', 'Merrow SF Connect', 'GUILDFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14843, 'C0KO', 11800743, 'UK', 'Michaelwood North SFC MWSA', 'DURSLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14844, 'C0KP', 11800744, 'UK', 'Michaelwood South Connect MWSA', 'DURSLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12932, 'C07K', 11800271, 'UK', 'Milton Heights SF Connect', 'ABINGDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14016, 'C08L', 11800308, 'UK', 'Milton SF Connect', 'DUMBARTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10528, 'C0CO', 11800455, 'UK', 'Mill End SF Connect', 'RICKMANSWORTH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15043, 'C0MX', 11800824, 'UK', 'Minster SF Connect', 'WIMBORNE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12970, 'C0CE', 11800445, 'UK', 'Mitcham Road SF Connect', 'CROYDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12971, 'C0FX', 11800572, 'UK', 'Solihull SF Connect', 'SOLIHULL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12050, 'C060', 11800215, 'UK', 'Monkton SF Connect', 'PRESTWICK');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10217, 'C0H0', 11800611, 'UK', 'The Moss MWSA Connect', 'CARLISLE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10478, 'C05O', 11800203, 'UK', 'Mottingham SF Connect', 'MOTTINGHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15195, 'C0OL', 11800884, 'UK', 'Mousehold SF Connect', 'NORWICH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10479, 'C0EQ', 11800529, 'UK', 'Mount SF Connect', 'ST ALBANS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13375, 'C072', 11800253, 'UK', 'Mytchett SF Connect', 'CAMBERLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10639, 'C0FR', 11800566, 'UK', 'Newnham Avenue SF Connect', 'BEDFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12945, 'C074', 11800255, 'UK', 'Newham Way Connect', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15272, 'C0PX', 11800932, 'UK', 'Newport SF Connect', 'NEWPORT');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10599, 'C05E', 11800193, 'UK', 'Nodeway SF Connect', 'WELWYN');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14304, 'C0JJ', 11800702, 'UK', 'Norton Canes Connect MWSA', 'CANNOCK');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10024, 'C0D8', 11800475, 'UK', 'North End SF Connect', 'EAST GRINSTEAD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10600, 'C0FS', 11800567, 'UK', 'Northolt Park SF Connect', 'NORTHOLT');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11960, 'C0C0', 11800431, 'UK', 'Oak Farm SF Connect', 'FARNBOROUGH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10013, 'C0GF', 11800590, 'UK', 'Oakfield SF Connect', 'HITCHIN');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10108, 'C0BH', 11800412, 'UK', 'Oak Tree SF Connect', 'LOWER KINGSWOOD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15027, 'C0NA', 11800837, 'UK', 'Oakham SF Connect', 'OAKHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10428, 'C04W', 11800175, 'UK', 'Odeon SF Connect', 'BARNET');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10519, 'C0A4', 11800363, 'UK', 'Old Windsor SF Connect', 'OLD WINDSOR');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13399, 'C0CJ', 11800450, 'UK', 'Ongar Road SF Connect', 'BRENTWOOD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12948, 'C06V', 11800246, 'UK', 'Orsett North SF Connect', 'ESSEX');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12950, 'C0E4', 11800507, 'UK', 'Orsett South SF Connect', 'GRAYS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14779, 'C0NG', 11800843, 'UK', 'Pannal SF Connect', 'HARROGATE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14979, 'C0LU', 11800785, 'UK', 'Parade SF Connect', 'BOURNE END');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15177, 'C0OA', 11800873, 'UK', 'Park Road SF Connect', 'CHESTER LE STREET');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15151, 'C0NM', 11800849, 'UK', 'Park SF Connect', 'BLACKBURN');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14462, 'C0PY', 11800933, 'UK', 'Park Gate SF Connect', 'SOUTHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15296, 'C0QI', 11800953, 'UK', 'Peebles SF Connect', 'PEEBLES');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13415, 'C0NE', 11800841, 'UK', 'Penns Lane SF Connect', 'SUTTON COLDFIELD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15404, 'C0RI', 11800989, 'UK', 'Perry Barr Service Station', 'BIRMINGHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10493, 'C0C1', 11800432, 'UK', 'Perry Street SF Connect', 'CHISLEHURST');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11700, 'C0BW', 11800427, 'UK', 'Perivale SF Connect', 'GREENFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14394, 'C0F2', 11800541, 'UK', 'Perth Services SF Connect', 'INVERALMOND');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13947, 'C0D9', 11800476, 'UK', 'Petersfield SF Connect', 'PETERSFIELD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15184, 'C0OI', 11800881, 'UK', 'Pevensey SF Connect', 'PEVENSEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10514, 'C0CU', 11800461, 'UK', 'Pinkham Way SF Connect', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11056, 'C0FT', 11800568, 'UK', 'Pollokshaws SF Connect', 'GLASGOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11958, 'C05B', 11800190, 'UK', 'Popham SF Connect', 'WINCHESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15168, 'C0OH', 11800880, 'UK', 'Poppleton SF Connect', 'YORK');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10066, 'C0FU', 11800569, 'UK', 'Portchester SF Connect', 'FAREHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13425, 'C06T', 11800244, 'UK', 'Potters Bar SF Connect', 'POTTERS BAR');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10110, 'C0J6', 11800689, 'UK', 'Pyecombe SF Connect', 'BRIGHTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14026, 'C0GO', 11800599, 'UK', 'Queensway North SF Connect', 'GLASGOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15197, 'C0OP', 11800888, 'UK', 'Rankin SF Connect', 'BINGLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13925, 'C0B3', 11800398, 'UK', 'Raunds SF Connect', 'WELLINGBOROUGH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12916, 'C06E', 11800229, 'UK', 'Ravenscroft SF Connect', 'HOUNSLOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15048, 'C0NC', 11800839, 'UK', 'Rayleigh SF Connect', 'RAYLEIGH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15278, 'C0PZ', 11800934, 'UK', 'Red Hall SF Connect', 'LEEDS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15011, 'C0MQ', 11800817, 'UK', 'Prestbury Road SF Connect', 'CHELTENHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10604, 'C055', 11800184, 'UK', 'Rivenhall South Connect', 'WITHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13454, 'C06W', 11800247, 'UK', 'Rosetta SF Connect', 'ORPINGTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10708, 'C0JH', 11800700, 'UK', 'Rothersthorpe NorthConnectMWSA', 'NORTHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10709, 'C0JI', 11800701, 'UK', 'Rothersthorpe SouthConnectMWSA', 'NORTHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10565, 'C0FW', 11800571, 'UK', 'Basildon SF Connect', 'BASILDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14750, 'C0LR', 11800782, 'UK', 'Rownhams East MWSA', 'SOUTHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12936, 'C07Q', 11800277, 'UK', 'Rowley Mile SF Connect', 'NR NEWMARKET');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14751, 'C0LS', 11800783, 'UK', 'Rownhams West MWSA', 'SOUTHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10485, 'C0E6', 11800509, 'UK', 'Rushett SF Connect', 'CHESSINGTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13459, 'C073', 11800254, 'UK', 'Rush Green SF Connect', 'HERTFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10112, 'C09R', 11800350, 'UK', 'Rustington SF Connect', 'LITTLEHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14830, 'C0K3', 11800722, 'UK', 'Salisbury SF Connect', 'SALISBURY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15260, 'C0PU', 11800929, 'UK', 'Sandbach North Connect MWSA', 'SANDBACH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15259, 'C0PT', 11800928, 'UK', 'Sandbach South Connect MWSA', 'SANDBACH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15270, 'C0QD', 11800948, 'UK', 'Scole SF Connect', 'Stuston');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15245, 'C0PH', 11800916, 'UK', 'Seven Bridges SFC', 'SWINDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13473, 'C0MU', 11800821, 'UK', 'Shepperton SF Connect', 'SHEPPERTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10070, 'C0CY', 11800465, 'UK', 'Shirley SF Connect', 'CROYDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13474, 'C0MG', 11800807, 'UK', 'Show Meadow SF Connect', 'SWINDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14021, 'C08Q', 11800313, 'UK', 'Slateford Road SF Connect', 'EDINBURGH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15214, 'C0PA', 11800909, 'UK', 'Soham SF Connect', 'ELY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10501, 'C05R', 11800206, 'UK', 'Sonning Cutting SF Connect', 'READING');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15222, 'C0PD', 11800912, 'UK', 'South Woodham Ferrers SFC', 'Chelmsford');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10713, 'C0NJ', 11800846, 'UK', 'Southlands SF Connect', 'LEEDS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13742, 'C0OG', 11800879, 'UK', 'Southwell Green SF Connect', 'SOUTHWELL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10489, 'C0GQ', 11800601, 'UK', 'South Mimms SF Connect MWSA', 'POTTERS BAR');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13482, 'C0OO', 11800887, 'UK', 'Spital SF Connect', 'WIRRAL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14313, 'C0EE', 11800517, 'UK', 'Stansted SF Connect', 'STANSTED');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13495, 'C0ML', 11800812, 'UK', 'Stafford Connect MWSA', 'STONE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11263, 'C0MF', 11800806, 'UK', 'Station Road SF Connect', 'STOW-ON-THE-WOLD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14895, 'C0LL', 11800776, 'UK', 'St Albans SF Connect', 'ST ALBANS');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10076, 'C0JB', 11800694, 'UK', 'St Cross Filling Station', 'WINCHESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14034, 'C092', 11800325, 'UK', 'St Davids SF Connect', 'DUNFERMLINE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11192, 'C03V', 11800138, 'UK', 'Stevensons SF Connect', 'INVERURIE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14456, 'C0MC', 11800803, 'UK', 'St Ives SF Connect', 'HUNTINGDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10688, 'C0FY', 11800573, 'UK', 'Stonebridge SF Connect', 'COVENTRY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15137, 'C0OT', 11800892, 'UK', 'Stourbridge SF Connect', 'STOURBRIDGE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10543, 'C0FZ', 11800574, 'UK', 'Streatley SF Connect', 'LUTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11256, 'C0JG', 11800699, 'UK', 'Strensham MWSA Connect', 'STRENSHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13506, 'C0QN', 11800958, 'UK', 'Stadhampton SF Connect', 'STADHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15030, 'C0MS', 11800819, 'UK', 'Sunningdale SF Connect', 'GLASGOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10056, 'C04V', 11800174, 'UK', 'Sutton Court Service Station', 'SUTTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10118, 'C0D6', 11800473, 'UK', 'Swanbridge SF Connect', 'NEWBURY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13988, 'C08J', 11800306, 'UK', 'Swan Connect', 'WEST BROMWICH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15205, 'C0OV', 11800894, 'UK', 'Teversham SF Connect', 'CAMBRIDGE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14827, 'C0K2', 11800721, 'UK', 'Thame BP SF Connect', 'THAME');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12929, 'C07L', 11800272, 'UK', 'One Thousand Guineas SFC', 'NR NEWMARKET');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10072, 'C0RH', 11800988, 'UK', 'Tilgate Express', 'CRAWLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10451, 'C0BU', 11800425, 'UK', 'Tilehurst SF Connect', 'READING');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13009, 'C0DZ', 11800502, 'UK', 'Townsend SF Connect', 'HARPENDEN');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14704, 'C0IZ', 11800682, 'UK', 'Tower Connect', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13533, 'C0BJ', 11800414, 'UK', 'Towcester North SF Connect', 'TOWCESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13538, 'C0CD', 11800444, 'UK', 'Trafalgar SF Connect', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14328, 'C0EF', 11800518, 'UK', 'Triangle SF Connect', 'WOKINGHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10455, 'C0CT', 11800460, 'UK', 'Trinity SF Connect', 'TOOTING BEC');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13546, 'C07R', 11800278, 'UK', 'Tudor SF Connect', 'MAIDSTONE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13549, 'C07C', 11800263, 'UK', 'Twyford SF Connect', 'READING');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15398, 'C0QY', 11800969, 'UK', 'Uddingston Service Station', 'GLASGOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10127, 'C0D1', 11800468, 'UK', 'University Way SF Connect', 'BRIGHTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13013, 'C0DM', 11800489, 'UK', 'Upton Way SF Connect', 'NORTHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15240, 'C0PK', 11800919, 'UK', 'Wadebridge SF Connect', 'WADEBRIDGE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12917, 'C0BX', 11800428, 'UK', 'Wandsworth SF Connect', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13015, 'C0EA', 11800513, 'UK', 'Ware Road SF Connect', 'HODDESDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10573, 'C0CG', 11800447, 'UK', 'Watford Way SF Connect', 'MILL HILL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10556, 'C0DT', 11800496, 'UK', 'Waterfall SF Connect', 'NEW SOUTHGATE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10706, 'C0JF', 11800698, 'UK', 'Watford Gap North Connect MWSA', 'NORTHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10707, 'C0JC', 11800695, 'UK', 'Watford Gap South Connect MWSA', 'NORTHAMPTON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10571, 'C0BL', 11800416, 'UK', 'Wavendon Gate SF Connect', 'MILTON KEYNES');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12012, 'C0DN', 11800490, 'UK', 'Weldale SF Connect', 'READING');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (11038, 'C0G2', 11800577, 'UK', 'West End SF Connect', 'GLASGOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13578, 'C0AQ', 11800385, 'UK', 'Westwood SF Connect', 'BENFLEET');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10988, 'C043', 11800146, 'UK', 'Western Service Station', 'KILMARNOCK');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (12969, 'C0CN', 11800454, 'UK', 'Western Avenue SF Connect', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13576, 'C0G3', 11800578, 'UK', 'West Street SF Connect', 'SOUTHEND-ON-SEA');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14834, 'C0K5', 11800724, 'UK', 'Weymouth SF Connect', 'WEYMOUTH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10646, 'C0D3', 11800470, 'UK', 'Whittlesford SF Connect', 'PAMPISFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14039, 'C0QM', 11800957, 'UK', 'West Yeovil SF Connect', 'YEOVIL');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10133, 'C0G4', 11800579, 'UK', 'Widmore SF Connect', 'BROMLEY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14884, 'C0LH', 11800772, 'UK', 'Willingdon SF Connect', 'EASTBOURNE');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10195, 'C0MT', 11800820, 'UK', 'Wilmslow SF Connect', 'WILMSLOW');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13586, 'C0CK', 11800451, 'UK', 'Wimbledon Chase SF Connect', 'LONDON');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14831, 'C0K7', 11800726, 'UK', 'Winchester North Connect MWSA', 'WINCHESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14833, 'C0K8', 11800727, 'UK', 'Winchester South Connect MWSA', 'WINCHESTER');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10030, 'C0C5', 11800436, 'UK', 'Wisley North SF Connect', 'GUILDFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10031, 'C0BR', 11800422, 'UK', 'Wisley South SF Connect', 'GUILDFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (14820, 'C0NU', 11800857, 'UK', 'Littleport SF Connect', 'ELY');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15160, 'C0NS', 11800855, 'UK', 'Wokingham SF Connect', 'WOKINGHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (15058, 'C0NQ', 11800853, 'UK', 'Wollaton SF Connect', 'NOTTINGHAM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10119, 'C054', 11800183, 'UK', 'Woodcote SF Connect', 'EPSOM');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (13010, 'C0CP', 11800456, 'UK', 'Woodstock SF Connect', 'OXFORD');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (10044, 'C0E9', 11800512, 'UK', 'Wrythe SF Connect', 'CARSHALTON');

-- dummy data for Oz
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (99999, 'ZZZZ', 99999999, 'Australia', 'Perth SF Connect', 'PERTH');
INSERT INTO sites (siteId, sapId, sapRetailNo, country, siteName, town) VALUES (88888, 'YYYY', 88888888, 'Australia', 'Sydney SF Connect', 'SYDNEY');



CREATE TABLE vehicles(
    vehicleId SERIAL PRIMARY KEY NOT NULL,
    vehicleReg VARCHAR(20),
    createdDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastUpdatedDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);


CREATE TABLE passes(
    passId SERIAL PRIMARY KEY NOT NULL,
    passType passType NOT NULL,
    passCategory passCategory,
    passStatus passStatus,
    passNumber INT,
    dateIssued TIMESTAMP,
    dateExpiry TIMESTAMP,
    visitorId INT  NOT NULL,
    FOREIGN KEY (visitorId)
        REFERENCES visitors(visitorId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    createdDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastUpdatedDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

CREATE TABLE visits(
    visitId SERIAL PRIMARY KEY NOT NULL,
    siteId INT  NOT NULL,
    FOREIGN KEY (siteId)
        REFERENCES sites(id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    visitPurpose VARCHAR(255),
    expectedDurationHrs INT,
    signInDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    signInStaffId VARCHAR(255) NOT NULL,
    signOutDateTime TIMESTAMP,
    signOutStaffId VARCHAR(255),
    welfareCheck VARCHAR(255) DEFAULT 'Visitor OK and working safely',
    passId INT  ,
    FOREIGN KEY (passId)
        REFERENCES passes(passId)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    vehicleId INT ,
    FOREIGN KEY (vehicleId)
        REFERENCES vehicles(vehicleId)
        ON UPDATE CASCADE
        ON DELETE SET NULL,
    createdDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastUpdatedDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    visitorPresentAtSignOut presentEnum DEFAULT 'UNKNOWN'
);

CREATE TABLE signInChecks(
    signInCheckId SERIAL PRIMARY KEY NOT NULL,
    inductionCompleted BOOLEAN default false,
    wafRequired BOOLEAN default false,
    wafStarted BOOLEAN default false,
    wafCompleted BOOLEAN default false,
    visitId INT ,
    FOREIGN KEY (visitId)
        REFERENCES visits(visitId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    createdDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastUpdatedDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE welfareChecks(
    welfareCheckId SERIAL PRIMARY KEY NOT NULL,
    notificationId INT  UNIQUE NOT NULL,
    visitId INT ,
    FOREIGN KEY (visitId)
        REFERENCES visits(visitId)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    checkerId VARCHAR(255),
    checkedDateTime TIMESTAMP,
    welfareCheckStatus welfareCheckStatus DEFAULT 'PENDING',
    visitorStatus visitorStatus,
    notes VARCHAR(255),
    createdDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastUpdatedDateTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
--- ******************************************************************************************************************************************* ---
--- ***********************************************  DATABASE STATUS ABOVE THIS LINE IS STAGING SITUATION   ************************************************** ---
-- add update statements here to test how to hotfix sql tables (i.e. without recreating)
-- add reference to countries

CREATE TABLE countries(
	countryId SERIAL PRIMARY KEY NOT NULL,
	countryName VARCHAR(255) NOT NULL
);
INSERT INTO countries (countryName) VALUES ('UK'), ('Australia');

-- used for if company not already listed
CREATE TABLE whenLoaded (
	whenLoadedId SERIAL PRIMARY KEY NOT NULL,
	whenLoadedValue VARCHAR(50) NOT NULL
);

INSERT INTO whenLoaded (whenLoadedValue) VALUES ('INITIAL_LISTING'), ('CUSTOMER_ADDED');

-- set up companies listing
CREATE TABLE companies(
	companyId SERIAL PRIMARY KEY NOT NULL,
	companyName VARCHAR(50) NOT NULL,
	whenLoadedId INT NOT NULL,
		FOREIGN KEY (whenLoadedId)
		REFERENCES whenLoaded(whenLoadedId)
);

-- load initial company data
INSERT INTO companies(companyname, whenLoadedId) VALUES ('BP', 1),('City',1),('Cimbali',1), ('Diebold Nixdorf',1),('GVR',1),('I4Retail',1), ('OzPetrol', 1);
-- assume visitors has data we need to migrate
-- add data to migrate - mix of current and new companies
INSERT INTO visitors (name, company) VALUES ('bob','BP'), ('john','City'), ('bill','I4Retail'), ('terry','Contractor Solutions'), ('matt','A4GS'), ('joe','General Electric'), ('amanda', 'tree contractors'), ('oz_visitors','OzPetrol'), ('oz_other_1', 'Ozymandias'), ('oz_other_2','ollyOllyOlly');
-- passes
INSERT INTO passes(passType, passCategory, passStatus, passNumber, dateIssued, dateExpiry, visitorId) VALUES
	('LOA', 'A', 'ACTIVE', 1, now(), now(), 1),
	('LOA', 'A', 'ACTIVE', 1, now(), now(), 2),
	('LOA', 'A', 'ACTIVE', 1, now(), now(), 3),
	('LOA', 'A', 'ACTIVE', 1, now(), now(), 4),
	('LOA', 'A', 'ACTIVE', 1, now(), now(), 5),
	('LOA', 'A', 'ACTIVE', 1, now(), now(), 6),
	('LOA', 'A', 'ACTIVE', 1, now(), now(), 1),
	('LOA', 'A', 'ACTIVE', 1, now(), now(), 7),
	('LOA', 'A', 'ACTIVE', 1, now(), now(), 8),
	('LOA', 'A', 'ACTIVE', 1, now(), now(), 9),
	('LOA', 'A', 'ACTIVE', 1, now(), now(), 10)
	;
-- visits
-- insert two visits from initial listings and two customer added listings
INSERT INTO visits(siteId, visitPurpose, expectedDurationHrs, signInStaffId, passId) VALUES 
-- site 1 (Abindgdon)
	(1, 'initial company 1', 1, 'tsk', 1),
	(1, 'initial company 2', 1, 'tsk', 2),
	(1, 'additional company 1', 1, 'tsk', 4),
	(1, 'additional company 2', 1, 'tsk', 5),
	-- site 2 (Acle)
	(2, 'site2',1,'tsk',6), -- other company
	(2, 's2', 1, 'tsk',7), -- expected company
	(2, 'site2',1,'tsk',6), -- other company
	-- oz site 1 (Perth)
	(331, 'perth1', 1, 'ss', 8), -- expected company
	(331, 'perth', 1, 'ss', 9), -- other company
	-- oz site 2 (Sydney)
	(332, 'sydney1', 1, 'ss', 10); -- other company
	

-- the data is now set up to migrate
-- to reiterate, previous data had all visitors enter a company
-- we want to see if visitors are from companies outside the expected company list. we've done that by linking up the whenLoaded tables. but, we still need to migrate the current data.
-- so, first we want to pull out all the companies from the visits that aren't in the initial listing (all the customer added companies)
-- create a temporary table to hold the companies

CREATE TEMPORARY TABLE all_other_companies (companyname VARCHAR(255));
-- then we need to copy out all the company names that we don't already have
INSERT INTO all_other_companies select visitors.company from visitors LEFT JOIN companies ON visitors.company = companies.companyName WHERE companies.companyid is null;
-- insert those values into the companies table
-- whenloadedid will always be 2
SELECT whenloadedid from whenloaded;
INSERT INTO companies(companyName, whenLoadedId) select all_other_companies.companyname, 2 from all_other_companies;
-- check
-- select * from companies;

-- now we want to update visitors to use the FK from companies table
alter table visitors add column companyid int;
update visitors set companyid = (select companyid from companies where companies.companyname = visitors.company);
alter table visitors drop column company;
alter table visitors add foreign key (companyid)
	references companies(companyid);

-- do the same thing to update sites table to use countries FK
alter table sites add column countryid int;
update sites set countryid = (select countryid from countries where countries.countryName = sites.country);
alter table sites drop column country;
alter table sites add foreign key (countryid)
	references countries(countryid);
	

/**
drop table if exists "visitors" cascade;
drop table if exists "passes" cascade;
drop table if exists "countries" cascade;
drop table if exists "sites" cascade;
drop table if exists "vehicles" cascade;
drop table if exists "signinchecks" cascade;
drop table if exists "welfarechecks" cascade;
drop table if exists "whenloaded" cascade;
drop table if exists "companies" cascade;
drop table if exists "all_other_companies" cascade;
drop table if exists "savedid" cascade;
drop table if exists "savedids" cascade;
**/