

---
title: Récupération des sous comptes
description: >
---

# Récupération des sous comptes

Pour récupérer, les informations des sous comptes, il y a deux méthodes : 
### Par la plateforme:
En vous rendant sur votre <a style="color: #3eb0ad;" href="https://my.mailpartner.fr"><strong>tableau de bord</strong></a> ou vous aurez accès à l’ensemble des sous comptes associés à votre compte.
### Par l'API;
En effectuant une requête sur l'url ci-dessous. 









## URL

<div>
  <div style="background-color: #FF4C4C; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.mailpartner.fr/v1/subaccount/list</span>
</div>







## Paramètres

  Chaque demande d'API prend en charge les paramètres suivants :

  | Paramètre  | Description |
  | :--------------- |:---------------|
  | **apiKey** | Clé API de votre compte. Vous l'obtenez dans votre compte Mail Partner. |
  | **page** | Le numéro de la page, il y a 20 résultats par page. Si ce paramètre est omis, la page 1 sera retourné. |

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

        // Prepare data for GET request
        $data = 'apiKey=YOUR_API_KEY';
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.mailpartner.fr/v1/subaccount/list?'.$data);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 10);
 
 
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
 
    #check credits
    Dim url As String
    url = base_url & "subaccount/list" & "?apiKey=" & apiKey
 
    Dim credits As String
    credits = apiRequest("GET", url, Nothing)
 
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
    def get_list_subaccount(self):
		url = URL + "/subaccount/list?apiKey=" + API_KEY
		r = requests.get(url)
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
curl -H  "Content-Type: application/json" -X GET  https://api.mailpartner.fr/v1/subaccount/list?apiKey=xxx&page=1
   </code></pre>
  </div>

  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code>
const axios = require('axios');

const apiKey = 'YOUR_API_KEY';
const url = `https://api.mailpartner.fr/v1/subaccount/list?apiKey=${apiKey}`;

axios.get(url)
    .then(response => {
        console.log(response.data);
    })
    .catch(error => {
        console.error('Error:', error);
    });


   </code></pre>
  </div>
  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code>
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class Main {
    public static void main(String[] args) {
        try {
            String apiKey = "YOUR_API_KEY";
            String url = "https://api.mailpartner.fr/v1/subaccount/list?apiKey=" + apiKey;

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            con.setRequestMethod("GET");
            con.setConnectTimeout(10000); // 10 seconds

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

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
    <pre><code>
import Foundation

let apiKey = "YOUR_API_KEY"
let urlString = "https://api.mailpartner.fr/v1/subaccount/list?apiKey=(apiKey)"

if let url = URL(string: urlString) {
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.timeoutInterval = 10

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: (error)")
            return
        }
        
        if let data = data {
            let responseString = String(data: data, encoding: .utf8)
            print(responseString ?? "No response")
        }
    }
    
    task.resume()
}


   </code></pre>
  </div>

   <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
    <!-- GO code example goes here -->
    <pre><code>
package main

import (
    "fmt"
    "io/ioutil"
    "net/http"
    "time"
)

func main() {
    apiKey := "YOUR_API_KEY"
    url := "https://api.mailpartner.fr/v1/subaccount/list?apiKey=" + apiKey

    client := &http.Client{Timeout: 10 * time.Second}
    resp, err := client.Get(url)
    if err != nil {
        fmt.Println("Error:", err)
        return
    }
    defer resp.Body.Close()

    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        fmt.Println("Error:", err)
        return
    }

    fmt.Println(string(body))
}

   </code></pre>
  </div>
  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
    <!-- C# code example goes here -->
    <pre><code>
using System;
using System.Net.Http;
using System.Threading.Tasks;

class Program
{
    static async Task Main(string[] args)
    {
        string apiKey = "YOUR_API_KEY";
        string url = $"https://api.mailpartner.fr/v1/subaccount/list?apiKey={apiKey}";

        using (HttpClient client = new HttpClient())
        {
            client.Timeout = TimeSpan.FromSeconds(10);

            try
            {
                HttpResponseMessage response = await client.GetAsync(url);
                response.EnsureSuccessStatusCode();

                string result = await response.Content.ReadAsStringAsync();
                Console.WriteLine(result);
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


## Réponse
<!-- Tab panes pour JSON et XML -->
```json
 {
  "success": true,
  "code": 200,
  "total": 29,
  "nb_per_page": 20,
  "page": 1,
  "data": [
    {
      "id": 1,
      "email": "email1",
      "type": "simple",
      "token": "token1", //Est utilisé comme identifiant du sous-compte pour ajouter des crédits
      "apiKey": "ApiKey sous compte",
      "createdAt": "2016-03-04 11:23:14",
      "credits": {
          "balance": "0.800",
          "currency": "EUR"
      }
    },
    {
      "id": 2,
      "email": "email2",
      "type": "simple",
      "token": "token2",
      "apiKey": "ApiKey2 du sous compte",
      "createdAt": "2016-03-04 11:23:14",
      "credits": {
          "balance": "10.245",
          "currency": "EUR"
      }
    }
  ]
}

  ```






## Code de contrôle

| _  | Réponse |
| :---------------: |:---------------|
|1 |La Clé API est requise |
|10 |Clé API incorrecte |
|200 | 	Tout s’est bien passé ! |






