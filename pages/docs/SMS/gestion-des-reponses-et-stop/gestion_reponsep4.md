---
title: Gestion des réponses
description: >
---


# Réponse sur un numéro long

SMS Partner vous propose la location d’un numéro long (exemple : 06 XX XX XX XX).
Pour en savoir plus sur la création d’un numéro dédié, [contactez-nous](https://www.smspartner.fr/contact).

   <div class="alert alert-info">
A noter : Pour recevoir les réponses: paramétrer votre <strong> URL de réception des réponses </strong> dans votre onglet   <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">API SMS </a>. </div>

## Exemple de réponse sur un SMS simple (160 caractères maximum)

``` json
Array
(
    'msisdn' => '33xxxxxxxxx', //numéro de la personne qui envoi le SMS
    'to' => '33xxxxxxxxx',
    'messageId' => '02000000XXXXXXXXX',
    'text' => 'Test',
    'type' =>  'text',
    'keyword' => 'Test',
    'message-timestamp' => '2016-03-10 09:51:46'
)
```
## Exemple de réponse sur un SMS long (plus de 160 caractères)
``` json
Array
(
    'msisdn' =&gt; '33xxxxxxxxx', //numéro de la personne qui envoi le SMS
    'to' =&gt; '33xxxxxxxxx',
    'messageId' =&gt; '02000000YYYYYYYY',
    'concat' =&gt; 'true',
    'concat-ref' =&gt; '171',
    'concat-total' =&gt; '2',
    'concat-part' =&gt; '1',
    'text' =&gt; '   Message long....',
    'type' =&gt; 'text',
    'keyword' =&gt; 'MESSAGELONG',
    'message-timestamp' =&gt; '2016-03-09 16:00:30'
)
 
Array
(
    'msisdn' =&gt; '33xxxxxxxxx', //numéro de la personne qui envoi le SMS
    'to' =&gt; '33xxxxxxxxx',
    'messageId' =&gt; '02000000XXXXXXXX',
    'concat' =&gt; 'true',
    'concat-ref' =&gt; '171',
    'concat-total' =&gt; '2',
    'concat-part' =&gt; '2',
    'text' =&gt; '....très long',
    'type' =&gt; 'text',
    'keyword' =&gt; 'TRESLONG',
    'message-timestamp' =&gt; '2016-03-09 16:00:31'
)
```
<br>
# Réponse sur un numéro court (SMS Premium)

Après l’envoi d’une campagne depuis notre numéro court, SMS Partner vous permet de recevoir des réponses.
Pour en savoir plus, [contactez-nous](https://www.smspartner.fr/contact).
<div class="alert alert-info">
A noter : Pour recevoir les réponses: paramétrer votre <strong> URL de réception des réponses </strong> dans votre onglet   <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">API SMS </a>. </div>

## Exemple de réponse depuis notre numéro court

```json
Array (
  'type' => 'response',
  'phone_number' => '+336XXXXXXX1',
  'text' => 'Ma réponse',
  'message_id' => '123'
)
```


