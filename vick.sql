  -- Insertion dans la table chemin
  INSERT INTO chemin (path) VALUES 
  ('pages/docs/VERIFICATION-NUMEROS/verification_page2.en.md');


-- Insertion dans la table introduction
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
(
'
---
title: Check the Format of a Number
description: >
---

# Check the Format of a Number

This feature allows you to check the format of a mobile phone number. It is available for free.

<div class="alert alert-warning">Limit: 360 requests per minute.<br>
If you exceed these limits, you will receive an HTTP 429 response.</div>



', 'en', 122
);

-- Insertion dans la table URLAPI
INSERT INTO urlapi (textcode, id_chemin) VALUES 
('



## URL

<div>
  <div style="background-color: #5cb85c; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/lookup</span>
</div>




',  122);

-- Insertion dans la table PARAMETRE
INSERT INTO parametre (textcode, langue, id_chemin) VALUES 
('





## Parameters

Each API request supports the following parameters:

| Parameter       | Description |
| :-------------- |:-----------|
| **apiKey**      | API key for your account. You can obtain it from your SMS Partner account. |
| **phoneNumbers** | Mobile numbers to verify.<br>They must be in international format (+336xxxxxxxx).<br>For multiple verifications, separate numbers with commas.<br>Up to 500 numbers can be verified per request. |

### Optional Parameters

| Parameter       | Description |
| :-------------- |:-----------|
| **_format**     | Response format. You can choose between JSON or XML. By default, the response format is JSON. |




', 'en', 122);



-- Insertion dans la table REQUETE_REPONSE
INSERT INTO requete_reponse (textcode, langue, id_chemin) VALUES 
('







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


        <?php
        // Prepare data for POST request
        $fields = array(
            \'apiKey\'=> \'YOUR API KEY\',
            \'phoneNumbers\'=> \'+336xxxxxxxx\'
        );
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,\'https://api.smspartner.fr/v1/lookup\');
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 10);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS,json_encode($fields));
 
        $result = curl_exec($curl);
        curl_close($curl);
 
        // Process your response here
        echo $result;
?>
?&gt;
    </code></pre>
  </div>

  <div class="tab-pane fade" id="vbnet" role="tabpanel" aria-labelledby="vbnet-tab">
   <pre><code>
Imports System.IO
Imports System.Net
 
Module Module1
 
  Sub Main()
 
    Dim base_url As String = "http://api.smspartner.fr/v1/"
    Dim apiKey As String = "VOTRE_APIKEY"
 
    #send sms
    url = base_url & "lookup"
    #note : utiliser une librairie JSON en production, par exemple :
    #https//www.nuget.org/packages/Newtonsoft.Json/
    Dim parameters As String = String.Format(
        "{{""apiKey"":""{0}"",""phoneNumbers"":""{1}""}}",
        apiKey,
        "+33XXXXXXXXX")
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
URL = "https://api.smspartner.fr/v1"
 
class SMSPartner():
    def add_stop(self,phone_numbers):
 
		data = OrderedDict([
			("apiKey", API_KEY),
			("phoneNumbers", phone_numbers)
		])
 
		url = URL + "/lookup"
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
curl -H  "Content-Type: application/json" -X POST -d \'{"apiKey":"xxxxx","phoneNumbers":"xxxx"}\' https://api.smspartner.fr/v1/lookup
   </code></pre>
  </div>

  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <pre><code>

const axios = require(\'axios\');

const data = {
    apiKey: \'YOUR API KEY\',
    phoneNumbers: \'+336xxxxxxxx\'
};

axios.post(\'https://api.smspartner.fr/v1/lookup\', data)
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
import com.google.gson.Gson;

public class LookupRequest {
    public static void main(String[] args) {
        try {
            String url = "https://api.smspartner.fr/v1/lookup";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json");
            con.setDoOutput(true);

            // Prepare data for POST request
            String jsonInputString = new Gson().toJson(new RequestBody("YOUR API KEY", "+336xxxxxxxx"));

            try (OutputStream os = con.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            int responseCode = con.getResponseCode();
            System.out.println("Response Code : " + responseCode);
            // Process your response here

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

class RequestBody {
    private String apiKey;
    private String phoneNumbers;

    public RequestBody(String apiKey, String phoneNumbers) {
        this.apiKey = apiKey;
        this.phoneNumbers = phoneNumbers;
    }
}


   </code></pre>
  </div>

   <div class="tab-pane fade" id="swift" role="tabpanel" aria-labelledby="swift-tab">
    <pre><code>

import Foundation

let url = URL(string: "https://api.smspartner.fr/v1/lookup")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")

let parameters: [String: Any] = [
    "apiKey": "YOUR API KEY",
    "phoneNumbers": "+336xxxxxxxx"
]

do {
    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
} catch {
    print("Error: Cannot create JSON from parameters")
    return
}

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data = data, error == nil else {
        print("Error: \(error?.localizedDescription ?? "Unknown error")")
        return
    }
    // Process your response here
    let responseString = String(data: data, encoding: .utf8)
    print("Response: \(responseString ?? "No response")")
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
)

type RequestBody struct {
    ApiKey      string `json:"apiKey"`
    PhoneNumbers string `json:"phoneNumbers"`
}

func main() {
    url := "https://api.smspartner.fr/v1/lookup"

    requestBody := RequestBody{
        ApiKey:      "YOUR API KEY",
        PhoneNumbers: "+336xxxxxxxx",
    }

    jsonData, err := json.Marshal(requestBody)
    if err != nil {
        fmt.Println(err)
        return
    }

    resp, err := http.Post(url, "application/json", bytes.NewBuffer(jsonData))
    if err != nil {
        fmt.Println(err)
        return
    }
    defer resp.Body.Close()

    // Process your response here
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
using Newtonsoft.Json;

class Program
{
    static async Task Main(string[] args)
    {
        var url = "https://api.smspartner.fr/v1/lookup";
        var client = new HttpClient();

        var data = new
        {
            apiKey = "YOUR API KEY",
            phoneNumbers = "+336xxxxxxxx"
        };

        var json = JsonConvert.SerializeObject(data);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        var response = await client.PostAsync(url, content);
        var result = await response.Content.ReadAsStringAsync();

        // Process your response here
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
    "lookup": [
        {
            "request": "336XXXXXXXX",
            "success": true,
            "countryCode": "France",
            "prefixCode": 33,
            "phoneNumber": "+336XXXXXXXX",
            "type": "Mobile",
            "network": "",
            "format": {
                "e164": "+336XXXXXXXX",
                "international": "+33 6 XX XX XX XX",
                "national": "06 XX XX XX XX",
                "rfc3966": "tel:+33-6-XX-XX-XX-XX"
            }
        }
    ]
}

  ```



',
'en',  122);
-- Insertion dans la table Suitecode 
INSERT INTO erreur_controlecode (textcode, langue, id_chemin) VALUES 
('




## Errors
Example of an error message:
    
```json
{
    "success": false,
    "code": 10,
    "message": "API key invalid"
}
```
## Control Codes

| _  | Error Codes |
| :---------------: |:---------------|
| 1 | API Key is required |
|2 | The phone number is required|
|3 | The numbers must be separated by a comma|
|10 | Incorrect API Key |
| 200 | Everything went well!|




', 'en', 122);




