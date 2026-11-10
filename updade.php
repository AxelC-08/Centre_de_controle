<?php
declare(strict_types=1);

function page(string $message, bool $success = false): never
{
    $titre = $success ? 'Opération réussie' : 'Erreur';
    $couleur = $success ? 'green' : 'crimson';

    echo '<!doctype html><html lang="fr"><meta charset="utf-8">';
    echo '<title>' . $titre . '</title><body>';
    echo '<h1>' . $titre . '</h1>';
    echo '<p style="color:' . $couleur . '">'
        . htmlspecialchars($message, ENT_QUOTES, 'UTF-8')
        . '</p>';
    echo '<p><a href="index.html">Retour au catalogue</a></p>';
    echo '</body></html>';
    exit;
}

function champ(string $nom): ?string
{
    $valeur = trim($_POST[$nom] ?? '');
    return $valeur === '' ? null : $valeur;
}

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    page('Méthode non autorisée.');
}

$id = filter_input(INPUT_POST, 'idj', FILTER_VALIDATE_INT);
$name = champ('name');

if ($id === false || $id === null || $id < 1) {
    http_response_code(400);
    page('Veuillez fournir un identifiant valide.');
}

if ($name === null) {
    http_response_code(400);
    page('Le nom du jeu est obligatoire.');
}

$ratingText = champ('rating');
$rating = null;

if ($ratingText !== null) {
    if (!is_numeric($ratingText) || (float)$ratingText < 0 || (float)$ratingText > 5) {
        http_response_code(400);
        page('La note doit être un nombre compris entre 0 et 5.');
    }
    $rating = (float)$ratingText;
}

try {
    // Ajuste ce chemin si api.php utilise un autre emplacement.
    $db = new PDO('sqlite:' . __DIR__ . '/jeux.db');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $db->prepare(
        'UPDATE games
         SET name = :name,
             players_label = :players_label,
             duration_label = :duration_label,
             card_label = :card_label,
             rating = :rating
         WHERE id = :id'
    );

    $stmt->execute([
        ':name' => $name,
        ':players_label' => champ('players_label'),
        ':duration_label' => champ('duration_label'),
        ':card_label' => champ('card_label'),
        ':rating' => $rating,
        ':id' => $id,
    ]);

    // rowCount peut valoir 0 si les valeurs envoyées sont identiques.
    $check = $db->prepare('SELECT 1 FROM games WHERE id = :id');
    $check->execute([':id' => $id]);

    if (!$check->fetchColumn()) {
        page("Aucun jeu trouvé avec l’identifiant $id.");
    }

    page("Le jeu portant l’identifiant $id a été mis à jour.", true);
} catch (Throwable $e) {
    http_response_code(500);
    page('Impossible de modifier le jeu : ' . $e->getMessage());
}