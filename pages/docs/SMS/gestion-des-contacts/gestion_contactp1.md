---
title: Ajouter un groupe
description: >
---
# Ajouter un groupe


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/group/add</span>
</div>




## Paramètres

Chaque demande d’API prend en charge les paramètres suivants :
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **name** | Nom du compte |






## Requête
``` bash
curl --location --request POST 'http://api.smspartner.fr/v1/group/add' 
--header 'Content-Type: application/json' --data-raw '{   "apiKey": "YOUR_API_KEY",
   "name": "Nom du groupe"}'
```
## Réponses
``` json
{   
"success": true,   
"code": 2,   
"name": "Nom du groupe",   
"groupId": "ID GROUPE" 
}
```



## Erreurs
Exemple de message d’erreur :

``` json
{   
{ 
"success": false, 
"code": 10, 
"message": "Clef API incorrecte" 
}
}
```

## Code de contrôle

| _  | Code erreurs |
| :---------------: |:---------------|
|1 | 	name est requis |
|2 | 	La Clé API est requise |
<br>



