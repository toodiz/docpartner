
---
title: Send Verification
description: >
---

# Verify the Validity of a Phone Number

### The mobile number verification API (<a href="https://www.smspartner.fr/api-hlr/">HLR API</a>) allows you to check if a mobile number actually exists.

<div class="alert alert-warning">Limit: 360 requests per minute.<br>
If you exceed these limits, you will receive an HTTP 429 response.</div>









<div>
  <div style="background-color: #5cb85c; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/hlr/notify</span>
</div>









## Parameters

Each API request supports the following parameters:

| Parameter       | Description |
| :-------------- |:-----------|
| **apiKey**      | API key for your account. You can obtain it from your SMS Partner account. |
| **phoneNumbers** | Mobile numbers to verify.<br>They must be in international format (+336xxxxxxxx).<br>For multiple verifications, separate numbers with commas.<br>Up to 500 numbers can be verified per request. |

### Optional Parameters

| Parameter       | Description |
| :-------------- |:-----------|
| **tag**         | String of up to 20 characters. |
| **notifyUrl**   | Allows retrieval of the HLR request result to a URL of your choice.<br>The result is sent via POST.<br><a style="text-decoration: underline; color: #3eb0ad;" href="#notifyUrl">Example of an HLR request notification</a> |
| **_format**     | Response format. You can choose between JSON or XML. By default, the response format is JSON. |










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
            'phoneNumbers'=> '+336xxxxxxxx',
            'notifyUrl'=>'http://...'
        );
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.smspartner.fr/v1/hlr/notify');
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
 
    Dim base_url As String = "http://api.smspartner.fr/v1/"
    Dim apiKey As String = "VOTRE_APIKEY"
 
    #send sms
    url = base_url & "hlr/notify"
    #note : utiliser une librairie JSON en production, par exemple :
    #https//www.nuget.org/packages/Newtonsoft.Json/
    Dim parameters As String = String.Format(
        "{{""apiKey"":""{0}"",""phoneNumbers"":""{1}"",""notifyUrl"":""{2}""}}",
        apiKey,
        "+33XXXXXXXXX",
        "http://...")
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
			("phoneNumbers", phone_numbers,
			"notifyUrl", notify_url)
		])
 
		url = URL + "/hlr/notify"
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
curl -H  "Content-Type: application/json" -X POST -d '{"apiKey":"xxxxx","phoneNumbers":"xxxx","notifyUrl":"http://..."}' https://api.smspartner.fr/v1/hlr/notify
   </code></pre>
  </div>

  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <pre><code>
const axios = require('axios');

const data = {
    apiKey: 'YOUR API KEY',
    phoneNumbers: '+336xxxxxxxx',
    notifyUrl: 'http://...'
};

axios.post('https://api.smspartner.fr/v1/hlr/notify', data)
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

public class HLRRequest {
    public static void main(String[] args) {
        try {
            String url = "https://api.smspartner.fr/v1/hlr/notify";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json");
            con.setDoOutput(true);

            // Prepare data for POST request
            String jsonInputString = new Gson().toJson(new RequestBody("YOUR API KEY", "+336xxxxxxxx", "http://..."));
            
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
    private String notifyUrl;

    public RequestBody(String apiKey, String phoneNumbers, String notifyUrl) {
        this.apiKey = apiKey;
        this.phoneNumbers = phoneNumbers;
        this.notifyUrl = notifyUrl;
    }
}

   </code></pre>
  </div>

   <div class="tab-pane fade" id="swift" role="tabpanel" aria-labelledby="swift-tab">
    <pre><code>
import Foundation

let url = URL(string: "https://api.smspartner.fr/v1/hlr/notify")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("application/json", forHTTPHeaderField: "Content-Type")

let parameters: [String: Any] = [
    "apiKey": "YOUR API KEY",
    "phoneNumbers": "+336xxxxxxxx",
    "notifyUrl": "http://..."
]

do {
    request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
} catch {
    print("Error: Cannot create JSON from parameters")
    return
}

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    guard let data = data, error == nil else {
        print("Error: (error?.localizedDescription ?? "Unknown error")")
        return
    }
    // Process your response here
    let responseString = String(data: data, encoding: .utf8)
    print("Response: (responseString ?? "No response")")
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
    NotifyUrl   string `json:"notifyUrl"`
}

func main() {
    url := "https://api.smspartner.fr/v1/hlr/notify"

    requestBody := RequestBody{
        ApiKey:      "YOUR API KEY",
        PhoneNumbers: "+336xxxxxxxx",
        NotifyUrl:   "http://...",
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
        var url = "https://api.smspartner.fr/v1/hlr/notify";
        var client = new HttpClient();

        var data = new
        {
            apiKey = "YOUR API KEY",
            phoneNumbers = "+336xxxxxxxx",
            notifyUrl = "http://..."
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
    "campaign_id": "HLR000000",
    "number": 1,
    "cost": 0.005,
    "currency": "EUR"
}

  ```










## Errors
Example of an error message:

### JSON
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



## Example of an HLR request notification
```json
Array(
    'phone' => '+3300000000',
    'messageId'=>'1234-12344-1234-1234',
    'mccMnc' => '20815',
    'ported'=> 1,
    'errorGrpId'=> 0,
    'errorName'=> 'NO_ERROR ',
    'errorDesc'=>'No Error' ,
    'date'=>'2018-03-05T10:34:52.355+0000'
)
```

## HLR error codes

| ErrorGrpId	  | Error Codes |
| :---------------: |:---------------|
| 0 | <code>NO_ERROR:</code> No error. |
| 1 | <code>EC_UNKNOWN_SUBSCRIBER:</code> The number does not exist or has not been assigned to any active subscriber in the operator's user database. |
| 5 | <code>EC_UNIDENTIFIED_SUBSCRIBER:</code> Unidentified subscriber. |
| 6 | <code>EC_ABSENT_SUBSCRIBER_SM:</code> As there was no response, the subscriber has been detected as unavailable. This is often due to the phone being turned off or in a low signal area. |
| 7 | <code>EC_UNKNOWN_EQUIPMENT:</code> The mobile device was not recognized by the EIR (Equipment Identity Register) during the device check at the MAP protocol level on the operator's infrastructure. |
| 8 | <code>EC_ROAMING_NOT_ALLOWED:</code> The subscriber is currently roaming in another country or using another operator's infrastructure – roaming delivery is not guaranteed due to the lack of roaming agreements between many different operators. |
| 9 | <code>EC_ILLEGAL_SUBSCRIBER:</code> Illegal subscriber. |
| 12 | <code>EC_ILLEGAL_EQUIPMENT:</code> Illegal equipment. |
| 13 | <code>EC_CALL_BARRED:</code> The subscriber is configured on the NPD (No Disturb) service and does not receive any service traffic to their number. |
| 27 | <code>EC_ABSENT_SUBSCRIBER:</code> The subscriber is offline. This is often due to the phone being turned off. |
| 255 | <code>EC_UNKNOWN_ERROR:</code> Unknown error. |














