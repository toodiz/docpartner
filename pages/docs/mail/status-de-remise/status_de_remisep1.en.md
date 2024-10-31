

---
title: Statut par message
description: >
---

# Status by ID

This request allows you to retrieve the statuses of multiple emails based on an ID.

<div class="alert alert-info no-margin">Note: Reports are typically received a few seconds after the email is sent; however, this delay can extend up to a maximum of 48 hours depending on the operators and the load on our platform.</div>









## URL
<div>
  <div style="background-color: #FF4C4C; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.mailpartner.fr/v1/bulk-status</span>
</div>













### Parameters

Each API request supports the following parameters:

| Parameter  | Description |
| :--------------- |:---------------|
| **apiKey** | Your account's API key. You get it in your Mail Partner account.
 |
| **messageId** | Found in the response when sending an email |











## Request

Example request: 

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
        $data = 'apiKey=YOUR_API_KEY&messageId=300';
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.mailpartner.fr/v1/bulk-status?'.$data);
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
Imports System.Net

Module Module1
    Sub Main()
        ' Prepare data for GET request
        Dim apiKey As String = "YOUR_API_KEY"
        Dim messageId As String = "300"
        Dim url As String = $"https://api.mailpartner.fr/v1/bulk-status?apiKey={apiKey}&messageId={messageId}"

        ' Create a WebClient instance
        Using client As New WebClient()
            Try
                ' Make the GET request and get the response
                Dim response As String = client.DownloadString(url)
                Console.WriteLine(response)
            Catch ex As WebException
                ' Handle any errors that occur during the request
                Console.WriteLine("Error: " & ex.Message)
            End Try
        End Using
    End Sub
End Module


   </code></pre>
  </div>
  <div class="tab-pane fade" id="python" role="tabpanel" aria-labelledby="python-tab">
    <!-- Python code example goes here -->
    <pre><code>
import requests

# Prepare data for GET request
api_key = "YOUR_API_KEY"
message_id = "300"
url = f"https://api.mailpartner.fr/v1/bulk-status?apiKey={api_key}&messageId={message_id}"

response = requests.get(url)
print(response.text)

   </code></pre>
  </div>
  <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code>
curl -G "https://api.mailpartner.fr/v1/bulk-status" --data-urlencode "apiKey=YOUR_API_KEY" --data-urlencode "messageId=300"

   </code></pre>
  </div>
  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code>
const https = require('https');

// Prepare data for GET request
const apiKey = 'YOUR_API_KEY';
const messageId = '300';
const url = `https://api.mailpartner.fr/v1/bulk-status?apiKey=${apiKey}&messageId=${messageId}`;

https.get(url, (resp) => {
  let data = '';

  // A chunk of data has been received.
  resp.on('data', (chunk) => {
    data += chunk;
  });

  // The whole response has been received.
  resp.on('end', () => {
    console.log(data);
  });

}).on("error", (err) => {
  console.log("Error: " + err.message);
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
            String messageId = "300";
            String url = "https://api.mailpartner.fr/v1/bulk-status?apiKey=" + apiKey + "&messageId=" + messageId;

            HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection();
            con.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // Print result
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
let messageId = "300"
let urlString = "https://api.mailpartner.fr/v1/bulk-status?apiKey=(apiKey)&messageId=(messageId)"

if let url = URL(string: urlString) {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            print("Error: (error)")
            return
        }
        if let data = data, let responseString = String(data: data, encoding: .utf8) {
            print(responseString)
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
)

func main() {
    apiKey := "YOUR_API_KEY"
    messageId := "300"
    url := fmt.Sprintf("https://api.mailpartner.fr/v1/bulk-status?apiKey=%s&messageId=%s", apiKey, messageId)

    resp, err := http.Get(url)
    if err != nil {
        fmt.Println("Error:", err)
        return
    }
    defer resp.Body.Close()

    body, _ := ioutil.ReadAll(resp.Body)
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
    static async Task Main()
    {
        string apiKey = "YOUR_API_KEY";
        string messageId = "300";
        string url = $"https://api.mailpartner.fr/v1/bulk-status?apiKey={apiKey}&messageId={messageId}";

        using (HttpClient client = new HttpClient())
        {
            HttpResponseMessage response = await client.GetAsync(url);
            string responseBody = await response.Content.ReadAsStringAsync();
            Console.WriteLine(responseBody);
        }
    }
}

   </code></pre>
  </div>
</div>


<!-- Nouvelle section de navigation tabs pour JSON et XML -->
<ul class="nav nav-tabs" id="formatTab" role="tablist" style="margin-top: 20px;">
  <li class="nav-item">
    <a class="nav-link active" id="json-tab" data-toggle="tab" href="#json" role="tab" aria-controls="json" aria-selected="true">JSON</a>
  </li>
</ul>



## Response
``` json
{
    "success": true,
    "code": 200,
    "messageId": "xxx",
    "StatutResponseList": [
        {
            "email": "email1",
            "token": "xxx",
            "status": "Delivered",
            "cost": 1,
            "stopMail": true,
            "date": "1599061044"
        },
        {
            "email": "email2",
            "token": "yyy",
            "status": "Delivered",
            "cost": 1,
            "stopMail": true,
            "date": "1599061044"
        }
    ]
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
|1 | The API Key is required |
|3 | The message ID is required |
|4 | Message not found |
|10 | Incorrect API Key |    
|200 | Everything went well! |
  

  













