

---
title:  Creation of Sub-Account

description: >
---
# Creation of Sub-Account

Creating a sub-account.








## URL
<div>
  <div style="background-color: #49CC90; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;"> https://api.mailpartner.fr/v1/subaccount/create</span>
</div>













## Parameters

Each API request supports the following parameters:
| Parameter    | Description |
|:-------------|:------------|
| **apiKey**   | API key for your account. You can obtain it from your [Mail Partner account](https://www.mailpartner.fr). |
| **type**     | **Description**: This choice is final and cannot be changed. <br><br> **simple**: <br>- The sub-account will not receive any emails.<br>- No phone number is required.<br>- Purchasing is not allowed.<br><br> **advanced**: <br>- A valid email is required.<br>- The signup process is identical to that of a standard account.<br>- A mobile phone number will be requested upon signup. |
| **parameters** | <ul class="nav nav-tabs"> <li class="active"><a href="#op1" data-toggle="tab" aria-expanded="true">Advanced Sub-Account</a></li> <li><a href="#op2" data-toggle="tab" aria-expanded="false">Simple Sub-Account</a></li> </ul> <div class="tab-content"> <div id="op1" class="tab-pane fade active in"> <strong>Advanced Sub-Account:</strong><br><strong>email:</strong> Valid email of the account holder.<br><strong>isBuyer:</strong> If `isBuyer=1`, the sub-account can purchase its own SMS.<br><strong>creditToAttribute (optional):</strong> Credit in euros added to the sub-account at creation. This credit will be deducted from the main account.<br><strong>title (optional):</strong> Sub-account name.<br><strong>firstname (optional):</strong> First name of the sub-account holder.<br><strong>lastname (optional):</strong> Last name of the sub-account holder.<br></div> <div id="op2" class="tab-pane fade"> <strong>Simple Sub-Account:</strong><br><strong>email (optional):</strong> If this field is empty, an email will be automatically generated (e.g., 9875587@mailpartner.fr).<br><strong>creditToAttribute (optional):</strong> Credit in euros added to the sub-account at creation. This credit will be deducted from the main account.<br><strong>title (optional):</strong> Sub-account name.<br><strong>firstname (optional):</strong> First name of the sub-account holder.<br><strong>lastname (optional):</strong> Last name of the sub-account holder.<br></div> </div> |

### Optional Parameters

| Parameter  | Description |
|:---------------|:---------------|
| **_format** | Response format. You can choose between JSON or XML. By default, the response format is JSON. |






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


        // Prepare data for POST request
        $fields = array(
            'apiKey'=> 'YOUR API KEY',
            'type'=> 'advanced',
            'parameters'=>array(
                'email':'aaaa@bbb.ccc',
    	        'creditToAttribute':10,
    	        'isBuyer':0,
    	        'firstname':'prenom',
    	        'lastname':'nom'
            ));
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.mailpartner.fr/v1/subaccount/create');
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
URL = "https://api.mailpartner.fr/v1"
 
class MailPartner():
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
    <pre><code>
curl -H  "Content-Type: application/json" -X POST -d '{"apiKey":"xxxxx","type":"advanced","parameters":{"email":"aaaa@bbb.ccc","creditToAttribute":10,"isBuyer":0,"firstname":"prenom","lastname":"nom"}}' https://api.mailpartner.fr/v1/subaccount/create
    </code></pre>
  </div>

  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <pre><code class="language-javascript">
const axios = require('axios');

// Prepare data for POST request
const fields = {
    apiKey: 'YOUR API KEY',
    type: 'advanced',
    parameters: {
        email: 'aaaa@bbb.ccc',
        creditToAttribute: 10,
        isBuyer: 0,
        firstname: 'prenom',
        lastname: 'nom'
    }
};

axios.post('https://api.mailpartner.fr/v1/subaccount/create', fields)
    .then(response => {
        // Process your response here
        console.log(response.data);
    })
    .catch(error => {
        console.error('Error:', error);
    });

    </code></pre>
  </div>

  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <pre><code>
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class CreateSubAccount {
    public static void main(String[] args) {
        try {
            String url = "https://api.mailpartner.fr/v1/subaccount/create";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json");
            con.setDoOutput(true);

            String jsonInputString = "{"apiKey": "YOUR API KEY", "type": "advanced", "parameters": {"email": "aaaa@bbb.ccc", "creditToAttribute": 10, "isBuyer": 0, "firstname": "prenom", "lastname": "nom"}}";

            try (OutputStream os = con.getOutputStream()) {
                byte[] input = jsonInputString.getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            // Process your response here
            System.out.println("Response Code : " + con.getResponseCode());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

    </code></pre>
  </div>

  <div class="tab-pane fade" id="swift" role="tabpanel" aria-labelledby="swift-tab">
    <pre><code>
import Foundation

// Prepare data for POST request
let apiKey = "YOUR API KEY"
let url = URL(string: "https://api.mailpartner.fr/v1/subaccount/create")!

let parameters: [String: Any] = [
    "apiKey": apiKey,
    "type": "advanced",
    "parameters": [
        "email": "aaaa@bbb.ccc",
        "creditToAttribute": 10,
        "isBuyer": 0,
        "firstname": "prenom",
        "lastname": "nom"
    ]
]

// Convert parameters to JSON data
let jsonData: Data
do {
    jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
} catch {
    print("Error serializing JSON: (error)")
    return
}

// Create the request
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")
request.httpBody = jsonData

// Create the URL session and data task
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
        print("Error making request: (error)")
        return
    }

    guard let data = data else {
        print("No data returned")
        return
    }

    // Process your response here
    if let responseString = String(data: data, encoding: .utf8) {
        print("Response: (responseString)")
    }
}

// Start the task
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

func main() {
    // Prepare data for POST request
    apiKey := "YOUR API KEY"
    url := "https://api.mailpartner.fr/v1/subaccount/create"

    parameters := map[string]interface{}{
        "apiKey": apiKey,
        "type":   "advanced",
        "parameters": map[string]interface{}{
            "email":            "aaaa@bbb.ccc",
            "creditToAttribute": 10,
            "isBuyer":         0,
            "firstname":       "prenom",
            "lastname":        "nom",
        },
    }

    // Convert parameters to JSON
    jsonData, err := json.Marshal(parameters)
    if err != nil {
        fmt.Printf("Error marshaling JSON: %v
", err)
        return
    }

    // Create the request
    req, err := http.NewRequest("POST", url, bytes.NewBuffer(jsonData))
    if err != nil {
        fmt.Printf("Error creating request: %v
", err)
        return
    }
    req.Header.Set("Content-Type", "application/json")

    // Send the request
    client := &http.Client{}
    resp, err := client.Do(req)
    if err != nil {
        fmt.Printf("Error sending request: %v
", err)
        return
    }
    defer resp.Body.Close()

    // Process your response here
    var responseBody bytes.Buffer
    _, err = responseBody.ReadFrom(resp.Body)
    if err != nil {
        fmt.Printf("Error reading response: %v
", err)
        return
    }

    fmt.Printf("Response: %s
", responseBody.String())
}

    </code></pre>
  </div>

  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
    <pre><code>
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

class Program
{
    static async Task Main()
    {
        using (var client = new HttpClient())
        {
            var fields = new
            {
                apiKey = "YOUR API KEY",
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

            var json = Newtonsoft.Json.JsonConvert.SerializeObject(fields);
            var content = new StringContent(json, Encoding.UTF8, "application/json");

            var response = await client.PostAsync("https://api.mailpartner.fr/v1/subaccount/create", content);

            // Process your response here
            string result = await response.Content.ReadAsStringAsync();
            Console.WriteLine(result);
        }
    }
}

    </code></pre>
  </div>
</div>


## Response
<!-- Tab panes pour JSON et XML -->
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
  




















