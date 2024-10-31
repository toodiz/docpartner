---
title: Obtenir le détail d’un contact
description: >
---
# Obtenir le détail d’un contact


## URL

<div>
  <div style="background-color: red; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> https://api.smspartner.fr/v1/contact/detail</span>
</div>




## Paramètres

Chaque demande d’API prend en charge les paramètres suivants :
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **apiKey**      |Identifiant du contact. |




## Requête

Exemple de requête :

``` bash
{
  "url": "https://api.smspartner.fr/v1/contact/detail?apiKey=YOUR_API_KEY&contactId=ID_CONTACT",
  "method": "GET",
  "location": true
}
```
## Réponses
``` json
{
   "success": true,
   "code": 200,
   "contact": {
       "contactId": "ID CONTACT",
       "phone": "+xxxxxxxxxxx",
       "firstname": "",
       "lastname": "",
       "url": "",
       "shortUrl": "",
       "date": "",
       "custom1": "",
       "custom2": "",
       "custom3": "",
       "custom4": "",
       "createdAt": "2020-10-02T16:40:05+02:00",
       "stopSms": false,
       "groupId": 6363
   }
}
```



## Erreurs
Exemple de message d’erreur :

``` json
{
  "success": false,
  "code": 10,
  "message": "Clef API incorrecte"
}
```

## Code de contrôle

| _  | Code erreurs |
| :---------------: |:---------------|
|1 | contactId est requis |
|10 | La Clé API est requise |
|404 | Le contact n’existe pas |

<br>



