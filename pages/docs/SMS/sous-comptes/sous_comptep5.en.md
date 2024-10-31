---
title: Add Credits
description: >
---
# Adding Credit
> From your account, you can add credits to your sub-accounts. The credits will be debited from your main account.


## URL

<div>
  <div style="background-color: #49CC90; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style="color: #FF4C4C; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/subaccount/credit/add</span>
</div>


## Parameters
Each API request supports the following parameters:

| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You can obtain it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **credit** |Amount of credit in Euros to add to the sub-account.|
| **tokenSubaccount**   |Identifier of the sub-account. |
## Optional parameters
_format : Response format. You can choose between <strong>JSON</strong> or <strong>XML</strong>. By default, the response format is <strong>JSON.</strong> 



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
&lt;? 
        // Prepare data for POST request
        $fields = array(
            'apiKey'=> 'YOUR API KEY',
            'credit'=> '100',
            'tokenSubaccount'=>'identifiant du sous-compte'
            );
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.smspartner.fr/v1/subaccount/credit/add');
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
   <pre><code class="language-vbnet">
Imports System.IO
Imports System.Net
 
Module Module1
 
  Sub Main()
 
    Dim base_url As String = "http://api.smspartner.fr/v1/"
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
 <pre><code class="language-python">
# std
import logging
import json
from collections import OrderedDict
 
# 3p
import requests
 
API_KEY = "MY API KEY"
URL = "https://api.smspartner.fr/v1"
 
class SMSPartner():
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
    <!-- cURL code example goes here -->
    <pre><code class="language-bash">
curl -H  "Content-Type: application/json" -X POST -d
 '{"apiKey":"xxxxx","credit":"10","tokenSubaccount":
 "identifiant du sous-compte"}' https://api.smspartner.fr/v1/subaccount/credit/add
  </code></pre>
  </div>

    <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code class="language-javascript">
const https = require('https');

// permet d'ajouter des crédits à un sous-compte
//Depuis votre compte, il vous est possible d’ajouter des crédits sur vos sous comptes. Les crédits seront débités de votre compte principal.
let data = JSON.stringify({
  apiKey: 'YOUR API KEY',
  credit: '100',
  tokenSubaccount: 'identifiant du sous-compte'
});

let options = {
  hostname: 'api.smspartner.fr',
  path: '/v1/subaccount/credit/add',
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Content-Length': data.length
  }
};

let req = https.request(options, (res) => {
  let data = '';

  res.on('data', (chunk) => {
    data += chunk;
  });

  res.on('end', () => {
    console.log(JSON.parse(data));
  });

}).on("error", (err) => {
  console.log("Error: " + err.message);
});

req.write(data);
req.end();
        </code></pre>
  </div>

  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code class="language-java">
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class AjouterRetirerDesCredits {
    public static void main(String[] args) {
        try {
            // Prepare data for POST request
            String apiKey = "YOUR API KEY";
            int credit = 100;
            String tokenSubaccount = "identifiant du sous-compte";

            // Create JSON payload
            String jsonPayload = "{"apiKey": "" + apiKey + "", "credit": " + credit + ", "tokenSubaccount": "" + tokenSubaccount + ""}";

            // Create POST request
            URL url = new URL("https://api.smspartner.fr/v1/subaccount/credit/add");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);

            // Send POST request
            OutputStream outputStream = connection.getOutputStream();
            outputStream.write(jsonPayload.getBytes());
            outputStream.flush();
            outputStream.close();

            // Get response
            int responseCode = connection.getResponseCode();
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            // Process your response here
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
    <pre><code class="language-swift">
import SwiftUI

struct AjoutCreditSousCompte: View {
    @State private var result: String = "Loading..."

    var body: some View {
        VStack {
            Text("Ajout Credit Sous Compte")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: ajoutCreditSousCompte)
    }

    func ajoutCreditSousCompte() {
        let apiKey = "YOUR_API_KEY"
        let credit = "100"
        let tokenSubaccount = "identifiant du sous-compte"

        let urlString = "https://api.smspartner.fr/v1/subaccount/credit/add"
        let url = URL(string: urlString)!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "apiKey": apiKey,
            "credit": credit,
            "tokenSubaccount": tokenSubaccount
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: (error)")
            } else if let data = data {
                let resultString = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    self.result = resultString ?? "Error"
                }
            }
        }

        task.resume()
    }
}

struct AjoutCreditSousCompte_Previews: PreviewProvider {
    static var previews: some View {
        AjoutCreditSousCompte()
    }
}
   </code></pre>
  </div>
  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
<pre><code class="language-go">
package main

import (
	"bytes"
	"encoding/json"
	"io/ioutil"
	"log"
	"net/http"
)

type SubaccountData struct {
	APIKey         string `json:"apiKey"`
	Credit         string `json:"credit"`
	TokenSubaccount string `json:"tokenSubaccount"`
}

func main() {
	apiKey := "YOUR_API_KEY"
	credit := "100"
	tokenSubaccount := "identifiant du sous-compte"

	// Create POST request data
	data := SubaccountData{
		APIKey:         apiKey,
		Credit:         credit,
		TokenSubaccount: tokenSubaccount,
	}
	jsonData, _ := json.Marshal(data)

	// Create POST request
	req, err := http.NewRequest("POST", "https://api.smspartner.fr/v1/subaccount/credit/add", bytes.NewBuffer(jsonData))
	if err != nil {
		log.Fatalf("Error creating request: %v", err)
	}
	req.Header.Set("Content-Type", "application/json")

	// Send the request
	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		log.Fatalf("Error sending request: %v", err)
	}
	defer resp.Body.Close()

	// Read the response
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatalf("Error reading response: %v", err)
	}

	// Print the response body
	log.Printf("Response body: %s", string(body))
}
   </code></pre>
  </div>

  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
    <!-- C# code example goes here -->
    <pre><code class="language-csharp">
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

class Program
{
    private static readonly HttpClient client = new HttpClient();

    static async Task Main(string[] args)
    {
        var data = new
        {
            apiKey = "YOUR API KEY",
            credit = "100",
            tokenSubaccount = "Subaccount ID"
        };

        string jsonString = JsonConvert.SerializeObject(data);

        var content = new StringContent(jsonString, Encoding.UTF8, "application/json");

        HttpResponseMessage response = await client.PostAsync("https://api.smspartner.fr/v1/subaccount/credit/add", content);

        if (response.IsSuccessStatusCode)
        {
            string result = await response.Content.ReadAsStringAsync();
            Console.WriteLine(result);
        }
        else
        {
            Console.WriteLine("POST request failed with status code: " + response.StatusCode);
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
    "code": 200,
    "credit": 2869.2,
    "subaccountCredit": 61.8,
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
    "message": "Incorrect API Key"
}
```
## Control Codes

| _  | Error Codes |
| :---------------: |:---------------|
| 1 | API Key is required |
|2 | Credit is required|
|3 | The identifier of the sub-account is required |
|4 | You do not have the permission|
|5 | Credit to attribute must be greater than 0|
|6 | The balance must be greater than 0|
|7 | 	The sub-account does not exist|
|8 | Insufficient credit|
|9 | Invalid API key|
| 200 | Everything went well! |



