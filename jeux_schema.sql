-- Catalogue extrait des lignes de jeux de la page HTML source.
-- Les points de suspension et informations inconnues deviennent NULL.
-- Les mentions non numériques sont conservées dans les colonnes *_label.
PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS games (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    players_label TEXT,
    duration_label TEXT,
    card_label TEXT,
    rating REAL CHECK (rating IS NULL OR (rating >= 0 AND rating <= 5)),
    rating_label TEXT
);
CREATE INDEX IF NOT EXISTS idx_games_name ON games(name);

INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('1 jeux de tarot', '3-5', 'Indéterminée', 'Dépend', 5.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('5 jeux de 54 cartes', NULL, NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('5 lives', '2-6', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Apéro culte Vieux Con', '2-10', 'Variable', NULL, NULL);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Bellz !', NULL, NULL, NULL, NULL);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Cluedo', '2-6', NULL, NULL, 3.5);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Crack list', '2-8', '30 min', NULL, 2.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Cranium', '4+', NULL, NULL, 3.5);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Crazy cup +', '2', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Dékal', '2-6', '6 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Jungle Speed', '2-10', '10 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('La Horde', '2-4', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Limite Limite', '3+', '15 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Master mind', '2', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Microbz', '2-6', '10 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Mikamo', NULL, NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Mimetix', '3+', '30-45 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Monopoly édition tricheurs', '2-6', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Monopoly électronique ultime', '2-4', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Papayoo', '3-8', '30 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('pictionary', '3-7', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Quick Touch !', '1+', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Skyjo', '2-8', '30 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Taco chat bouc cheese pizza', NULL, '10 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Time’s up !', NULL, NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Triominos de luxe', '2-10', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Uno Flip', '2-10', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Wazabi', '2-6', '20 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Tala ref 90’s 2000’s', '3+', '30 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('présage', '4-6', '10 min et +', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Le poker des cafards', '2-6','25 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Pili pili', '2-8', '20 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Kites', '2-6', '10 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Gagne ton papa !', '2', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Puissance 4', '2', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Mind me !', '3-7', '20 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Brainstorm !', NULL, '60 min', NULL, 4.0); 
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('6 qui surprend !', '2-10', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Jungle Speed', NULL, NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Bonanza', '2-7', '45 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('1000 Bornes', NULL, NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Just One', '3-7', '20 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Celebrity Taboo', '4+', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Puissance 4 Shots', '2', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Loups-Garous', '8-18', '30 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Kapla', 'Beaucoup', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Cluedo', '2-6', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Smart Game', NULL, NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Hitster français', '2-10', '30 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('La bonne Paye', '2-8', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Diplomatie', '2-7', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Hitster international', '2-10', '30 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Code names', '2-8', '15 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('1000 Bornes car', '2-8', NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Zombie teenz', '2-4', '20 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Duplik Duplik', '3-10', '45 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('voisins parfaits', '3-7', '20 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Diamant', '3-8', '30 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Tales of Italy', NULL, NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Cabanga', '3-6', '20 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Top ten', '4-9', '30 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Traîtres à bord', '3-8', '20 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Mister Geopolitix', NULL, NULL, NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Match Beat', '3-8', '20 min', NULL, 4.0);
INSERT INTO games (name, players_label, duration_label, card_label, rating) VALUES ('Taggle', '3-12', '30 min', '1', 4.0);

COMMIT;
