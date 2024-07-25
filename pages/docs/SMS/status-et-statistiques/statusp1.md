---
title: Statut unitaire
description: >
---
# Statut de remise unitaire
Cette requête permet de récupérer le statut d’un SMS.

<div class="alert alert-info">
A noter : les comptes-rendus sont reçus en moyenne quelques secondes après l’envoi du SMS ;
cependant, ce délai peut s’étendre jusqu’à 48h maximum selon les opérateurs et la charge de notre plateforme.
    </div>



## URL

<div>
  <div style="background-color: #FF4C4C; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/message-status</span>
</div>


### Paramètres
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **messageId** | ID du message. <br> Il se trouve dans [la réponse lors de l’envoi d’un SMS](../envoyer-des-sms/envois_smsp1.md).|
| **phoneNumber** | Numéro de téléphone portable du destinataire..|

### Paramètres optionnels
| Paramètre       | Description |
|:-----------------:|-------------| 
| **_format**             | Format de la réponse. Par défaut, le format de réponse est `JSON` |



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
  <li class="nav-item">
    <a class="nav-link" id="nodejs-tab" data-toggle="tab" href="#nodejs" role="tab" aria-controls="nodejs" aria-selected="false">NodeJS</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="java-tab" data-toggle="tab" href="#java" role="tab" aria-controls="java" aria-selected="false">JAVA</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="swift-tab" data-toggle="tab" href="#swift" role="tab" aria-controls="swift" aria-selected="false">SWIFT</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="go-tab" data-toggle="tab" href="#go" role="tab" aria-controls="go" aria-selected="false">GO</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="csharp-tab" data-toggle="tab" href="#csharp" role="tab" aria-controls="csharp" aria-selected="false">C#</a>
  </li>
</ul>




<!-- Tab panes -->
<div class="tab-content">
  <div class="tab-pane fade show active" id="php" role="tabpanel" aria-labelledby="php-tab">
    <pre><code class="language-php">
&lt;? // Prepare data for GET request
        $data = 'apiKey=YOUR_API_KEY&messageId=300&phoneNumber=06xxxxxxxx';
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.smspartner.fr/v1/message-status?'.$data);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 10);
 
 
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
    Dim phoneNumber As String = "06XXXXXXXX"
    Dim messageId As Integer = XXX
 
    #check credits
    Dim url As String
    url = base_url & "message-status" & "?apiKey=" & apiKey & "&phoneNumber=" & phoneNumber & "&messageId=" & messageId
 
    Dim credits As String
    credits = apiRequest("GET", url, Nothing)
 
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
      Using reqStream As StreamWriter = New StreamWriter(request.GetRequestStream())
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
    def get_delivery(self,phone_numbers,message_id):
		url = URL + "/message-status?apiKey=" + API_KEY + "&phoneNumber=" + phone_numbers + "&messageId=" + message_id
		r = requests.get(url)
		r_json = r.json()
		if r_json.get("success") == True:
			print(r_json)
			status = True
		else:
			print(r_json)
			status = False
		return status
  </div>
    <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code class="language-bash">
curl -H  "Content-Type: application/json" -X GET  https://api.smspartner.fr/v1/message-status?apiKey=xxx&messageId=300&phoneNumber=06xxxxxxxx
   </code></pre>
  </div>
  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code class="language-javascript">
const https = require("https");

// Remplacez par votre clé API et autres données
const apiKey = "VOTRE_CLÉ_API";
const messageId = "300";
const phoneNumber = "06xxxxxxxx";

// Préparer les données pour la requête GET
const data = `apiKey=${apiKey}&messageId=${messageId}&phoneNumber=${phoneNumber}`;

// Définir les options pour la requête HTTP GET vers l'API SMS Partner
const options = {
  hostname: "api.smspartner.fr",
  port: 443,
  path: `/v1/message-status?${data}`,
  method: "GET",
  headers: {
    "Content-Type": "application/json",
    "cache-control": "no-cache",
  },
};

// Effectuer la requête HTTP GET avec les options et données définies précédemment
const req = https.request(options, (res) => {
  console.log(`statusCode: ${res.statusCode}`);

  // Afficher les données de réponse de l'API sur la sortie standard
  res.on("data", (d) => {
    process.stdout.write(d);
  });
});

// Afficher en cas d'erreur lors de l'exécution de la requête HTTP GET
req.on("error", (error) => {
  console.error(error);
});

// Terminer la requête HTTP GET
req.end();
   </code></pre>
  </div>
  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code class="language-java">
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.stream.Collectors;
import org.json.JSONObject;

public class SMSSTatus {
    public static void main(String[] args) {
        try {
            // Remplacez par votre clé API et autres données
            String apiKey = "VOTRE_CLÉ_API";
            String messageId = "300";
            String phoneNumber = "06xxxxxxxx";

            // Préparer les données pour la requête GET
            String data = String.format("apiKey=%s&messageId=%s&phoneNumber=%s", apiKey, messageId, phoneNumber);
            URL url = new URL("https://api.smspartner.fr/v1/message-status?" + data);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("cache-control", "no-cache");

            // Lecture de la réponse de l'API
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String response = br.lines().collect(Collectors.joining());

            // Afficher la réponse JSON
            System.out.println(response);

            // Fermeture de la connexion HTTP
            conn.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
   </code></pre>
  </div>
  <div class="tab-pane fade" id="swift" role="tabpanel" aria-labelledby="swift-tab">
    <!-- SWIFT code example goes here -->
    <pre><code class="language-swift">
import SwiftUI

// Structure pour la vue "StatutSMS"
struct StatutSMS: View {
   var body: some View {
       // Un bouton qui appelle la fonction StatutSMS() lorsqu'il est pressé
       Button(action: {
           StatutSMS()
       }) {
           Text("Check SMS Status")
               .font(.system(size: 20))
               .foregroundColor(.white)
               .frame(minWidth: 0, maxWidth: .infinity)
               .padding()
               .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
               .cornerRadius(10)
               .padding(.horizontal)
       }
   }
   
   // Fonction pour vérifier le statut d'un SMS
   func StatutSMS() {
       let apiKey = "XXXXXXXXXXXX YOUR API KEY XXXXXXXXXXXXX" // Votre clé API
       let messageId = "your msg ID" // ID de votre message
       let phoneNumber = "06XXXXXXXX" // Numéro de téléphone

       // URL pour vérifier le statut du SMS
       let urlString = "https://api.smspartner.fr/v1/message-status?apiKey=(apiKey)&messageId=(messageId)&phoneNumber=(phoneNumber)"

       // On vérifie que l'URL est correctement formée
       guard let url = URL(string: urlString) else {
           print("Erreur : impossible de créer l'URL")
           return
       }

       // Tâche pour récupérer les données de l'URL
       let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
           // Si une erreur se produit, on l'affiche
           if let error = error {
               print("Erreur : (error)")
           }
           // Sinon, on affiche les données reçues
           else if let data = data {
               let str = String(data: data, encoding: .utf8)
               print("Données reçues :
(str ?? "")")
           }
       }
       
       task.resume() // On lance la tâche
   }
}

// Aperçu de la vue
struct StatutSMS_Previews: PreviewProvider {
   static var previews: some View {
       StatutSMS()
   }
}
   </code></pre>
  </div>
  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
    <!-- GO code example goes here -->
    <pre><code class="language-go">
package main

import (
	"io/ioutil"
	"log"
	"net/http"
	"time"
)

func main() {
	// Prepare data for GET request
	apiKey := "YOUR_API_KEY"
	messageId := "300"
	phoneNumber := "06xxxxxxxx"

	// Create GET request URL
	url := "https://api.smspartner.fr/v1/message-status?" +
		"apiKey=" + apiKey + "&messageId=" + messageId + "&phoneNumber=" + phoneNumber

	// Create HTTP client
	client := &http.Client{Timeout: 10 * time.Second}

	// Send GET request
	resp, err := client.Get(url)
	if err != nil {
		log.Fatalf("Error sending request: %v", err)
	}
	defer resp.Body.Close()

	// Get response
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatalf("Error reading response body: %v", err)
	}

	// Process your response here
	log.Printf("Response: %s", body)
}
   </code></pre>
  </div>
  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
    <!-- C# code example goes here -->
    <pre><code class="language-csharp">
using System;
using System.Net.Http;
using System.Threading.Tasks;

class Program
{
    private static readonly HttpClient client = new HttpClient();

    static async Task Main(string[] args)
    {
        var apiKey = "YOUR_API_KEY";
        var messageId = "300";
        var phoneNumber = "06xxxxxxxx";
        var uri = new Uri($"https://api.smspartner.fr/v1/message-status?apiKey={apiKey}&messageId={messageId}&phoneNumber={phoneNumber}");

        HttpResponseMessage response = await client.GetAsync(uri);

        if (response.IsSuccessStatusCode)
        {
            var result = await response.Content.ReadAsStringAsync();
            Console.WriteLine(result);
        }
        else
        {
            Console.WriteLine("GET request failed with status code: " + response.StatusCode);
        }
    }
}
   </code></pre>
  </div>
</div>

## Réponses

### JSON
```json
{
    "success": true,
    "code": 200,
    "number": "0600000000",
    "messageId": "1111",
    "stopSms": false,
    "date": "2015-02-07 22:39:46",
    "statut": "Delivered",
    "cost": 0.045,
    "countryCode": "FR",
    "currency": "EUR"
}
```
### 3 statuts de remises possibles
* **Delivered (Livré)** : Ce statut indique que le message a été livré avec succès au destinataire. Cela signifie que le message a été envoyé correctement et qu’il a été reçu sur l’appareil ou la plateforme du destinataire. La date et l’heure de la réception est normalement disponible.
* **Not delivered (Non livré)** : Ce statut fait référence aux messages qui n’ont pas pu être livrés au destinataire. Il peut y avoir plusieurs raisons pour lesquelles un message n’est pas livré : comme un numéro de téléphone non valide ou un problème opérateurs chez un opérateur.
* **Waiting (En attente)** : Ce statut indique que le message est en cours de livraison et qu’il n’a pas encore été confirmé s’il sera livré ou non. Cela peut se produire en cas de retards sur le réseau ou lorsque des confirmations supplémentaires sont nécessaires avant de pouvoir marquer le message comme livré ou non livré.




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
|2 | Le numéro de téléphone est requis|
|3 | L’ID du message est requis |
|4 | Message introuvable|
|10 | Clé API incorrecte |
|200 |Tout s’est bien passé ! |



