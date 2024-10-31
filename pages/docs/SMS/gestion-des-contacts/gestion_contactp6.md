---
title: Supprimer un contact
description: >
---
# Supprimer un contact


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;">http://api.smspartner.fr/v1/contact/delete</span>
</div>




## Paramètres

Chaque demande d’API prend en charge les paramètres suivants :
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **contactId** |Identifiant du contact | 




## Requête

Exemple de requête :

``` bash
curl --location --request 
POST 'http://api.smspartner.fr/v1/contact/delete' 
--header 'Content-Type: application/json' 
--data-raw '{
   "apiKey": "YOUR_API_KEY",
   "contactId": "ID CONTACT"}'
```
## Réponses
``` json
{
   "success": true,
   "code": 200
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
|1 | 	groupId est requis |
|10 | La Clé API est requise |
|404 | Le groupe n’existe pas |
<br>



