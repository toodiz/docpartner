-- Insertion dans la table chemin
INSERT INTO chemin (path) VALUES 
('pages/docs/sms/envoyer-des-sms/envois_smsp6.en.md');

-- Insertion dans la table introduction
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Modifier un contact
description: >
---
# Modifier un contact
', 'fr', 44);

-- Insertion dans la table URLAPI
INSERT INTO URLAPI (textcode, id_chemin) VALUES 
('## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/contact/update</span>
</div>

', 44);

-- Insertion dans la table PARAMETRE
INSERT INTO PARAMETRE (textcode, langue, id_chemin) VALUES 
('
## Paramètres

Chaque demande d’API prend en charge les paramètres suivants :
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l\'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
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
', 'fr', 44);

-- Insertion dans la table REQUETE_REPONSE
INSERT INTO REQUETE_REPONSE (textcode, langue, id_chemin) VALUES 
('
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
',
'fr', 44);

-- Insertion dans la table Suitecode 
INSERT INTO erreur_controlecode (textcode, langue, id_chemin) VALUES 
('
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

', 'fr', 44);



--------------------------------------------
-- Insertion dans la table introduction
-- Insertion into the introduction table
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Modify a contact
description: >
---
# Modify a contact
', 'en', 45);

-- Insertion into the URLAPI table
INSERT INTO URLAPI (textcode, id_chemin) VALUES 
('## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/contact/update</span>
</div>

', 45);

-- Insertion into the PARAMETRE table
INSERT INTO PARAMETRE (textcode, langue, id_chemin) VALUES 
('
## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You will get it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **contactId** |Identifier of the contact to modify| 
| **phoneNumber** |Contact\'s phone numbers. <br> For sending multiple SMS, the numbers must be separated by commas. <br> They can be:  <ul><li>In national format (0600000000) and international format (+33600000000) for French numbers.</li><li>In international format (+496xxxxxxxx), for numbers outside France.</li></ul>| 
| **firstname** | First name (32 characters maximum). |
|**lastname** 	| Last name (32 characters maximum).| 
|**date** 	| Date in YYYY-MM-DD format. Can be used for automatic sending (e.g., birthday)| 
|**url** 	| URL, it must start with http:// or https://| 
|**custom1** 	| Custom field 1.| 
|**custom2** 	| Custom field 2.| 
|**custom3** 	| Custom field 3.| 
|**custom4** 	| Custom field 4.| 
', 'en', 45);

-- Insertion into the REQUETE_REPONSE table
INSERT INTO REQUETE_REPONSE (textcode, langue, id_chemin) VALUES 
('
## Request

Example of a request:

``` bash
{
  "url": "http://api.smspartner.fr/v1/contact/update",
  "method": "POST",
  "headers": {
    "Content-Type": "application/json"
  },
  "data": {
    "apiKey": "YOUR_API_KEY",
    "contactId": "CONTACT ID",
    "contact": {
      "phoneNumber": "+xxxxxxxxx",
      "firstname": "firstname",
      "lastname": "lastname",
      "url": "",
      "date": "12-06-2020",
      "custom2": "custom2"
    }
  }
}
```
 ## Responses
``` json   
{
  "success": true,
  "code": 200,
  "contact": {
    "phoneNumber": "+xxxxxxxx",
    "firstname": "firstname",
    "lastname": "lastname",
    "url": "",
    "date": "12-06-2020",
    "custom2": "custom2",
    "contactId": "CONTACT ID"
  }
}
``` 
',
'en', 45);

INSERT INTO erreur_controlecode (textcode, langue, id_chemin) VALUES 
('
## Errors
Error message example:
 ``` json
{ 
"success": false, 
"code": 10, 
"message": "Incorrect API key" 
}

```
 
 ## Control Code

| _  | Error Codes |
| :---------------: |:---------------|
|1 | groupId is required |
|2 | Contact info is required |
|10 | API key is required |
|15 | The number is already in the group |

 <br>
', 'en', 45);



