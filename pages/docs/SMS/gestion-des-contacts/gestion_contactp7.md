---
title: Obtenir la liste des groupes
description: >
---
# Obtenir la liste des groupes de contacts


## URL

<div>
  <div style="background-color: red; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/group/list</span>
</div>




## Paramètres

Chaque demande d’API prend en charge les paramètres suivants :
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |





## Requête

Exemple de requête :

``` bash
{
  "curlCommand": {
    "location": true,
    "request": "GET",
    "url": "https://api.smspartner.fr/v1/group/list?
    apiKey=YOUR_API_KEY"
  }
}
```
## Réponses
``` json
{
  "success": false,
  "groups": [
    {
      "id": "identifiant du groupe",
      "name": "groupe name",
      "createdAt": "2020-10-02T16:40:05+02:00",
      "isSpecialFile": false,
      "isLocationFile": false
    }
  ]
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
|10 | La Clé API est requise |

<br>



