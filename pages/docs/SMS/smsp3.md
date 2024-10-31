---
title: Gérer le transfert d’appel
description: >
---
# Transfert d’appel


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/vn/callforward</span>
</div>




## Paramètres

Chaque demande d’API prend en charge les paramètres suivants :
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **number**      |Numéro virtuel |
| **type**      |Type de transfert: <br> 0 => Désactivé <br> 1 => Transfert d’appel <br> 2 => Messagerie|
| **param**      |Si type = 0 laisser vide <br> Si type = 1 ajouter le numéro du transfert. <br> Si type = 2 ajouter l’email qui sera notifié d’un nouveau message |




## Requête
Exemple de requête :

``` bash
{
curl --location 'https://api.smspartner.fr/v1/vn/callforward' 
--header 'Content-Type: application/json' 
--data '{
    "apiKey": "API_KEY",
    "number": "NUMBET",
    "type": 0, 
    "param": ""
}'
```
## Réponses
``` json
{
    "success": true,
    "code": 2,
    "message": "Callforward disabled"
}
```



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

