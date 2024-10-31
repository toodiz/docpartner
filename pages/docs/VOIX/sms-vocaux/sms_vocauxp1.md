---
title: Envoyer un SMS vocal
description: >
---
# Envoyer un SMS vocal

Envoyer un SMS vocal sur mobile Rate Limit: 2000 requêtes par heure



## URL

<div>
  <div style="background-color: #49CC90 ; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;">  https://api.voicepartner.fr/v1/tts/send </span>
</div>


## Paramètres

Chaque demande d’API prend en charge les paramètres suivants :
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **text**       | Texte du message vocal. Une pause entre les mots est possible. |
| **tokenAudio**  | Identifiant du fichier audio, le paramètre “text” ne sera pas pris en compte. |
| **lang**        | Langue dans laquelle le message est envoyé. |
| **phoneNumbers**| Numéros de téléphone mobile des destinataires.<br>Pour l’envoi de plusieurs SMS, les numéros doivent être séparés par des virgules.<br>Ils peuvent être :<br>- au format national (06xxxxxxxx) ou international (+336xxxxxxxx), pour des numéros français. |

## Paramètres optionnels

| Paramètre      | Description |
|:----------------:|-------------|
| **speechRate**     | La vitesse de reproduction de la parole dans le message. Efficace uniquement lorsque vous utilisez du texte. La plage prise en charge va de 0.5 (parole ralentie) à 2 (accélération de la parole). Les valeurs inférieures à 0.5 seront remplacées par 0.5 et les valeurs supérieures à 2 seront remplacées par 2. La vitesse par défaut est 1. |
| **notifyUrl**      | Url de retour du statut du SMS vocal envoyé en POST au format JSON. |
| **scheduledDate**  | Date d’envoi du message, au format YYYY-mm-dd H:m:00 (ex : 2021-02-02 14:15:00). À définir uniquement si vous souhaitez que les SMS soient envoyés en différé. |

## Pause entre les mots
   <div class="alert alert-info">
Il est possible d’ajouter des pauses entre les mots et d’allonger la durée du message vocal en utilisant la virgule «,».
Par exemple, si vous souhaitez avoir une pause de 3 secondes après chaque mot, le paramètre text devrait alors ressembler à ceci: «un ,,,,,, deux ,,,,,, trois ,,,,,,». Chaque virgule crée <strong> une pause de 0,5 seconde. </strong></div>




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

// L'URL de l'API pour envoyer le message vocal
$url = 'http://api.voicepartner.fr/v1/tts/send';

// Les données à envoyer en JSON
$data = [
    'apiKey' => 'YOUR_API_KEY',         // Remplacez par votre clé API réelle
    'phoneNumbers' => '06XXXXXXXX',     // Remplacez par le(s) numéro(s) de téléphone réel(s)
    'text' => 'Mon premier test',       // Remplacez par le texte que vous souhaitez convertir en parole
    // 'speed' => '1',                  // Optionnel: Vitesse de la parole
    // 'notifyUrl' => 'http://...',     // Optionnel: URL de notification
    // 'scheduledDate' => 'YYYY-mm-dd H:i:00', // Optionnel: Date prévue pour l'envoi
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
Imports System.Text

Public Class EnvoyerSmsVocal
    Private Const Url As String = "http://api.voicepartner.fr/v1/tts/send"

    Public Shared Async Function SendSmsVocalAsync() As Task
        Using client As New HttpClient()
            ' Remplacez ces valeurs par les vôtres
            Dim apiKey As String = "YOUR_API_KEY"
            Dim phoneNumbers As String = "06XXXXXXXX"
            Dim text As String = "Mon premier test"
            ' ... autres paramètres si nécessaire

            Dim data = New With {
                .apiKey = apiKey,
                .phoneNumbers = phoneNumbers,
                .text = text
            }

            Dim jsonContent = JsonConvert.SerializeObject(data)
            Using content As New StringContent(jsonContent, Encoding.UTF8, "application/json")
                Try
                    Dim response = Await client.PostAsync(Url, content)
                    Dim responseContent = Await response.Content.ReadAsStringAsync()

                    If response.IsSuccessStatusCode Then
                        Console.WriteLine(responseContent)
                    Else
                        Console.WriteLine($"Erreur lors de la requête: {response.StatusCode}")
                        Console.WriteLine($"Contenu: {responseContent}")
                    End If
                Catch ex As Exception
                    Console.WriteLine($"Exception: {ex.Message}")
                End Try
            End Using
        End Using
    End Function
End Class
   </code></pre>
  </div>
  <div class="tab-pane fade" id="python" role="tabpanel" aria-labelledby="python-tab">
 <pre><code class="language-python">
import requests
import json

# Activer l'affichage des erreurs pour le débogage
# En Python, les erreurs sont affichées par défaut lorsqu'elles se produisent.

# L'URL de l'API pour envoyer le message vocal
url = 'http://api.voicepartner.fr/v1/tts/send'

# Les données à envoyer en JSON
data = {
    'apiKey': 'YOUR_API_KEY',  # Remplacez par votre clé API réelle
    'phoneNumbers': '06XXXXXXXX',  # Remplacez par le(s) numéro(s) de téléphone réel(s)
    'text': 'Mon premier test',  # Remplacez par le texte que vous souhaitez convertir en parole
    # 'speed': '1',  # Optionnel: Vitesse de la parole
    # 'notifyUrl': 'http://...',  # Optionnel: URL de notification
    # 'scheduledDate': 'YYYY-mm-dd H:i:00',  # Optionnel: Date prévue pour l'envoi
}

# Encodage des données en JSON
data_json = json.dumps(data)

# Configuration des en-têtes HTTP
headers = {
    'Content-Type': 'application/json',
    'Cache-Control': 'no-cache'
}

# Exécution de la requête POST avec les données JSON
response = requests.post(url, data=data_json, headers=headers)

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
curl -X POST https://api.voicepartner.fr/v1/campaign/send 
-H "Content-Type: application/json" 
-d '{
  "apiKey": "YOUR_API_KEY",
  "tokenAudio": "tokenAudio",
  "phoneNumbers": "06XXXXXXXX",
  "speechRate": 1,
  "notifyUrl": "http://votreurlderetour.com/callback",
  "scheduledDate": "2024-04-10T14:15:00"
}'

 </code></pre>
  </div>
    <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
     <pre><code class="language-javascript">
   
    <!-- NodeJS code example goes here -->
const axios = require('axios');

// L'URL de l'API pour envoyer le message vocal
const url = 'http://api.voicepartner.fr/v1/tts/send';

// Les données à envoyer en JSON
const data = {
    apiKey: 'YOUR_API_KEY',
    phoneNumbers: '06XXXXXXXX',
    text: 'Mon premier test'
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
import java.net.http.HttpRequest.BodyPublishers;
import java.net.http.HttpResponse.BodyHandlers;

public class EnvoyerSmsVocal {
    public static void main(String[] args) {
        // L'URL de l'API
        String apiUrl = "https://api.voicepartner.fr/v1/tts/send";

        // Les données à envoyer en JSON
        String json = """
                {
                    "apiKey": "YOUR_API_KEY",
                    "phoneNumbers": "06XXXXXXXX",
                    "text": "Mon premier test",
                    "speechRate": "1",
                    "notifyUrl": "http://example.com/notify",
                }
                """;

        // Créer une instance de HttpClient
        HttpClient client = HttpClient.newHttpClient();

        // Construire la requête
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(apiUrl))
                .header("Content-Type", "application/json")
                .POST(BodyPublishers.ofString(json))
                .build();

        // Envoyer la requête de manière asynchrone
        client.sendAsync(request, BodyHandlers.ofString())
                .thenApply(response -> response) // Retourner l'objet de réponse entier
                .thenAccept(response -> {
                    // Maintenant, vous pouvez appeler les méthodes sur l'objet HttpResponse
                    System.out.println("Status Code: " + response.statusCode());
                    System.out.println("Response: " + response.body());
                })
                .exceptionally(e -> {
                    e.printStackTrace(); // Affiche le stack trace en cas d'erreur
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

type SmsData struct {
	ApiKey        string   `json:"apiKey"`
	Text          string   `json:"text"`
	PhoneNumbers  string   `json:"phoneNumbers"`
	Lang          *string  `json:"lang,omitempty"`          // Optional: Language of the SMS
	SpeechRate    *float64 `json:"speechRate,omitempty"`    // Optional: Rate of the speech
	NotifyUrl     *string  `json:"notifyUrl,omitempty"`     // Optional: Notification URL
	ScheduledDate *string  `json:"scheduledDate,omitempty"` // Optional: Scheduled date and time
}

func main() {
	url := "http://api.voicepartner.fr/v1/tts/send"
	//lang := "fr"
	//speechRate := 1.0
	//notifyUrl := "https://yourdomain.com/notify"
	//scheduledDate := "2024-04-12 14:30:00" // Example format: 'yyyy-MM-dd HH:mm:ss'

	data := SmsData{
		ApiKey:       "YOUR_API_KEY",
		Text:         "Votre texte ici",
		PhoneNumbers: "06XXXXXXXX",
		//Lang:         &lang,                  // Uncomment to use
		//SpeechRate:   &speechRate,            // Uncomment to use
		//NotifyUrl:    &notifyUrl,             // Uncomment to use
		//ScheduledDate: &scheduledDate,        // Uncomment to use
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

public class EnvoyerSmsVocal
{
    public static async Task Main()
    {
        var url = "http://api.voicepartner.fr/v1/tts/send";
        //var scheduledDate = "2024-04-12 10:30:00"; // Format 'yyyy-MM-dd HH:mm:ss'

        var data = new
        {
            apiKey = "YOUR_API_KEY",
            text = "Votre texte ici",
            phoneNumbers = "06XXXXXXXX",
            // Ajoutez d'autres paramètres optionnels si nécessaire
            //speechRate = 1.0, // La vitesse par défaut est 1
            //notifyUrl = "https://yourdomain.com/notify",
            //scheduledDate
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
    "campaignId": "Ff1tbu0lax",
    "cost": xxx,
    "currency": "EUR",
    "nbSms": 1,
    "lang": "en",
    "duration": 6.3,
    "detail": {
        "33": {
            "nbSms": 1,
            "cost_unity": xxx,
            "cost": xxx,
            "country_code": "fr",
            "duration": 6.3
        }
    }
}
```
## Exemple

```bash
curl -X POST 
  http://api.voicepartner.fr/v1/tts/send 
  -H 'Content-Type: application/json' 
  -H 'cache-control: no-cache' 
  -d '{
"apiKey":"YOUR-API-KEY",
"phoneNumbers":"06XXXXXXXX",
"speed":"1",
"text":"Mon premier test",
"notifyUrl":"http://..."
}'
```


