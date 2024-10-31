---
title: Envoi unitaire de mail
description: Page 03 MAIL.
---

# Envoyer des mails


Cette requête est utilisée pour envoyer des mails en temps réel ou en différé.

## URL

<div>
 <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="display: inline-block; vertical-align: middle; margin-left: 10px;">http://api.mailpartner.fr/v1/send</span>
</div>



## Paramètres
Chaque demande d’API prend en charge les paramètres suivants :

   <div class="alert alert-info">
        La plateforme n’envoie pas de mails commerciaux entre 20h et 8h en semaine et les dimanches et jours fériés (restriction légale). Si un message mail est envoyé, le message est en pause jusqu’au prochain jour ouvrable à 8h.</strong> Vous n’envoyez pas de mails commerciaux? contactez-nous pour désactiver cette restriction : <a href="mailto:help@smspartner.fr">help@smspartner.fr</a>
    </div>
           
| Paramètre       | Description |
|-----------------|-------------| 
| **apiKey**      | 	Clé API de votre compte. Vous l’obtenez dans votre <a href="http://my.mailpartner.fr/dashboard/api" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte Mail Partner</a>. |
| **subject** | Sujet du mail |
| **htmlContent**     | Contenu du mail en HTML.
Le tag #READ_ONLINE# ajoute le lien “Si cet e-mail ne s’affiche pas correctement, veuillez utiliser le lien suivant :”
Le tag #UNSUBSCRIBE_LINK# ajoute le lien de désinscription |

## Paramètres optionnels

| Paramètre               | Description |
|-------------------------|-------------|
| **gamme**               | Gamme du SMS, sa valeur doit être : <ul><li>1 pour les SMS Premium</li><li>2 pour les SMS Low Cost</li></ul> ⚠️ Si ce paramètre est omis, les SMS seront envoyés dans la gamme Premium |
| **sender**              | Nom d’émetteur du message. Si l’émetteur est laissé vide, vos SMS seront acheminés avec un shortcode opérateur en guise d’expéditeur (exemple : 36xxx). <br>⚠️ Le nombre de caractères pour le nom de l'émetteur est compris **entre 3 et 11 inclus** et ne doit pas comporter de caractères spéciaux. <br>Certains modèles de téléphone n'interprètent pas les caractères spéciaux dans le nom d'émetteur. |
| **tag**                 | Chaîne de caractères de 20 caractères maximum sans espace(s) et vous permettant de tagger vos envois. |
| **scheduledDeliveryDate** | Date d'envoi du SMS, au format `dd/MM/yyyy`, à définir uniquement si vous souhaitez que les SMS soient envoyés en différé. |
| **time**                | Heure d'envoi du SMS (format 0-24), obligatoire si `scheduledDeliveryDate` est définie. |
| **minute**              | Minute d'envoi du SMS (format 0-55, par intervalle de cinq minutes), obligatoire si `scheduledDeliveryDate` est définie. |
| **urlResponse**         | URL de retour des Réponses (ex: https://www.monurlderesponse). |
| **urlDlr**              | URL de retour des Accusé de réception (ex: https://www.monurldlr). |
| **isStopSms**           | Gamme Premium : 1 pour ajouter la mention STOP à la fin du SMS (obligatoire pour les SMS commerciaux).<br> ⚠️ Gamme ÉCO : Ce paramètre n’est pas applicable pour cette gamme, il est nécessaire d'ajouter manuellement la mention NoPub=STOP pour les SMS commerciaux. |
| **isUnicode**           | Si 1 : Active le mode Unicode, le nombre de caractères maximum par SMS sera de 70. <br>**Important :** le SMS unicode doit être activé sur votre compte par un administrateur pour que les envois soient disponibles. Merci de prendre contact avec le service technique pour l’activation de cette fonctionnalité.<br> [Voir la liste](https://www.smspartner.fr/blog/liste-complete-des-emoticones-a-copier-coller). |
| **sandbox**             | Pour tester l’envoi de SMS, vous pouvez utiliser le paramètre `sandbox:` **1** pour activer le mode bac à sable. ⚠️ Aucun SMS ne sera envoyé, et il n’y aura aucun débit sur votre compte. Ces SMS seront supprimés de vos listes d’envois automatiquement tous les jours.|
| **_format**             | Format de la réponse. Vous pouvez choisir entre `JSON` ou `XML`. Par défaut, le format de réponse est `JSON` |
