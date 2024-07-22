---
title: "API Documentation"
layout: "default"
---

<div id="docs-container"></div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    var apiUrl = '/fetch_docs.php'; // Mettre à jour avec l'URL correcte de ton serveur

    // Faire une requête fetch pour récupérer les données depuis l'API
    fetch(apiUrl)
        .then(response => response.json()) // Convertir la réponse en JSON
        .then(docs => {
            var docsContainer = document.getElementById('docs-container'); // Récupérer l'élément où afficher les données

            // Boucler à travers les documents récupérés
            docs.forEach(doc => {
                var docElement = document.createElement('div'); // Créer un élément pour chaque document
                docElement.innerHTML = `
                    <h2>${doc.title}</h2>
                    <p>${doc.content}</p>
                    <hr>
                `;
                docsContainer.appendChild(docElement); // Ajouter l'élément au conteneur
            });
        })
        .catch(error => {
            console.error('Error fetching documents:', error); // Gérer les erreurs éventuelles
        });
});

</script>
