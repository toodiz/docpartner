-- Insertion dans la table chemin
INSERT INTO chemin (path) VALUES 
('pages/docs/sms/smsp1.it.md');

-- Insertion dans la table introduction
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Introduction
lang: es
description: Page d\'introduction à l\'API SMS Partner.
---

# Introducción a la API de SMS Partner

Los envíos de SMS se realizan desde [la plataforma SMS Partner](https://www.smspartner.fr/api-sms/) de SMS Partner.. Desde el sitio, usted tiene acceso inmediato a nuestra API gratuita, la cual le permitirá integrar fácilmente nuestros servicios de SMS a su sitio web, software o aplicación de CRM en PHP, ASP, .NET, Java o cualquier otro lenguaje.
', 'es', 6); 

-- Insertion dans la table URLAPI
INSERT INTO URLAPI (textcode, id_chemin) VALUES 
('https://cecil.app/docs/getting-started', 1),
('https://cecil.app/docs/configuration', 2),
('https://cecil.app/docs/content', 5);

-- Insertion dans la table PARAMETRE
INSERT INTO PARAMETRE (textcode, langue, id_chemin) VALUES 
('## Configuraciones

Cada solicitud de API es compatible con al menos los siguientes parámetros :

| Paramètre | Description |
|:-----------|:-------------|
| `apiKey`  |  Clave de API de su cuenta. Usted lo consigue en su  [Cuenta de SMS Partner](https://my.smspartner.fr/connexion). |

### Ajustes opcionales

| Paramètre | Description |
|:-----------|:-------------|
| `_format` | Formato de la respuesta. Usted tiene la posibilidad de elegir entre `json` y `xml`. Por defecto, el formato de respuesta es  `json`. Ejemplo : `https://api.smspartner.fr/v1/me?apiKey=YOUR_API_KEY&_format=json` |


| __format_ | _Content-Type_ |
| :--------------- |:---------------|
| json  | application/json |
| xml | application/xml |', 'es', 6);

-- Insertion dans la table REQUETE_REPONSE
INSERT INTO REQUETE_REPONSE (textcode, langue, id_chemin) VALUES 
('Puede, por ejemplo, dar formato al mensaje SMS a formatos JSON , pero debe introducir la cabecera Content-Type en consecuencia :

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

## Solicitudes
Todas las solicitudes de API deben enviarse a http://api.smspartner.fr/v1/orden, orden el mando es la llamada a la API que desea ejecutar con los parámetros incluidos en el body POST o la dirección URL (GET ).
', 
'es', 6);

-- Insertion dans la table Suitecode 
INSERT INTO Suitecode (textcode, langue, id_chemin) VALUES 
('## Descargar un ejemplo en PHP

 <a href="https://github.com/smspartnerfr/SMS-API-PHP" class="btn btn-success btn-sm text-white">Ejemplo de API</a>


No dude en consultar nuestros SDK disponibles en este sitio.', 'es', 6);
