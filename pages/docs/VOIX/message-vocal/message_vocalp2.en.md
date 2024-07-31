---
title: Rename an Audio File
description: >
---
# Rename an Audio File

Rename an added and validated audio file




## URL

<div>
  <div style="background-color: #49CC90; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;"> https://api.voicepartner.fr/v1/audio-file/rename</span>
</div>


## Parameters
Each API request supports the following parameters:

| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Your account's API key. You can obtain it from your <a href="https://www.voicepartner.fr" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">Voice Partner account</a>. |
| tokenAudio       | Audio file identifier |
| filename       | New filename between 3 and 50 characters |


## Request
Request example


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

// L'URL de l'API où vous voulez envoyer la requête
$url = 'https://api.voicepartner.fr/v1/audio-file/rename';

// Les données que vous souhaitez envoyer en JSON
$data = array(
    'apiKey' => 'YOUR_API_KEY',
    'tokenAudio' => 'TOKEN_DU_FICHIER_AUDIO',
    'filename' => 'Nom du fichier'
);

// Encodage des données en JSON
$data_json = json_encode($data);

// Initialisation de cURL
$curl = curl_init($url);

// Configuration des options de cURL pour envoyer du JSON
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_POST, true);
curl_setopt($curl, CURLOPT_POSTFIELDS, $data_json);
curl_setopt($curl, CURLOPT_HTTPHEADER, array(
    'Content-Type: application/json',
    'Content-Length: ' . strlen($data_json)
));

// Exécution de la requête cURL et enregistrement de la réponse
$response = curl_exec($curl);

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
Imports System.Text
Imports Newtonsoft.Json

Public Class RenommerFichierAudio
    Private ReadOnly _url As String = "https://api.voicepartner.fr/v1/audio-file/rename"
    Private ReadOnly _apiKey As String = "YOUR_API_KEY"
    Private ReadOnly _tokenAudio As String = "YOUR_TOKEN_AUDIO"
    Private ReadOnly _filename As String = "YOUR_FILE_NAME"

    Public Async Function RenameAudioFile() As Task
        Dim httpClient As New HttpClient()

        Dim data As New With {
            .apiKey = _apiKey,
            .tokenAudio = _tokenAudio,
            .filename = _filename
        }

        Dim jsonContent As String = JsonConvert.SerializeObject(data)
        Using content As New StringContent(jsonContent, Encoding.UTF8, "application/json")
            Try
                Dim response As HttpResponseMessage = Await httpClient.PostAsync(_url, content)
                If response.IsSuccessStatusCode Then
                    Dim responseContent As String = Await response.Content.ReadAsStringAsync()
                    Console.WriteLine(responseContent)
                Else
                    Console.WriteLine("Error: " & response.StatusCode)
                End If
            Catch ex As Exception
                Console.WriteLine("Erreur lors de la requête: " & ex.Message)
            End Try
        End Using
    End Function

End Class
   </code></pre>
  </div>
  <div class="tab-pane fade" id="python" role="tabpanel" aria-labelledby="python-tab">
 <pre><code class="language-python">
import requests
import json

# L'URL de l'API où vous voulez envoyer la requête
url = 'https://api.voicepartner.fr/v1/audio-file/rename'

# Les données que vous souhaitez envoyer en JSON
data = {
    'apiKey': 'YOUR_API_KEY',
    'tokenAudio': 'TOKEN_DU_FICHIER_AUDIO',
    'filename': 'Nom du fichier'
}

# Encodage des données en JSON
data_json = json.dumps(data)

# Envoi de la requête POST avec les données JSON
headers = {
    'Content-Type': 'application/json'
}
response = requests.post(url, data=data_json, headers=headers)

# Affichage de la réponse
print(response.text)
  
   </code></pre>
  </div>
    <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code class="language-bash">
curl -Method Post -Uri "https://api.voicepartner.fr/v1/audio-file/rename" 
-Headers @{"Content-Type"="application/json"} -Body 
'{"apiKey": "YOUR_API_KEY", "tokenAudio": "TOKEN_DU_FICHIER_AUDIO", 
"filename": "Nom du fichier"}'
 </code></pre>
  </div>

    <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
     <pre><code class="language-javascript">
    <!-- NodeJS code example goes here -->

const axios = require('axios');

// L'URL de l'API pour renommer un fichier audio
const url = 'https://api.voicepartner.fr/v1/audio-file/rename';

// Les données à envoyer en JSON
const data = {
    apiKey: 'YOUR_API_KEY',
    tokenAudio: 'TOKEN_DU_FICHIER_AUDIO',
    filename: 'Nom du fichier'
};

axios.post(url, data)
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
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse.BodyHandlers;

public class RenommerFichierAudio {

    public static void main(String[] args) {
        // L'URL de l'API pour renommer un fichier audio
        String url = "https://api.voicepartner.fr/v1/audio-file/rename";

        // Vos données d'authentification et les informations du fichier
        String apiKey = "VOTRE_CLE_API";
        String tokenAudio = "VOTRE_TOKEN_AUDIO";
        String nouveauNom = "NouveauNomFichier";

        // Les données à envoyer en JSON
        String json = String.format(
                "{"apiKey":"%s","tokenAudio":"%s","filename":"%s"}",
                apiKey, tokenAudio, nouveauNom);

        // Créer une instance de HttpClient
        HttpClient client = HttpClient.newHttpClient();

        // Construire la requête
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Content-Type", "application/json")
                .POST(BodyPublishers.ofString(json))
                .build();

        // Envoyer la requête de manière asynchrone
        client.sendAsync(request, BodyHandlers.ofString())
                .thenApply(HttpResponse::body)
                .thenAccept(System.out::println)
                .exceptionally(e -> {
                    System.out.println("Erreur lors de la requête: " + e.getMessage());
                    return null;
                })
                .join(); // Attendre la fin de l'opération asynchrone
    }
}
   </code></pre>
  </div>
 
  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
<pre><code class="language-go">
package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

type RenameData struct {
	ApiKey     string `json:"apiKey"`
	TokenAudio string `json:"tokenAudio"`
	Filename   string `json:"filename"`
}

func main() {
	url := "https://api.voicepartner.fr/v1/audio-file/rename"
	data := RenameData{
		ApiKey:     "YOUR_API_KEY",
		TokenAudio: "TOKEN_DU_FICHIER_AUDIO",
		Filename:   "Nom du fichier",
	}

	payloadBytes, err := json.Marshal(data)
	if err != nil {
		fmt.Printf("Error: %s
", err.Error())
		return
	}
	body := bytes.NewReader(payloadBytes)

	req, err := http.NewRequest("POST", url, body)
	if err != nil {
		fmt.Printf("Error: %s
", err.Error())
		return
	}
	req.Header.Set("Content-Type", "application/json")

	resp, err := http.DefaultClient.Do(req)
	if err != nil {
		fmt.Printf("Error: %s
", err.Error())
		return
	}
	defer resp.Body.Close()

	respBody, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Printf("Error: %s
", err.Error())
		return
	}

	fmt.Printf("Response: %s
", string(respBody))
}
   </code></pre>
  </div>

  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
    <!-- C# code example goes here -->
    <pre><code class="language-csharp">
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace API.ApiClients
{
    public class RenommerFichierAudio
    {
        public static async Task Main()
        {
            var url = "https://api.voicepartner.fr/v1/audio-file/rename";
            var data = new
            {
                apiKey = "YOUR_API_KEY",
                tokenAudio = "TOKEN_DU_FICHIER_AUDIO",
                filename = "Nom du fichier"
            };

            using (var client = new HttpClient())
            {
                try
                {
                    var json = JsonConvert.SerializeObject(data);
                    var content = new StringContent(json, Encoding.UTF8, "application/json");
                    var response = await client.PostAsync(url, content);
                    var responseContent = await response.Content.ReadAsStringAsync();
                    Console.WriteLine("Response: " + responseContent);
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
## Response

### JSON
```json
{
    "success": true,
    "filename": "NOM DU FICHIER",
    "tokenAudio": "TOKEN DU FICHIER AUDIO"
}
```

## Examples

```bash
curl --location --request POST 'https://api.voicepartner.fr/v1/audio-file/rename' 
--header 'Content-Type: application/json' 
--data-raw '{
    "apiKey": "APIKEY",
    "tokenAudio": "TOKEN DU FICHIER AUDIO",
    "filename": "Nom du fichier"
}
```


