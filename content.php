<?php

// Vérifier si le paramètre path est fourni
if ($argc != 2) {
    die("Usage: php content.php <path>\n");
}

$path = $argv[1];

// Paramètres de connexion à la base de données
$host = 'localhost';
$db   = 'api_docs';
$user = 'root';
$pass = '';
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
    die("Chemin non trouvé dans la base de données.\n");
}

$id_chemin = $result['id'];

// Tableaux pour stocker les résultats
$tables = ['introduction', 'URLAPI', 'PARAMETRE', 'REQUETE_REPONSE', 'ERREUR_ControleCode', 'Suitecode'];
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