---
title: Liste des fichiers audio
description: >
---
# Liste des fichiers audio

Récupére la liste des fichiers audios ajoutés et validés




## URL

<div>
  <div style="background-color: red; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;"> https://api.voicepartner.fr/v1/audios</span>
</div>


## Paramètres
Chaque demande d’API prend en charge les paramètres suivants :

| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://www.voicepartner.fr" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte Voice Partner</a>. |




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
// L'URL de l'API où vous voulez envoyer la requête'URL de l'API où vous voulez envoyer la requête
$url = 'http://api.voicepartner.fr/v1/audios/YOUR_API_KEY';

// Initialisation de cURL
$curl = curl_init($url);

// Configuration des options de cURL
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_HTTPHEADER, [
    'Cache-Control: no-cache'
]);

// Exécution de la requête cURL 
$response = curl_exec($curl);

// Vérification s'il y a eu des erreurs
if ($response === false) {
    // Gérer l'erreur ici
    $error = curl_error($curl);
    curl_close($curl);
    die("Erreur cURL: $error");
}

// Fermeture de la session cURL
curl_close($curl);

// Affichage de la réponse
echo $response;
?&gt;
    </code></pre>
  </div>
 <div class="tab-pane fade" id="vbnet" role="tabpanel" aria-labelledby="vbnet-tab">
   <pre><code class="language-vbnet">
 Imports System.Net.Http

Public Class ListeFichierAudio
    Public Async Function GetAudios(client As HttpClient, apiKey As String) As Task
        Dim url As String = $"audios/{apiKey}"

        Try
            Dim response As HttpResponseMessage = Await client.GetAsync(url)
            If response.IsSuccessStatusCode Then
                Dim responseString As String = Await response.Content.ReadAsStringAsync()
                Console.WriteLine("Audios: " & responseString)
            Else
                Console.WriteLine("Error: " & response.ReasonPhrase)
            End If
        Catch ex As Exception
            Console.WriteLine("Exception: " & ex.Message)
        End Try
    End Function
End Class
   </code></pre>
  </div>
  <div class="tab-pane fade" id="python" role="tabpanel" aria-labelledby="python-tab">
 <pre><code class="language-python">
import requests

# L'URL de l'API où vous voulez envoyer la requête
url = 'http://api.voicepartner.fr/v1/audios/YOUR_API_KEY'

# Configuration des en-têtes HTTP
headers = {
    'Cache-Control': 'no-cache'
}

# Exécution de la requête GET et enregistrement de la réponse
response = requests.get(url, headers=headers)

# Vérification du statut de la réponse
if response.status_code == 200:
    # Affichage de la réponse
    print(response.text)
else:
    # Gérer l'erreur ici
    print(f"Erreur lors de la requête: {response.status_code}")
  
   </code></pre>
  </div>
    <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code class="language-bash">
curl http://api.voicepartner.fr/v1/audios/YOUR_API_KEY
 </code></pre>
  </div>

    <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
   <pre><code class="language-javascript">
    <!-- NodeJS code example goes here -->
   const axios = require('axios');

// L'URL de l'API où vous voulez envoyer la requête
const url = 'http://api.voicepartner.fr/v1/audios/YOUR_API_KEY';

axios.get(url)
    .then(response => {
        console.log(response.data);
    })
    .catch(error => {
        console.error('Erreur lors de la requête:', error);
    });
        </code></pre>
  </div>

  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code class="language-java">
package com.example.API;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

public class ListeFichierAudio {
    public static void main(String[] args) {
        // Replace 'YOUR_API_KEY' with your actual API key
        String url = "http://api.voicepartner.fr/v1/audios/YOUR_API_KEY";

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .build();

        client.sendAsync(request, BodyHandlers.ofString())
                .thenApply(HttpResponse::body)
                .thenAccept(System.out::println)
                .exceptionally(e -> {
                    System.out.println("Erreur lors de la requête: " + e.getMessage());
                    return null;
                })
                .join();
    }
}
   </code></pre>
  </div>
 
  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
<pre><code class="language-go">
package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func main() {
	url := "http://api.voicepartner.fr/v1/audios/YOUR_API_KEY"

	response, err := http.Get(url)
	if err != nil {
		fmt.Printf("Error: %s
", err.Error())
		return
	}
	defer response.Body.Close()

	body, err := ioutil.ReadAll(response.Body)
	if err != nil {
		fmt.Printf("Error: %s
", err.Error())
		return
	}

	fmt.Printf("Response: %s
", string(body))
}
   </code></pre>
  </div>

  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
    <!-- C# code example goes here -->
    <pre><code class="language-csharp">
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace API.ApiClients
{
    public class ListeFichierAudio
    {
        public static async Task Main()
        {
            var url = "http://api.voicepartner.fr/v1/audios/YOUR_API_KEY";

            using (var client = new HttpClient())
            {
                try
                {
                    var response = await client.GetAsync(url);
                    var content = await response.Content.ReadAsStringAsync();
                    Console.WriteLine("Response: " + content);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
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
    "nb_datas": 58,
    "datas": [
        {
            "name": "filename1",
            "token": "token1",
            "size": "104.5Ko",
            "duration": "0:07",
            "created_at": {
                "date": "2018-04-16 13:26:46.000000",
                "timezone_type": 3,
                "timezone": "Europe/Paris"
            }
        },
        {
            "name": "filename2",
            "token": "token2",
            "size": "762.7Ko",
            "duration": "0:49",
            "created_at": {
                "date": "2018-06-04 07:26:04.000000",
                "timezone_type": 3,
                "timezone": "Europe/Paris"
            }
        },...
    ]
}
```
## Exemple

```bash
curl -X GET 
  http://api.voicepartner.fr/v1/audios/YOUR_API_KEY 
  -H 'cache-control: no-cache'
}'
```


