---
title: Introduction
lang: es
description: Page d'introduction à l'API SMS Partner.
---

# Introduction à l'API SMS Partner 3

Les envois de SMS sont effectués à partir de l'[API SMS](https://www.smspartner.fr/api-sms/) de SMS Partner. Depuis le site, vous avez un accès immédiat à notre API gratuite : elle vous permet d’intégrer facilement nos services de SMS à votre site web, logiciel ou application CRM en PHP, ASP, .NET, Java ou tout autre langage.

## Paramètres

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

#### JSON

```json
POST /v1/send HTTP/1.1
Host: api.smspartner.fr
Content-Type: application/json

{
    "apiKey": "API_KEY",
    "phoneNumbers": "+33600000000",
    "message": "Hello world"
}
```

## Requêtes
Toutes les demandes de l’API doivent être envoyées à http://api.smspartner.fr/v1/commande, commande est l’appel API que vous souhaitez exécuter, avec les paramètres inclus dans le body POST ou l’URL (GET).
## Télécharger un exemple en PHP

<p>Exemple API <a href="https://github.com/smspartnerfr/SMS-API-PHP" class="btn btn-success btn-sm text-white">Voir l'exemple</a></p>



N’hésitez pas à consulter nos SDK disponible sur ce site.