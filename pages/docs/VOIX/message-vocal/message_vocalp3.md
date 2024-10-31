---
title: Déposer un message vocal
description: >
---
# Déposer un message vocal

Le [dépôt d’un message vocal (VMS)](https://www.voicepartner.fr/depot-de-messages-vocaux) est disponible sur l’API. Le dépôt fonctionne sur les fixes et sur les mobiles. Il est important de noter que le fonctionnement est différent.

Pour rappel, sur un numéro mobile le message est directement déposé sur le répondeur alors que sur un numéro fixe, le téléphone sonne et le message est déposé uniquement si le destinataire ne répond pas.

Pour déposer un message vocal sur les répondeurs mobile Rate Limit: 2000 requêtes par heure

Limite: 5 requêtes par minute

Limite d’envoi sur une même requête : 500 numéros




## URL

<div>
  <div style="background-color: #49CC90; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;"> https://api.voicepartner.fr/v1/campaign/send</span>
</div>


## Paramètres
Chaque demande d’API prend en charge les paramètres suivants :

| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://www.voicepartner.fr" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte Voice Partner</a>. |
| **tokenAudio**       | Identifiant du fichier audio |
| **emailForNotification**       | 	La notification de fin de campagne sera envoyé vers cette adresse email |
| **phoneNumbers**       | 	Numéros de téléphone mobile des destinataires. <br> Pour l’envoi de plusieurs SMS les numéros doivent être séparés par des virgules. <br> Ils peuvent être : <li> au format national (06xxxxxxxx) ou international (+336xxxxxxxx), pour des numéros français. </li> |

### Paramètres optionnels
| Paramètre       | Description |
|:-----------------:|-------------| 
| **sender**       | Numéro de téléphone portable qui peut être rappelé. Ce numéro doit être validé au préalable sur la plateforme my.voicepartner.fr. |
| **scheduledDate**       | Date d’envoi du message, au format YYYY-mm-dd H:m:00 (ex: 2021-02-02 14:15:00). A définir uniquement si vous souhaitez que les dépôts soient envoyés en différé. |
| **notifyUrl**       | Url de retour du statut de la campagne envoyé en GET |


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

// URL de l'API à laquelle effectuer la requête POST
$url = 'https://api.voicepartner.fr/v1/campaign/send';

// Les données à envoyer en JSON
$data = [
    'apiKey'            => 'YOUR_API_KEY', // Remplacez par votre clé API réelle
    'tokenAudio'        => 'TOKEN_AUDIO',  // Remplacez par le token audio réel
    'emailForNotification' => 'email@example.com', // Remplacez par l'email de notification souhaité
    'phoneNumbers'      => '06xxxxxxxx',   // Remplacez par le(s) numéro(s) de téléphone réel(s), séparés par des virgules si besoin
    // Ajoutez les autres paramètres optionnels si nécessaire
    // 'sender'         => 'VotreNuméro', // Optionnel
    // 'scheduledDate'  => 'YYYY-mm-dd H:i:s', // Optionnel
    // 'notifyUrl'      => 'https://your.notify.url', // Optionnel
];

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
Imports System.Threading.Tasks
Imports Newtonsoft.Json

Public Class DeposerMessageVocal
    Private Const ApiUrl As String = "https://api.voicepartner.fr/v1/campaign/send"
    Private Const ApiKey As String = "YOUR_API_KEY"
    Private Const TokenAudio As String = "YOUR_TOKEN_AUDIO"
    Private Const EmailForNotification As String = "your@mail.com"
    Private Const PhoneNumbers As String = "06XXXXXXXX"

    Public Shared Async Function SendCampaignAsync() As Task
        Using client As New HttpClient()
            Dim payload = New With {
                .apiKey = ApiKey,
                .tokenAudio = TokenAudio,
                .emailForNotification = EmailForNotification,
                .phoneNumbers = PhoneNumbers
            }
            Dim content = New StringContent(JsonConvert.SerializeObject(payload), Text.Encoding.UTF8, "application/json")

            Try
                Dim response = Await client.PostAsync(ApiUrl, content)
                If response.IsSuccessStatusCode Then
                    Dim responseContent = Await response.Content.ReadAsStringAsync()
                    ' Handle success
                    Console.WriteLine(responseContent)
                Else
                    ' Handle failure
                    Console.WriteLine($"Error: {response.StatusCode}")
                End If
            Catch ex As Exception
                ' Handle error
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

# URL de l'API à laquelle effectuer la requête POST
url = 'https://api.voicepartner.fr/v1/campaign/send'

# Les données à envoyer en JSON
data = {
    'apiKey': 'YOUR_API_KEY',  # Remplacez par votre clé API réelle
    'tokenAudio': 'TOKEN_AUDIO',  # Remplacez par le token audio réel
    'emailForNotification': 'email@example.com',  # Remplacez par l'email de notification souhaité
    'phoneNumbers': '06xxxxxxxx',  # Remplacez par le(s) numéro(s) de téléphone réel(s)
    # Ajoutez les autres paramètres optionnels si nécessaire
    # 'sender': 'VotreNuméro',  # Optionnel
    # 'scheduledDate': 'YYYY-mm-dd H:i:s',  # Optionnel
    # 'notifyUrl': 'https://your.notify.url',  # Optionnel
}

# Configuration des en-têtes HTTP
headers = {
    'Content-Type': 'application/json',
    'Cache-Control': 'no-cache'
}

# Exécution de la requête POST avec les données JSON
response = requests.post(url, json=data, headers=headers)

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
curl -X POST 'https://api.voicepartner.fr/v1/campaign/send' 
     -H 'Content-Type: application/json' 
     -d '{
          "apiKey": "YOUR_API_KEY",
          "tokenAudio": "TOKEN_AUDIO",
          "emailForNotification": "email@example.com",
          "phoneNumbers": "06xxxxxxxx"
          // ... autres paramètres si nécessaire
         }'
 </code></pre>
  </div>

    <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
     <pre><code class="language-javascript">
    <!-- NodeJS code example goes here -->
const axios = require('axios');

// URL de l'API à laquelle effectuer la requête POST
const url = 'https://api.voicepartner.fr/v1/campaign/send';

// Les données à envoyer en JSON
const data = {
    apiKey: 'YOUR_API_KEY',
    tokenAudio: 'TOKEN_AUDIO',
    emailForNotification: 'email@example.com',
    phoneNumbers: '06xxxxxxxx'
    // ... autres paramètres si nécessaire
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
import java.util.concurrent.CompletableFuture;

public class DeposerMessageVocal {

    public static void main(String[] args) {
        String url = "https://api.voicepartner.fr/v1/campaign/send";
        String json = """
                {
                    "apiKey": "YOUR_API_KEY",
                    "tokenAudio": "tokenAudio",
                    "emailForNotification": "email@example.com",
                    "phoneNumbers": "06XXXXXXXX"
                     // ... autres paramètres si nécessaire
                }
                """;

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .header("Content-Type", "application/json")
                .POST(BodyPublishers.ofString(json))
                .build();

        CompletableFuture future = client.sendAsync(request, BodyHandlers.ofString())
                .thenApply(HttpResponse::body)
                .thenAccept(System.out::println)
                .exceptionally(e -> {
                    System.out.println("Erreur lors de la requête: " + e.getMessage());
                    return null;
                });

        // Utiliser CompletableFuture.allOf pour attendre la fin de toutes les futures.
        CompletableFuture.allOf(future).join();
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

type Message struct {
	ApiKey               string  `json:"apiKey"`
	TokenAudio           string  `json:"tokenAudio"`
	EmailForNotification string  `json:"emailForNotification"`
	PhoneNumbers         string  `json:"phoneNumbers"`
	ScheduledDate        *string `json:"scheduledDate,omitempty"` // Optional, use pointer to omit if nil
	Sender               *string `json:"sender,omitempty"`        // Optional, use pointer to omit if nil
	NotifyUrl            *string `json:"notifyUrl,omitempty"`     // Optional, use pointer to omit if nil
	// Additional fields can be added here
}

func main() {
	url := "https://api.voicepartner.fr/v1/campaign/send"
	//scheduledDate := "2024-04-12 14:30:00"       // Example Date and Time
	//sender := "VotreNumero"                      // Example sender number
	//notifyUrl := "https://yourdomain.com/notify" // Example notification URL

	data := Message{
		ApiKey:               "YOUR_API_KEY",
		TokenAudio:           "TOKEN_AUDIO",
		EmailForNotification: "email@exemple.com",
		PhoneNumbers:         "06xxxxxxxx",
		//ScheduledDate:        &scheduledDate, // Uncomment to use
		//Sender:               &sender,        // Uncomment to use
		//NotifyUrl:            &notifyUrl,     // Uncomment to use
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
using Newtonsoft.Json;
using System.Text;

public class DeposerMessageVocal
{
    public static async Task Main()
    {
        var url = "https://api.voicepartner.fr/v1/campaign/send";

        // Définissez la date et l'heure manuellement ici
        //var scheduledDate = "2024-04-12 14:30:00"; // Format 'yyyy-MM-dd HH:mm:ss'
        //var sender = "VotreNumero"; // Remplacez par votre numéro de téléphone validé
        //var notifyUrl = "https://yourdomain.com/notify"; // Votre URL de notification

        var data = new
        {
            apiKey = "YOUR_API_KEY",
            tokenAudio = "TOKEN_AUDIO",
            emailForNotification = "email@example.com",
            phoneNumbers = "06xxxxxxxx",
            // Ajoutez d'autres paramètres optionnels si nécessaire
            //scheduledDate,
            //sender, // Numéro de téléphone portable qui peut être rappelé
            //notifyUrl // URL de retour du statut de la campagne envoyée en GET
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
  </code></pre>
  </div>
</div>
## Réponses

### JSON
```json
{
    "success": true,
    "campaignId": "campaignId",
    "cost": 0.15,
    "currency": "EUR",
    "nbSms": 1,
    "audioFile": {
        "filename": "filename.wav",
        "size": "135.8Ko"
    },
    "detail": {
        "33": {
            "nbSms": 1,
            "cost_unity": 0.15,
            "cost": 0.15
        }
    }
}
```
## Exemple

```bash
curl -X POST 
  http://api.voicepartner.fr/v1/campaign/send 
  -H 'Content-Type: application/json' 
  -H 'Postman-Token: 40756d00-a7f3-4162-8513-bd6a13328cc3' 
  -H 'cache-control: no-cache' 
  -d '{
"apiKey":"YOUR-API-KEY",
"phoneNumbers":"06XXXXXXXX",
"tokenAudio":"TOKEN-AUDIO"
}'
```


