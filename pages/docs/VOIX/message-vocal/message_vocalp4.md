---
title: Supprimer un envoi différé
description: >
---
# Supprimer un envoi différé

Permet d’annuler un envoi



## URL

<div>
  <div style="background-color: red ; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">DELETE</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;"> https://api.voicepartner.fr/v1/campaign/cancel </span>
</div>


## Paramètres
Chaque demande d’API prend en charge les paramètres suivants :

| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://www.voicepartner.fr" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte Voice Partner</a>. |
| **campaignId**       | id de message |




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

// Activer l'affichage des erreurs pour le débogage
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// L'URL de l'API pour annuler la campagne
$apiKey = 'YOUR_API_KEY'; // Remplacez par votre clé API réelle
$campaignId = 'CAMPAIGN_ID'; // Remplacez par l'ID de campagne réel

// Construction de l'URL avec la clé API et l'ID de campagne
$url = "https://api.voicepartner.fr/v1/campaign/cancel/$apiKey/$campaignId";

// Initialisation de cURL
$curl = curl_init($url);

// Configuration des options de cURL pour une requête DELETE
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
curl_setopt($curl, CURLOPT_CUSTOMREQUEST, 'DELETE');
curl_setopt($curl, CURLOPT_HTTPHEADER, array(
    'Cache-Control: no-cache'
));

// Exécution de la requête cURL et enregistrement de la réponse
$response = curl_exec($curl);

// Vérification s'il y a eu des erreurs pendant l'exécution de la requête
if (curl_errno($curl)) {
    echo 'Erreur cURL : ' . curl_error($curl);
} else {
    // Affichage de la réponse
    echo 'Réponse : ' . $response;
}

// Fermeture de la session cURL
curl_close($curl);
?&gt;
    </code></pre>
  </div>
 <div class="tab-pane fade" id="vbnet" role="tabpanel" aria-labelledby="vbnet-tab">
   <pre><code class="language-vbnet">
Imports System.Net.Http

Public Class SupprimeEnvoiDiffere
    Public Async Function CancelCampaignAsync() As Task
        Using client As New HttpClient()
            Dim apiKey As String = "YOUR_API_KEY"
            Dim campaignId As String = "CAMPAIGN_ID"
            Dim url As String = $"https://api.voicepartner.fr/v1/campaign/cancel/{apiKey}/{campaignId}"

            Try
                Dim response = Await client.DeleteAsync(url)
                Dim responseContent = Await response.Content.ReadAsStringAsync()

                If response.IsSuccessStatusCode Then
                    Console.WriteLine(responseContent)
                Else
                    Console.WriteLine($"Erreur: {response.StatusCode}")
                    Console.WriteLine($"Contenu : {responseContent}")
                End If
            Catch ex As Exception
                Console.WriteLine($"Exception: {ex.Message}")
            End Try
        End Using
    End Function
End Class
   </code></pre>
  </div>
  <div class="tab-pane fade" id="python" role="tabpanel" aria-labelledby="python-tab">
 <pre><code class="language-python">
import requests

# Activer l'affichage des erreurs pour le débogage
# En Python, les erreurs sont affichées par défaut lorsqu'elles se produisent.

# L'URL de l'API pour annuler la campagne
apiKey = 'YOUR_API_KEY'  # Remplacez par votre clé API réelle
campaignId = 'CAMPAIGN_ID'  # Remplacez par l'ID de campagne réel

# Construction de l'URL avec la clé API et l'ID de campagne
url = f"https://api.voicepartner.fr/v1/campaign/cancel/{apiKey}/{campaignId}"

# Configuration des en-têtes HTTP
headers = {
    'Cache-Control': 'no-cache'
}

# Exécution de la requête DELETE
response = requests.delete(url, headers=headers)

# Vérification s'il y a eu des erreurs pendant l'exécution de la requête
if response.status_code != 200:
    print(f'Erreur cURL : {response.status_code}')
else:
    # Affichage de la réponse
    print(f'Réponse : {response.text}')
   </code></pre>
  </div>
    <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code class="language-bash">
curl -X DELETE 'https://api.voicepartner.fr/v1/campaign/cancel/YOUR_API_KEY/CAMPAIGN_ID'
 </code></pre>
  </div>

    <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
     <pre><code class="language-javascript">
    <!-- NodeJS code example goes here -->
const axios = require('axios');

// L'URL de l'API pour annuler la campagne
const apiKey = 'YOUR_API_KEY';
const campaignId = 'CAMPAIGN_ID';
const url = `https://api.voicepartner.fr/v1/campaign/cancel/${apiKey}/${campaignId}`;

axios.delete(url)
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

public class SupprimeEnvoiDiffere {
    public static void main(String[] args) {
        // L'URL de l'API pour annuler la campagne
        String apiKey = "YOUR_API_KEY";
        String campaignId = "CAMPAIGN_ID";
        String url = "https://api.voicepartner.fr/v1/campaign/cancel/" + apiKey + "/" + campaignId;

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .DELETE() // This sets the request method to DELETE.
                .build();

        client.sendAsync(request, HttpResponse.BodyHandlers.ofString())
                .thenApply(HttpResponse::body)
                .thenAccept(System.out::println)
                .exceptionally(e -> {
                    System.out.println("Erreur lors de la requête: " + e.getMessage());
                    return null;
                })
                .join(); // Wait for the async operation to complete
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
	apiKey := "YOUR_API_KEY"
	campaignId := "CAMPAIGN_ID"
	url := fmt.Sprintf("https://api.voicepartner.fr/v1/campaign/cancel/%s/%s", apiKey, campaignId)

	req, err := http.NewRequest("DELETE", url, nil)
	if err != nil {
		fmt.Printf("Error: %s
", err.Error())
		return
	}

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
using System.Threading.Tasks;

namespace API.ApiClients
{
    public class SupprimeEnvoiDiffere
    {
        public static async Task Main()
        {
            var apiKey = "YOUR_API_KEY";
            var campaignId = "CAMPAIGN_ID";
            var url = $"https://api.voicepartner.fr/v1/campaign/cancel/{apiKey}/{campaignId}";

            using (var client = new HttpClient())
            {
                try
                {
                    var response = await client.DeleteAsync(url);
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
    "success": true,
    "campaignId": "D572M",
    "assignedCredit": "1.8",
    "currency": "EUR"
}
```
## Exemple

```bash
curl -X DELETE 
  http://api.voicepartner.fr/v1/campaign/cancel/YOUR-API-KEY/CAMPAIGN-ID 
  -H 'cache-control: no-cache'
```




## Code de contrôle

| _  | Code erreurs |
| :---------------: |:---------------|
|200 |Tout s’est bien passé ! |
|400 | Mauvaise requête|
|10 | Action non autorisé. |
|404 |Ressource non trouvé. |



