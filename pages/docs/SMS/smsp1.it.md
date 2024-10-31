---
title: Introduzione
lang: it
description: Pagina introduttiva dell'API SMS Partner.
---

# Introduzione all'API SMS Partner

Gli SMS sono inviati tramite [PartnerSMS](https://www.smspartner.fr/api-sms/) di SMS Partner. Dal sito, hai accesso immediato alla nostra API gratuita: ti permette di integrare facilmente i nostri servizi di SMS nel tuo sito web, software o applicazione CRM in PHP, ASP, .NET, Java o qualsiasi altro linguaggio.

## Parametri

Ogni richiesta API supporta almeno i seguenti parametri:

| Parametro | Descrizione |
|:-----------|:-------------|
| `apiKey`  | Chiave API del tuo account. Puoi ottenerla nel tuo [account SMS Partner](https://my.smspartner.fr/connexion). |

### Parametri opzionali

| Parametro | Descrizione |
|:-----------|:-------------|
| `_format` | Formato della risposta. Hai la scelta tra `json` e `xml`. Di default, il formato di risposta è `json`. Esempio: `https://api.smspartner.fr/v1/me?apiKey=YOUR_API_KEY&_format=json` |

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

## Richieste
Tutte le richieste API devono essere inviate a http://api.smspartner.fr/v1/commande, commande esè la chiamata API che si vuole eseguire, con i parametri inclusi nel ** body POST**  o **l’URL (GET)**.

## Scarica un esempio in PHP
<a href="https://github.com/smspartnerfr/SMS-API-PHP" class="btn btn-success btn-sm text-white">Esempio API</a>

Non esitare a consultare i nostri [SDK](https://docpartner.dev/sdks). disponibili su questo sito.


