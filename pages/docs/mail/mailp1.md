---
title: Introduction Mail
description: >
---
# Introduction à l’API Mail Partner

Les envois de mail sont effectués à partir de la plateforme [Mail Partner](shttps://mailpartner.fr ) ou d’effectuer des [dépôts de messages directement sur répondeur.](message-vocal/message_vocalp3.md) Ces fonctionnalités sont proposées à partir de la plateforme [Voice Partner](https://www.voicepartner.fr/).Depuis le site, vous avez un accès immédiat à notre API gratuite : elle vous permet d’intégrer facilement nos services de mail à votre site web, logiciel ou application CRM en PHP, ASP, .NET, Java ou tout autre langage.




## Paramètres

Chaque demande d’API prend en charge les paramètres suivants :
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.mailpartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |

## Paramètres optionnels

| Paramètre      | Description |
|:----------------:|-------------|
| **_format**     | Format de la réponse. Vous avez le choix entre json et xml. Par défaut, le format de réponse est json. <br> Exemple : https://api.mailpartner.fr/v1/me?apiKey=YOUR_API_KEY&_format=json |

| _format      | Content-Type |
|:----------------:|-------------|
| **json**     | application/json |
| **xml**     | application/xml |






Vous pouvez, par exemple, formater la requête au format json ou xml, mais vous devez renseigner l’en-tête Content-Type en conséquence:

``` json
POST /v1/send HTTP/1.1
Host: api.mailpartner.fr
Content-Type: application/json
{
    "apiKey": "API_KEY",
    "subject": "Mon premier email",
    "htmlContent": "Hello world",
    "params":{
        "to":[
             {
                "email":"mon@email2.com"
             }
         ]
    }
}
```
## Requêtes
Toutes les demandes de l’API doivent être envoyées à **http://api.mailpartner.fr/v1/commande**, **commande** est l’appel API que vous souhaitez exécuter, avec les paramètres inclus dans le **body POST** ou **l’URL (GET)**.


