---
title: Voice Credits
description: >
---
# Voice Credits
This request is used to retrieve your available credit for voice messages, message deposits.

Limit: 5 requests per minute


## URL

<div>
  <div style="background-color: red; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;"> https://api.voicepartner.fr/v1/me</span>
</div>


## Parameters

Each API request supports the following parameters:

| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Your account API key. You will obtain it in your <a href="https://www.voicepartner.fr" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">Voice Partner account</a>. |

## Optional Parameters
| Parameter       | Description |
|:-----------------:|-------------| 
| **_format**      | Response format. You can choose between <strong> JSON</strong> or <strong> XML </strong>. By default, the response format is <strong> JSON. </strong> |



## Request
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
                // Prepare data for GET request
        $data = 'YOUR_API_KEY';
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.voicepartner.fr/v1/me/'.$data);
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
   <pre><code class="language-vbnet">
cURL
Imports System.IO
Imports System.Net
 
Module Module1
 
  Sub Main()
 
    Dim base_url As String = "https://api.voicepartner.fr/v1/"
    Dim apiKey As String = "VOTRE_APIKEY"
 
    #check credits
    Dim url As String
    url = base_url & "me" & "/" & apiKey
 
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
 <pre><code class="language-python">
# std
import logging
import json
from collections import OrderedDict
 
# 3p
import requests
 
API_KEY = "MY API KEY"
URL = "https://api.voicepartner.fr/v1"
 
class SMSPartner():
    def get_balance(self):
		url = URL + "/me/" + API_KEY
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
    <pre><code class="language-bash">
curl -H "Content-Type: application/json" -X 
GET  https://api.voicepartner.fr/v1/me/xxx
</code></pre>
  </div>

    <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code class="language-javascript">
const axios = require('axios');

// Replace 'YOUR_API_KEY' with your actual API key
const apiKey = 'YOUR_API_KEY';

// The URL of the API with the API key appended
const url = `https://api.voicepartner.fr/v1/me/${apiKey}`;

axios.get(url)
.then(response => {
console.log('Response:', response.data);
})
.catch(error => {
console.error('Error:', error.response ? error.response.data : error.message);
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
import java.net.http.HttpResponse.BodyHandlers;

public class CreditVoix {
    public static void main(String[] args) {
        // Replace 'YOUR_API_KEY' with your actual API key
        String apiKey = "YOUR_API_KEY";
        String url = "https://api.voicepartner.fr/v1/me/" + apiKey;

        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                .uri(URI.create(url))
                .build();

        client.sendAsync(request, BodyHandlers.ofString())
                .thenApply(HttpResponse::body)
                .thenAccept(System.out::println)
                .exceptionally(e -> {
                    System.out.println("Error: " + e.getMessage());
                    return null;
                })
                .join();
    }
}
   </code></pre>
  </div>
 
  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
<pre><code class="language-go">
package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
)

func main() {
	apiKey := "YOUR_API_KEY"
	url := fmt.Sprintf("https://api.voicepartner.fr/v1/me/%s", apiKey)

	response, err := http.Get(url)
	if err != nil {
		fmt.Printf("Error: %s
", err.Error())
		return
	}
	defer response.Body.Close()

	body, err := ioutil.ReadAll(response.Body)
	if err != nil {
		fmt.Printf("Error: %s
", err.Error())
		return
	}

	fmt.Printf("Response: %s
", string(body))
}
   </code></pre>
  </div>

  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
    <!-- C# code example goes here -->
    <pre><code class="language-csharp">
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace API.ApiClients
{
    public class CreditVoix
    {
        public static async Task Main()
        {
            var apiKey = "YOUR_API_KEY";
            var url = $"https://api.voicepartner.fr/v1/me/{apiKey}";

            using (var client = new HttpClient())
            {
                try
                {
                    var response = await client.GetAsync(url);
                    var content = await response.Content.ReadAsStringAsync();
                    Console.WriteLine("Response: " + content);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("Error: " + ex.Message);
                }
            }
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
    "success": true,
    "credit": "19",
    "currency": "€",
    "details": {
        "tts": {
            "h": 5,
            "m": 55,
            "s": 66
        },
        "tts_fixe": {
            "h": 3,
            "m": 44,
            "s": 55
        },
        "voice": {
            "message": 10
        }
    }
}
```




## Control Codes

| _  | Error Codes |
| :---------------: |:---------------|
| 10 | Invalid API key |
| 200 | Everything went well! |



