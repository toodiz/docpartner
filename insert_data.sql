-- Insertion dans la table chemin
INSERT INTO chemin (path) VALUES 
('pages/docs/sms/smsp1');

-- Insertion dans la table introduction
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Introduction 
lang: fr
description: Page d'introduction à l'API SMS Partner.
---

# Introduction à l'API SMS Partner

Les envois de SMS sont effectués à partir de l'[API SMS](https://www.smspartner.fr/api-sms/) de SMS Partner. Depuis le site, vous avez un accès immédiat à notre API gratuite : elle vous permet d’intégrer facilement nos services de SMS à votre site web, logiciel ou application CRM en PHP, ASP, .NET, Java ou tout autre langage.
', 'fr', 1);

-- Insertion dans la table URLAPI
INSERT INTO URLAPI (textcode, id_chemin) VALUES 
('https://cecil.app/docs/getting-started', 1),
('https://cecil.app/docs/configuration', 2),
('https://cecil.app/docs/content', 3);

-- Insertion dans la table PARAMETRE
INSERT INTO PARAMETRE (textcode, langue, id_chemin) VALUES 
('## Paramètres

Chaque demande d'API prend en charge au minimum les paramètres suivants :

| Paramètre | Description |
|:-----------|:-------------|
| `apiKey`  | Clé API de votre compte. Vous l'obtenez dans votre [compte SMS Partner](https://my.smspartner.fr/connexion). |

### Paramètres optionnels

| Paramètre | Description |
|:-----------|:-------------|
| `_format` | Format de la réponse. Vous avez le choix entre `json` et `xml`. Par défaut, le format de réponse est `json`. Exemple : `https://api.smspartner.fr/v1/me?apiKey=YOUR_API_KEY&_format=json` |



| __format_ | _Content-Type_ |
| :--------------- |:---------------|
| json  | application/json |
| xml | application/xml |
', 'fr', 1);


INSERT INTO REQUETE_REPONSE (textcode, langue, id_chemin) VALUES 
('#### JSON

```json
POST /v1/send HTTP/1.1
Host: api.smspartner.fr
Content-Type: application/json

{
    "apiKey": "API_KEY",
    "phoneNumbers": "+33600000000",
    "message": "Hello world"
}
```', 'fr', 1);

## Requêtes
Toutes les demandes de l’API doivent être envoyées à http://api.smspartner.fr/v1/commande, commande est l’appel API que vous souhaitez exécuter, avec les paramètres inclus dans le body POST ou l’URL (GET).', 'fr', 1);


INSERT INTO Suitecode (textcode, langue, id_chemin) VALUES 
('## Télécharger un exemple en PHP

 <a href="https://github.com/smspartnerfr/SMS-API-PHP" class="btn btn-success btn-sm text-white">Exemple API</a>

 N’hésitez pas à consulter nos SDK disponible sur ce site.
', 'fr', 1);