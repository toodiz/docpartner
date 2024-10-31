---
title: Cancel Deferred Email Sending
description: Page 03 MAIL.
---

# Cancel Deferred Email Sending


This request is used to cancel a deferred email sending.




## URL
<div>
  <div style="background-color: #FF4C4C; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/message-cancel</span>
</div>





## Parameters

Each API request supports the following parameters:

| Parameter  | Description |
| :--------------- |:---------------|
| **apiKey** | Your account's API key. You get it in your SMS Partner account.
 |
| **messageId** | Found in the response when sending an email |

### Optional Parameters

| Parameter  | Description |
| :--------------- |:---------------|
| **_format** | Response format. You can choose between JSON or XML. By default, the response format is JSON. |

<div class="alert alert-info">
             Note !! It is not possible to cancel the sending of an email <strong>less than 5 minutes before its sending</strong>.
    </div>






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
        curl_setopt($curl, CURLOPT_URL,'https://api.mailpartner.fr/v1/message-cancel?'.$data);
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
    Dim messageId As Integer = XXX
 
    #check credits
    Dim url As String
    url = base_url & "message-cancel" & "?apiKey=" & apiKey & "&messageId=" & messageId
 
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
    def get_delivery(self,phone_numbers,message_id):
        url = URL + "/message-cancel?apiKey=" + API_KEY + "&messageId=" + message_id
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
  curl -H  "Content-Type: application/json" -X GET  https://api.mailpartner.fr/v1/message-cancel?apiKey=xxx&messageId=300
   </code></pre>
  </div>

  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code>
const https = require('https');

// API key and base URL
const API_KEY = 'MY API KEY';
const URL = 'https://api.smspartner.fr/v1/message-cancel';
// Prepare data for the GET request
let messageId = 'YOUR_MESSAGE_ID';
let url = `${URL}?apiKey=${API_KEY}&messageId=${messageId}`;

https.get(url, (res) => {
  let data = ';

  // A chunk of data has been received.
  res.on('data', (chunk) => {
    data += chunk;
  });

  // The entire response has been received. Print the result.
  res.on('end', () => {
    console.log(JSON.parse(data));
  });

}).on("error", (err) => {
  // An error message will be printed in case of an error.
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

public class MailPartner {
    // API key and base URL
    private static final String API_KEY = "MY API KEY";
    private static final String URL_BASE = "https://api.smspartner.fr/v1/message-cancel";

    public static void main(String[] args) {
        // Message ID to cancel
        String messageId = "YOUR_MESSAGE_ID";

        // Build the request URL
        String urlString = URL_BASE + "?apiKey=" + API_KEY + "&messageId=" + messageId;

        try {
            // Create the URL
            URL url = new URL(urlString);
            // Open the connection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");

            // Read the response
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String inputLine;
            StringBuilder content = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                content.append(inputLine);
            }

            // Close streams
            in.close();
            connection.disconnect();

            // Print the result
            System.out.println(content.toString());
        } catch (Exception e) {
            // Print the error message if an exception occurs
            System.out.println("Error: " + e.getMessage());
        }
    }
}


   </code></pre>
  </div>

   <div class="tab-pane fade" id="swift" role="tabpanel" aria-labelledby="swift-tab">
    <!-- SWIFT code example goes here -->
    <pre><code>
import Foundation

// API key and base URL
let apiKey = "MY API KEY"
let urlBase = "https://api.smspartner.fr/v1/message-cancel"

// Message ID to cancel
let messageId = "YOUR_MESSAGE_ID"

// Build the request URL
let urlString = "(urlBase)?apiKey=(apiKey)&messageId=(messageId)"
guard let url = URL(string: urlString) else {
    print("Error: Invalid URL")
    exit(1)
}

// Create a session
let session = URLSession.shared

// Create the data task
let task = session.dataTask(with: url) { data, response, error in
    // Handle errors
    if let error = error {
        print("Error: (error.localizedDescription)")
        return
    }

    // Check the response
    guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
        print("Error: Invalid server response")
        return
    }

    // Check the data
    guard let data = data else {
        print("Error: Empty data")
        return
    }

    // Print the result
    if let jsonString = String(data: data, encoding: .utf8) {
        print(jsonString)
    } else {
        print("Error: Unable to convert data to string")
    }
}

// Start the task
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
)

func main() {
    // API key and base URL
    apiKey := "MY API KEY"
    urlBase := "https://api.smspartner.fr/v1/message-cancel"

    // Message ID to cancel
    messageId := "YOUR_MESSAGE_ID"

    // Build the request URL
    url := fmt.Sprintf("%s?apiKey=%s&messageId=%s", urlBase, apiKey, messageId)

    // Make the GET request
    resp, err := http.Get(url)
    if err != nil {
        fmt.Printf("Error: %v
", err)
        return
    }
    defer resp.Body.Close()

    // Read the response
    body, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        fmt.Printf("Error: %v
", err)
        return
    }

    // Check the HTTP response status
    if resp.StatusCode != http.StatusOK {
        fmt.Printf("Error: HTTP Status %d
", resp.StatusCode)
        return
    }

    // Print the result
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
        // API key and base URL
        string apiKey = "MY API KEY";
        string urlBase = "https://api.smspartner.fr/v1/message-cancel";

        // Message ID to cancel
        string messageId = "YOUR_MESSAGE_ID";

        // Build the request URL
        string url = $"{urlBase}?apiKey={apiKey}&messageId={messageId}";

        // Create an HTTP client
        using (HttpClient client = new HttpClient())
        {
            try
            {
                // Make the GET request
                HttpResponseMessage response = await client.GetAsync(url);
                response.EnsureSuccessStatusCode();

                // Read the response
                string responseBody = await response.Content.ReadAsStringAsync();

                // Print the result
                Console.WriteLine(responseBody);
            }
            catch (HttpRequestException e)
            {
                // Print the error message if an exception occurs
                Console.WriteLine($"Error: {e.Message}");
            }
        }
    }
}

   </code></pre>
  </div>
</div>


## Response
<!-- Tab panes pour JSON et XML -->
```json
 "success": true,
  "code": 200,
  "message": "The email has been canceled."


  ```
  




## Code de contrôle

| Code  | Response |
| :---------------: |:---------------|
|1 | API key is required |
|3 | Message ID is required |
|4 | Message not found |
|5 | The mail has already been canceled |
|6 | You cannot cancel the mail less than 5 minutes before its scheduled time |
|7 | You cannot cancel a mail that has already been sent |
|10 | Incorrect API key |
|200 | Everything went well! |






