---
title: Ajouter un lot de contacts
description: >
---
# Ajouter un lot de contacts


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/contact/add</span>

</div>

Cette requête est utilisée pour ajouter un lot de 500 contacts (maximum).



## Requête

Exemple de requête :

``` bash
 {
   "apiKey": "API_KEY",
   "groupId": "GROUP_ID",
   "contactsList": [
       {
           "firstname":"firstname_1",
           "lastname":"lastname_1",
           "date": "2023-01-01",
           "url": "http:...",
           "phoneNumber": "0600000000",
           "custom1": "email"
       },
       {
           "firstname":"firstname_2",
           "lastname":"lastname_2",
           "date": "2023-01-01",
           "url": "http:...",
           "phoneNumber": "0600000001",
           "custom1": "email"
       },
       …
   ]
}
```
## Réponses
``` json
{
   "groupe": {
       "name": "NOM DU GROUPEl",
       "token": "GROUP_ID"
   },
   "results": [
       {
           "success": false,
           "code": 15,
           "phoneNumber": "+33600000000",
           "message": "Le numéro est déjà dans le groupe"
       },
       {
           "success": false,
           "code": 15,
           "phoneNumber": "+33600000001",
           "message": "Le numéro est déjà dans le groupe"
       }
   ],
   "rapport": 
       {
       "nbline": 2,
       "nbline_imported": 0,
       "nbline_updated": 0,
       "errors": 
       {
           "stopSms": 0,
           "invalidePhone": 0,
           "duplicatePhone": 0,
           "allreadyInGroupe": 2,
           "urlInvalide": 0,
           "dateInvalide": 0,
           "empty": 0,
           "unactivated": 0,
           "dateInvalid": 0
       }
   }
}
```


