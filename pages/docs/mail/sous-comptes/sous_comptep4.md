---
title:  Supprimer un mail de la liste des désabonnements

description: >
---
# Supprimer un mail de la liste des désabonnements


Cette requête permet de supprimer un mail de la liste des désabonnements.



## URL
<div>
  <div style="background-color: #49CC90; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;">http://api.mailpartner.fr/v1/unsubscribe/delete</span>
</div>



## Paramètres

  Chaque demande d\'API prend en charge les paramètres suivants : 

  | Paramètre  | Description |
  | :--------------- |:---------------|
  | **apiKey** | Clé API de votre compte. Vous l\'obtenez dans votre <a href="https://www.mailpartner.fr" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte Mail Partner</a>.|
  | **credit** |Nombre de crédit en Euro à ajouter au sous-compte. |
    | **tokenSubaccount** |Identifiant du sous compte. |



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
            \'apiKey\'=> \'YOUR API KEY\',
            \'credit\'=> \'100\',
            \'tokenSubaccount\'=>\'identifiant du sous-compte\'
            );
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,\'https://api.mailpartner.fr/v1/subaccount/credit/add\');
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
    <!-- Python code example goes here -->
    <pre><code>
# std
import logging
import json
from collections import OrderedDict
 
# 3p
import requests
 
API_KEY = "MY API KEY"
URL = "https://api.mailpartner.fr/v1"
 
class MailPartner():
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
    <pre><code>
curl -H  "Content-Type: application/json" -X POST -d '{"apiKey":"xxxxx","credit":"10","tokenSubaccount":"identifiant du sous-compte"}' https://api.mailpartner.fr/v1/subaccount/credit/add
   </code></pre>
  </div>

  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code>
const axios = require(\'axios\');

const apiKey = \'YOUR_API_KEY\';
const url = `https://api.mailpartner.fr/v1/subaccount/list?apiKey=${apiKey}`;

axios.get(url)
    .then(response => {
        console.log(response.data);
    })
    .catch(error => {
        console.error(\'Error:\', error);
    });


   </code></pre>
  </div>
  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code>
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class Main {
    public static void main(String[] args) {
        try {
            String url = "https://api.mailpartner.fr/v1/subaccount/credit/add";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json");
            con.setDoOutput(true);

            String jsonInputString = "{\"apiKey\": \"YOUR_API_KEY\", \"credit\": \"100\", \"tokenSubaccount\": \"identifiant du sous-compte\"}";

            try (OutputStream os = con.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            int responseCode = con.getResponseCode();
            System.out.println("Response Code : " + responseCode);
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

let url = URL(string: "https://api.mailpartner.fr/v1/subaccount/credit/add")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")

let parameters: [String: Any] = [
    "apiKey": "YOUR_API_KEY",
    "credit": "100",
    "tokenSubaccount": "identifiant du sous-compte"
]

request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
        print("Error: \(error)")
        return
    }
    if let data = data, let responseString = String(data: data, encoding: .utf8) {
        print("Response: \(responseString)")
    }
}

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
    "net/http"
    "log"
)

func main() {
    url := "https://api.mailpartner.fr/v1/subaccount/credit/add"

    payload := map[string]string{
        "apiKey":         "YOUR_API_KEY",
        "credit":         "100",
        "tokenSubaccount": "identifiant du sous-compte",
    }

    jsonData, err := json.Marshal(payload)
    if err != nil {
        log.Fatal(err)
    }

    resp, err := http.Post(url, "application/json", bytes.NewBuffer(jsonData))
    if err != nil {
        log.Fatal(err)
    }
    defer resp.Body.Close()

    var responseBody bytes.Buffer
    _, err = responseBody.ReadFrom(resp.Body)
    if err != nil {
        log.Fatal(err)
    }
    log.Println("Response:", responseBody.String())
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

class Program
{
    static async Task Main(string[] args)
    {
        var client = new HttpClient();
        var url = "https://api.mailpartner.fr/v1/subaccount/credit/add";

        var data = new
        {
            apiKey = "YOUR_API_KEY",
            credit = "100",
            tokenSubaccount = "identifiant du sous-compte"
        };

        var json = Newtonsoft.Json.JsonConvert.SerializeObject(data);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await client.PostAsync(url, content);
        var responseString = await response.Content.ReadAsStringAsync();

        Console.WriteLine(responseString);
    }
}

   </code></pre>
  </div>
</div>


## Réponse
<!-- Tab panes pour JSON et XML -->
```json
 {
    "success": true,
    "code": 200,
    "credit": 2869.2,
    "subaccountCredit": 61.8,
    "currency": "EUR"
}
  ```



## Erreurs

```json
{
    "success": false,
    "code": 10,
    "message": "Clé API incorrecte"
}
  ```


## Code de contrôle

| _  | Réponse |
| :---------------: |:---------------|
|1 |La Clé API est requise |
|2 |Le crédit est requis|
|3 | L’identifiant du sous-compte est requis |
|4 |Vous n’avez pas l’authorisation |
|5 |Le crédit à attribuer doit être supérieur à 0|
|6 |La balance doit être supérieur à 0|
|7 |Le sous-compte n’exsite pas|
|8 |Crédits insuffisant |
|10 |Clé API incorrecte |
|200 | 	Tout s’est bien passé ! |



