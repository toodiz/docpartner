---
title: Annuler l’envoi d’un SMS
description: >
---
# Annuler l’envoi d’un SMS différé
Cette requête est utilisée pour envoyer un sondage en temps réel ou en différé.

## URL

<div>
  <div style="background-color: #FF4C4C; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/message-cancel</span>
</div>



## Paramètres
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **messageId** | ID du message. <br> Il se trouve dans [la réponse lors de l’envoi d’un SMS](envois_smsp1.md).|

### Paramètres optionnels
| Paramètre       | Description |
|:-----------------:|-------------| 
| **_format**             | Format de la réponse. Vous pouvez choisir entre `JSON` ou `XML`. Par défaut, le format de réponse est `JSON` |

<div class="alert alert-info">
       Attention !! Il n’est pas possible d’annuler l’envoi d’un SMS<strong> moins de 5 minutes avant son envoi </strong>.
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
        curl_setopt($curl, CURLOPT_URL,
        'https://api.smspartner.fr/v1/message-cancel?'.$data);
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
    <pre><code class="language-bash">
  curl -H  "Content-Type: application/json" -X GET  https://api.smspartner.fr/v1/message-cancel?apiKey=xxx&messageId=300
   </code></pre>
  </div>
  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code class="language-javascript">
const https = require('https');

// Préparer les données pour la requête GET
let data = 'apiKey=YOUR_API_KEY&messageId=300';
let url = 'https://api.smspartner.fr/v1/message-cancel?' + data;

https.get(url, (res) => {
  let data = '';

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
   <pre><code class="language-java">
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class AnnulerEnvoiSMS {
    public static void main(String[] args) {
        try {
            // Prepare data for GET request
            String apiKey = "YOUR_API_KEY";
            String messageId = "300";

            // Create GET request URL
            String urlString = "https://api.smspartner.fr/v1/message-cancel?" +
                    "apiKey=" + apiKey + "&messageId=" + messageId;

            // Create URL object
            URL url = new URL(urlString);

            // Create HTTP connection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(10000);
            connection.setReadTimeout(10000);

            // Send GET request
            int responseCode = connection.getResponseCode();

            // Get response
            BufferedReader reader;
            if (responseCode >= 200 && responseCode <= 299) {
                reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            } else {
                reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
            }

            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            // Process your response here
            System.out.println(response.toString());
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

struct AnnulerEnvoi: View {
    @State private var result: String = "Loading..."

    var body: some View {
        VStack {
            Text("Annuler Envoi")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: cancelMessage)
    }

    func cancelMessage() {
        let apiKey = "YOUR_API_KEY"
        let messageId = "300"
        let urlString = "https://api.smspartner.fr/v1/message-cancel?apiKey=(apiKey)&messageId=(messageId)"

        guard let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: (error)")
            } else if let data = data {
                let result = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    self.result = result ?? "Error"
                }
            }
        }

        task.resume()
    }
}

struct AnnulerEnvoi_Previews: PreviewProvider {
    static var previews: some View {
        AnnulerEnvoi()
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

	// Create GET request URL
	url := "https://api.smspartner.fr/v1/message-cancel?" +
		"apiKey=" + apiKey + "&messageId=" + messageId

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
        var uri = new Uri($"https://api.smspartner.fr/v1/message-cancel?apiKey={apiKey}&messageId={messageId}");

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
  "message": "L'envoi du SMS a été annulé."
}
```




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
|3 | L’ID du message est requis |
|4 | Message introuvable|
|5 | L’envoi du SMS a déjà été annulé |
|6 | Vous ne pouvez pas annuler l’envoi d’un SMS moins de 5 minutes avant son envoi |
|7 | 	Vous ne pouvez pas annuler un SMS déjà envoyé |
|10 | Clé API incorrecte |
|200 |Tout s’est bien passé ! |



