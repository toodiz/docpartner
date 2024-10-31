import os
import json
import re

def extract_title_and_intro(content):
    # Utiliser des expressions régulières pour extraire les lignes title et description
    title_match = re.search(r'^title:\s*(.+)', content, re.MULTILINE)
    description_match = re.search(r'^description:\s*(.+)', content, re.MULTILINE)

    # Extraire le titre et la première phrase de la description si trouvés
    title = title_match.group(1).strip() if title_match else ""
    description = description_match.group(1).split('.')[0].strip() if description_match else ""  # Prendre la première phrase de description
    
    return title, description

def main(markdown_dir, output_file):
    posts = []

    # Parcourir tous les fichiers dans le répertoire et ses sous-répertoires
    for root, dirs, files in os.walk(markdown_dir):
        for filename in files:
            if filename.endswith('.md'):
                file_path = os.path.join(root, filename)
                
                with open(file_path, 'r', encoding='utf-8') as file:
                    content = file.read()
                    # Extraire le titre et l'introduction (première phrase de la description)
                    title, intro = extract_title_and_intro(content)

                    # Tronquer le contenu à 500 caractères
                    truncated_content = content[:500].strip()  # Prendre seulement les 500 premiers caractères
                    
                    # Extraire le chemin relatif y compris le dossier 'docs'
                    try:
                        relative_path_from_docs = file_path.split(markdown_dir + os.sep, 1)[1]
                        relative_path = f"docs/{os.path.splitext(relative_path_from_docs)[0]}"  # Retirer l'extension .md ici
                        
                        if '.en' in relative_path:
                            relative_path = relative_path.replace('.en', '')  # Retirer '.en' de l'URL
                            relative_path = f"en/{relative_path}"  # Ajouter 'en/' seulement si le fichier se termine par '.en'

                        relative_path = relative_path.lower()  # Convertir en minuscules
                        relative_path = relative_path.replace('\\', '/')  # Remplacer les backslashes par des slashes pour une URL correcte
                    except IndexError:
                        relative_path = ""  # Si 'docs' n'est pas trouvé dans le chemin, laisser vide
                    
                    # Ajouter le post au tableau
                    posts.append({
                        'Title': title,
                        'Intro': intro,
                        'Content': truncated_content,  # Ajouter le contenu tronqué ici
                        'Url': relative_path  # URL incluant 'en/docs' ou 'docs' selon le cas, sans .md ni .en
                    })

    # Écrire le fichier JSON
    with open(output_file, 'w', encoding='utf-8') as json_file:
        json.dump(posts, json_file, ensure_ascii=False, indent=4)

if __name__ == '__main__':
    markdown_directory = 'pages/docs'  # Remplace par le chemin vers tes fichiers Markdown
    output_json_file = 'search-data.json'  # Nom du fichier JSON de sortie
    main(markdown_directory, output_json_file)
    print(f'Fichier JSON créé : {output_json_file}')
