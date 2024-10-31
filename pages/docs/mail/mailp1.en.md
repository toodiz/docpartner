---
title: Mail Introduction
description: >
---
# Introduction to Mail Partner API

Email sending is done from the [Mail Partner](https://mailpartner.fr) platform or by [leaving messages directly on voicemail.](message-vocal/message_vocalp3.md) These features are offered through the [Voice Partner](https://www.voicepartner.fr/) platform. From the site, you have immediate access to our free API: it allows you to easily integrate our mail services into your website, software or CRM application in PHP, ASP, .NET, Java or any other language.




## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Your account's API key. You can obtain it from your <a href="https://my.mailpartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |

## Optional Parameters

| Parameter      | Description |
|:----------------:|-------------|
| **_format**     | Response format. You can choose between json and xml. By default, the response format is json. <br> Example: https://api.mailpartner.fr/v1/me?apiKey=YOUR_API_KEY&_format=json |

| _format      | Content-Type |
|:----------------:|-------------|
| **json**     | application/json |
| **xml**     | application/xml |





You can, for example, format the request in json or xml format, but you must set the Content-Type header accordingly:

``` json
POST /v1/send HTTP/1.1
Host: api.mailpartner.fr
Content-Type: application/json
{
    "apiKey": "API_KEY",
    "subject": "My first email",
    "htmlContent": "Hello world",
    "params":{
        "to":[
             {
                "email":"my@email2.com"
             }
         ]
    }
}
```
## Requests
All API requests must be sent to http://api.mailpartner.fr/v1/command, where command is the API call you want to execute, with the parameters included in the POST body or URL (GET).


