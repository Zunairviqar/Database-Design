-- insert
-- Works
INSERT INTO title_type (type_id, name) VALUES
('1','Movie'),
('2','TV Show');

-- Works
INSERT INTO netflix_titles (showid, title, title_type_type_id, date_added, release_year, rating, duration, description) VALUES
('81145628','Norm of the North: King Sized Adventure.com', 1, '2019-09-09', 2019, 'TV-PG', '90 min', 'Before planning an awesome wedding for his grandfather, a polar bear king must take back a stolen artifact from an evil archaeologist first.'),
('70304989','Automata',1,  '2017-09-08', '2014', 'R', '110 min','In a dystopian future, an insurance adjuster for a tech company investigates a robot killed for violating protocol and discovers a global conspiracy.'),
('80117902','Fabrizio Copano: Solo pienso en mi', 1, '2017-09-08','2017', 'TV-MA', '60 min', 'Fabrizio Copano takes audience participation to the next level in this stand-up set while reflecting on sperm banks, family WhatsApp groups and more.');

-- Works
INSERT INTO director (director_id, name) VALUES
('1','Richard Finn'),
('2','Tim Maltby'),
('3','Gabe Ibáñez'),
('4','Rodrigo Toro'),
('5','Francisco Schultz');

INSERT INTO netflix_titles_has_director (director_director_id, netflix_titles_showid) VALUES
('1','81145628'),
('2','81145628'),
('3','70304989'),
('4','80117902'),
('5','80117902');

-- Works
INSERT INTO cast (cast_id, name) VALUES
('1','Alan Marriott'),
('2','Andrew Toth'),
('3','Brian Dobson'),
('4','Cole Howard'),
('5','Jennifer Cameron'),
('6','Jonathan Holmes'),
('7','Lee Tockar'),
('8','Lisa Durupt'),
('9','Maya Kay'),
('10','Michael Dobson'),
('11','Antonio Banderas'),
('12','Dylan McDermott'),
('13','Melanie Griffith'),
('14','Birgitte Hjort Sørensen'),
('15','Robert Forster'),
('16','Christa Campbell'),
('17','Tim McInnerny'),
('18','Andy Nyman'),
('19','David Ryall'),
('20','Fabrizio Copano');

INSERT INTO netflix_titles_has_cast (cast_cast_id, netflix_titles_showid) VALUES
('1','81145628'),
('2','81145628'),
('3','81145628'),
('4','81145628'),
('5','81145628'),
('6','81145628'),
('7','81145628'),
('8','81145628'),
('9','81145628'),
('10','81145628'),
('11','70304989'),
('12','70304989'),
('13','70304989'),
('14','70304989'),
('15','70304989'),
('16','70304989'),
('17','70304989'),
('18','70304989'),
('19','70304989'),
('20','80117902');

-- Works
INSERT INTO country_produced (country_id, name) VALUES
('1','United States'),
('2','India'),
('3','South Korea'),
('4','China'),
('5','Bulgaria'),
('6', 'Spain'),
('7', 'Canada'),
('8', 'Chile');

INSERT INTO netflix_titles_has_country_produced (country_produced_country_id, netflix_titles_showid) VALUES
('1','81145628'),
('2','81145628'),
('3','81145628'),
('4','81145628'),
('5','70304989'),
('1','70304989'),
('6','70304989'),
('7','70304989'),
('8','80117902');

-- Works
INSERT INTO genre (genre_id, name) VALUES
('1','Children & Family Movies'),
('2','Comedies'),
('3','International Movies'),
('4','Sci-Fi & Fantasy'),
('5','Thrillers'),
('6','Stand-Up Comedy');


INSERT INTO netflix_titles_has_genre (genre_genre_id, netflix_titles_showid) VALUES
('1','81145628'),
('2','81145628'),
('3','70304989'),
('4','70304989'),
('5','70304989'),
('6','80117902');
