-- Insertion dans la table chemin
INSERT INTO chemin (path) VALUES 
('pages/docs/sms/smsp1.pt.md');

-- Insertion dans la table introduction
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Introdução
lang: pt
description: Página de introdução à API SMS Partner.
---

# Introdução à API SMS Partner

Os envios de SMS são feitos através da [API SMS](https://www.smspartner.fr/api-sms/) da SMS Partner. A partir do site, você tem acesso imediato à nossa API gratuita: ela permite integrar facilmente nossos serviços de SMS ao seu site, software ou aplicação CRM em PHP, ASP, .NET, Java ou qualquer outro idioma.

', 'pt', 8);

-- Insertion dans la table URLAPI
INSERT INTO URLAPI (textcode, id_chemin) VALUES 
('https://cecil.app/docs/getting-started', 1),
('https://cecil.app/docs/configuration', 2),
('https://cecil.app/docs/content', 5);

-- Insertion dans la table PARAMETRE
INSERT INTO PARAMETRE (textcode, langue, id_chemin) VALUES 
('## Parâmetros

Cada solicitação da API suporta pelo menos os seguintes parâmetros:

| Parâmetro | Descrição |
|:-----------|:-------------|
| `apiKey`  | Chave API da sua conta. Você pode obtê-la na sua [conta da SMS Partner](https://my.smspartner.fr/connexion). |

### Parâmetros opcionais

| Parâmetro | Descrição |
|:-----------|:-------------|
| `_format` | Formato da resposta. Você pode escolher entre `json` e `xml`. Por padrão, o formato de resposta é `json`. Exemplo: `https://api.smspartner.fr/v1/me?apiKey=YOUR_API_KEY&_format=json` |

| __formato_ | _Content-Type_ |
| :--------------- |:---------------|
| json  | application/json |
| xml | application/xml |

', 'pt', 8);

-- Insertion dans la table REQUETE_REPONSE
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

```

## Solicitações
Todas as solicitações da API devem ser enviadas para http://api.smspartner.fr/v1/commande, onde commande é a chamada de API que você deseja executar, com os parâmetros incluídos no corpo do POST ou URL (GET).

','pt', 8);

-- Insertion dans la table Suitecode 
INSERT INTO Suitecode (textcode, langue, id_chemin) VALUES 
('## Baixar um exemplo em PHP

<a href="https://github.com/smspartnerfr/SMS-API-PHP" class="btn btn-success btn-sm text-white">Exemplo de API </a>

Não hesite em consultar nossos [SDK](https://docpartner.dev/sdks) disponíveis neste site.

', 'pt', 8);
