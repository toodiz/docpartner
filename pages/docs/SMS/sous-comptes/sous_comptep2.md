---
title: Création de sous-compte
description: >
---
# Création de sous-compte


## URL

<div>
  <div style="background-color: #49CC90; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/subaccount/create</span>
</div>


## Paramètres
Chaque demande d’API prend en charge les paramètres suivants :

| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l\'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **type** |	Type de sous-compte : ce choix est définitif, il ne sera plus possible de le modifier  <br> **simple:** <br> <ul> <li>Le sous compte ne recevra aucun email ni SMS.</li> <li> Aucun numéros de téléphone demandé. </li> <li>L’achat n’est pas permis. </li></ul>. <br> **advanced :** <ul> <li>Un email valide est demandé. </li> <li>Le processus d’inscription est identique à celui d’un compte standard. </li> <li>Un numéro de téléphone mobile sera demandé à l’inscription.</li></ul>|
| **parameters**   | **Sous-compte advanced** <br><br> <u> **email** :</u> Email valide du titulaire du compte <br> <u> **isBuyer** :</u> Si **isBuyer=1** le sous-compte pourra acheter ces propres SMS. <br> <u>**creditToAttribute (optionnel) :** </u> Crédit en euros ajouté au sous-compte lors de la création. Ce crédit sera déduit du compte principal. <br> <u> **title (optionnel) : ** </u> Nom du sous-compte. <br> <u> **firstname (optionnel) :** </u> Prénom du titulaire du sous-compte.<br> <u> **lastname (optionnel):** </u> Nom du titulaire du sous-compte. <br> <br><br>  **Sous-compte simple** <br><br> <u> **email** :</u> Email valide du titulaire du compte <br> <u>**creditToAttribute (optionnel) :** </u> Crédit en euros ajouté au sous-compte lors de la création. Ce crédit sera déduit du compte principal. <br> <u> **title (optionnel) : ** </u>  Nom du sous-compte. <br> <u> **firstname (optionnel) :** </u><br> Prénom du titulaire du sous-compte.<br> <u> **lastname (optionnel):** </u> Nom du titulaire du sous-compte. <br> <br>  |

## Paramètres optionnels
_format : Format de la réponse. Vous pouvez choisir entre <strong> JSON</strong> ou <strong> XML </strong>. Par défaut, le format de réponse est <strong> JSON. </strong> |




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
       // Prepare data for POST request
        $fields = array(
            'apiKey'=> 'YOUR API KEY',
            'type'=> 'advanced',
            'parameters'=>array(
                'email':'aaaa@bbb.ccc',
    	        'creditToAttribute':10,
    	        'isBuyer':0,
    	        'firstname':'prenom',
    	        'lastname':'nom'
            ));
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.smspartner.fr/v1/subaccount/create');
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
    url = base_url & "subaccount/create"
    #note : utiliser une librairie JSON en production, par exemple :
    #https//www.nuget.org/packages/Newtonsoft.Json/
    Dim parameters As String = String.Format(
        "{{""apiKey"":""{0}"",""type"":""{1}"",""parameters"":""{2}""}}",
        apiKey,
        "advanced",
        {"email":"aaaa@bbb.ccc","creditToAttribute":10,"isBuyer":0,"firstname":"prenom","lastname":"nom"})
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
    def create(self,creditToAdd,userId):
 
		data = {"apiKey":APIKEY,"type":"advanced","parameters": {"email":"aaaa@bbb.ccc","creditToAttribute":10,"isBuyer":0,"firstname":"prenom","lastname":"nom"}}
 
 
		url = URL + "/subaccount/create"
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
    <pre><code class="language-bash">
curl -H  "Content-Type: application/json" 
curl -H  "Content-Type: application/json" -X POST -d '{"apiKey":"xxxxx","type":"advanced","parameters":
{"email":"aaaa@bbb.ccc","creditToAttribute":10,"isBuyer":0,"firstname":"prenom","lastname":"nom"}}'
 https://api.smspartner.fr/v1/subaccount/create
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
  type: "advanced",
  parameters: {
    email: "aaaa@bbb.ccc",
    creditToAttribute: 10,
    isBuyer: 0,
    firstname: "prenom",
    lastname: "nom",
  },
});

// Définir les options pour la requête HTTP POST vers l'API SMS Partner
const options = {
  hostname: "api.smspartner.fr",
  port: 443,
  path: "/v1/subaccount/create",
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


public class SubAccountCreation {
    public static void main(String[] args) {
        try {
            // Remplacez par votre clé API
            String apiKey = "VOTRE_CLÉ_API";

            // Préparer les données pour la requête POST
            JSONObject parameters = new JSONObject();
            parameters.put("email", "aaaa@bbb.ccc");
            parameters.put("creditToAttribute", 10);
            parameters.put("isBuyer", 0);
            parameters.put("firstname", "prenom");
            parameters.put("lastname", "nom");

            JSONObject json = new JSONObject();
            json.put("apiKey", apiKey);
            json.put("type", "advanced");
            json.put("parameters", parameters);

            URL url = new URL("https://api.smspartner.fr/v1/subaccount/create");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("cache-control", "no-cache");
            conn.setDoOutput(true);

            // Écriture des données JSON dans le corps de la requête HTTP
            OutputStream os = conn.getOutputStream();
            os.write(json.toString().getBytes());
            os.flush();

            // Lecture de la réponse de l'API
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String response = br.lines().collect(Collectors.joining());

            // Afficher la réponse JSON
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

// Structure pour la vue "CreationSubCompte"
struct CreationSubCompte: View {
    var body: some View {
        // Un bouton qui appelle la fonction createSubaccount() lorsqu'il est pressé
        Button(action: {
            createSubaccount()
        }) {
            Text("Créer sous-compte")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }

    // Fonction pour créer un sous-compte
    func createSubaccount() {
        let url = URL(string: "https://api.smspartner.fr/v1/subaccount/create")! // URL pour créer un sous-compte

        // Paramètres pour la requête
        let parameters: [String: Any] = [
            "apiKey": "TU_CLAVE_API", // Votre clé API
            "type": "advanced",
            "parameters": [
                "email": "aaaa@bbb.ccc", // Adresse e-mail du sous-compte
                "creditToAttribute": 10, // Crédit à attribuer
                "isBuyer": 0, // Indique si le sous-compte est un acheteur
                "firstname": "prenom", // Prénom de l'utilisateur du sous-compte
                "lastname": "nom" // Nom de l'utilisateur du sous-compte
            ] as [String : Any]
        ]

        // Création de la requête
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("no-cache", forHTTPHeaderField: "cache-control")

        // Ajout du corps de la requête
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }

        // Tâche pour envoyer la requête et recevoir la réponse
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Si une erreur survient, on l'affiche
            if let error = error {
                print("Erreur : (error)")
            }
            // Sinon, on traite les données reçues
            else if let data = data {
                do {
                    // On tente de convertir les données reçues en JSON
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json) // On affiche le JSON obtenu
                    }
                } catch let error {
                    print("Erreur : (error)")
                }
            }
        }

        task.resume() // On lance la tâche
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
	"io/ioutil"
	"log"
	"net/http"
)

type Fields struct {
	APIKey     string      `json:"apiKey"`
	Type       string      `json:"type"`
	Parameters Parameters `json:"parameters"`
}

type Parameters struct {
	Email            string `json:"email"`
	CreditToAttribute int    `json:"creditToAttribute"`
	IsBuyer          int    `json:"isBuyer"`
	Firstname        string `json:"firstname"`
	Lastname         string `json:"lastname"`
}

func main() {
	// Prepare data for POST request
	data := Fields{
		APIKey: "YOUR_API_KEY",
		Type:   "advanced",
		Parameters: Parameters{
			Email:            "aaaa@bbb.ccc",
			CreditToAttribute: 10,
			IsBuyer:          0,
			Firstname:        "prenom",
			Lastname:         "nom",
		},
	}

	payloadBuf := new(bytes.Buffer)
	json.NewEncoder(payloadBuf).Encode(data)

	// Create POST request
	req, err := http.NewRequest("POST", "https://api.smspartner.fr/v1/subaccount/create", payloadBuf)
	if err != nil {
		log.Fatalf("Error creating request: %v", err)
	}
	req.Header.Add("Content-Type", "application/json")

	// Create HTTP client and send the request
	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		log.Fatalf("Error sending request: %v", err)
	}
	defer resp.Body.Close()

	// Read the response
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatalf("Error reading response: %v", err)
	}

	// Print the response status and body
	log.Printf("Response status: %s", resp.Status)
	log.Printf("Response body: %s", string(body))
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
        var fields = new
        {
            apiKey = "VOTRE_CLÉ_API",
            type = "advanced",
            parameters = new 
            {
                email = "aaaa@bbb.ccc",
                creditToAttribute = 10,
                isBuyer = 0,
                firstname = "prenom",
                lastname = "nom"
            }
        };

        var json = JsonConvert.SerializeObject(fields);

        var uri = new Uri("https://api.smspartner.fr/v1/subaccount/create");
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        HttpResponseMessage response = await client.PostAsync(uri, content);

        if (response.IsSuccessStatusCode)
        {
            var result = await response.Content.ReadAsStringAsync();
            Console.WriteLine(result);
        }
        else
        {
            Console.WriteLine("La requête POST a échoué avec le code d'état : " + response.StatusCode);
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
 "success":true,
 "code":200,
 "subaccount":
 {
    "email":"aaaa@bbb.ccc",
    "token":"token"
 },
 "sendConfirmMailTo":"aaaa@bbb.ccc",
 "parent_email":"emailparent@ddd.eee"
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
|2 | Vous n’avez pas l’authorisation|
|3 | isBuyer est requis |
|4 | Le type est requis (simple ou advanced)|
|5 | Le type de sous-compte n’existe pas (simple ou advanced)|
|6 | L’email est requis|
|7 | Un compte existe déjà avec cet email|
|8 | creditToAttribute doit être supérieurr à 0|
|9 | La balance doit être supérieur à 0 |
|200 |Tout s’est bien passé ! |



