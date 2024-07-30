-- Insertion dans la table chemin
INSERT INTO chemin (path) VALUES 
('pages/docs/sms/status-et-statistiques/statusp2.md');

-- Insertion dans la table introduction
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Crédits voix
description: >
---
# Crédits voix
Cette requête est utilisée pour récupérer votre crédit disponible de messages vocaux, dépôt de messages.

Limite: 5 requêtes par minute
', 'fr',  70); 

-- Insertion dans la table URLAPI
INSERT INTO URLAPI (textcode, id_chemin) VALUES 
('## URL

<div>
  <div style="background-color: #red; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;"> https://api.voicepartner.fr/v1/me</span>
</div>
',  70);

-- Insertion dans la table PARAMETRE
INSERT INTO PARAMETRE (textcode, langue, id_chemin) VALUES 
('## Paramètres
Chaque demande d’API prend en charge les paramètres suivants :

| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l\'obtiendrez dans votre <a href="https://www.voicepartner.fr" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte Voice Partner</a>. |

## Paramètres optionnels
| Paramètre       | Description |
|:-----------------:|-------------| 
| **_format**      | Format de la réponse. Vous pouvez choisir entre <strong> JSON</strong> ou <strong> XML </strong>. Par défaut, le format de réponse est <strong> JSON. </strong> |


', 'fr',  70);

          

-- Insertion dans la table REQUETE_REPONSE
INSERT INTO REQUETE_REPONSE (textcode, langue, id_chemin) VALUES 
('## Requête
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
            \'apiKey\'=> \'YOUR API KEY\',
            \'credit\'=> \'100\',
            \'tokenSubaccount\'=>\'identifiant du sous-compte\'
            );
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,\'https://api.smspartner.fr/v1/subaccount/credit/add\');
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
    url = base_url & "subaccount/credit/sms"
    #note : utiliser une librairie JSON en production, par exemple :
    #https//www.nuget.org/packages/Newtonsoft.Json/
    Dim parameters As String = String.Format(
        "{{""apiKey"":""{0}"",""credit"":""{1}"",""tokenSubaccount"":""{2}""}}",
        apiKey,
        50,
        "identifiant du sous-compte")
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
    def add_credit(self,creditToAdd,tokenSubaccount):
 
		data = OrderedDict([
			("apiKey", API_KEY),
			("credit",creditToAdd),
			("tokenSubaccount",tokenSubaccount)
 
		])
 
		url = URL + "/subaccount/credit/add"
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
curl -H  "Content-Type: application/json" -X POST -d
 \'{"apiKey":"xxxxx","credit":"10","tokenSubaccount":
 "identifiant du sous-compte"}\' https://api.smspartner.fr/v1/subaccount/credit/add
  </code></pre>
  </div>

    <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code class="language-javascript">
const https = require(\'https\');

// permet d\'ajouter des crédits à un sous-compte
//Depuis votre compte, il vous est possible d’ajouter des crédits sur vos sous comptes. Les crédits seront débités de votre compte principal.
let data = JSON.stringify({
  apiKey: \'YOUR API KEY\',
  credit: \'100\',
  tokenSubaccount: \'identifiant du sous-compte\'
});

let options = {
  hostname: \'api.smspartner.fr\',
  path: \'/v1/subaccount/credit/add\',
  method: \'POST\',
  headers: {
    \'Content-Type\': \'application/json\',
    \'Content-Length\': data.length
  }
};

let req = https.request(options, (res) => {
  let data = \'\';

  res.on(\'data\', (chunk) => {
    data += chunk;
  });

  res.on(\'end\', () => {
    console.log(JSON.parse(data));
  });

}).on("error", (err) => {
  console.log("Error: " + err.message);
});

req.write(data);
req.end();
        </code></pre>
  </div>

  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code class="language-java">
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class AjouterRetirerDesCredits {
    public static void main(String[] args) {
        try {
            // Prepare data for POST request
            String apiKey = "YOUR API KEY";
            int credit = 100;
            String tokenSubaccount = "identifiant du sous-compte";

            // Create JSON payload
            String jsonPayload = "{\"apiKey\": \"" + apiKey + "\", \"credit\": " + credit + ", \"tokenSubaccount\": \"" + tokenSubaccount + "\"}";

            // Create POST request
            URL url = new URL("https://api.smspartner.fr/v1/subaccount/credit/add");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            // Send POST request
            OutputStream outputStream = connection.getOutputStream();
            outputStream.write(jsonPayload.getBytes());
            outputStream.flush();
            outputStream.close();

            // Get response
            int responseCode = connection.getResponseCode();
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
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

struct AjoutCreditSousCompte: View {
    @State private var result: String = "Loading..."

    var body: some View {
        VStack {
            Text("Ajout Credit Sous Compte")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: ajoutCreditSousCompte)
    }

    func ajoutCreditSousCompte() {
        let apiKey = "YOUR_API_KEY"
        let credit = "100"
        let tokenSubaccount = "identifiant du sous-compte"

        let urlString = "https://api.smspartner.fr/v1/subaccount/credit/add"
        let url = URL(string: urlString)!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "apiKey": apiKey,
            "credit": credit,
            "tokenSubaccount": tokenSubaccount
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                let resultString = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    self.result = resultString ?? "Error"
                }
            }
        }

        task.resume()
    }
}

struct AjoutCreditSousCompte_Previews: PreviewProvider {
    static var previews: some View {
        AjoutCreditSousCompte()
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

type SubaccountData struct {
	APIKey         string `json:"apiKey"`
	Credit         string `json:"credit"`
	TokenSubaccount string `json:"tokenSubaccount"`
}

func main() {
	apiKey := "YOUR_API_KEY"
	credit := "100"
	tokenSubaccount := "identifiant du sous-compte"

	// Create POST request data
	data := SubaccountData{
		APIKey:         apiKey,
		Credit:         credit,
		TokenSubaccount: tokenSubaccount,
	}
	jsonData, _ := json.Marshal(data)

	// Create POST request
	req, err := http.NewRequest("POST", "https://api.smspartner.fr/v1/subaccount/credit/add", bytes.NewBuffer(jsonData))
	if err != nil {
		log.Fatalf("Error creating request: %v", err)
	}
	req.Header.Set("Content-Type", "application/json")

	// Send the request
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

	// Print the response body
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
        var data = new
        {
            apiKey = "YOUR API KEY",
            credit = "100",
            tokenSubaccount = "Subaccount ID"
        };

        string jsonString = JsonConvert.SerializeObject(data);

        var content = new StringContent(jsonString, Encoding.UTF8, "application/json");

        HttpResponseMessage response = await client.PostAsync("https://api.smspartner.fr/v1/subaccount/credit/add", content);

        if (response.IsSuccessStatusCode)
        {
            string result = await response.Content.ReadAsStringAsync();
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
## Réponses

### JSON
```json
{
    "success": true,
    "code": 200,
    "credit": 2869.2,
    "subaccountCredit": 61.8,
    "currency": "EUR"
}
```
',
'fr',  70);

-- Insertion dans la table Suitecode 
INSERT INTO erreur_controlecode (textcode, langue, id_chemin) VALUES 
('
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
|2 | Le crédit est requis|
|3 | L’identifiant du sous-compte est requis |
|4 | Vous n’avez pas l’authorisation |
|5 | Le crédit à attribuer doit être supérieur à 0|
|6 | La balance doit être supérieur à 0|
|7 | 	Le sous-compte n’exsite pas|
|8 | Crédits insufisant|
|10 | Clé API incorrecte |
|200 |Tout s’est bien passé ! |

', 'fr',  70);



--------------------------------------------------------
--------------------------------------------------------
--------------------------------------------------------
------------------------EN?-----------------------------
--------------------------------------------------------
--------------------------------------------------------
--------------------------------------------------------



-- Insertion into the table chemin
INSERT INTO chemin (path) VALUES 
('pages/docs/sms/status-et-statistiques/statusp2.md');

-- Insertion into the table introduction
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Sub-account Creation
description: >
---
# Sub-account Creation
', 'en',  65); 

-- Insertion into the table URLAPI
INSERT INTO URLAPI (textcode, id_chemin) VALUES 
('## URL

<div>
  <div style="background-color: #49CC90; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/subaccount/create</span>
</div>
',  65);

-- Insertion into the table PARAMETRE
INSERT INTO PARAMETRE (textcode, langue, id_chemin) VALUES 
('## Parameters
Each API request supports the following parameters:

| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API Key of your account. You will get it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **type** |	Type of sub-account: this choice is final, it cannot be changed later  <br> **simple:** <br> <ul> <li>The sub-account will not receive any emails or SMS.</li> <li> No phone number required. </li> <li>Purchase is not allowed. </li></ul>. <br> **advanced :** <ul> <li>A valid email is required. </li> <li>The registration process is the same as for a standard account. </li> <li>A mobile phone number will be required upon registration.</li></ul>|
| **parameters**   | **Advanced sub-account** <br><br> <u> **email** :</u> Valid email of the account holder <br> <u> **isBuyer** :</u> If **isBuyer=1** the sub-account will be able to purchase its own SMS. <br> <u>**creditToAttribute (optional) :** </u> Credit in euros added to the sub-account upon creation. This credit will be deducted from the main account. <br> <u> **title (optional) : ** </u> Name of the sub-account. <br> <u> **firstname (optional) :** </u> First name of the sub-account holder.<br> <u> **lastname (optional):** </u> Last name of the sub-account holder. <br> <br><br>  **Simple sub-account** <br><br> <u> **email** :</u> Valid email of the account holder <br> <u>**creditToAttribute (optional) :** </u> Credit in euros added to the sub-account upon creation. This credit will be deducted from the main account. <br> <u> **title (optional) : ** </u>  Name of the sub-account. <br> <u> **firstname (optional) :** </u><br> First name of the sub-account holder.<br> <u> **lastname (optional):** </u> Last name of the sub-account holder. <br> <br>  |
## Optional Parameters
_format : Response format. You can choose between <strong> JSON</strong> or <strong> XML </strong>. By default, the response format is <strong> JSON. </strong> |


', 'en',  65);


-- Insertion dans la table REQUETE_REPONSE
INSERT INTO REQUETE_REPONSE (textcode, langue, id_chemin) VALUES 
('## Request
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
            \'apiKey\'=> \'YOUR API KEY\',
            \'type\'=> \'advanced\',
            \'parameters\'=>array(
                \'email\':\'aaaa@bbb.ccc\',
    	        \'creditToAttribute\':10,
    	        \'isBuyer\':0,
    	        \'firstname\':\'prenom\',
    	        \'lastname\':\'nom\'
            ));
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,\'https://api.smspartner.fr/v1/subaccount/create\');
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
curl -H  "Content-Type: application/json" -X POST -d \'{"apiKey":"xxxxx","type":"advanced","parameters":
{"email":"aaaa@bbb.ccc","creditToAttribute":10,"isBuyer":0,"firstname":"prenom","lastname":"nom"}}\'
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

// Définir les options pour la requête HTTP POST vers l\'API SMS Partner
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

  // Afficher les données de réponse de l\'API sur la sortie standard
  res.on("data", (d) => {
    process.stdout.write(d);
  });
});

// Afficher en cas d\'erreur lors de l\'exécution de la requête HTTP POST
req.on("error", (error) => {
  console.error(error);
});

// Envoyer les données de l\'objet \'data\' à la demande
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

            // Lecture de la réponse de l\'API
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
        // Un bouton qui appelle la fonction createSubaccount() lorsqu\'il est pressé
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
                "firstname": "prenom", // Prénom de l\'utilisateur du sous-compte
                "lastname": "nom" // Nom de l\'utilisateur du sous-compte
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
            // Si une erreur survient, on l\'affiche
            if let error = error {
                print("Erreur : \(error)")
            }
            // Sinon, on traite les données reçues
            else if let data = data {
                do {
                    // On tente de convertir les données reçues en JSON
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json) // On affiche le JSON obtenu
                    }
                } catch let error {
                    print("Erreur : \(error)")
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
            Console.WriteLine("La requête POST a échoué avec le code d\'état : " + response.StatusCode);
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
',
'en',  65);
-- Insertion dans la table Suitecode 
INSERT INTO erreur_controlecode (textcode, langue, id_chemin) VALUES 
('

## Errors
Example of an error message:

### JSON
```json
{
    "success": false,
    "code": 10,
    "message": "Incorrect API Key"
}
```
## Control Codes

| _  | Error Codes |
| :---------------: |:---------------|
| 1 | API Key is required |
|2 | You are not authorized|
|3 | isBuyer is required |
|4 | Type is required (simple or advanced)|
|5 | Sub-account type does not exist (simple or advanced)|
|6 | Email is required|
|7 | An account already exists with this email|
|8 | creditToAttribute must be greater than 0|
|9 | Balance must be greater than 0|
| 200 | Everything went well! |

', 'en', 65);
