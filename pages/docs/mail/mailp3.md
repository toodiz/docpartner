---
title: Annuler l’envoi d’un Mail
description: Page 03 MAIL.
---

# Annuler l’envoi d’un mail différé

Cette requête est utilisée pour annuler l’envoi d’un mail envoyé en différé.

## URL

<div>
  <div style="background-color: #FF4C4C; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/message-cancel</span>
</div>


  ## Paramètres

  Chaque demande d'API prend en charge les paramètres suivants :

  | Paramètre  | Description |
  | :--------------- |:---------------|
  | **apiKey** | Clé API de votre compte. Vous l'obtenez dans votre compte SMS Partner. |
  | **messageId** | Il se trouve dans la réponse lors de l’envoi d’un mail |

  ### Paramètres optionnels

  | Paramètre  | Description |
  | :--------------- |:---------------|
  | **_format** | Format de la réponse. Vous pouvez choisir entre JSON ou XML. Par défaut, le format de réponse est JSON. |

  <div class="alert alert-info">
        Attention !! Il n’est pas possible d’annuler l’envoi d’un mail<strong> moins de 5 minutes avant son envoi </strong>.
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
&lt;?php
 // Prepare data for GET request
        $data = 'apiKey=YOUR_API_KEY&messageId=300';
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.mailpartner.fr/v1/message-cancel?'.$data);
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
   <pre><code>
Imports System.IO
Imports System.Net
 
Module Module1
 
  Sub Main()
 
    Dim base_url As String = "http://api.mailpartner.fr/v1/"
    Dim apiKey As String = "VOTRE_APIKEY"
    Dim messageId As Integer = XXX
 
    #check credits
    Dim url As String
    url = base_url & "message-cancel" & "?apiKey=" & apiKey & "&messageId=" & messageId
 
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
    <pre><code>
# std
import logging
import json
from collections import OrderedDict
 
# 3p
import requests
 
API_KEY = "MY API KEY"
URL = "https://api.mailpartner.fr/v1"
 
class MailPartner():
    def get_delivery(self,phone_numbers,message_id):
		url = URL + "/message-cancel?apiKey=" + API_KEY + "&messageId=" + message_id
		r = requests.get(url)
		r_json = r.json()
		if r_json.get("success") == True:
			print(r_json)
			status = True
		else:
			print(r_json)
			status = False
		return status
   </code></pre>
  </div>

  <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code>
  curl -H  "Content-Type: application/json" -X GET  https://api.mailpartner.fr/v1/message-cancel?apiKey=xxx&messageId=300
   </code></pre>
  </div>

  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code>
const https = require('https');

// Clé API et URL de base
const API_KEY = 'MY API KEY';
const URL = 'https://api.smspartner.fr/v1/message-cancel';

// Préparer les données pour la requête GET
let messageId = 'YOUR_MESSAGE_ID';
let url = `${URL}?apiKey=${API_KEY}&messageId=${messageId}`;

https.get(url, (res) => {
  let data = ';

  // Un morceau de données a été reçu.
  res.on('data', (chunk) => {
    data += chunk;
  });

  // La totalité de la réponse a été reçue. Imprimer le résultat.
  res.on('end', () => {
    console.log(JSON.parse(data));
  });

}).on("error", (err) => {
  // Un message d'erreur sera imprimé en cas d'erreur.
  console.log("Erreur: " + err.message);
});

   </code></pre>
  </div>
  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code>
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class MailPartner {
    // Clé API et URL de base
    private static final String API_KEY = "MY API KEY";
    private static final String URL_BASE = "https://api.smspartner.fr/v1/message-cancel";

    public static void main(String[] args) {
        // ID du message à annuler
        String messageId = "YOUR_MESSAGE_ID";

        // Construire l'URL de la requête
        String urlString = URL_BASE + "?apiKey=" + API_KEY + "&messageId=" + messageId;

        try {
            // Créer l'URL
            URL url = new URL(urlString);
            // Ouvrir la connexion
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            // Lire la réponse
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder content = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            // Fermer les flux
            in.close();
            connection.disconnect();

            // Afficher le résultat
            System.out.println(content.toString());
        } catch (Exception e) {
            // Imprimer le message d'erreur en cas d'exception
            System.out.println("Erreur: " + e.getMessage());
        }
    }
}

   </code></pre>
  </div>

   <div class="tab-pane fade" id="swift" role="tabpanel" aria-labelledby="swift-tab">
    <!-- SWIFT code example goes here -->
    <pre><code>
import Foundation

// Clé API et URL de base
let apiKey = "MY API KEY"
let urlBase = "https://api.smspartner.fr/v1/message-cancel"

// ID du message à annuler
let messageId = "YOUR_MESSAGE_ID"

// Construire l'URL de la requête
let urlString = "(urlBase)?apiKey=(apiKey)&messageId=(messageId)"
guard let url = URL(string: urlString) else {
    print("Erreur: URL invalide")
    exit(1)
}

// Créer une session
let session = URLSession.shared

// Créer la tâche de données
let task = session.dataTask(with: url) { data, response, error in
    // Gestion des erreurs
    if let error = error {
        print("Erreur: (error.localizedDescription)")
        return
    }
    
    // Vérifier la réponse
    guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
        print("Erreur: Réponse serveur invalide")
        return
    }
    
    // Vérifier les données
    guard let data = data else {
        print("Erreur: Données vides")
        return
    }
    
    // Afficher le résultat
    if let jsonString = String(data: data, encoding: .utf8) {
        print(jsonString)
    } else {
        print("Erreur: Impossible de convertir les données en chaîne")
    }
}

// Démarrer la tâche
task.resume()

   </code></pre>
  </div>

   <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
    <!-- GO code example goes here -->
    <pre><code>
package main

import (
    "fmt"
    "io/ioutil"
    "net/http"
)

func main() {
    // Clé API et URL de base
    apiKey := "MY API KEY"
    urlBase := "https://api.smspartner.fr/v1/message-cancel"

    // ID du message à annuler
    messageId := "YOUR_MESSAGE_ID"

    // Construire l'URL de la requête
    url := fmt.Sprintf("%s?apiKey=%s&messageId=%s", urlBase, apiKey, messageId)

    // Faire la requête GET
    resp, err := http.Get(url)
    if err != nil {
        fmt.Printf("Erreur: %v
", err)
        return
    }
    defer resp.Body.Close()

    // Lire la réponse
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        fmt.Printf("Erreur: %v
", err)
        return
    }

    // Vérifier le statut de la réponse HTTP
    if resp.StatusCode != http.StatusOK {
        fmt.Printf("Erreur: Statut HTTP %d
", resp.StatusCode)
        return
    }

    // Afficher le résultat
    fmt.Println(string(body))
}

   </code></pre>
  </div>
  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
    <!-- C# code example goes here -->
    <pre><code>
using System;
using System.Net.Http;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        // Clé API et URL de base
        string apiKey = "MY API KEY";
        string urlBase = "https://api.smspartner.fr/v1/message-cancel";

        // ID du message à annuler
        string messageId = "YOUR_MESSAGE_ID";

        // Construire l'URL de la requête
        string url = $"{urlBase}?apiKey={apiKey}&messageId={messageId}";

        // Créer un client HTTP
        using (HttpClient client = new HttpClient())
        {
            try
            {
                // Faire la requête GET
                HttpResponseMessage response = await client.GetAsync(url);
                response.EnsureSuccessStatusCode();

                // Lire la réponse
                string responseBody = await response.Content.ReadAsStringAsync();

                // Afficher le résultat
                Console.WriteLine(responseBody);
            }
            catch (HttpRequestException e)
            {
                // Afficher le message d'erreur en cas d'exception
                Console.WriteLine($"Erreur: {e.Message}");
            }
        }
    }
}

   </code></pre>
  </div>
</div>


## Réponse
<!-- Tab panes pour JSON et XML -->
```json
 "success": true,
  "code": 200,
  "message": "L'envoi du mail a été annulé."

  ```




## Code de contrôle

| _  | Réponse |
| :---------------: |:---------------|
|1 |La Clé API est requise |
|3 | 	L’ID du message est requis |
|4 | Message introuvable |
|5 | L’envoi du mail a déjà été annulé |
|6 | Vous ne pouvez pas annuler l’envoi d’un mail moins de 5 minutes avant son envoi|
|7 | Vous ne pouvez pas annuler un mail déjà envoyé |
|10 |Clé API incorrecte |
|200 | 	Tout s’est bien passé ! |






