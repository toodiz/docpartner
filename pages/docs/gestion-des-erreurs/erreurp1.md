---
title: Code d’erreurs
description: >
---
# Codes erreurs API
Vous trouverez ci dessous, les codes erreurs pour l’API SMS :

* Envoi de SMS
* Annulation des SMS
* Récupération des statuts
* Liste des statuts
* Codes erreurs des statuts
* Vérification des numéros
* Location
* Sous-compte
* Envoi de messages vocaux / VMS
* Envoi des mails
 



## Envoi de SMS

992 Sender non autorisé

| Codes | Message                                                                                      |
|:-------:|------------------------|
| 1     | La clé API est requise                                                                       |
| 2     | Le champ phoneNumbers est requis                                                             |
| 4     | message introuvable                                                                           |
| 10    | Clef API incorrecte                                                                           |
| 11    | Crédit insuffisant                                                                            |
| 13    | Aucun prix par défaut n’a été trouvé pour les numéros suivant                               |
| 14    | Le numéro est dans la liste des STOP SMS                                                     |
| 15    | Le numéro est déjà présent dans la liste                                                     |
| 20    | Compte désactivé                                                                              |
| 22    | SMS Marketing: L’heure d’envoi n’est pas valide, elle doit être comprise entre 8h et 22h.  |
| 23    | SMS Marketing: La date […] n’est pas valide, L’envoi des sms n’est pas possible le dimanche et jours fériés. |
| 30    | Compte bloqué                                                                                 |
| 40    | L’accès à l’API est refusé                                                                    |
| 42    | Le nombre de caractères pour un sms Low Cost est 160 caractères                             |
| 43    | Le message est requis                                                                         |
| 44    | L’émetteur est invalide                                                                       |
| 45    | La date est requise                                                                          |
| 46    | L’heure est requise                                                                           |
| 47    | Le chiffre des minutes est invalide                                                           |
| 48    | Les minutes doivent-être comprise entre 5 et 55 dans un interval de 5 minutes               |
| 49    | La date est invalide                                                                          |
| 50    | Le nombre de numéros autorisés est de 500 maxi                                               |
| 51    | La gamme lowcost n’est pas éligible                                                          |
| 52    | Le nombre de SMS concaténés ne peut excéder 10 SMS                                           |
| 55    | Aucun numéro à envoyer                                                                        |
| 90    | Le JSON est malformé: erreur de syntaxe                                                      |
| 96    | L’IP n’est pas autorisée                                                                      |
| 500   | Problème lors de l’ajout du sms dans la file d’attente                                       |

## Annulation des SMS

| Codes | Message                                                                                      |
|:-------:|----------------------------------------------------------------------------------------------|
| 2     | Le champ phoneNumber est requis                                                               |
| 3     | Le champ MessageId est requis                                                                 |
| 4     | Ce message est introuvable                                                                     |
| 5     | La liste des numéros est vide                                                                  |
| 6     | Le format n’est pas correct                                                                    |
| 9     | Ne semble pas être un numéro de mobile                                                         |
| 50    | Le nombre de numéros autorisés est de 500 maxi                                                 |
| 96    | L’IP n’est pas autorisée                                                                        |

## Récupération des statuts

| Codes | Message                                                                                      |
|:-------:|----------------------------------------------------------------------------------------------|
| 2     | Le champ phoneNumber est requis                                                               |
| 3     | Le champ MessageId est requis                                                                 |
| 4     | Ce message est introuvable                                                                     |
| 5     | La liste des numéros est vide                                                                  |
| 6     | Le format n’est pas correct                                                                    |
| 9     | Ne semble pas être un numéro de mobile                                                         |
| 50    | Le nombre de numéros autorisés est de 500 maxi                                                 |
| 96    | L’IP n’est pas autorisée                                                                        |

## Liste des statuts

| Codes        | Message                                                                                      |
|--------------|----------------------------------------------------------------------------------------------|
| delivered    | Le SMS a été délivré                                                                         |
| not delivered | Le SMS n’a pas été délivré                                                                   |
| waiting      | Le SMS a été envoyé, en attente chez l’opérateur                                             |
| ko           | Le SMS n’a pas été envoyé, un problème est survenu veuillez contacter le SAV                 |


## Codes erreurs des statuts

| Statuts SMS | Description |
|:-------------:|-------------|
| <mark style="background-color: #a8d3fb;">DELIVRD</mark> | Le message a été traité et livré avec succès. |
| <mark style="background-color: #a8d3fb;">PENDING</mark> | Le message a été traité et envoyé à l'instance suivante. Le rapport de livraison n'a pas encore été reçu et est attendu, le statut est toujours en attente. |
| <mark style="background-color: #a8d3fb;">UNDELIV</mark> | Le message a été envoyé à l'opérateur, mais n'a pas pu être livré, car un accusé de réception avec le statut « UNDELIV » été annulé par l'opérateur. |
| <mark style="background-color: #a8d3fb;">ACCEPTD</mark> | Le SMS a été accepté et sera envoyé. |
| <mark style="background-color: #a8d3fb;">UNKNOWN</mark> | Une erreur inconnue s'est produite. |
| <mark style="background-color: #a8d3fb;">ENROUTE</mark> | Le message est en route. |
| <mark style="background-color: #a8d3fb;">EXPIRED</mark> | Le message a été envoyé et a expiré en raison d'un dépassement de sa période de validité (notre plate-forme par défaut est de 48 heures), ou l'opérateur a renvoyé EXPIRED comme statut final. |
| <mark style="background-color: #a8d3fb;">REJECTD</mark> | Le message a été envoyé, mais il a été rejeté par l'opérateur et a renvoyé REJECTD comme statut final |



## Vérification des numéros

| Codes | Message                                                           |
|:-------:|-------------------------------------------------------------------|
| 2     | Le champ phoneNumber est requis                                   |
| 11    | Crédit insuffisant                                                |
| 13    | Aucun prix par défaut n'a été trouvé vers cette destination       |
| 14    | Le numéro est dans la liste des STOP SMS                          |
| 19    | Les numéros doivent-être séparés par une virgule                  |
| 50    | Le nombre de numéros autorisés est de 500 maxi                    |
| 55    | Aucun numéro à envoyer                                            |
| 96    | L'IP n'est pas autorisée                                          |

## Location

| Codes | Message                                                                       |
|:-------:|-------------------------------------------------------------------------------|
| 3     | Le paramètre parameters est requis                                            |
| 4     | Le paramètre op est requis                                                    |
| 5     | Le paramètre urlNotification n'est pas une URL valide                         |
| 6     | Cette opération n'est pas autorisé                                            |
| 7     | Le paramètre sexe est requis                                                  |
| 8     | Le paramètre sexe doit être uniquement m,h or f                               |
| 9     | Le paramètre minAge est requis                                                |
| 11    | Crédit insuffisant                                                            |
| 12    | Le paramètre minAge doit être supérieur à 17                                  |
| 13    | Le paramètre maxAge est requis                                                |
| 14    | Le paramètre maxAge doit être inférieur à 99                                  |
| 15    | Le paramètre interest doit être supérieur à 0                                 |
| 16    | Le paramètre interest ne peut pas être vide                                   |
| 17    | Le paramètre subInterest ne doit pas être vide                                |
| 18    | Le paramètre subInterest doit être supérieur à 0                              |
| 19    | Les paramètres interest ou subInterest sont requis                            |
| 22    | Le paramètre category ne doit pas être vide                                   |
| 23    | Le paramètre category doit être supérieur à 0                                 |
| 24    | Les paramètres Type est requis                                                |
| 25    | Le paramètre Localite est requis                                              |
| 26    | Le paramètre Volume est requis                                                |
| 27    | Le volume souhaité ne peut pas être supérieur au volume disponible            |
| 28    | Le paramètre DesiredVolume ne peux pas être supérieur au volume total         |
| 31    | Le paramètre token est requis                                                 |
| 32    | La demande de location est introuvable                                        |
| 33    | Le fichier de location est introuvable                                        |
| 34    | Le fichier de location a déjà été utilisé                                     |
| 35    | Le fichier de location est en cours de téléchargement                         |
| 36    | La location du fichier a échoué                                               |
| 61    | La requête semble invalide et n'a retourné aucun résultat                     |
| 96    | L'IP n'est pas autorisée                                                      |

## Sous-compte

| Codes | Message                                                    |
|:-------:|-----------------------------------------------------------|
| 2     | Vous n'êtes pas autorisé à créer des sous-comptes         |
| 3     | Le champ Credit est requis                                |
| 4     | Le champ tokenSubaccount est requis                       |
| 5     | Le champ credit doit être supérieur à 0                   |
| 6     | Le sous-compte est introuvable                            |
| 7     | Crédit insuffisant pour le sous-compte                    |
| 11    | Crédit insuffisant                                        |
| 96    | L'IP n'est pas autorisée                                  |


## HLR

### Code des status: PENDING (statusGrpId: 1)

Le message a été traité et envoyé à l'opérateur mobile.

| statusId | Status | Description |
|:----------:|:--------:|-------------|
| 3 | <mark style="background-color: #a8d3fb;">PENDING_WAITING_DELIVERY</mark> | Le message a été traité et envoyé. Le rapport de livraison n'a pas encore été reçu et est attendu, donc le statut est toujours en attente. |
| 7 | <mark style="background-color: #a8d3fb;">PENDING_ENROUTE</mark> | Le message a été traité et envoyé à l'opérateur mobile. |
| 26 | <mark style="background-color: #a8d3fb;">PENDING_ACCEPTED</mark> | Le message a été accepté et traité, et est prêt à être envoyé à l'opérateur. |

### UNDELIVERABLE (statusGrpId: 2)

Le message n'a pas été délivré.

| statusId | Status | Description |
|:----------:|:--------:|-------------|
| 4 | <mark style="background-color: #a8d3fb;">UNDELIVERABLE_REJECTED_OPERATOR</mark> | Un message a été envoyé à l'opérateur, un rapport de livraison avec le statut "REJECTED" a été retourné. |
| 9 | <mark style="background-color: #a8d3fb;">UNDELIVERABLE_NOT_DELIVERED</mark> | Le message a été envoyé à l'opérateur, mais n'a pas pu être livré, un rapport de livraison avec le statut "UNDELIVERED" a été renvoyé par l'opérateur. |

### DELIVERED (statusGrpId: 3)

Le message a été traité et délivré avec succès.

| statusId | Status | Description |
|:----------:|:--------:|-------------|
| 2 | <mark style="background-color: #a8d3fb;">DELIVERED_TO_OPERATOR</mark> | Le message a été envoyé et livré avec succès à l'opérateur. |
| 5 | <mark style="background-color: #a8d3fb;">DELIVERED_TO_HANDSET</mark> | Le message a été traité et remis au destinataire avec succès. |

### EXPIRED (statusGrpId: 4)

Le message a été envoyé et a expiré soit parce qu'il était en attente au-delà de sa période de validité (notre plate-forme est configurée par défaut sur 48 heures), soit parce que le rapport de livraison de l'opérateur a rétabli le statut "EXPIRED" comme statut final.

| statusId | Status | Description |
|:----------:|:--------:|-------------|
| 15 | <mark style="background-color: #a8d3fb;">EXPIRED_EXPIRED</mark> | Le message a été reçu et envoyé à l'opérateur. Toutefois, il est resté en attente jusqu'à l'expiration de la période de validité ou jusqu'à ce que l'opérateur ait renvoyé le statut EXPIRED. |
| 29 | <mark style="background-color: #a8d3fb;">EXPIRED_DLR_UNKNOWN</mark> | Le message a été reçu et transmis à l'opérateur pour livraison. Toutefois, le rapport de livraison de l'opérateur n'a pas été formaté correctement ou n'a pas été reconnu comme valable. |

### REJECTED (statusGrpId: 5)

Le message a été reçu mais a été rejeté l'opérateur.

| statusId | Status | Description |
|:----------:|:--------:|-------------|
| 6 | <mark style="background-color: #a8d3fb;">REJECTED_NETWORK</mark> | Le message a été reçu, mais le réseau est hors de notre couverture. |
| 8 | <mark style="background-color: #a8d3fb;">REJECTED_PREFIX_MISSING</mark> | Le message a été reçu mais a été rejeté car le numéro n'est pas reconnu en raison d'un préfixe ou d'une longueur de numéro incorrecte. Ces informations sont différentes pour chaque réseau et sont régulièrement mises à jour. |
| 10 | <mark style="background-color: #a8d3fb;">REJECTED_DND</mark> | Le message a été reçu et rejeté parce que l'utilisateur est abonné aux services DND (Ne pas déranger), ce qui désactive tout trafic de service vers son numéro. |
| 11 | <mark style="background-color: #a8d3fb;">REJECTED_SOURCE</mark> | Votre compte est configuré pour n'accepter que les ID d'expéditeur enregistrés alors que l'ID d'expéditeur défini dans la demande n'a pas été enregistré sur votre compte. |
| 21 | <mark style="background-color: #a8d3fb;">REJECTED_SYSTEM_ERROR</mark> | La demande a été rejetée en raison d'une erreur de système, veuillez réessayer la soumission ou contacter notre équipe de support technique pour plus de détails. |
| 52 | <mark style="background-color: #a8d3fb;">REJECTED_DESTINATION</mark> | La demande a été reçue, mais la destination n'est pas valide – le préfixe du numéro n'est pas correct car il ne correspond à un préfixe valide d'aucun opérateur de téléphonie mobile. La longueur du numéro est également prise en considération pour vérifier la validité du numéro. |

## Code des erreurs (HLR)

### OK (errorGrpId: 0)

La demande a été traitée avec succès.

| errorId | Permanent | Error | Description |
|---------|-----------|-------|-------------|
| 0 | false | <mark style="background-color: #a8d3fb;">NO_ERROR</mark> | Aucune description d'erreur n'est fournie. Généralement renvoyé pour livraison réussie ou lorsque le code d'erreur n'a pas été renvoyé par l'opérateur. |

### HANDSET_ERRORS (errorGrpId: 1)

La demande n'a pas été complétée en raison de problèmes liés au téléphone portable.

| errorId | Permanent | Error | Description |
|:---------:|:-----------:|:-------:|-------------|
| 1 | true | <mark style="background-color: #a8d3fb;">EC_UNKNOWN_SUBSCRIBER</mark> | Le numéro n'existe pas ou n'a pas été attribué à un abonné actif dans la base de données des utilisateurs de l'opérateur. |
| 5 | false | <mark style="background-color: #a8d3fb;">EC_UNIDENTIFIED_SUBSCRIBER</mark> | Abonné non identifié |
| 6 | false | <mark style="background-color: #a8d3fb;">EC_ABSENT_SUBSCRIBER_SM</mark> | L'abonné est détecté comme étant indisponible, car il n'y a pas eu de réponse à la radiomessagerie du combiné. Cela est souvent dû au fait que le combiné est éteint ou se trouve dans une zone de faible signal. S'applique à la version 3 du protocole MAP. |
| 7 | false | <mark style="background-color: #a8d3fb;">EC_UNKNOWN_EQUIPMENT</mark> | L'appareil mobile n'a pas été reconnu par l'EIR (Equipment Identity Register), lors de la vérification de l'appareil au niveau du protocole MAP sur l'infrastructure de l'opérateur. |
| 8 | false | <mark style="background-color: #a8d3fb;">EC_ROAMING_NOT_ALLOWED</mark> | L'abonné est actuellement en itinérance dans un autre pays ou dans l'infrastructure d'un autre opérateur – la fourniture de l'itinérance n'est pas garantie en raison de l'absence d'accords d'itinérance entre de nombreux opérateurs différents. |
| 9 | true | <mark style="background-color: #a8d3fb;">EC_ILLEGAL_SUBSCRIBER</mark> | Abonné illégal |
| 11 | true | <mark style="background-color: #a8d3fb;">EC_TELESERVICE_NOT_PROVISIONED</mark> | Le service mobile de l'abonné a été suspendu par l'opérateur. |
| 12 | true | <mark style="background-color: #a8d3fb;">EC_ILLEGAL_EQUIPMENT</mark> | Équipement illégal |
| 13 | false | <mark style="background-color: #a8d3fb;">EC_CALL_BARRED</mark> | Le message est rejeté en raison de l'interdiction du service de messagerie, le blocage est fixé par l'opérateur ou l'abonné pour le numéro. |
| 27 | false | <mark style="background-color: #a8d3fb;">EC_ABSENT_SUBSCRIBER</mark> | L'abonné est hors ligne dans le réseau, comme le confirme la réponse du combiné à la radiomessagerie. Cela est souvent dû au fait que le combiné est éteint. |
| 31 | false | <mark style="background-color: #a8d3fb;">EC_SUBSCRIBER_BUSY_FOR_MT_SMS</mark> | L'abonné est occupé pour Mt SMS |
| 32 | false | <mark style="background-color: #a8d3fb;">EC_SM_DELIVERY_FAILURE</mark> | Échec de la livraison |
| 33 | false | <mark style="background-color: #a8d3fb;">EC_MESSAGE_WAITING_LIST_FULL</mark> | Liste d'attente des messages complète |
| 34 | false | <mark style="background-color: #a8d3fb;">EC_SYSTEM_FAILURE</mark> | Défaillance du système |
| 35 | false | <mark style="background-color: #a8d3fb;">EC_DATA_MISSING</mark> | Données manquantes |
| 36 | false | <mark style="background-color: #a8d3fb;">EC_UNEXPECTED_DATA_VALUE</mark> | Valeur inattendue des données |
| 255 | false | <mark style="background-color: #a8d3fb;">EC_UNKNOWN_ERROR</mark> | Erreur inconnue |
| 256 | false | <mark style="background-color: #a8d3fb;">EC_SM_DF_MEMORYCAPACITYEXCEEDED</mark> | Il y a eu une erreur d'équipement de l'abonné mobile, alors que la mémoire du combiné a été dépassée. |
| 257 | false | <mark style="background-color: #a8d3fb;">EC_SM_DF_EQUIPMENTPROTOCOLERROR</mark> | Il y a eu une erreur dans l'équipement de l'abonné mobile. |
| 258 | false | <mark style="background-color: #a8d3fb;">EC_SM_DF_EQUIPMENTNOTSM_EQUIPPED</mark> | Il y a eu une erreur dans l'équipement de l'abonné mobile. |
| 259 | false | <mark style="background-color: #a8d3fb;">EC_SM_DF_UNKNOWNSERVICECENTRE</mark> | Il y a eu une erreur dans l'équipement de l'abonné mobile. |
| 260 | false | <mark style="background-color: #a8d3fb;">EC_SM_DF_SC_CONGESTION</mark> | Il y a eu une erreur dans l'équipement de l'abonné mobile. |
| 261 | false | <mark style="background-color: #a8d3fb;">EC_SM_DF_INVALIDSME_ADDRESS</mark> | Il y a eu une erreur dans l'équipement de l'abonné mobile. |
| 262 | false | <mark style="background-color: #a8d3fb;">EC_SM_DF_SUBSCRIBERNOTSC_SUBSCRIBER</mark> | Il y a eu une erreur dans l'équipement de l'abonné mobile. |
| 500 | false | <mark style="background-color: #a8d3fb;">EC_PROVIDER_GENERAL_ERROR</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 502 | false | <mark style="background-color: #a8d3fb;">EC_NO_RESPONSE</mark> | Le message a été traité et transmis avec succès à l'opérateur, mais l'opérateur n'a pas répondu à la demande de soumission du message, ou l'erreur a été annulée par l'opérateur. L'erreur s'applique également à des erreurs similaires au niveau du réseau SS7. |
| 503 | false | <mark style="background-color: #a8d3fb;">EC_SERVICE_COMPLETION_FAILURE</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 504 | false | <mark style="background-color: #a8d3fb;">EC_UNEXPECTED_RESPONSE_FROM_PEER</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 507 | false | <mark style="background-color: #a8d3fb;">EC_MISTYPED_PARAMETER</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 508 | false | <mark style="background-color: #a8d3fb;">EC_NOT_SUPPORTED_SERVICE</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 509 | false | <mark style="background-color: #a8d3fb;">EC_DUPLICATED_INVOKE_ID</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 1024 | false | <mark style="background-color: #a8d3fb;">EC_OR_APPCONTEXTNOTSUPPORTED</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 1025 | false | <mark style="background-color: #a8d3fb;">EC_OR_INVALIDDESTINATIONREFERENCE</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 1026 | false | <mark style="background-color: #a8d3fb;">EC_OR_INVALIDORIGINATINGREFERENCE</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 1027 | false | <mark style="background-color: #a8d3fb;">EC_OR_ENCAPSULATEDAC_NOTSUPPORTED</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 1028 | false | <mark style="background-color: #a8d3fb;">EC_OR_TRANSPORTPROTECTIONNOTADEQUATE</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 1029 | false | <mark style="background-color: #a8d3fb;">EC_OR_NOREASONGIVEN</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 1030 | false | <mark style="background-color: #a8d3fb;">EC_OR_POTENTIALVERSIONINCOMPATIBILITY</mark> | Erreur générale de protocole de réseau, causée par des versions de protocole de réseau d'opérateur ou des paramètres incompatibles entre deux composants de réseau. |
| 1031 | false | <mark style="background-color: #a8d3fb;">EC_OR_REMOTENODENOTREACHABLE</mark> | L'abonné mobile n'était pas joignable en raison d'une erreur de protocole de l'opérateur de réseau. |
| 1152 | false | <mark style="background-color: #a8d3fb;">EC_NNR_NOTRANSLATIONFORANADDRESSOFSUCHNATURE</mark> | L'abonné mobile n'était pas joignable en raison d'une erreur de protocole de l'opérateur de réseau. |
| 1153 | false | <mark style="background-color: #a8d3fb;">EC_NNR_NOTRANSLATIONFORTHISSPECIFICADDRESS</mark> | Pas de traduction pour cette adresse spécifique. |
| 1154 | false | <mark style="background-color: #a8d3fb;">EC_NNR_SUBSYSTEMCONGESTION</mark> | L'abonné mobile n'était pas joignable en raison d'une erreur de protocole de l'opérateur de réseau. |
| 1155 | false | <mark style="background-color: #a8d3fb;">EC_NNR_SUBSYSTEMFAILURE</mark> | L'abonné mobile n'était pas joignable en raison d'une erreur de protocole de l'opérateur de réseau. |
| 1156 | false | <mark style="background-color: #a8d3fb;">EC_NNR_UNEQUIPPEDUSER</mark> | L'abonné mobile n'était pas joignable en raison d'une erreur de protocole de l'opérateur de réseau. |
| 1157 | false | <mark style="background-color: #a8d3fb;">EC_NNR_MTPFAILURE</mark> | L'abonné mobile n'était pas joignable en raison d'une erreur de protocole de l'opérateur de réseau. |
| 1158 | false | <mark style="background-color: #a8d3fb;">EC_NNR_NETWORKCONGESTION</mark> | L'abonné mobile n'était pas joignable en raison d'une erreur de protocole de l'opérateur de réseau. |

### USER_ERRORS (errorGrpId: 2)

Une erreur d'utilisateur s'est produite.

| errorId | Permanent | Error | Description |
|:---------:|:-----------:|:-------:|-------------|
| 2049 | true | <mark style="background-color: #a8d3fb;">EC_IMSI_BLACKLISTED</mark> | IMSI sur liste noire. |
| 2052 | true | <mark style="background-color: #a8d3fb;">EC_BLACKLISTED_DESTINATIONADDRESS</mark> | Le numéro de destination a été mis sur liste noire soit à la demande de l'opérateur, soit sur votre compte via les portails web SMSPartner – veuillez supprimer la liste noire sur votre compte via portal.infobip.com ou contactez le support pour plus d'informations. |
| 2053 | true | <mark style="background-color: #a8d3fb;">EC_BLACKLISTED_SENDERADDRESS</mark> | Le numéro de l'expéditeur a été mis sur liste noire soit à la demande de l'opérateur, soit sur votre compte via les portails web SMSPartner – veuillez supprimer la liste noire sur votre compte via portal.infobip.com ou contactez le support pour plus d'informations. |
| 2053 | true | <mark style="background-color: #a8d3fb;">EC_SOURCE_ADDRESS_BLACKLISTED</mark> | L'adresse source est sur la liste noire du compte SMSPartner. |
| 4096 | true | <mark style="background-color: #a8d3fb;">EC_INVALID_PDU_FORMAT</mark> | Format PDU non valide. |
| 4100 | true | <mark style="background-color: #a8d3fb;">EC_MESSAGE_CANCELED</mark> | La demande a été reçue, mais n'a pas été envoyée à l'instance suivante pendant sa période de validité, et est expirée avec le code d'erreur approprié EC_MESSAGE_CANCELED, ou le même code d'erreur a été renvoyé par l'opérateur. |
| 4101 | true | <mark style="background-color: #a8d3fb;">EC_VALIDITYEXPIRED</mark> | Le message a été envoyé à l'instance suivante, et n'a pas été délivré dans la période de validité du message, il est donc expiré avec le code d'erreur approprié EC_VALIDITYEXPIRED ou le code d'erreur a été renvoyé par l'opérateur. |
| 4102 | true | <mark style="background-color: #a8d3fb;">EC_NOTSUBMITTEDTOSMPPCHANNEL</mark> | Ne peut pas être transférée via le SMPP en raison de l'absence de conectivité du SMPP. |
| 4103 | true | <mark style="background-color: #a8d3fb;">EC_DESTINATION_FLOODING</mark> | En ce qui concerne le statut REJECTED_FLOODING_FILTER, le message est rejeté en raison du nombre de messages envoyés à un seul numéro. |
| 4104 | true | <mark style="background-color: #a8d3fb;">EC_DESTINATION_TXT_FLOODING</mark> | En ce qui concerne le statut REJECTED_FLOODING_FILTER, le message est rejeté en raison du nombre de messages identiques envoyés à un seul numéro. |

### OPERATOR_ERRORS (errorGrpId: 3)

La demande n'a pas été complétée en raison de problèmes liés à l'opérateur.

| errorId | Permanent | Error | Description |
|:---------:|:-----------:|:-------:|-------------|
| 10 | true | <mark style="background-color: #a8d3fb;">EC_BEARER_SERVICE_NOT_PROVISIONED</mark> | Service au porteur non fourni. |
| 20 | false | <mark style="background-color: #a8d3fb;">EC_SS_INCOMPATIBILITY</mark> | Incompatibilité SS. |
| 51 | true | <mark style="background-color: #a8d3fb;">EC_RESOURCE_LIMITATION</mark> | Indique que l'opération MAP invoquée n'a pas pu être terminée en raison de la congestion du réseau – il s'agit d'une erreur de congestion du réseau SS7 au niveau du protocole MAP. |
| 71 | false | <mark style="background-color: #a8d3fb;">EC_UNKNOWN_ALPHABET</mark> | Alphabet inconnu. |
| 501 | false | <mark style="background-color: #a8d3fb;">EC_INVALID_RESPONSE_RECEIVED</mark> | Réception d'une réponse non valable. |
| 2048 | false | <mark style="background-color: #a8d3fb;">EC_TIME_OUT</mark> | Time Out. |
| 2050 | true | <mark style="background-color: #a8d3fb;">EC_DEST_ADDRESS_BLACKLISTED</mark> | Le numéro a été trouvé sur la liste noire du DND (Do Not Disturb) fournie par l'opérateur, ou le même code d'erreur a été retourné par l'opérateur. |

## Envoi de messages vocaux / VMS

| Codes                      | Message                                      |
|:----------------------------:|----------------------------------------------|
| PHONE_NUMBER_REQUIRED      | Le numéro de téléphone est requis            |
| PHONE_NUMBER_SIZE_ERROR    | Le nombre de numéros est supérieur à 500     |
| TOKEN_AUDIO_REQUIRED       | Le token de l’audio est requis               |
| NOTIFY_URL_INVALID         | L’url de notification est invalide           |
| SENDER_NOT_AUTHORIZED      | Le sender n’est pas autorisé                 |
| SENDER_INVALID             | Le sender est invalide                       |
| AUDIO_FILE_NOT_FOUND       | Le fichier audio est introuvable             |
| DESTINATION_INVALID        | Le numéro de téléphone n’est pas autorisé    |
| NOT_CREDIT                 | Crédit insuffisant                           |

## Envoi de Mail

| Codes | Message                                                      |
|:-------:|--------------------------------------------------------------|
| 1     | La clé API est requise                                       |
| 2     | Le contenu du mail est requis                                |
| 3     | La clé API est requise                                       |
| 4     | Le sender email est requis                                   |
| 5     | Le sender name ne peut-être vide                             |
| 8     | L’URL de la pièce jointe est requise                         |
| 9     | L’extension de la pièce jointe n’est pas autorisée           |
| 10    | Clef API incorrecte                                          |
| 11    | Crédit insuffisant                                           |
| 14    | Le mail est dans la liste des désinscriptions                |
| 15    | Le mail est déjà dans la liste d’envoi                       |
| 16    | Le nom de la pièce jointe ne peut-être vide                  |
| 17    | Nombre de destinataires maximum dépassé                      |
| 18    | L’email du destinataire est requis                           |
| 19    | L’email du destinataire semble invalide                      |
| 20    | Compte désactivé                                             |
| 21    | Le nom du destinataire ne peut-être vide                     |
| 22    | La liste des destinataires est requise                       |
| 23    | L’email du destinataire en réponse est requis                |
| 24    | L’email du destinataire en réponse semble invalide           |
| 25    | Le nom du destinataire en réponse ne peut-être vide          |
| 30    | Compte bloqué                                                |
| 40    | L’accès à l’API est refusé                                   |
| 45    | La date est requise                                          |
| 46    | L’heure est requise                                          |
| 47    | Le chiffre des minutes est invalide                          |
| 48    | Les minutes doivent-être comprises entre 5 et 55 dans un intervalle de 5 minutes |
| 49    | La date est invalide                                         |
| 50    | Le nombre de mails autorisés est de 500 maxi                 |
| 55    | Aucun prix par défaut n’a été trouvé                         |
| 90    | Le JSON est malformé: erreur de syntaxe                      |
| 96    | L’IP n’est pas autorisée                                     |
| 429   | Trop de requêtes effectuées en une minute (limite : 2000 requêtes / minute / Adresse IP) |
| 500   | Problème lors de l’ajout du mail dans la file d’attente      |


