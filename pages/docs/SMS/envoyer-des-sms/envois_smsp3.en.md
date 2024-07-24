---
title: Send SMS via Long Number
description: Send SMS via Long Number
---
# Send SMS via Long Number
This request is used to send SMS in real-time or delayed using a long number.



## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;">http://api.smspartner.fr/v1/vn/send</span>
</div>


## Parameters

| Parameter       | Description |
|:----------------:|-------------| 
| **apiKey**      | Your account's API key. You can obtain it from your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **to**          | Recipient's phone numbers. <br> <ul><li>In national format (0600000000) and international format (+33600000000) for French numbers.</li><li>In international format (+496xxxxxxxx) for non-French numbers.</li></ul> |
| **from**        | Your virtual number in international format (336xxxxxxxx). | 
| **message**     | SMS content. **160 characters** maximum per SMS (beyond this, an additional SMS will be deducted for every 153 characters). <br>Note, some special characters and accents are replaced during sending: <a href="#" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">See the list</a> <br> <br>The character ” must be escaped (”) for the SMS text to be valid. Otherwise, a 400 error will be returned. <br>The tag `:br:` allows for a line break. **Note that the line break counts as two characters.** <br>**The mention STOP SMS is mandatory for commercial SMS.** |

## Optional Parameters

| Parameter               | Description |
|:-----------------------:|-------------|
| **tag**                 | A string of up to 20 characters without spaces, allowing you to tag your sends. |
| **urlResponse**         | URL for response returns (e.g., https://www.myresponseurl). |
| **urlDlr**              | URL for delivery receipt returns (e.g., https://www.mydlrurl). |
| **sandbox**             | To test SMS sending, you can use the `sandbox:` parameter **1** to activate sandbox mode. ⚠️ No SMS will be sent, and there will be no charge to your account. <br> These SMS will be automatically deleted from your send lists every day. |
| **_format**             | Response format. You can choose between `JSON` or `XML`. By default, the response format is `JSON`. |


## Request
Request example :

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
            'to'=> '336xxxxxxxx',
            'from' => '336xxxxxxxx',
            'message'=> 'This is your message'
        );
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.smspartner.fr/v1/vn/send');
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
   <pre><code class="language-vbnet">
Imports System.IO
Imports System.Net
 
Module Module1
 
  Sub Main()
 
    Dim base_url As String = "http://api.smspartner.fr/v1/"
    Dim apiKey As String = "VOTRE_APIKEY"
 
    #send sms
    url = base_url & "vn/send"
    #note : utiliser une librairie JSON en production, par exemple :
    #https//www.nuget.org/packages/Newtonsoft.Json/
    Dim parameters As String = String.Format(
        "{{""apiKey"":""{0}"",""to"":""{1}"",""from"":""{2}"",""message"":""{3}""}}",
        apiKey,
        "336xxxxxxxx",
        "336xxxxxxxx",
        "message de test")
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
    def send_sms(self, to, from, msg):
		print(to)
 
		data = OrderedDict([
			("apiKey", API_KEY),
			("to", to),
			("from",from),
			("message", msg)
		])
 
		url = URL + "/vn/send"
		r = requests.post(url, data=json.dumps(data), verify=False)
 
		r_json = r.json()
		if r_json.get("success") == True:
			print(r_json)
			status = True
		else:
			print("SMS msg {} not delivered to {}".format(msg, to))
			status = False
		return status
   </code></pre>
  </div>
    <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code class="language-bash">
    curl -H  "Content-Type: application/json" -X POST -d '{"apiKey":"xxxxx","to":"xxxx","from":"xxx","message":"test"}' https://api.smspartner.fr/v1/vn/send
   </code></pre>
  </div>
  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code class="language-javascript">
const https = require("https");

// Remplacez par votre clé API
const apiKey = "VOTRE_CLÉ_API";

// Préparer les données pour la requête POST
const data = JSON.stringify({
  apiKey: apiKey,
  to: "336xxxxxxxx",
  from: "336xxxxxxxx",
  message: "Ceci est votre message",
});

// Définir les options pour la requête HTTP POST vers l'API SMS Partner
const options = {
  hostname: "api.smspartner.fr",
  port: 443,
  path: "/v1/vn/send",
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    "Content-Length": data.length,
    "cache-control": "no-cache",
  },
};

// Effectuer la requête HTTP POST avec les options et données définies précédemment
const req = https.request(options, (res) => {
  console.log(`statusCode: ${res.statusCode}`);

  // Afficher les données de réponse de l'API sur la sortie standard
  res.on("data", (d) => {
    process.stdout.write(d);
  });
});

// Afficher en cas d'erreur lors de l'exécution de la requête HTTP POST
req.on("error", (error) => {
  console.error(error);
});

// Envoyer les données de l'objet 'data' à la demande
req.write(data);
// Terminer la demande HTTP POST
req.end();
</code></pre>
  </div>
  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code class="language-java">
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.OutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.stream.Collectors;
import org.json.JSONObject;

public class EnvoyerSMSLong {
    public static void main(String[] args) {
        try {
            // Remplacez par votre clé API
            String apiKey = "VOTRE_CLÉ_API";

            // Création de l'objet URL avec l'adresse de l'API SMS
            URL url = new URL("https://api.smspartner.fr/v1/vn/send");

            // Ouverture de la connexion HTTP avec l'API
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("cache-control", "no-cache");
            conn.setDoOutput(true);

            // Création de l'objet JSON contenant les paramètres du SMS à envoyer
            JSONObject json = new JSONObject();
            json.put("apiKey", apiKey);
            json.put("to", "336xxxxxxxx");
            json.put("from", "336xxxxxxxx");
            json.put("message", "Ceci est votre message");

            // Écriture des données JSON dans le corps de la requête HTTP
            OutputStream os = conn.getOutputStream();
            os.write(json.toString().getBytes());
            os.flush();

            // Lecture de la réponse de l'API
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String response = br.lines().collect(Collectors.joining());
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
import Foundation

// Struct pour la vue "EnvoieSMSParNumeroLong"
struct EnvoieSMSParNumeroLong: View {
    var body: some View {
        NavigationView {
            VStack {
                // Un bouton qui appelle la fonction EnvoieSMSParNumeroLong() lorsqu'il est pressé
                Button(action: {
                    EnvoieSMSParNumeroLong()
                }) {
                    Text("Envoyer SMS")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
    }
    
    // Fonction pour envoyer un SMS par numéro long
    func EnvoieSMSParNumeroLong() {
        let apiKey = "XXXXXXXXXXXX YOUR API KEY XXXXXXXXXXXXX" // Votre clé API
        let destinataire = "33XXXXXXXXX" // Le numéro du destinataire
        let expediteur = "33XXXXXXXXX" // Votre numéro
        let message = "status" // Le message à envoyer

        let url = URL(string: "https://api.smspartner.fr/v1/vn/send")! // URL pour envoyer le SMS
        var requete = URLRequest(url: url)
        requete.httpMethod = "POST"
        requete.addValue("application/json", forHTTPHeaderField: "Content-Type") // Ajout du type de contenu dans l'en-tête de la requête

        // Paramètres pour l'envoi du SMS
        let params: [String: Any] = [
            "apiKey": apiKey,
            "to": destinataire,
            "from": expediteur,
            "message": message
        ]
        
        // Ajout des paramètres dans le corps de la requête
        requete.httpBody = try? JSONSerialization.data(withJSONObject: params)
        
        let session = URLSession.shared
        // Tâche pour envoyer la requête
        let task = session.dataTask(with: requete) { (data, response, error) in
            // Si une erreur survient, on l'affiche
            if let erreur = error {
                print("Erreur : (erreur.localizedDescription)")
                return
            }
            
            // Sinon, on affiche les données reçues
            if let donnees = data {
                if let resultat = String(data: donnees, encoding: .utf8) {
                    print(resultat) // Impression du résultat
                }
            }
        }
        
        task.resume() // On lance la tâche
    }
}
   </code></pre>
  </div>
  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
    <!-- GO code example goes here -->
    <pre><code class="language-go">
package main

import (
	"bytes"
	"fmt"
	"net/http"
)

func main() {
	apiKey := "YOUR API KEY"
	to := "336xxxxxxxx"
	from := "336xxxxxxxx"
	message := "This is your message"

	// Construire les données JSON pour la requête POST
	data := map[string]interface{}{
		"apiKey":  apiKey,
		"to":      to,
		"from":    from,
		"message": message,
	}

	// Convertir les données en JSON
	jsonData, err := json.Marshal(data)
	if err != nil {
		fmt.Println("Erreur lors de la conversion en JSON:", err)
		return
	}

	// Effectuer la requête POST
	url := "https://api.smspartner.fr/v1/vn/send"
	resp, err := http.Post(url, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		fmt.Println("Erreur lors de l'envoi de la requête:", err)
		return
	}
	defer resp.Body.Close()

	// Traiter la réponse
	if resp.StatusCode == http.StatusOK {
		body := new(bytes.Buffer)
		_, err := body.ReadFrom(resp.Body)
		if err != nil {
			fmt.Println("Erreur lors de la lecture de la réponse:", err)
			return
		}
		fmt.Println(body.String())
	} else {
		fmt.Println("La requête POST a échoué. Code de réponse:", resp.StatusCode)
	}
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

class Program
{
    private static readonly HttpClient client = new HttpClient();

    static async Task Main(string[] args)
    {
        var request = new
        {
            apiKey = "YOUR_API_KEY",
            to = "336xxxxxxxx",
            from = "336xxxxxxxx",
            message = "This is your message"
        };

        var content = new StringContent(
            JsonConvert.SerializeObject(request),
            Encoding.UTF8,
            "application/json");

        HttpResponseMessage response = await client.PostAsync("https://api.smspartner.fr/v1/vn/send", content);

        if (response.IsSuccessStatusCode)
        {
            var result = await response.Content.ReadAsStringAsync();
            Console.WriteLine(result);
        }
        else
        {
            Console.WriteLine("POST request failed with status code: " + response.StatusCode);
        }
    }
}
   </code></pre>
  </div>
</div>

## Responses

### JSON
```json
{
   "success":true,
   "code":200,
   "message_id":xxx,
   "nb_sms": 1,
   "cost": xxx,
   "currency": "EUR"
}
````
<br> <br>


