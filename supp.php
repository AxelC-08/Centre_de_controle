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

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    page('Méthode non autorisée.');
}

$id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);

if ($id === false || $id === null || $id < 1) {
    http_response_code(400);
    page('Veuillez fournir un identifiant valide.');
}

try {
    // Ajuste ce chemin si api.php utilise un autre emplacement.
    $db = new PDO('sqlite:' . __DIR__ . '/jeux.db');
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmt = $db->prepare('DELETE FROM games WHERE id = :id');
    $stmt->execute([':id' => $id]);

    if ($stmt->rowCount() === 0) {
        page("Aucun jeu trouvé avec l’identifiant $id.");
    }

    page("Le jeu portant l’identifiant $id a été supprimé.", true);
} catch (Throwable $e) {
    http_response_code(500);
    page('Impossible de supprimer le jeu : ' . $e->getMessage());
}