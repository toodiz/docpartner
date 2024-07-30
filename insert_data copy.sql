-- Insertion dans la table chemin
INSERT INTO chemin (path) VALUES 
('pages/docs/voix/message-vocal/message_vocalp1.md');
INSERT INTO chemin (path) VALUES 
('pages/docs/voix/message-vocal/message_vocalp1.en.md');


-- Insertion dans la table introduction
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Introduction
description: >
---
# Introduction à l’API VOICE Partner


L’API permet d’effectuer des envois de [SMS Vocaux](sms-vocaux/sms_vocauxp1.md ) ou d’effectuer des [dépôts de messages directement sur répondeur.](message-vocal/message_vocalp3.md) Ces fonctionnalités sont proposées à partir de la plateforme [Voice Partner](https://www.voicepartner.fr/). Depuis le site, vous avez un accès immédiat à notre API gratuite : elle vous permet d’intégrer facilement nos services de voix à votre site web, logiciel ou application CRM.

', 'fr', 79);



-- Insertion dans la table URLAPI
INSERT INTO URLAPI (textcode, id_chemin) VALUES 
('## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/vn/callforward</span>
</div>

', 66);

-- Insertion dans la table PARAMETRE
INSERT INTO PARAMETRE (textcode, langue, id_chemin) VALUES 
('
## Paramètres

Chaque demande d’API prend en charge les paramètres suivants :
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l\'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **number**      |Numéro virtuel |
| **type**      |Type de transfert: <br> 0 => Désactivé <br> 1 => Transfert d’appel <br> 2 => Messagerie|
| **param**      |Si type = 0 laisser vide <br> Si type = 1 ajouter le numéro du transfert. <br> Si type = 2 ajouter l’email qui sera notifié d’un nouveau message |

', 'fr', 66);

-- Insertion dans la table REQUETE_REPONSE
INSERT INTO REQUETE_REPONSE (textcode, langue, id_chemin) VALUES 
('
## Requête
Exemple de requête :

``` bash
{
curl --location \'https://api.smspartner.fr/v1/vn/callforward\' \
--header \'Content-Type: application/json\' \
--data \'{
    "apiKey": "API_KEY",
    "number": "NUMBET",
    "type": 0, 
    "param": ""
}\'
```
## Réponses
``` json
{
    "success": true,
    "code": 2,
    "message": "Callforward disabled"
}
```
',
'fr', 66);

-- Insertion dans la table Suitecode 
INSERT INTO erreur_controlecode (textcode, langue, id_chemin) VALUES 
('
## Erreurs
Exemple de message d’erreur :

``` json
{
    "success": false,
    "code": 5,
    "message": "email is not valid"
}
```

## Code de contrôle

| _  | Code erreurs |
| :---------------: |:---------------|
| 10   | La Clé API est requise |
| 1    | name est requis |
| 5    | Le numéro virtuel est requis |
| 6    | Le type est requis |
| 7    | Le type n’est pas valide |
| 8    | param est requis |
| 9    | L’email n’est pas valide |
| 12   | Le numéro de transfert n’est pas valide |
| 13   | Le numéro virtuel n’existe pas |
| 14   | Le transfert d’appel n’est pas activé |
| 15   | Le numéro est désactivé |
| 16   | Le transfert d’appel est déjà activé |
| 17   | La messagerie est déjà activée |
| 18   | Le transfert d’appel est déjà désactivé |

<br>

', 'fr', 66);



--------------------------------------------
-- Insertion into the introduction table
-- Insertion into the introduction table
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Delete a sub-account
description: >
---
# Delete a sub-account
', 'en', 67);

-- Insertion into the URLAPI table
INSERT INTO URLAPI (textcode, id_chemin) VALUES 
('## URL

<div>
  <div style="background-color: red; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">DELETE</div> 
  <span style="display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/subaccount/remove</span>
</div>

', 67);

-- Insertion into the PARAMETRE table
INSERT INTO PARAMETRE (textcode, langue, id_chemin) VALUES 
('
## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You can obtain it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **token**      | Contact identifier. |

', 'en', 67);

-- Insertion into the REQUETE_REPONSE table
INSERT INTO REQUETE_REPONSE (textcode, langue, id_chemin) VALUES 
('
## Request
Example request:

``` bash
{
curl --location --request DELETE \'http://api.smspartner.fr/v1/subaccount/remove\' \
--header \'Content-Type: application/json\' \
--data-raw \'{
   "apiKey": "YOUR_API_KEY",
   "token": "TOKEN SUBACCOUNT"}\'
}
```
 ## Responses
``` json   
{
   "success": true,
   "code": 200,
}
``` 
',
'en', 67);

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
|1 | 	token is required |
|10 | API key is required |
|404 | Sub-account does not exist |

 <br>
', 'en', 67);



--------------------------------------------------------------
-- Insertion dans la table Suitecode 
INSERT INTO erreur_controlecode (textcode, langue, id_chemin) VALUES 
('

## Errors
Example of an error message:

### JSON
```json
{
    "success": false,
    "code": 10,
    "message": "Incorrect API Key"
}
```
## Control Codes

| _  | Error Codes |
| :---------------: |:---------------|
| 1 | API Key is required |
| 10 | Incorrect API Key |
| 200 | Everything went well! |

', 'en', 32);



















-- Insertion into the introduction table
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Activation
description: >
---
# Activation et création des sous-comptes
## Demande d’activation des sous-comptes
> SMS Partner vous donne la possibilité de créer des sous-comptes. Ainsi vous pouvez gérer un nombre illimité de sous-compte à partir de votre compte principal.

**Activation des sous-comptes**

Pour activer cette fonctionnalité, il suffit de contacter notre [équipe technique.](https://www.smspartner.fr/contact).

## Création des sous-comptes
> Pour créer des sous-compte à partir de votre compte maitre, il y a deux solutions possibles.

* Par l’API SMS : voir  [la page création de sous-compte](sous_comptep2.md).

* Par fichier Excel: à partir du fichier à télécharger: Fichier modèle [Fichier modéle](https://view.officeapps.live.com/op/view.aspx?src=https%3A%2F%2Fmy.smspartner.fr%2Fsubaccount_model.xls&wdOrigin=BROWSELINK). <br> Il vous suffit de nous le renvoyer pour que nous l’intégrions à votre compte.
* Par inscription manuelle: en créant manuellement les sous comptes depuis [la plateforme SMSPartner](https://my.smspartner.fr/connexion).



', 'fr', 62);

-- Insertion into the REQUETE_REPONSE table
INSERT INTO REQUETE_REPONSE (textcode, langue, id_chemin) VALUES 
('

# Response on a long number

SMS Partner offers you the rental of a long number (example: 06 XX XX XX XX).
To learn more about creating a dedicated number, [contact us](https://www.smspartner.fr/contact).

   <div class="alert alert-info">
Note: To receive responses: configure your <strong> response reception URL </strong> in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS API </a> tab. </div>

## Example of a response on a simple SMS (160 characters maximum)

``` json
Array
(
    \'msisdn\' => \'33xxxxxxxxx\', //number of the person sending the SMS
    \'to\' => \'33xxxxxxxxx\',
    \'messageId\' => \'02000000XXXXXXXXX\',
    \'text\' => \'Test\',
    \'type\' =>  \'text\',
    \'keyword\' => \'Test\',
    \'message-timestamp\' => \'2016-03-10 09:51:46\'

)
```
## Example of a response on a long SMS (more than 160 characters)
``` json
Array
(
    \'msisdn\' => \'33xxxxxxxxx\', //number of the person sending the SMS
    \'to\' => \'33xxxxxxxxx\',
    \'messageId\' => \'02000000YYYYYYYY\',
    \'concat\' => \'true\',
    \'concat-ref\' => \'171\',
    \'concat-total\' => \'2\',
    \'concat-part\' => \'1\',
    \'text\' => \'   Long message....\',
    \'type\' => \'text\',
    \'keyword\' => \'LONGMESSAGE\',
    \'message-timestamp\' => \'2016-03-09 16:00:30\'
)
 
Array
(
    \'msisdn\' => \'33xxxxxxxxx\', //number of the person sending the SMS
    \'to\' => \'33xxxxxxxxx\',
    \'messageId\' => \'02000000XXXXXXXX\',
    \'concat\' => \'true\',
    \'concat-ref\' => \'171\',
    \'concat-total\' => \'2\',
    \'concat-part\' => \'2\',
    \'text\' => \'....very long\',
    \'type\' => \'text\',
    \'keyword\' => \'VERYLONG\',
    \'message-timestamp\' => \'2016-03-09 16:00:31\'
)
```
<br> 
# Response on a short number (SMS Premium) After sending a campaign from our short number, SMS Partner allows you to receive responses.
To learn more, contact us. <div class="alert alert-info"> Note: To receive responses: configure your <strong> response reception URL </strong> in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS API </a> tab. </div>

## Example of a response from our short number

```json
Array (
  \'type\' => \'response\',
  \'phone_number\' => \'+336XXXXXXX1\',
  \'text\' => \'My response\',
  \'message_id\' => \'123\'
)
```
',
'en', 61);

