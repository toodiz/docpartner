---
title:  Liste des désabonnements
description: >
---
# Liste des désabonnements

Cette requête permet de récupérer la liste désabonnements.





## URL
<div>
  <div style="background-color: #ef4836; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;">http://api.mailpartner.fr/v1/unsubscribe/list</span>
</div>








  ## Paramètres


Chaque demande d’API prend en charge les paramètres suivants :

  | Paramètre  | Description |
  | :--------------- |:---------------|
  | **apiKey** | Clé API de votre compte. Vous l'obtenez dans votre <a href="https://www.mailpartner.fr" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte Mail Partner</a>. |

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
?php
 
        // Prepare data for GET request
        $data = 'apiKey=YOUR_API_KEY';
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'http://api.mailpartner.fr/v1/unsubscribe/list?'.$data);
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
    Dim mail As String = "xxx@www.com"
    Dim messageId As Integer = XXX
 
    #check credits
    Dim url As String
    url = base_url & "unsubscribe/list" & "?apiKey=" & apiKey
 
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
URL = "http://api.mailpartner.fr/v1"
 
class MailPartner():
    def get_list_stop(self):
		url = URL + "/unsubscribe/list?apiKey=" + API_KEY
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
curl -H “Content-Type: application/json” -X GET http://api.mailpartner.fr/v1/unsubscribe/list?apiKey=xxx

   </code></pre>
  </div>

  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code>
const axios = require('axios');

const apiKey = 'YOUR_API_KEY';
const url = `http://api.mailpartner.fr/v1/unsubscribe/list?apiKey=${apiKey}`;

axios.get(url, { timeout: 10000 })
  .then(response => {
    console.log(response.data);
  })
  .catch(error => {
    console.error(error);
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
            String url = "http://api.mailpartner.fr/v1/unsubscribe/list?apiKey=" + apiKey;

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            con.setConnectTimeout(10000);
            
            int responseCode = con.getResponseCode();
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();
            
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

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
    <pre><code>
import Foundation

let apiKey = "YOUR_API_KEY"
let url = URL(string: "http://api.mailpartner.fr/v1/unsubscribe/list?apiKey=(apiKey)")!

var request = URLRequest(url: url)
request.httpMethod = "GET"

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data = data, error == nil else {
        print("Error: (error?.localizedDescription ?? "No data")")
        return
    }

    if let responseString = String(data: data, encoding: .utf8) {
        print(responseString)
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
	"fmt"
	"io/ioutil"
	"net/http"
	"time"
)

func main() {
	apiKey := "YOUR_API_KEY"
	url := "http://api.mailpartner.fr/v1/unsubscribe/list?apiKey=" + apiKey

	client := http.Client{
		Timeout: 10 * time.Second,
	}

	resp, err := client.Get(url)
	if err != nil {
		fmt.Println("Error:", err)
		return
	}
	defer resp.Body.Close()

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("Error reading response:", err)
		return
	}

	// Process your response here
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
        string url = $"http://api.mailpartner.fr/v1/unsubscribe/list?apiKey={apiKey}";

        using HttpClient client = new HttpClient { Timeout = TimeSpan.FromSeconds(10) };
        
        try
        {
            HttpResponseMessage response = await client.GetAsync(url);
            response.EnsureSuccessStatusCode();
            string responseBody = await response.Content.ReadAsStringAsync();

            // Process your response here
            Console.WriteLine(responseBody);
        }
        catch (Exception e)
        {
            Console.WriteLine($"Request failed: {e.Message}");
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
  "nbData": 1,
  "data": [
    {
      "id": 19,
      "email": "xxx@www.com",
      "createdAt": "2015-07-20 10:19:45"
    }
  ]
}

  ```






## Code de contrôle

|_ |Response|
|----|--------|
|1|La Clé API est requise|
|10|Clé API incorrecte|
|200|Tout s’est bien passé!|








