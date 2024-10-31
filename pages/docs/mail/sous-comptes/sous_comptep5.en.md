
---
title: Removing Credit
description: >
---

# Removing Credit

From your account, you can remove credits from your sub-accounts. The credits will be added back to your main account.









## URL

<div>
  <div style="background-color: #5cb85c; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;"> https://api.mailpartner.fr/v1/subaccount/credit/remove</span>
</div>










## Parameters

  Each API request supports the following parameters:

  | Parameter  | Description |
  | :--------------- |:---------------|
  | **apiKey** | The API key of your account, which you can get from your Mail Partner account. |
  | **credit** | Amount of credit in Euros to add to the sub-account. |
  | **tokenSubaccount** | Identifier of the sub-account. |

  ### Optional Parameters

  | Parameter  | Description |
  | :--------------- |:---------------|
  | **_format** | The response format. You can choose between JSON or XML. By default, the response format is JSON. |



















## Request

Request example:
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
            'credit'=> '100',
            'tokenSubaccount'=>'identifiant du sous-compte'
            );
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.mailpartner.fr/v1/subaccount/credit/add');
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
    <pre><code>
curl -H  "Content-Type: application/json" -X POST -d '{"apiKey":"xxxxx","credit":"10","tokenSubaccount":"identifiant du sous-compte"}' https://api.mailpartner.fr/v1/subaccount/credit/add
   </code></pre>
  </div>

  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <pre><code>
const axios = require('axios');

const data = {
    apiKey: 'YOUR API KEY',
    credit: '100',
    tokenSubaccount: 'identifiant du sous-compte'
};

axios.post('https://api.mailpartner.fr/v1/subaccount/credit/remove', data, {
    headers: { 'Content-Type': 'application/json' },
    timeout: 10000
})
.then(response => {
    console.log(response.data);
})
.catch(error => {
    console.error(error);
});


   </code></pre>
  </div>

  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
   <pre><code>
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class Main {
    public static void main(String[] args) throws Exception {
        String apiUrl = "https://api.mailpartner.fr/v1/subaccount/credit/remove";
        String data = "{"apiKey":"YOUR API KEY", "credit":"100", "tokenSubaccount":"identifiant du sous-compte"}";

        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setConnectTimeout(10000);
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(data.getBytes("UTF-8"));
        }

        int responseCode = conn.getResponseCode();
        System.out.println("Response Code: " + responseCode);
    }
}

   </code></pre>
  </div>

   <div class="tab-pane fade" id="swift" role="tabpanel" aria-labelledby="swift-tab">
    <pre><code>
import Foundation

let url = URL(string: "https://api.mailpartner.fr/v1/subaccount/credit/remove")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")
request.timeoutInterval = 10

let body: [String: Any] = [
    "apiKey": "YOUR API KEY",
    "credit": "100",
    "tokenSubaccount": "identifiant du sous-compte"
]
request.httpBody = try? JSONSerialization.data(withJSONObject: body)

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let data = data, let responseString = String(data: data, encoding: .utf8) {
        print(responseString)
    } else if let error = error {
        print(error)
    }
}
task.resume()

   </code></pre>
  </div>

  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
   <pre><code>
package main

import (
    "bytes"
    "encoding/json"
    "fmt"
    "net/http"
    "time"
)

func main() {
    url := "https://api.mailpartner.fr/v1/subaccount/credit/remove"
    data := map[string]string{
        "apiKey":          "YOUR API KEY",
        "credit":          "100",
        "tokenSubaccount": "identifiant du sous-compte",
    }

    jsonData, _ := json.Marshal(data)
    client := &http.Client{Timeout: 10 * time.Second}
    req, _ := http.NewRequest("POST", url, bytes.NewBuffer(jsonData))
    req.Header.Set("Content-Type", "application/json")

    resp, err := client.Do(req)
    if err != nil {
        fmt.Println(err)
        return
    }
    defer resp.Body.Close()

    fmt.Println("Response Status:", resp.Status)
}

   </code></pre>
  </div>

  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
   <pre><code>
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

public class Program
{
    public static async Task Main()
    {
        var url = "https://api.mailpartner.fr/v1/subaccount/credit/remove";
        var data = new
        {
            apiKey = "YOUR API KEY",
            credit = "100",
            tokenSubaccount = "identifiant du sous-compte"
        };

        var json = Newtonsoft.Json.JsonConvert.SerializeObject(data);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        using var client = new HttpClient { Timeout = TimeSpan.FromSeconds(10) };
        var response = await client.PostAsync(url, content);

        string result = await response.Content.ReadAsStringAsync();
        Console.WriteLine(result);
    }
}

   </code></pre>
  </div>
</div>


## Response
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








## Errors

Exemple of errors message :

```json
{
    "success": false,
    "code": 10,
    "message": "Api key invalid"
}

  ```




## Control code

| _  | Response |
| :---------------: |:---------------|
|1 |API key is required |
|2 |Credit is required|
|3 |The sub-account identifier is required |
|4 |You are not authorized |
|5 |The credit to assign must be greater than 0 |
|6 |The balance must be greater than 0 |
|7 |The sub-account does not exist |
|8 |Insufficient credits |
|10 |Incorrect API Key|
|200 | Everything went well!|








