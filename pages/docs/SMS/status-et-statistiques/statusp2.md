---
title: Statut multiple
description: >
---
# Statut de remise
Cette requête permet de récupérer le statut de plusieurs SMS (maximum 500 numéros).

<div class="alert alert-info">
A noter : les comptes-rendus sont reçus en moyenne quelques secondes après l’envoi du SMS ; cependant, ce délai peut s’étendre jusqu’à 48h maximum selon les opérateurs et la charge de notre plateforme.
    </div>


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/multi-status</span>
</div>


## Paramètres
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
|**SMSStatus_List**   | **phoneNumber:** <br> Numéros de téléphone des destinataires. <br> Ils doivent être:<br> – au format international (+336xxxxxxxx). <br> **messageId**: <br> ID du message. <br> Il se trouve dans [la réponse lors de l’envoi d’un SMS](../envoyer-des-sms/envois_smsp1.md).|
<br>
<div class="alert alert-info">
Attention !! Il n’est pas possible d’annuler l’envoi d’un SMS <strong>moins de 5 minutes avant son envoi</strong>.
    </div>

## Requête
Exemple de requête :

<!-- Nav tabs -->
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="php-tab" data-toggle="tab" href="#php" role="tab" aria-controls="php" aria-selected="true">PHP</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="vbnet-tab" data-toggle="tab" href="#vbnet" role="tab" aria-controls="vbnet" aria-selected="false">VB.net</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="python-tab" data-toggle="tab" href="#python" role="tab" aria-controls="python" aria-selected="false">Python</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="curl-tab" data-toggle="tab" href="#curl" role="tab" aria-controls="curl" aria-selected="false">cURL</a>
  </li>
</ul>



<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane fade show active" id="php" role="tabpanel" aria-labelledby="php-tab">
    <pre><code class="language-php">
&lt;?  // Prepare data for POST request
        $fields = array(
            'apiKey'=> 'YOUR API KEY',
            'SMSStatut_List'=>>array(
                array('phoneNumber'=>'+336xxxxxxxx','messageId'=>messageId1),
                array('phoneNumber'=>'+336xxxxxxxx','messageId'=>messageId2)
             )
        );
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.smspartner.fr/v1/multi-status');
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 10);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS,json_encode($fields));
 
        $result = curl_exec($curl);
        curl_close($curl);
 
        // Process your response here
        echo $result;
?&gt;
    </code></pre>
  </div>
 <div class="tab-pane fade" id="vbnet" role="tabpanel" aria-labelledby="vbnet-tab">
   <pre><code class="language-vbnet">
Imports System.IO
Imports System.Net
 
Module Module1
 
  Sub Main()
 
    Dim base_url As String = "http://api.smspartner.fr/v1/"
    Dim apiKey As String = "VOTRE_APIKEY"
 
    #send sms
    url = base_url & "multi-status"
    #note : utiliser une librairie JSON en production, par exemple :
    #https//www.nuget.org/packages/Newtonsoft.Json/
    Dim parameters As String = String.Format(
        "{{""apiKey"":""{0}"",""SMSStatut_List"":""{1}""}}"
    ,
        apiKey,
        {{ ""phoneNumber"":"06xxxxxxx1",
        ""messageId"":"msgId1"},
        { ""phoneNumber"":"06xxxxxxx2"
        ,""message"":"msgId2"}}
    
        )
    Console.Write(parameters)
    apiRequest("POST", url, parameters)
 
  End Sub
 
  Function apiRequest(method As String, url As String, parameters As String) As String
 
    Dim request As HttpWebRequest
    request = WebRequest.Create(url)
    request.Method = method
    request.Timeout = 10000   # timeout in ms
    request.ContentType = "application/json; charset=utf-8"
    request.ContentLength = 0
 
    #set POST data
    If Not String.IsNullOrEmpty(parameters) Then
      request.ContentLength = parameters.Length
      Using reqStream As StreamWriter = 
      New StreamWriter(request.GetRequestStream())
        reqStream.Write(parameters)
      End Using
    End If
 
    #get response
    Dim returnValue As String = Nothing
    Using response As HttpWebResponse = request.GetResponse()
      If response.StatusCode = HttpStatusCode.OK Then
        Using resStream = response.GetResponseStream()
          If resStream IsNot Nothing Then
            Using reader As New StreamReader(resStream)
              returnValue = reader.ReadToEnd()
            End Using
          End If
        End Using
      End If
    End Using
    apiRequest = returnValue
 
  End Function
 
End Module

   </code></pre>
  </div>
  <div class="tab-pane fade" id="python" role="tabpanel" aria-labelledby="python-tab">
    <!-- Python code example goes here -->
    <pre><code class="language-python">
# std
import logging
import json
from collections import OrderedDict
 
# 3p
import requests
 
API_KEY = "MY API KEY"
URL = "https://api.smspartner.fr/v1"
 
class SMSPartner():
    def send_sms(self,phone_number, 
    phone_number2, msgId1, msgId2):
		print(phone_number)
 
 
		data = {"apiKey":APIKEY,"SMSStatut_List":[{"phoneNumber":phone_number,"messageId":msgId1},
        {"phoneNumber":phone_number2,"messageId":msgId2}]}
 
		url = URL + "/multi-status"
		r = requests.post(url, data=json.dumps(data), verify=False)
 
		r_json = r.json()
		if r_json.get("success") == True:
			print(r_json)
			status = True
		else:
			print("SMS msg {} not delivered to {}".format(msg, phone_numbers))
			status = False
		return status
  </div>
    <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code class="language-bash">
curl -X POST https://api.smspartner.fr/v1/multi-status -H "Content-Type: application/json" -d 
'{"apiKey": "Votre clé API","SMSStatut_List": 
[{"phoneNumber": "0619922264", "messageId": 199897},
{"phoneNumber": "06xxxxxxx2", "messageId": 1000},
{"phoneNumber": "06xxxxxxx1", "messageId": 1222}]}'
   </code></pre>
  </div>
  
</div>

## Réponses

### JSON
```json
{
    "success": true,
    "code": 200,
    "StatutResponse_List": [
        {
            "success": true,
            "code": 200,
            "phoneNumber": "+33699999993",
            "messageId": 111111,
            "status": "Delivered",
            "date": "1517934416",
            "stopSms": "0",
            "isSpam": "0"
        },
        {
            "success": false,
            "code": 4,
            "phoneNumber": "+33699999992",
            "messageId": 1000,
            "status": "Numéro introuvable"
        },
        {
            "success": false,
            "code": 4,
            "phoneNumber": "+33699999991",
            "messageId": 1222,
            "status": "Numéro introuvable"
        }
    ]
}
```
### 3 statuts de remises possibles
* **Delivered**
* **Not delivered**
* **Waiting**



## Erreurs
Exemple de message d’erreur:

### JSON
```json
{
    "success": false,
    "code": 10,
    "message": "Clé API incorrecte"
}
```

## Code de contrôle

| _  | Code erreurs |
| :---------------: |:---------------|
|1 | La Clé API est requise |
|4 | Message introuvable|
|10 | Clé API incorrecte |



