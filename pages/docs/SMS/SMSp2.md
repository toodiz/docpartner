---
title: Crédits
description: Page 2 Crédits.
---

# Introduction à l'API SMS Partner

Cette requête est utilisée pour récupérer votre crédit disponible de SMS, ainsi que le nombre de SMS en instance de départ.

## URL

<div>
  <div style="background-color: #FF4C4C; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/me</span>
</div>

## Paramètres

Chaque demande d'API prend en charge les paramètres suivants :

| Paramètre  | Description |
| :--------------- |:---------------|
| **apiKey** | Clé API de votre compte. Vous l'obtenez dans votre compte SMS Partner. |

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
curl_setopt($curl, CURLOPT_URL, 'https://api.smspartner.fr/v1/me?' . $data);
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
cURL
Imports System.IO
Imports System.Net
 
Module Module1
 
  Sub Main()
 
    Dim base_url As String = "http://api.smspartner.fr/v1/"
    Dim apiKey As String = "VOTRE_APIKEY"
 
    #check credits
    Dim url As String
    url = base_url & "me" & "?apiKey=" & apiKey
 
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
URL = "https://api.smspartner.fr/v1"
 
class SMSPartner():
    def get_balance(self):
		url = URL + "/me?apiKey=" + API_KEY
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
    curl -H "Content-Type: application/json" -X GET  https://api.smspartner.fr/v1/me?apiKey=xxx
   </code></pre>
  </div>
  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code>
const https = require('https');
// Préparer les données pour la requête GET
let data = 'apiKey=YOUR API KEY';
let url = 'https://api.smspartner.fr/v1/me?' + data;

https.get(url, (res) => {
  let data = ';

  // Un morceau de données a été reçu.
  res.on('data', (chunk) => {
    data += chunk;
  });

  // La totalité de la réponse a été reçue. Imprimer le résultat.
  res.on('end', () => {
    console.log(JSON.parse(data));
  });

}).on("error", (err) => {
  // Un message d'erreur sera imprimé en cas d'erreur.
  console.log("Erreur: " + err.message);
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

public class CreditsSms {
    public static void main(String[] args) {
        try {
            String apiKey = "your_api_key";
            String url = "https://api.smspartner.fr/v1/me?apiKey=" + apiKey;

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");

            int responseCode = con.getResponseCode();

            if (responseCode == HttpURLConnection.HTTP_OK) {
                BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
                String inputLine;
                StringBuilder response = new StringBuilder();

                while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
                }
                in.close();

                System.out.println(response.toString());
            } else {
                System.out.println("GET request failed. Response Code: " + responseCode);
            }
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
import SwiftUI
 
struct Credits: View {
    @State private var credit: String = "Loading..."
 
    var body: some View {
        VStack {
            Text("Mon crédit")
                .font(.title)
                .padding()
 
            Text(credit)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: getCredit)
    }
 
    func getCredit() {
        let apiKey = "Your-api-key"
        let urlString = "https://api.smspartner.fr/v1/me?apiKey=(apiKey)"
 
        guard let url = URL(string: urlString) else {
            print("URL inválida")
            return
        }
 
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: (error)")
            } else if let data = data {
                let result = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    credit = result ?? "Error"
                }
            }
        }
 
        task.resume()
    }
}
 
struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        Credits()
    }
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
)

func main() {
	apiKey := "your_api_key"
	url := "https://api.smspartner.fr/v1/me?apiKey=" + apiKey

	response, err := http.Get(url)
	if err != nil {
		fmt.Println("GET request failed:", err)
		return
	}
	defer response.Body.Close()

	if response.StatusCode == http.StatusOK {
		bodyBytes, err := ioutil.ReadAll(response.Body)
		if err != nil {
			fmt.Println("Failed to read response body:", err)
			return
		}
		fmt.Println(string(bodyBytes))
	} else {
		fmt.Println("GET request failed. Response Code:", response.StatusCode)
	}
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
    private static readonly HttpClient client = new HttpClient();

    static async Task Main(string[] args)
    {
        var apiKey = "YOUR_API_KEY";
        var uri = new Uri($"https://api.smspartner.fr/v1/me?apiKey={apiKey}");

        HttpResponseMessage response = await client.GetAsync(uri);

        if (response.IsSuccessStatusCode)
        {
            var result = await response.Content.ReadAsStringAsync();
            Console.WriteLine(result);
        }
        else
        {
            Console.WriteLine("GET request failed with status code: " + response.StatusCode);
        }
    }
}
   </code></pre>
  </div>
</div>

## Réponses

<!-- Nouvelle section de navigation tabs pour JSON et XML -->
<ul class="nav nav-tabs" id="formatTab" role="tablist" style="margin-top: 20px;">
  <li class="nav-item">
    <a class="nav-link active" id="json-tab" data-toggle="tab" href="#json" role="tab" aria-controls="json" aria-selected="true">JSON</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="xml-tab" data-toggle="tab" href="#xml" role="tab" aria-controls="xml" aria-selected="false">XML</a>
  </li>
</ul>

<!-- Tab panes pour JSON et XML -->
<div class="tab-content">
  <div class="tab-pane fade show active" id="json" role="tabpanel" aria-labelledby="json-tab">
    <pre><code class="language-json">
{
    "success": true,
    "code": 200,
    "user": {
        "username": "exemple@email.com",
        "firstname": "John",
        "lastname": "Doe"
    },
    "credits": {
        "creditSms": 269082,
        "creditSmsLowCost": 444570 (Ce paramètre sera prochainement supprimé, il est actuellement remplacé par creditSmsECO)
        "creditSmsECO": 444570,
        "creditHlr": 2045023,
        "toSend": 0,
        "solde": "10225.119",
        "currency": "EUR",
        "balance": "10225.119"
    }
}
    </code></pre>
  </div>
  <div class="tab-pane fade" id="xml" role="tabpanel" aria-labelledby="xml-tab">
    <pre><code class="language-xml">
<?xml version='1.0' encoding='UTF-8'?>
<result>
    <entry>true</entry>
    <entry>200</entry>
    <entry>
        <username>exemple@email.com</username>
        <firstname>John</firstname>
        <lastname>Doe</lastname>
    </entry>
    <entry>
        <entry>269070</entry>
        <entry>444551</entry>
        <entry>2044937</entry>
        <entry>0</entry>
        <entry>
            <![CDATA[10224.688]]>
        </entry>
        <entry>
            <![CDATA[EUR]]>
        </entry>
        <entry>
            <![CDATA[10224.688]]>
        </entry>
    </entry>
</result>
    </code></pre>
  </div>
</div>



## Code de contrôle

| _  | Réponse |
| :---------------: |:---------------|
|10 | Clé API incorrecte |
|200 | Tout s’est bien passé ! |




