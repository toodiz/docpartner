---
title: Introduction à l'API SMS Partner
description: Page d'introduction à l'API SMS Partner.
---

# Introduction à l'API SMS Partner

Les envois de SMS sont effectués à partir de l'[API SMS](https://www.smspartner.fr/api-sms/) de SMS Partner. Depuis le site, vous avez un accès immédiat à notre API gratuite : elle vous permet d’intégrer facilement nos services de SMS à votre site web, logiciel ou application CRM en PHP, ASP, .NET, Java ou tout autre langage.

## Paramètres

Chaque demande d'API prend en charge au minimum les paramètres suivants :

| Paramètre | Description |
|-----------|-------------|
| `apiKey`  | Clé API de votre compte. Vous l'obtenez dans votre [compte SMS Partner](https://my.smspartner.fr/connexion). |

### Paramètres optionnels

| Paramètre | Description |
|-----------|-------------|
| `_format` | Format de la réponse. Vous avez le choix entre `json` et `xml`. Par défaut, le format de réponse est `json`. Exemple : `https://api.smspartner.fr/v1/me?apiKey=YOUR_API_KEY&_format=json` |

<style>
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
}

.tab button:hover {
  background-color: #ddd;
}

.tab button.active {
  background-color: #ccc;
}

.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>

<div class="tab">
  <button class="tablinks" onclick="openTab(event, 'json')" id="defaultOpen">JSON</button>
  <button class="tablinks" onclick="openTab(event, 'xml')">XML</button>
</div>

<div id="json" class="tabcontent">
  <pre><code>
```json
POST /v1/send HTTP/1.1
Host: api.smspartner.fr
Content-Type: application/json

{
    "apiKey": "API_KEY",
    "phoneNumbers": "+33600000000",
    "message": "Hello world"
}
  </code></pre>
</div>

<div id="xml" class="tabcontent">
  <pre><code>
POST /v1/send HTTP/1.1
Host: api.smspartner.fr
Content-Type: application/xml

<request>
    <apiKey>API_KEY</apiKey>
    <phoneNumbers>+33600000000</phoneNumbers>
    <message>Hello world</message>
</request>
  </code></pre>
</div>

<script>
function openTab(evt, tabName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(tabName).style.display = "block";
  evt.currentTarget.className += " active";
}

// Set the default tab to be opened
document.getElementById("defaultOpen").click();
</script>

## Requêtes
Toutes les demandes de l’API doivent être envoyées à http://api.smspartner.fr/v1/commande, commande est l’appel API que vous souhaitez exécuter, avec les paramètres inclus dans le body POST ou l’URL (GET).
## Télécharger un exemple en PHP

<p>Exemple API <a href="https://github.com/smspartnerfr/SMS-API-PHP" class="btn btn-green">Voir l'exemple</a></p>

N’hésitez pas à consulter nos SDK disponible sur ce site.