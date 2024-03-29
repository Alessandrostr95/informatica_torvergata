use informatica_magistrale;

insert into teacher
(lastname,          firstname,          qualification,  office,     phone,              mail,                                   website) values
('Arcieri',         'Franco',           'Esterno',      NULL,       '3355399135',       'arcieri@nestor.uniroma2.it',           NULL),
('Ausiello',        'Gabriele',         'Ordinario',    NULL,       NULL,               NULL,                                   NULL), 	 	 	 	 
('Basili',          'Roberto',          'Associato',    'A11',      '+390672597391',    'basili@info.uniroma2.it',              'http://ai-nlp.info.uniroma2.it/basili/'),
('Bianchi',         'Giuseppe',         'Ordinario',    NULL,       NULL,               NULL,                                   NULL),  
('Clementi',        'Andrea',           'Ordinario',    '00116',    '4622',             'clementi@mat.uniroma2.it',             'http://www.mat.uniroma2.it/~clementi/'), 
('Croce',           'Danilo',           'Ordinario',    NULL,       NULL,               NULL,                                   NULL),  
("D'Ambrogio",      'Andrea',           'Associato',    'A3-13',    '0672597381',       'dambro@uniroma2.it',                   'http://sel.uniroma2.it/dambro'),  
('Di Fiore',        'Carmine',          'Associato',    NULL,       '4631',             'difiore@mat.uniroma2.it',              NULL),
('Di Ianni',        'Miriam',           'Associato',    '0117',     '4631',             'diianni@mat.uniroma2.it',              'http://www.mat.uniroma2.it/~diianni/'),  
('Dimitri',         'Andrea',           'Esterno', 	    NULL,       '3357651573',       'andrea.dimitri@uniroma2.it',           NULL),
('Gambosi',         'Giorgio',          'Ordinario',    '1114',     '0672594696',       'giorgio.gambosi@uniroma2.it',          NULL),
('Gualà',           'Luciano',          'Ricercatore',  '0206',     '0672594615',       'guala@mat.uniroma2.it',                'http://www.mat.uniroma2.it/~guala/'),  
('Iazeolla',        'Giuseppe',         'Ordinario',    'A3-18',    '06-72597376',      'iazeolla@uniroma2.it',                 'http://www.sel.uniroma2.it/iazeolla'),  
('Intrigila',       'Benedetto',        'Ordinario',    '1212',     '0672594670',       'intrigil@mat.uniroma2.it',             NULL),
('Isola',           'Tommaso',          'Ordinario',    NULL,       NULL,               NULL,                                   NULL),
('Lipparini',       'Paolo',            'Ricercatore',  NULL,       NULL,               'lipparin@axp.mat.uniroma2.it',         'http://axp.mat.uniroma2.it/~lipparin/stud.html'),
('Macci',           'Claudio',          'Associato',    '2003',     '0672594728',       'macci@mat.uniroma2.it',                'http://www.mat.uniroma2.it/~macci'),
('Manni',           'Carla',            'Ordinario',    '1202',     '0672594660',       'manni@mat.uniroma2.it',                'http://www.mat.uniroma2.it/~manni/'),
('Pareschi',        'Giuseppe',         'Ordinario',    NULL,       NULL,               NULL,                                   NULL),
('Salsano',         'Stefano Domenico', 'Ordinario',    NULL,       NULL,               NULL,                                   NULL),
('Scalia Tomba',    'Giampaolo',        'Associato',    NULL,       NULL,               NULL,                                   NULL),
('Speleers',        'Hendrik',          'Ordinario',    NULL,       NULL,               NULL,                                   NULL),
('Stellato',        'Armando',          'Ricercatore',  'A1-14',    '+390672597330',    'stellato@uniroma2.it',                 'http://art.uniroma2.it/stellato'),
('Talamo',          'Maurizio',         'Ordinario',    NULL,       '062020568',        'talamo@nestor.uniroma2.it',            NULL),
('Vatalaro',        'Francesco',        'Ordinario',    NULL,       NULL,               NULL,                                   NULL),	 	 	 	 
('Zanzotto',        'Fabio Massimo',    'Associato',    'A1-14',    '0672597330',       'fabio.massimo.zanzotto@uniroma2.it',   'http://art.uniroma2.it/zanzotto');

insert into class
(name, code, sector, course_year) values
('Algoritmi distribuiti e reti complesse','ADRC','INF/01',1),
('Analisi di reti','AR','INF/01',1),
('Calcolo delle probabilità','CP2','MAT/06',1),
("Economia dell'ICT",'EICT','ING-INF/03',1),
('Elementi di analisi numerica','EAN','MAT/08',1),
('Geometria algebrica','GA2','MAT/03',1),
("Inferenza statistica e teoria dell'informazione",'ISTI','MAT/06',1),
('Logica matematica 1','LM1','MAT/01',1),
('Modellizzazione geometrica e simulazione numerica','MGSN','MAT/08',1),
('Service oriented software engineering','SOSE','ING-INF/05',1),
('Sicurezza informatica e Internet','SII','ING-INF/05',1),
('Sistemi di simulazione distribuita','SSD','ING-INF/05',1),
('Sistemi distribuiti cooperativi','SDC','INF/01',1),
('Information retrieval','IR','INF/01',2),
('Intelligenza artificiale 2 - Ingegneria della conoscenza','IA2','ING-INF/05',2),
('Internet technology and protocols','ITP','ING-INF/03',2),
('Machine learning','ML','INF/01',2),
('Metodi di verifica di sistemi','MVS','INF/01',2),
('Modelli e qualità del SW','MQS','INF/01',2),
('Natural language processing','NLP','ING-INF/05',2),
('Sicurezza dei sistemi informativi','SSI','INF/01',2),
('Teoria spettrale','TS','MAT/05',2),
('Web mining and retrieval','WMR','INF/01',2);

insert into class_offered
(class,     year,       cfu) values
('ADRC',    '21-22',    9),
('AR',      '21-22',    6),
('CP2',     '21-22',    6),
('EICT',    '21-22',    6),
('EAN',     '21-22',    8),
('GA2',     '21-22',    8),
('ISTI',    '21-22',    6),
('LM1',     '21-22',    8),
('MGSN',    '21-22',    8),
('SOSE',    '21-22',    9),
('SII',     '21-22',    9),
('SSD',     '21-22',    6),
('SDC',     '21-22',    9),
('IR',      '21-22',    6),
('IA2',     '21-22',    6),
('ITP',     '21-22',    6),
('ML',      '21-22',    9),
('MVS',     '21-22',    6),
('MQS',     '21-22',    9),
('NLP',     '21-22',    6),
('SSI',     '21-22',    9),
('TS',      '21-22',    8),
('WMR',     '21-22',    9);

insert into teach
(class,     year,       teacher) values
('ADRC',    '21-22',    5),
('ADRC',    '21-22',    12),
('AR',      '21-22',    9),
('CP2',     '21-22',    17),
('EICT',    '21-22',    25),
('EAN',     '21-22',    8),
('GA2',     '21-22',    19),
('ISTI',    '21-22',    21),
('LM1',     '21-22',    16),
('MGSN',    '21-22',    18),
('MGSN',    '21-22',    22),
('SOSE',    '21-22',    7),
('SII',     '21-22',    4),
('SSD',     '21-22',    7),
('SDC',     '21-22',    24),
('SDC',     '21-22',    1),
('IR',      '21-22',    6),
('IR',      '21-22',    11),
('IA2',     '21-22',    23),
('ITP',     '21-22',    20),
('ML',      '21-22',    11),
('MVS',     '21-22',    14),
('MQS',     '21-22',    13),
('NLP',     '21-22',    26),
('SSI',     '21-22',    24),
('SSI',     '21-22',    10),
('TS',      '21-22',    15),
('WMR',     '21-22',    3);

insert into calendar
(class,     year,       semester,   day,    start_time, end_time,   room,   building) values
('SSD',     '21-22',    2,          0,      '11:30:00', '13:30:00', 'C10',  'INGEGNERIA'),
('SSD',     '21-22',    2,          4,      '11:30:00', '13:30:00', 'C7',   'INGEGNERIA'),
('ISTI',    '21-22',    2,          1,      '09:00:00', '11:00:00', '2',    'SOGENE'),
('ISTI',    '21-22',    2,          4,      '09:00:00', '11:00:00', '2',    'SOGENE'),
('CP2',     '21-22',    2,          1,      '14:00:00', '16:00:00', '19',   'SOGENE'),
('CP2',     '21-22',    2,          3,      '14:00:00', '16:00:00', '19',   'SOGENE'),

('MQS',     '21-22',    2,          0,      '11:30:00', '13:30:00', NULL,   'ONLINE'),
('MQS',     '21-22',    2,          1,      '14:00:00', '18:00:00', NULL,   'ONLINE'),
('MQS',     '21-22',    2,          2,      '14:00:00', '18:00:00', NULL,   'ONLINE'),
('WMR',     '21-22',    2,          0,      '14:00:00', '18:00:00', '19',   'SOGENE'),
('WMR',     '21-22',    2,          2,      '09:30:00', '11:30:00', '13',   'SOGENE'),
('WMR',     '21-22',    2,          2,      '11:30:00', '13:30:00', '13',   'SOGENE'),
('SSI',     '21-22',    2,          1,      '09:30:00', '11:30:00', '13',   'SOGENE'),
('SSI',     '21-22',    2,          2,      '11:30:00', '13:30:00', '19',   'SOGENE'),
('SSI',     '21-22',    2,          3,      '09:30:00', '11:30:00', '13',   'SOGENE'),
('ML',      '21-22',    2,          1,      '12:00:00', '14:00:00', '16',   'SOGENE'),
('ML',      '21-22',    2,          3,      '16:00:00', '18:00:00', 'T7',   'SOGENE'),
('ML',      '21-22',    2,          4,      '14:00:00', '16:00:00', 'T7',   'SOGENE');
