---
title: Introduction 
lang: en
description: Page d'introduction à l'API SMS Partner.
slug: page-01
---

# Introduction to SMS Partner’s API

SMS messages are sent from the [SMS Partner](https://www.smspartner.fr/api-sms/) platform. From the site, you have immediate access to our free API: it allows you to easily integrate our SMS services into your website, software or CRM application in PHP, ASP, .NET, Java or any other language.


## Parameters

Each API request supports at least the following parameters:

| Parameters | Description |
|:-----------|:-------------|
| `apiKey`  | CAPI Key of your account. You get it in your  [SMS Partner account.](https://my.smspartner.fr/connexion). |

### Optional parameters

| Paramèters | Description |
|:-----------|:-------------|
| `_format` | Format of the response. You can choose between `json` and `xml`. By default, the response format is `json`. Example : `https://api.smspartner.fr/v1/me?apiKey=YOUR_API_KEY&_format=json` |


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

## Requests
All API requests must be sent to http://api.smspartner.fr/v1/ordered, ordered is the API call you want to execute, with the parameters included in the body POST or URL (GET).

## Download an example in PHP

<a href="https://github.com/smspartnerfr/SMS-API-PHP" class="btn btn-success btn-sm text-white">API Example </a>



Feel free to consult our [SDK](https://docpartner.dev/sdks). available on this site.

