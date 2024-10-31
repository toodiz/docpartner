

---
title: Sending Emails
description: >
---

# Sending Emails

This request is used to send emails in real-time or on a delayed schedule.











## URL
<div>
  <div style="background-color: #49CC90; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;">http://api.mailpartner.fr/v1/send</span>
</div>












## Parameters

Each API request supports the following parameters:



<div class="alert alert-info">
        
The platform does not send commercial emails between 8 PM and 8 AM on weekdays, as well as on Sundays and public holidays (legal restriction). If an email is sent, the message will be paused until the next working day at 8 AM. Not sending commercial emails? Contact us to disable this restriction:<a href="mailto:help@smspartner.fr"> help@smspartner.fr</a>
    </div>

| Parameter  | Description |
| :--------------- |:---------------|
| **apiKey** | Your account's API key. You get it in your <a href="http://my.mailpartner.fr/dashboard/api" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">Mail Partner account</a>.
 |
| **subject** | Subject of the mail |
| **htmlContent** | Email content in HTML. <br>The tag #READ_ONLINE# adds the link "If this email is not displayed correctly, please use the following link:" <br>The tag #UNSUBSCRIBE_LINK# adds the unsubscribe link. |
| **to**             | You can add up to 500 receivers. <br> **email**: Receiver's email <br> **name** (optional): Receiver's name |


## Optional Parameters

| Parameter                  | Description                                                                                                                                                                           |
| :-------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **replyTo**                | **email**: example@email.com <br> **name** (optional): John Doe                                                                                                                    |
| **variables**              | You can add up to 8 custom variables containing text only (no HTML). <br> **Example:** <br> <code>"variables":{"firstname":"John", "lastname": "Doe"}</code><br>These variables must be added in the template or in htmlContent as follows:<br>#FIRSTNAME# and #LASTNAME# |
| **attachments**            |                                                                                                                                                                                      |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|                            | Up to 3 attachments. 5MB per attachment.                                                                                                                                           |
|                            | **base64Content**| The content must be encoded in Base64. You must also specify the MIME type and a filename.<br> <code>"attachments":<br>[{<br>"base64Content": "VGhpcyBpcyB5b3VyIGF0dGFjaGVkIGZpbGUhISEK",<br>"contentType": "text/plain",<br>"filename": "test"<br>}]</code> 
|                            | **filename**      | Attachment name (without extension).                                                                                                                                                |
|                            | **contentType**   | MIME type of the attachment.<br>You can view the official list of MIME types [here](https://www.iana.org/assignments/media-types/media-types.xhtml).<br>For the content, you can find an online Base64 encoder – for example, [here](#).<br>Once the file is encoded, use the resulting string as the value for Base64Content. |
| **tag**                    | Lowercase identifier (no spaces) between 3 and 20 characters.                                                                                                                     |
| **scheduledDeliveryDate**  | Email sending date, in the format <code>dd/mm/YYYY</code>. To be specified only if you want the emails to be sent with a delay.                                                                |
| **time**                   | Email sending time (0-24 format), required if <code>scheduledDeliveryDate</code> is specified.                                                                                                 |
| **minute**                 | Minute of email sending (0-55 format, in five-minute intervals).<br>Required if <code>scheduledDeliveryDate</code> is specified.                                                               |
| **sandbox**                | To test the email sending, you can use the sandbox parameter:<br>1 to activate <code>sandbox</code> mode.<br>No emails will be sent, and there will be no charge to your account.<br>These emails will be automatically deleted from your sending lists every day. |
| **_format**                | Response format. You can choose between JSON or XML. By default, the response format is JSON.                                                                                     |












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
        $jsonParams = "{
       "apiKey": "Your API kEY",
       "subject": "Sujet de mon email",
       "sandbox":0,
       "htmlContent": "Mon premier <strong>email</strong>",
       "scheduledDeliveryDate":"25/09/2020",
       "time":"12",
       "minute":"00",
       "params": 
        {
         "to": [
         {
          "email": "email1", "name":"email1"
         },
         {
          "email": "email2", "name":"email2"
         },
         {
          "email": "email3"
         }
        ]
       }
       }"
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'http://api.mailpartner.fr/v1/send');
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($curl, CURLOPT_TIMEOUT, 10);
        curl_setopt($curl, CURLOPT_POST, 1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, $jsonParams);
 
        $result = curl_exec($curl);
        curl_close($curl);
 
        // Process your response here
        echo $result;

?&gt;
    </code></pre>
  </div>
  <div class="tab-pane fade" id="vbnet" role="tabpanel" aria-labelledby="vbnet-tab">
   <pre><code>
Imports System.Net.Http
Imports System.Text
Imports Newtonsoft.Json

Module Module1
    Sub Main()
        Dim client As New HttpClient()
        Dim url As String = "http://api.mailpartner.fr/v1/send"
        
        Dim jsonParams As String = JsonConvert.SerializeObject(New With {
            .apiKey = "Your API kEY",
            .subject = "Sujet de mon email",
            .sandbox = 0,
            .htmlContent = "Mon premier <strong>email</strong>",
            .scheduledDeliveryDate = "25/09/2020",
            .time = "12",
            .minute = "00",
            .params = New With {
                .to = New Object() {
                    New With {.email = "email1", .name = "email1"},
                    New With {.email = "email2", .name = "email2"},
                    New With {.email = "email3"}
                }
            }
        })
        
        Dim content As New StringContent(jsonParams, Encoding.UTF8, "application/json")
        Dim response = client.PostAsync(url, content).Result
        
        Dim result As String = response.Content.ReadAsStringAsync().Result
        Console.WriteLine(result)
    End Sub
End Module

   </code></pre>
  </div>
  <div class="tab-pane fade" id="python" role="tabpanel" aria-labelledby="python-tab">
    <!-- Python code example goes here -->
    <pre><code>
import requests
import json

url = "http://api.mailpartner.fr/v1/send"
json_params = {
    "apiKey": "Your API kEY",
    "subject": "Sujet de mon email",
    "sandbox": 0,
    "htmlContent": "Mon premier <strong>email</strong>",
    "scheduledDeliveryDate": "25/09/2020",
    "time": "12",
    "minute": "00",
    "params": {
        "to": [
            {"email": "email1", "name": "email1"},
            {"email": "email2", "name": "email2"},
            {"email": "email3"}
        ]
    }
}

response = requests.post(url, json=json_params)
print(response.text)

   </code></pre>
  </div>
  <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code>
curl -X POST http://api.mailpartner.fr/v1/send 
-H "Content-Type: application/json" 
-d '{
    "apiKey": "Your API kEY",
    "subject": "Sujet de mon email",
    "sandbox": 0,
    "htmlContent": "Mon premier <strong>email</strong>",
    "scheduledDeliveryDate": "25/09/2020",
    "time": "12",
    "minute": "00",
    "params": {
        "to": [
            {"email": "email1", "name": "email1"},
            {"email": "email2", "name": "email2"},
            {"email": "email3"}
        ]
    }
}'

   </code></pre>
  </div>
  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code>
const axios = require('axios');

const url = 'http://api.mailpartner.fr/v1/send';
const jsonParams = {
    apiKey: "Your API kEY",
    subject: "Sujet de mon email",
    sandbox: 0,
    htmlContent: "Mon premier <strong>email</strong>",
    scheduledDeliveryDate: "25/09/2020",
    time: "12",
    minute: "00",
    params: {
        to: [
            { email: "email1", name: "email1" },
            { email: "email2", name: "email2" },
            { email: "email3" }
        ]
    }
};

axios.post(url, jsonParams)
    .then(response => console.log(response.data))
    .catch(error => console.error(error));
    
   </code></pre>
  </div>
  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code>
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import com.fasterxml.jackson.databind.ObjectMapper;

public class Main {
    public static void main(String[] args) {
        try {
            String url = "http://api.mailpartner.fr/v1/send";
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json");
            
            // Prepare JSON parameters
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonParams = objectMapper.writeValueAsString(new RequestData("Your API kEY"));

            con.setDoOutput(true);
            OutputStream os = con.getOutputStream();
            os.write(jsonParams.getBytes());
            os.flush();
            os.close();

            int responseCode = con.getResponseCode();
            System.out.println("Response Code: " + responseCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

class RequestData {
    public String apiKey;
    public String subject;
    public int sandbox;
    public String htmlContent;
    public String scheduledDeliveryDate;
    public String time;
    public String minute;
    public Params params;

    public RequestData(String apiKey) {
        this.apiKey = apiKey;
        this.subject = "Sujet de mon email";
        this.sandbox = 0;
        this.htmlContent = "Mon premier <strong>email</strong>";
        this.scheduledDeliveryDate = "25/09/2020";
        this.time = "12";
        this.minute = "00";
        this.params = new Params();
    }

    static class Params {
        public To[] to;

        public Params() {
            this.to = new To[]{
                new To("email1", "email1"),
                new To("email2", "email2"),
                new To("email3", null)
            };
        }
    }

    static class To {
        public String email;
        public String name;

        public To(String email, String name) {
            this.email = email;
            this.name = name;
        }
    }
}

   </code></pre>
  </div>
  <div class="tab-pane fade" id="swift" role="tabpanel" aria-labelledby="swift-tab">
    <!-- SWIFT code example goes here -->
    <pre><code>
import Foundation

let url = URL(string: "http://api.mailpartner.fr/v1/send")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.addValue("application/json", forHTTPHeaderField: "Content-Type")

let jsonParams: [String: Any] = [
    "apiKey": "Your API kEY",
    "subject": "Sujet de mon email",
    "sandbox": 0,
    "htmlContent": "Mon premier <strong>email</strong>",
    "scheduledDeliveryDate": "25/09/2020",
    "time": "12",
    "minute": "00",
    "params": [
        "to": [
            ["email": "email1", "name": "email1"],
            ["email": "email2", "name": "email2"],
            ["email": "email3"]
        ]
    ]
]

do {
    request.httpBody = try JSONSerialization.data(withJSONObject: jsonParams, options: [])
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: (error)")
            return
        }
        if let data = data, let responseString = String(data: data, encoding: .utf8) {
            print("Response: (responseString)")
        }
    }
    task.resume()
} catch {
    print("Error serializing JSON: (error)")
}

   </code></pre>
  </div>
  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
    <!-- GO code example goes here -->
    <pre><code>
package main

import (
    "bytes"
    "encoding/json"
    "fmt"
    "net/http"
)

func main() {
    url := "http://api.mailpartner.fr/v1/send"

    jsonParams := map[string]interface{}{
        "apiKey":                "Your API kEY",
        "subject":               "Sujet de mon email",
        "sandbox":               0,
        "htmlContent":           "Mon premier <strong>email</strong>",
        "scheduledDeliveryDate":  "25/09/2020",
        "time":                  "12",
        "minute":                "00",
        "params": map[string]interface{}{
            "to": []map[string]interface{}{
                {"email": "email1", "name": "email1"},
                {"email": "email2", "name": "email2"},
                {"email": "email3"},
            },
        },
    }

    jsonData, err := json.Marshal(jsonParams)
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

    var responseBody bytes.Buffer
    responseBody.ReadFrom(resp.Body)
    fmt.Println(responseBody.String())
}

   </code></pre>
  </div>
  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
    <!-- C# code example goes here -->
    <pre><code>
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

class Program
{
    static async Task Main()
    {
        var url = "http://api.mailpartner.fr/v1/send";
        
        var jsonParams = new
        {
            apiKey = "Your API kEY",
            subject = "Sujet de mon email",
            sandbox = 0,
            htmlContent = "Mon premier <strong>email</strong>",
            scheduledDeliveryDate = "25/09/2020",
            time = "12",
            minute = "00",
            @params = new
            {
                to = new[]
                {
                    new { email = "email1", name = "email1" },
                    new { email = "email2", name = "email2" },
                    new { email = "email3" }
                }
            }
        };

        var json = JsonConvert.SerializeObject(jsonParams);
        var content = new StringContent(json, Encoding.UTF8, "application/json");

        using (var client = new HttpClient())
        {
            var response = await client.PostAsync(url, content);
            var result = await response.Content.ReadAsStringAsync();
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
    "code": 200,
    "messageId": "xxx",
    "nbMail": 1,
    "cost": 1,
    "currency": "EUR",
    "scheduledDeliveryDate": "2020-09-25 12:00:00"
}

```












