<?php
declare(strict_types=1);

function valeur(string $nom): ?string
{
    $valeur = trim($_POST[$nom] ?? '');
    return $valeur === '' ? null : $valeur;
}

function entier(?string $valeur, string $nom): ?int
{
    if ($valeur === null) {
        return null;
    }

    $resultat = filter_var($valeur, FILTER_VALIDATE_INT);
    if ($resultat === false || $resultat < 0) {
        throw new RuntimeException("Valeur invalide pour « $nom ».");
    }

    return $resultat;
}

try {
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        http_response_code(405);
        exit('Méthode non autorisée.');
    }

    $name = valeur('name');
    if ($name === null) {
        throw new RuntimeException('Le nom du jeu est obligatoire.');
    }

    // IMPORTANT : ce chemin doit être exactement celui utilisé dans api.php.
    $db = new PDO('sqlite:' . __DIR__ . '/jeux.db');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $sql = 'INSERT INTO games (name, players_label, duration_label, card_label, rating
            ) VALUES (:name, :players_label, :duration_label, :card_label, :rating)';

    $stmt = $db->prepare($sql);
    $stmt->execute([
        ':name' => $name,
        ':players_label' => valeur('players_label'),
        ':duration_label' => valeur('duration_label'),
        ':card_label' => valeur('card_label'),
        ':rating' => valeur('rating'),
    ]);

    header('Location: index.html?ajout=ok');
    exit;

} catch (Throwable $e) {
    http_response_code(400);
    echo '<!doctype html><html lang="fr"><meta charset="utf-8">';
    echo '<title>Erreur</title><body>';
    echo '<h1>Impossible d’ajouter le jeu</h1>';
    echo '<p>' . htmlspecialchars($e->getMessage(), ENT_QUOTES, 'UTF-8') . '</p>';
    echo '<p><a href="add.html">Retour au formulaire</a></p>';
    echo '</body></html>';
}