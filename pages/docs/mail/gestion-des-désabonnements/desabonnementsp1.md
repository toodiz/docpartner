---
title:  Ajouter un mail 
description: >
---
# Ajouter un mail à la liste des désinscriptions

Cette requête permet d’ajouter un mail à la liste des désinscriptions.


## URL
<div>
  <div style="background-color: #49CC90; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;">  http://api.mailpartner.fr/v1/unsubscribe/add</span>
</div>





  ## Paramètres

  Chaque demande d’API prend en charge les paramètres suivants :

  | Paramètre  | Description |
  | :--------------- |:---------------|
  | **apiKey** | Clé API de votre compte. Vous l'obtenez dans votre <a href="https://www.mailpartner.fr" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte Mail Partner</a>. |
  | **email** | Mail à ajouter. |

  ### Paramètres optionnels

  | Paramètre  | Description |
  | :--------------- |:---------------|
  | **_format** | Format de la réponse. Vous pouvez choisir entre JSON ou XML. Par défaut, le format de réponse est JSON. |




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
        // Prepare data for POST request
        $fields = array(
            'apiKey'=> 'YOUR API KEY',
            'email'=> 'xxxx@www.com'
        );
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'http://api.mailpartner.fr/v1/unsubscribe/add');
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
   <pre><code>

Imports System.IO
Imports System.Net
 
Module Module1
 
  Sub Main()
 
    Dim base_url As String = "http://api.mailpartner.fr/v1/"
    Dim apiKey As String = "VOTRE_APIKEY"
 
    #send sms
    url = base_url & "unsubscribe/add"
    #note : utiliser une librairie JSON en production, par exemple :
    #https//www.nuget.org/packages/Newtonsoft.Json/
    Dim parameters As String = String.Format(
        "{{""apiKey"":""{0}"",""email"":""{1}""}}",
        apiKey,
        "xxxx@www.com")
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
URL = "http://api.mailpartner.fr/v1"
 
class SMSPartner():
    def add_stop(self,mail):
 
		data = OrderedDict([
			("apiKey", API_KEY),
			("email", mail)
		])
 
		url = URL + "/unsubscribe/add"
		r = requests.post(url, data=json.dumps(data), verify=False)
 
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
curl -H  "Content-Type: application/json" -X POST -d '{"apiKey":"xxxxx","email":"xxxx"}' https://api.mailpartner.fr/v1/unsubscribe/add
   </code></pre>
  </div>

  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code>
const axios = require('axios');

// Préparer les données pour la requête POST
const data = {
    apiKey: 'YOUR API KEY',
    email: 'xxxx@www.com'
};

// Configuration de la requête
const config = {
    method: 'post',
    url: 'http://api.mailpartner.fr/v1/unsubscribe/add',
    headers: {
        'Content-Type': 'application/json'
    },
    timeout: 10000, // Timeout de 10 secondes
    data: data
};

// Envoyer la requête POST
axios(config)
    .then(function (response) {
        console.log('Réponse:', response.data); // Traitez votre réponse ici
    })
    .catch(function (error) {
        console.error('Erreur:', error.message);
    });


   </code></pre>
  </div>
  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code>
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class HttpPostRequestExample {

    public static void main(String[] args) {
        try {
            // URL de l'API
            URL url = new URL("http://api.mailpartner.fr/v1/unsubscribe/add");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            // Configurer la requête
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json; utf-8");
            connection.setRequestProperty("Accept", "application/json");
            connection.setDoOutput(true); // Permet d'envoyer des données dans la requête

            // Préparer les données JSON
            String jsonInputString = "{ "apiKey": "YOUR API KEY", "email": "xxxx@www.com" }";

            // Envoyer les données dans la requête POST
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            // Lire la réponse
            int responseCode = connection.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) { // Code 200 : succès
                try (java.io.BufferedReader br = new java.io.BufferedReader(
                        new java.io.InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
                    StringBuilder response = new StringBuilder();
                    String responseLine;
                    while ((responseLine = br.readLine()) != null) {
                        response.append(responseLine.trim());
                    }
                    System.out.println("Réponse: " + response.toString()); // Traitez votre réponse ici
                }
            } else {
                System.out.println("Erreur dans la requête. Code de réponse: " + responseCode);
            }

            connection.disconnect();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


   </code></pre>
  </div>

   <div class="tab-pane fade" id="swift" role="tabpanel" aria-labelledby="swift-tab">
    <!-- SWIFT code example goes here -->
    <pre><code>
import Foundation

// Préparation des données JSON
let parameters: [String: Any] = [
    "apiKey": "YOUR API KEY",
    "email": "xxxx@www.com"
]

// Conversion des paramètres en JSON
guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
    print("Erreur lors de la conversion des données en JSON")
    return
}

// URL de l'API
let url = URL(string: "http://api.mailpartner.fr/v1/unsubscribe/add")!

// Création de la requête
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")
request.httpBody = jsonData

// Configuration de la session URLSession
let session = URLSession.shared
let task = session.dataTask(with: request) { data, response, error in
    // Vérifier s'il y a une erreur
    if let error = error {
        print("Erreur: (error.localizedDescription)")
        return
    }

    // Vérifier la réponse HTTP
    if let httpResponse = response as? HTTPURLResponse {
        print("Code de réponse: (httpResponse.statusCode)")
        
        // Si la requête est un succès
        if httpResponse.statusCode == 200 {
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Réponse: (responseString)") // Traitez votre réponse ici
            }
        } else {
            print("Erreur: Requête non réussie")
        }
    }
}

// Lancer la requête
task.resume()

   </code></pre>
  </div>

   <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
    <!-- GO code example goes here -->
    <pre><code>
package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"time"
)

func main() {
	// Préparer les données pour la requête POST
	data := map[string]string{
		"apiKey": "YOUR API KEY",
		"email":  "xxxx@www.com",
	}

	// Convertir les données en JSON
	jsonData, err := json.Marshal(data)
	if err != nil {
		fmt.Println("Erreur lors de la conversion des données en JSON:", err)
		return
	}

	// Créer la requête HTTP POST
	url := "http://api.mailpartner.fr/v1/unsubscribe/add"
	req, err := http.NewRequest("POST", url, bytes.NewBuffer(jsonData))
	if err != nil {
		fmt.Println("Erreur lors de la création de la requête:", err)
		return
	}

	// Ajouter les en-têtes de la requête
	req.Header.Set("Content-Type", "application/json")

	// Créer un client HTTP avec un timeout
	client := &http.Client{
		Timeout: 10 * time.Second,
	}

	// Envoyer la requête
	resp, err := client.Do(req)
	if err != nil {
		fmt.Println("Erreur lors de l'envoi de la requête:", err)
		return
	}
	defer resp.Body.Close()

	// Lire la réponse
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("Erreur lors de la lecture de la réponse:", err)
		return
	}

	// Vérifier le statut de la réponse HTTP
	if resp.StatusCode == http.StatusOK {
		fmt.Println("Réponse du serveur:", string(body)) // Traitez votre réponse ici
	} else {
		fmt.Printf("Erreur dans la requête. Code de réponse: %d
", resp.StatusCode)
	}
}

   </code></pre>
  </div>
  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
    <!-- C# code example goes here -->
    <pre><code>
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace HttpPostExample
{
    class Program
    {
        static async Task Main(string[] args)
        {
            // URL de l'API
            string url = "http://api.mailpartner.fr/v1/unsubscribe/add";

            // Préparer les données à envoyer
            var jsonData = new
            {
                apiKey = "YOUR API KEY",
                email = "xxxx@www.com"
            };

            // Convertir les données en JSON
            string jsonString = Newtonsoft.Json.JsonConvert.SerializeObject(jsonData);

            // Créer un HttpClient
            using (HttpClient client = new HttpClient())
            {
                // Configurer le timeout (10 secondes)
                client.Timeout = TimeSpan.FromSeconds(10);

                // Créer le contenu de la requête
                var content = new StringContent(jsonString, Encoding.UTF8, "application/json");

                try
                {
                    // Envoyer la requête POST
                    HttpResponseMessage response = await client.PostAsync(url, content);

                    // Vérifier le statut de la réponse
                    if (response.IsSuccessStatusCode)
                    {
                        // Lire le contenu de la réponse
                        string responseBody = await response.Content.ReadAsStringAsync();
                        Console.WriteLine("Réponse du serveur: " + responseBody); // Traitez votre réponse ici
                    }
                    else
                    {
                        Console.WriteLine($"Erreur dans la requête. Code de réponse: {response.StatusCode}");
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Erreur: " + ex.Message);
                }
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
  "stopId": 300

  ```




## Code de contrôle

|_ |Response|
|----|--------|
|1|La Clé API est requise|
|2|Le mail est requis|
|3|Le mail est déjà dans la liste|
|9|Le mail est invalide|
|10|Clé API incorrecte|
|200|Tout s’est bien passé!|







