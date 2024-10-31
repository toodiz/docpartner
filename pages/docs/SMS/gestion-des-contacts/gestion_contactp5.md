---
title: Modifier un contact
description: >
---
# Modifier un contact


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/contact/update</span>
</div>




## Paramètres

Chaque demande d’API prend en charge les paramètres suivants :
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **contactId** |Identifiant du contact à modifier| 
| **phoneNumber** |Numéros de téléphone du contact. <br> Pour l’envoi de plusieurs SMS les numéros doivent être séparés par des virgules. <br> Ils peuvent être :  <ul><li>Au format national (0600000000) et international (+33600000000) pour des numéros français.</li><li>Au format international (+496xxxxxxxx), pour des numéros hors France.</li></ul>| 
| **firstname** | Prénom (32 caractères maximum). |
|**lastname** 	| Nom (32 caractères maximum).| 
|**date** 	| Date au format YYYY-MM-DD. Pourra être utilisé pour des envois automatique (ex: anniversaire )| 
|**url** 	| Url , elle doit commencer par http:// ou https://| 
|**custom1** 	| Champ personnalisé 1.| 
|**custom2** 	| Champ personnalisé 2.| 
|**custom3** 	| Champ personnalisé 3.| 
|**custom4** 	| Champ personnalisé 4.| 



## Requête

Exemple de requête :

``` bash
{
  "url": "http://api.smspartner.fr/v1/contact/update",
  "method": "POST",
  "headers": {
    "Content-Type": "application/json"
  },
  "data": {
    "apiKey": "YOUR_API_KEY",
    "contactId": "ID CONTACT",
    "contact": {
      "phoneNumber": "+xxxxxxxxx",
      "firstname": "prénom",
      "lastname": "nom",
      "url": "",
      "date": "12-06-2020",
      "custom2": "custom2"
    }
  }
}
```
## Réponses
``` json
{
  "success": true,
  "code": 200,
  "contact": {
    "phoneNumber": "+xxxxxxxx",
    "firstname": "prénom",
    "lastname": "nom",
    "url": "",
    "date": "12-06-2020",
    "custom2": "custom2",
    "contactId": "ID CONTACT"
  }
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
|1 | 	groupId est requis |
|2 | 	Contact infos sont requises |
|10 | La Clé API est requise |
|15 | Le numéro est déjà dans le groupe |
<br>



