---
title: Sending Statistics
description: >
---
# Sending Statistics
This request is used to retrieve sending statistics for a specific period. It allows you to get the number of SMS sent and the associated cost of these sends.


## URL

<div>
  <div style="background-color: #FF4C4C; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style="color: red; display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/statistics/cost-resume</span>
</div>


## Parameters

| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You can obtain it from your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |

A limit of 5 requests per minute is applied.
          
| Parameter **interval**   | Description |
|:-----------------:|-------------| 
| **last_month**      | The previous month. |
|**last_twelve_months**| Last 12 months | 
|**from**| Start date for custom interval | 
| **custom** | In this case, start date (from) and end date (to) are required. |



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
&lt;? // Prepare data for GET request
       $apiKey = 'YOUR_API_KEY';
$url = 'https://api.smspartner.fr/v1/statistics/cost-resume?apiKey=' 
. $apiKey . '&interval=last_twelve_months'; 

// Initialise cURL session
$ch = curl_init($url);

// Set cURL options
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Execute cURL session and fetch the result
$response = curl_exec($ch);

// Handle errors
if (curl_errno($ch)) {
    echo 'Erreur: ' . curl_error($ch);
} else {
    // Decode the result
    $data = json_decode($response, true);
    print_r($data);
}

// Close cURL session
curl_close($ch);
?&gt;
    </code></pre>
  </div>
 <div class="tab-pane fade" id="vbnet" role="tabpanel" aria-labelledby="vbnet-tab">
   <pre><code class="language-vbnet">
Imports System.Net
Imports System.IO

Module Module1
    Sub Main()
        ' Prepare data for GET request
        Dim apiKey As String = "YOUR_API_KEY"
        Dim url As String = "https://api.smspartner.fr/v1/statistics/cost-resume?apiKey=" 
        & apiKey & "&interval=last_twelve_months"

        ' Initialise WebRequest
        Dim request As WebRequest = WebRequest.Create(url)
        request.Method = "GET"

        ' Get the response
        Try
            Dim response As WebResponse = request.GetResponse()
            Using dataStream As Stream = response.GetResponseStream()
                Using reader As New StreamReader(dataStream)
                    Dim responseFromServer As String = reader.ReadToEnd()
                    ' Decode the result
                    Dim data As Object = Newtonsoft.Json.JsonConvert.DeserializeObject
                    (responseFromServer)
                    Console.WriteLine(data)
                End Using
            End Using
            response.Close()
        Catch e As WebException
            Console.WriteLine("Error: " & e.Message)
        End Try
    End Sub
End Module
   </code></pre>
  </div>
  <div class="tab-pane fade" id="python" role="tabpanel" aria-labelledby="python-tab">
 <pre><code class="language-go">
   import requests
apiKey = 'YOUR_API_KEY'
url = f'https://api.smspartner.fr/v1/statistics/cost-resume?
apiKey={apiKey}&interval=last_twelve_months'

try:
    response = requests.get(url)
    response.raise_for_status()
    data = response.json()
    print(data)
except requests.exceptions.RequestException as e:
    print(f"Erreur: {e}")


Ou avec la bibliothèque 'urllib':

import json
from urllib import request, error

apiKey = 'YOUR_API_KEY'
url = f'https://api.smspartner.fr/v1/statistics/cost-resume?
apiKey={apiKey}&interval=last_twelve_months'

try:
    with request.urlopen(url) as response:
        data = json.load(response)
        print(data)
except error.URLError as e:
    print(f"Erreur: {e.reason}")
    </pre> </code>
  </div>
    <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code class="language-bash">
curl -H "Content-Type: application/json" -X GET 
"https://api.smspartner.fr/v1/statistics/cost-resume
?apiKey=YOUR_API_KEY&interval=last_twelve_months"  </code></pre>
  </div>
  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code class="language-javascript">
const https = require(`'https');

let apiKey = 'YOUR_API_KEY';
let url = `https://api.smspartner.fr/v1/statistics/cost-resume?apiKey=${apiKey}
&interval=last_twelve_months`; // 12 derniers mois
//interval=last_month // 1 dernier mois
//interval=custom&from=21-10-2022&to=21-10-2022 // intervalle personnalisé

https.get(url, (res) => {
  let data = '';

  res.on('data', (chunk) => {
    data += chunk;
  });

  res.on('end', () => {
    console.log(JSON.parse(data));
  });

}).on("error", (err) => {
  console.log("Erreur: " + err.message);
});
   </code></pre>
  </div>
  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code class="language-java">
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class StatistiqueDesEnvois {
    public static void main(String[] args) {
        try {
            // Prepare data for GET request
            String apiKey = "YOUR_API_KEY";
            String interval = "last_twelve_months";
            //interval=last_month // 1 dernier mois
//interval=custom&from=21-10-2022&to=21-10-2022 // intervalle personnalisé

            // Create GET request URL
            String urlString = 
            "https://api.smspartner.fr/v1/statistics/cost-resume?" +
                    "apiKey=" + apiKey + "&interval=" + interval;

            // Create URL object
            URL url = new URL(urlString);

            // Create HTTP connection
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(10000);
            connection.setReadTimeout(10000);

            // Send GET request
            int responseCode = connection.getResponseCode();

            // Get response
            BufferedReader reader;
            if (responseCode >= 200 && responseCode <= 299) {
                reader = new BufferedReader(
                new InputStreamReader(connection.getInputStream()));
            } else {
                reader = new BufferedReader(
                new InputStreamReader(connection.getErrorStream()));
            }

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

struct StatistiqueDesEnvois: View {
    @State private var result: String = "Loading..."

    var body: some View {
        VStack {
            Text("Statistique Des Envois")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: getStatistics)
    }

    func getStatistics() {
        let apiKey = "YOUR_API_KEY"
        let interval = "last_twelve_months"
        let urlString = "https://api.smspartner.fr/v1/statistics/cost-resume
        ?apiKey=(apiKey)&interval=(interval)"

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            result = "Invalid URL"
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: (error)")
                DispatchQueue.main.async {
                    self.result = "Error: (error)"
                }
            } else if let data = data {
                let str = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    self.result = str ?? "Error"
                }
            }
        }

        task.resume()
    }
}
   </code></pre>
  </div>
  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
<pre><code class="language-go">
  package main
import (
	"io/ioutil"
	"log"
	"net/http"
	"time"
)

func main() {
	// Prepare data for GET request
	apiKey := "YOUR_API_KEY"
	interval := "last_twelve_months" // last month: "last_month", custom interval: 
  "custom&from=21-10-2022&to=21-10-2022"

	// Create GET request URL
	url := "https://api.smspartner.fr/v1/statistics/cost-resume?" +
		"apiKey=" + apiKey + "&interval=" + interval

	// Create HTTP client
	client := &http.Client{Timeout: 10 * time.Second}

	// Send GET request
	resp, err := client.Get(url)
	if err != nil {
		log.Fatalf("Error sending request: %v", err)
	}
	defer resp.Body.Close()

	// Get response
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		log.Fatalf("Error reading response body: %v", err)
	}

	// Process your response here
	log.Printf("Response: %s", body)
}
   </code></pre>
  </div>
  <div class="tab-pane fade" id="csharp" role="tabpanel" aria-labelledby="csharp-tab">
    <!-- C# code example goes here -->
    <pre><code class="language-csharp">
using System;
using System.Net.Http;
using System.Threading.Tasks;

class Program
{
    private static readonly HttpClient client = new HttpClient();

    static async Task Main(string[] args)
    {
        var apiKey = "VOTRE_CLÉ_API";
        var interval = "last_twelve_months"; // Changer à "last_month" pour le dernier mois, "custom" pour un intervalle personnalisé
        var uri = new Uri
        ($"https://api.smspartner.fr/v1/statistics/cost-resume?apiKey={apiKey}&interval={interval}"); // Ajoutez "&from=date&to=date" pour un intervalle personnalisé

        // Envoyer la requête GET
        HttpResponseMessage response = await client.GetAsync(uri);

        if (response.IsSuccessStatusCode)
        {
            // Lire la réponse
            var result = await response.Content.ReadAsStringAsync();
            Console.WriteLine(result);
        }
        else
        {
            // Afficher un message en cas d'échec de la requête GET
            Console.WriteLine("La requête GET a échoué avec le code de statut: " + response.StatusCode);
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
"datas": [        
{            
"month": "october",            
"year": "2021",            
"m": "10",            
"date": 1633039200,            
"type": "month",            
"cost": "49.174",            
"nb_send": "1210"        
},        


{            
"month": "november",            
"year": "2021",            
"m": "11",            
"date": 1635721200,            
"type": "month",            
"cost": "67.674",            
"nb_send": "1409"        
},
```
### 3 possible delivery statuses
* **Delivered**
* **Not delivered**
* **Waiting**



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
| 10 | Incorrect API Key |
| 200 | Everything went well! |



