<?php

// Fonction pour afficher les messages d'erreur en rouge
function error_message($message) {
    echo "\033[31m$message\033[0m\n";
    die();
}

// Vérifier si les paramètres path et langue sont fournis
if ($argc != 3) {
    error_message("Usage: php content.php <path> <langue>");
}

$path = $argv[1];
$langue = strtolower(substr($argv[2], 0, 2)); // Prendre les deux premières lettres et les mettre en minuscules

// Modifier le chemin du fichier si la langue n'est pas 'fr'
if ($langue != 'fr') {
    $path = preg_replace('/\.md$/', ".$langue.md", $path);
}

// Paramètres de connexion à la base de données
$host = 'localhost';
$db   = 'api_docs';
// $user = 'root';
// $pass = '';
$user = 'test';
$pass = 'test';
$charset = 'utf8mb4';

$dsn = "mysql:host=$host;dbname=$db;charset=$charset";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
];

try {
    $pdo = new PDO($dsn, $user, $pass, $options);
} catch (\PDOException $e) {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
}

// Récupérer l'ID du chemin
$stmt = $pdo->prepare("SELECT id FROM chemin WHERE path = ?");
$stmt->execute([$path]);
$result = $stmt->fetch();

if (!$result) {
    error_message("Chemin non trouvé dans la base de données.");
}

$id_chemin = $result['id'];
echo("hhhh $id_chemin");

// Tableaux pour stocker les résultats
$tables = ['introduction', 'urlapi', 'parametre', 'requete_reponse', 'erreur_controlecode', 'suitecode'];
$content = [];

// Récupérer le contenu de chaque table
foreach ($tables as $table) {
    $stmt = $pdo->prepare("SELECT textcode FROM $table WHERE id_chemin = ?");
    $stmt->execute([$id_chemin]);
    $result = $stmt->fetchAll();
    
    if ($result) {
        $content[$table] = $result[0]['textcode'];
    }
}

// Générer le contenu du fichier Markdown
$markdown = "";
foreach ($tables as $table) {
    if (isset($content[$table])) {
        $markdown .= $content[$table] . "\n\n";
    }
}

// Créer le répertoire si nécessaire
$dir = dirname($path);
if (!is_dir($dir)) {
    mkdir($dir, 0777, true);
}

// Écrire le contenu dans le fichier
file_put_contents($path, $markdown);

echo "Fichier Markdown généré avec succès : $path\n";

?>
