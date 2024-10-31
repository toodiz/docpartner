---
title: Liste des stops
description: >
---
# Liste des stops
Cette requête permet de récupérer la liste des numéros qui ont envoyé un stop.
  
   <div class="alert alert-info">
   A noter : les comptes-rendus sont reçus en moyenne quelques secondes après l’envoi du SMS ; cependant, ce délai peut s’étendre jusqu’à 48h maximum selon les opérateurs et la charge de notre plateforme.
    </div>



## URL

<div>
  <div style="background-color: red; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/stop-sms/list</span>
</div>


## Paramètres
Chaque demande d’API prend en charge les paramètres suivants :

| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |

## Paramètres optionnels

| Paramètre   | Description |
|:-----------------:|-------------| 
| **_format**      | Format de la réponse. Vous pouvez choisir entre <strong> JSON</strong> ou <strong> XML </strong>. Par défaut, le format de réponse est <strong> JSON. </strong> |



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
&lt;? 
 // Prepare data for GET request
        $data = 'apiKey=YOUR_API_KEY';
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.smspartner.fr/v1/stop-sms/list?'.$data);
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
    url = base_url & "stop-sms/list" & "?apiKey=" & apiKey
 
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
    def get_list_stop(self):
		url = URL + "/stop-sms/list?apiKey=" + API_KEY
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
curl -H "Content-Type: application/json" -X 
GET https://api.smspartner.fr/v1/stop-sms/list?apiKey=xxx
    </code></pre>
  </div>

    <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code class="language-javascript">
const https = require('https');

const apiKey = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

const options = {
  hostname: 'api.smspartner.fr',
  port: 443,
  path: `/v1/stop-sms/list?apiKey=${apiKey}`,
  method: 'GET',
};

const req = https.request(options, (res) => {
  console.log(`statusCode: ${res.statusCode}`);

  let rawData = '';
  res.on('data', (chunk) => {
    rawData += chunk;
  });

  res.on('end', () => {
    try {
      const parsedData = JSON.parse(rawData);
      // Process your response here
      console.log(parsedData);
    } catch (e) {
      console.error(e.message);
    }
  });
});

req.on('error', (error) => {
  console.error(error);
});

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

public class StopSMSList {
    public static void main(String[] args) {
        try {
            String apiKey = "YOUR_API_KEY";
            URL url = new URL("https://api.smspartner.fr/v1/stop-sms/list?apiKey=" + apiKey);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("cache-control", "no-cache");

            // Reading API response
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String response = br.lines().collect(Collectors.joining());

            // Parse JSON response
            JSONObject jsonResponse = new JSONObject(response);

            // Display the JSON response
            System.out.println(jsonResponse.toString(2));

            // Closing HTTP connection
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

// Structure pour la vue "ListStopSMS"
struct ListStopSMS: View {
    var body: some View {
        // Un bouton qui appelle la fonction ListStopSMS() lorsqu'il est pressé
        Button(action: {
            ListStopSMS()
        }) {
            Text("Check Stop SMS List")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }

    // Fonction pour récupérer la liste des SMS stoppés
    func ListStopSMS() {
        let apiKey = "XXXXXXXXXXXX YOUR API KEY XXXXXXXXXXXXX" // Votre clé API
        let urlString = "https://api.smspartner.fr/v1/stop-sms/list?apiKey=(apiKey)" // URL pour récupérer la liste des SMS stoppés

        // On vérifie que l'URL est correctement formée
        guard let url = URL(string: urlString) else {
            print("URL invalide")
            return
        }

        // Tâche pour récupérer les données de l'URL
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Si une erreur survient, on l'affiche
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
struct StopSMSList_Previews: PreviewProvider {
    static var previews: some View {
        ListStopSMS()
    }
}
   </code></pre>
  </div>
  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
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

	// Create GET request URL
	url := "https://api.smspartner.fr/v1/stop-sms/list?" +
		"apiKey=" + apiKey

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
        var apiKey = "VOTRE_CLÉ_API";
        var uri = new Uri($"https://api.smspartner.fr/v1/stop-sms/list?apiKey={apiKey}");

        HttpResponseMessage response = await client.GetAsync(uri);

        if (response.IsSuccessStatusCode)
        {
            var result = await response.Content.ReadAsStringAsync();
            Console.WriteLine(result);
        }
        else
        {
            Console.WriteLine("La requête GET a échoué avec le code de statut: " + response.StatusCode);
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
  "nbData": 1,
  "data": [
    {
      "id": 19,
      "phoneNumber": "+33xxxxxxxxx",
      "createdAt": "2015-07-20 10:19:45"
    }
  ]
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
|10 | Clé API incorrecte |
|200 | 	Tout s’est bien passé ! |



