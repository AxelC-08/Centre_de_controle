-- Catalogue extrait des lignes de jeux de la page HTML source.
-- Les points de suspension et informations inconnues deviennent NULL.
-- Les mentions non numériques sont conservées dans les colonnes *_label.
PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS games (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    players_min INTEGER CHECK (players_min IS NULL OR players_min >= 0),
    players_max INTEGER CHECK (players_max IS NULL OR players_max >= 0),
    players_label TEXT,
    duration_min_minutes INTEGER CHECK (duration_min_minutes IS NULL OR duration_min_minutes >= 0),
    duration_max_minutes INTEGER CHECK (duration_max_minutes IS NULL OR duration_max_minutes >= 0),
    duration_label TEXT,
    card_count INTEGER CHECK (card_count IS NULL OR card_count >= 0),
    card_label TEXT,
    rating REAL CHECK (rating IS NULL OR (rating >= 0 AND rating <= 5)),
    rating_label TEXT
);
CREATE INDEX IF NOT EXISTS idx_games_name ON games(name);
