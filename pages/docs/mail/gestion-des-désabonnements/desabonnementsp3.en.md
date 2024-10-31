

---
title: Remove an email from the unsubscription list
description: >
---

# Remove an email from the unsubscription list
This request allows removing an email from the unsubscription list.










## URL
<div>
  <div style="background-color: #5cb85c; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">http://api.mailpartner.fr/v1/unsubscribe/delete</span>
</div>
















### Parameters

Each API request supports the following parameters:

| Parameter  | Description |
| :--------------- |:---------------|
| **apiKey** | Your account's API key. You get it in your Mail Partner account.
| **Id** | ID of the number to be removed.<br> <a style="text-decoration: underline; font-size: 14px;" href="/documentation-fr/api/v1/manage-stopsms/list#reponse">It is found in the response when retrieving the unsubscription list.</a>

### Optional Parameters 



| Parameter  | Description |
| :--------------- |:---------------|
| **_format** |	Response format. You can choose between JSON or XML. By default, the response format is JSON.










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
        $data = 'apiKey=YOUR_API_KEY&id=666';
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.mailpartner.fr/v1/unsubscribe/delete?'.$data);
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
    Dim id As Integer = XXX
 
    #check credits
    Dim url As String
    url = base_url & "unsubscribe/delete" & "?apiKey=" & apiKey & "&id=" & id
 
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
 
class SMSPartner():
    def del_stop(self,id):
		url = URL + "/unsubscribe/delete?apiKey=" + API_KEY + "&id=" + id
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

curl -H  "Content-Type: application/json" -X GET  https://api.mailpartner.fr/v1/unsubscribe/delete?apiKey=xxx&id=300
   </code></pre>
  </div>
  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code>
const https = require('https');

const apiKey = 'YOUR_API_KEY';
const id = '666';
const url = `https://api.mailpartner.fr/v1/unsubscribe/delete?apiKey=${apiKey}&id=${id}`;

https.get(url, (resp) => {
    let data = '';

    resp.on('data', (chunk) => {
        data += chunk;
    });

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
            String id = "666";
            String url = "https://api.mailpartner.fr/v1/unsubscribe/delete?apiKey=" + apiKey + "&id=" + id;

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("GET");
            con.setConnectTimeout(10000); // Timeout in milliseconds

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();

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
let id = "666"
let url = URL(string: "https://api.mailpartner.fr/v1/unsubscribe/delete?apiKey=(apiKey)&id=(id)")!

var request = URLRequest(url: url)
request.httpMethod = "GET"
request.timeoutInterval = 10

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data = data, error == nil else {
        print("Error: (error?.localizedDescription ?? "Unknown error")")
        return
    }
    if let responseText = String(data: data, encoding: .utf8) {
        print(responseText)
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
	id := "666"
	url := fmt.Sprintf("https://api.mailpartner.fr/v1/unsubscribe/delete?apiKey=%s&id=%s", apiKey, id)

	client := &http.Client{Timeout: 10 * time.Second}
	resp, err := client.Get(url)
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
using System.IO;
using System.Net;

class Program
{
    static void Main()
    {
        string apiKey = "YOUR_API_KEY";
        string id = "666";
        string url = $"https://api.mailpartner.fr/v1/unsubscribe/delete?apiKey={apiKey}&id={id}";

        HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
        request.Method = "GET";
        request.Timeout = 10000; // Timeout in milliseconds

        using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
        using (StreamReader reader = new StreamReader(response.GetResponseStream()))
        {
            string result = reader.ReadToEnd();
            Console.WriteLine(result);
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
    "code":200
}
```






## Errors

```json
{
    "success": false,
    "code": 10,
    "message": "Clé API incorrecte"
}
  ```



## Control code

| _  | Response |
| :---------------: |:---------------|
|1 | The API Key is required |
|2| The mail is required |
|3| ID of the mail is required |
|4| ID of the mail is not found |
|10| The API key is invalid |
|200| Everything went well! |
  




















