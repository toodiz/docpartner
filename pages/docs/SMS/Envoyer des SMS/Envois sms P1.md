---
title: Envoi unitaire
description: >
---
# Envoyer des SMS
Cette requête est utilisée pour envoyer des SMS en temps réel ou en différé.

## URL 
<div> <div style="background-color: #49CC90; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/me</span> </div> 

## Paramètres

   <div class="container mt-5">
          <div class="alert alert-info">
        La plateforme n'envoie pas de SMS commerciaux entre <strong> 20h et 8h en semaine et les dimanches et jours fériés </strong>(restriction légale). Si un message SMS est envoyé, le message est <strong>en pause jusqu'au prochain jour ouvrable à 8h </strong>. Ne vous envoyez pas de SMS commerciaux? contactez-nous pour désactiver cette restriction : <a href="mailto:help@smspartner.fr">help@smspartner.fr</a>
    </div>
        <table class="table table-bordered">
        <thead>
            <tr>
                <th>Paramètre</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>apiKey</strong></td>
                <td>
            Clé API de votre compte. Vous l'obtiendrez dans votre 
            <a href="https://my.smspartner.fr/connexion" style="display: inline-block; padding: 4px 4px; background-color: #5fbdab; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; transition: background-color 0.3s;">
                compte SMS Partner
            </a>
        </td>
</td>
            </td>
            </tr>
            <tr>
                <td><strong>phoneNumbers</strong></td>
                <td>
                    Numéros de téléphone des destinataires. Pour l'envoi de plusieurs SMS les numéros doivent être séparés par des virgules. <strong>La limite d'envoi sur une seule requête est de 500 numéros.</strong>
                    <ul>
                        <li>Au format national (0600000000) et international (+33600000000) pour des numéros français.</li>
                        <li>au format international (+496xxxxxxxx), pour des numéros hors France.</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td><strong>message</strong></td>
                <td>
                  Contenu du SMS. <strong>160 caractères</strong> maximum par SMS (au-delà, il vous sera décompté un SMS supplémentaire par tranche de 153 caractères).
                  <br>
                  Attention, certains caractères spéciaux et accents sont remplacés lors de l'envoi :
                        <a href="#" style="display: inline-block; padding: 4px 4px; background-color: #5fbdab; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; transition: background-color 0.3s;">Voir la liste</a>
                           <div class="alert alert-warning mt-2">
                        <p class="mt-2">
                            Le caractère ” doit obligatoirement être échappé (\”) pour que le texte du SMS soit valide. Dans le cas contraire une erreur 400 sera retournée.
                        </p>
                          </div>
                      <p>
                        Le tag <span style="background-color: #E6F3FF; padding: 2px 4px; border-radius: 3px;">:br:</span> permet de faire un saut de ligne. <strong>Attention le saut de ligne compte pour deux caractères.</strong>
                    </p>
                        <p>
                         <span style="background-color: #E6F3FF; padding: 2px 4px; border-radius: 3px;">   La mention STOP SMS est obligatoire pour les SMS à caractères commerciaux (voir le paramètre <strong> isStopSms </strong> ci-dessous).
                         <br>
                         Si c'est un compte marketing la mention STOP SMS est ajouté automatiquement.
                         </span>
                        </p>    
                </td>
            </tr>
        </tbody>
    </table>
        <h2 class="mt-5">Paramètres optionnels</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Paramètre</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>gamme</strong></td>
                <td>
                    Gamme du SMS, sa valeur doit être:
                    <ul>
                        <li>1 pour les SMS Premium</li>
                        <li>2 pour les SMS Low Cost</li>
                    </ul>
                    <div class="alert alert-warning">
                        ⚠️ Si ce paramètre est omis, les SMS seront envoyés dans la gamme Premium
                    </div>
                </td>
            </tr>
            <tr>
                <td><strong>sender</strong></td>
                <td>
                    Nom d’émetteur du message. Si l’émetteur est laissé vide, vos SMS seront acheminés avec un shortcode opérateur en guise d’expéditeur (exemple : 36xxx).
                    <div class="alert alert-warning">
                        ⚠️ Le nombre de caractères pour le nom de l'émetteur est compris <strong>entre 3 et 11 inclus</strong> et ne doit pas comporter de caractères spéciaux.
                        <br> Certains modèles de téléphone n'interprètent pas les caractères spéciaux dans le nom d'émetteur.
                    </div>
                </td>
            </tr>
            <tr>
                <td><strong>tag</strong></td>
                <td>Chaîne de caractères de 20 caractères maximum sans espace(s) et vous permettant de tagger vos envois.</td>
            </tr>
            <tr>
                <td><strong>scheduledDeliveryDate</strong></td>
                <td>
                    Date d'envoi du SMS, au format <code>dd/MM/yyyy</code>, à définir uniquement si vous souhaitez que les SMS soient envoyés en différé.
                </td>
            </tr>
            <tr>
                <td><strong>time</strong></td>
                <td>
                    Heure d'envoi du SMS (format 0-24), obligatoire si <code>scheduledDeliveryDate</code> est définie.
                </td>
            </tr>
            <tr>
                <td><strong>minute</strong></td>
                <td>
                    Minute d'envoi du SMS (format 0-55, par intervalle de cinq minutes), obligatoire si <code>scheduledDeliveryDate</code> est définie.
                </td>
            </tr>
            <tr>
                <td><strong>urlResponse</strong></td>
                <td>Url de retour des Réponses (ex:https://www.monurlderesponse).</td>
            </tr>
            <tr>
                <td><strong>urlDlr</strong></td>
                <td>Url de retour des Accusé de réception (ex: https://www.monurldlr).</td>
            </tr>
            <tr>
                <td><strong>isStopSms</strong></td>
                <td>
                    Gamme Premium : pour ajouter la mention STOP à la fin du SMS (obligatoire pour les SMS commerciaux).
                    <div class="alert alert-warning">
                        Gamme ÉCO : Ce paramètre n’est pas applicable pour cette gamme, il est nécessaire d'ajouter manuellement la mention NoPub=STOP pour les SMS commerciaux.
                    </div>
                </td>
            </tr>
                  <tr>
                <td><strong>isUnicode</strong></td>
                <td>
                  	Si 1: Active le mode Unicode, le nombre de caractères maximum par SMS sera de 70.<br>
                    <i> Important : le SMS unicode doit être activé sur votre compte par un administrateur pour que les envois soient disponibles. Merci de prendre contact avec le service technique pour l’activation de cette fonctionnalité.</i>
                     <a href="https://www.smspartner.fr/blog/liste-complete-des-emoticones-a-copier-coller/">Voir la liste</a>
                </td>
            </tr>
                  <tr>
                <td><strong>sandbox</strong></td>
                <td>
                         Pour tester l’envoi de SMS, vous pouvez utiliser le paramètre <span style="background-color: #E6F3FF; padding: 2px 4px; border-radius: 3px;">sandbox:
                         </span><br>
                         <strong>1</strong> pour activer le mode bac à sable
                    <div >
                       ⚠️ Aucun SMS ne sera envoyé, et il n’y aura aucun débit sur votre compte.
                        Ces SMS seront supprimés de vos listes d’envois automatiquement tous les jours.
                    </div>
                </td>
            </tr>
                  <tr>
                <td><strong>_format</strong></td>
                <td>
                    Format de la réponse. Vous pouvez choisir entre <span style="background-color: #E6F3FF; padding: 2px 4px; border-radius: 3px;">JSON </span> ou <span style="background-color: #E6F3FF; padding: 2px 4px; border-radius: 3px;">XML </span>. Par défaut, le format de réponse est <span style="background-color: #E6F3FF; padding: 2px 4px; border-radius: 3px;">JSON </span>.
                </td>
            </tr>
        </tbody>
    </table>
</div>

## Requête
Exemple de requête :

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
