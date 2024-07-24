-- Insertion dans la table chemin
INSERT INTO chemin (path) VALUES 
('pages/docs/sms/envoyer-des-sms/envois_smsp5.en.md');

-- Insertion dans la table introduction
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Send a Survey
description: >
---
# Send a Survey
This request is used to send a survey in real-time or scheduled.

', 'en', 22); 

-- Insertion dans la table URLAPI
INSERT INTO URLAPI (textcode, id_chemin) VALUES 
('## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> https://api.smspartner.fr/v1/sondage/to/send</span>
</div>

', 22);

-- Insertion dans la table PARAMETRE
INSERT INTO PARAMETRE (textcode, langue, id_chemin) VALUES 
('
## Parameters

   <div class="alert alert-info">
        The platform does not send commercial SMS between <strong>8 PM and 8 AM on weekdays and on Sundays and public holidays</strong> (legal restriction). If an SMS message is sent, the message is <strong>paused until the next business day at 8 AM</strong>. Not sending commercial SMS? Contact us to disable this restriction: <a href="mailto:help@smspartner.fr">help@smspartner.fr</a>
    </div>
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You can obtain it from your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **phoneNumbers** | Phone numbers of recipients. For sending multiple SMS, numbers should be separated by commas. **The sending limit on a single request is 500 numbers.** <ul><li>In national format (0600000000) and international format (+33600000000) for French numbers.</li><li>In international format (+496xxxxxxxx) for non-French numbers.</li></ul> |
| **sondageIdent**      | Survey identifier. |

## Optional Parameters

| Parameter               | Description |
|:-------------------------:|-------------|
| **tag**                 | String of maximum 20 characters without space(s) allowing you to tag your sends. |
| **scheduledDeliveryDate** | SMS sending date, in `dd/MM/yyyy` format, to be defined only if you want the SMS to be sent at a later time. |
| **time**                | SMS sending time (0-24 format), mandatory if `scheduledDeliveryDate` is defined. |
| **minute**              | SMS sending minute (0-55 format, in five-minute intervals), mandatory if `scheduledDeliveryDate` is defined. |
| **_format**             | Response format. You can choose between `JSON` or `XML`. By default, the response format is `JSON` |

', 'en', 22);

-- Insertion dans la table REQUETE_REPONSE
INSERT INTO REQUETE_REPONSE (textcode, langue, id_chemin) VALUES 
('## Request
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
&lt;?php
        // Prepare data for POST request
        $fields = array(
            \'apiKey\'=> \'YOUR API KEY\',
            \'phoneNumbers\'=> \'336xxxxxxxx\',
            \'sondageIdent\' => \'SONDAGE_IDENT\',
            \'scheduledDeliveryDate\'=> \'21/10/2014\',
            \'time\'=> 9,
            \'minute\'=> 0
        );
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,\'https://api.smspartner.fr/v1/sondage/to/send\');
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
    url = base_url & "sondage/to/send"
    #note : utiliser une librairie JSON en production, par exemple :
    #https//www.nuget.org/packages/Newtonsoft.Json/
    Dim parameters As String = String.Format(
        "{{""apiKey"":""{0}"",""phoneNumbers"":""{1}"",""sondageIdent"":""{2}""}}",
        apiKey,
        "+33XXXXXXXXX",
        "SONDAGE_IDENT")
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
    <!-- Python code example goes here -->
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
    def send_sms(self,phone_numbers, sondageIdent):
		#sender = "DEMOSMS"
		print(phone_numbers)
 
		data = OrderedDict([
			("apiKey", API_KEY),
			("phoneNumbers", phone_numbers),
			("sondageIdent", sondageIdent)
		])
 
		url = URL + "/send"
		r = requests.post(url, data=json.dumps(data), verify=False)
 
		r_json = r.json()
		if r_json.get("success") == True:
			print(r_json)
			status = True
		else:
			print("SMS msg {} not delivered to {}".format(msg, phone_numbers))
			status = False
		return status
   </code></pre>
  </div>
    <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code class="language-bash">
    curl -H  "Content-Type: application/json" -X POST -d \'{"apiKey":"xxxxx","phoneNumbers":"xxxx","sondageIdent":"SONDAGE_IDENT"}\' https://api.smspartner.fr/v1/sondage/to/send
   </code></pre>
  </div>
  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code class="language-javascript">
const https = require(\'https\');

// Préparer les données pour la requête POST
let data = JSON.stringify({
  apiKey: \'YOUR API KEY\',
  phoneNumbers: \'+336XXXXXXXX\',
  // identifiant du sondage que vous avez créé dans votre compte SMS Partner
  sondageIdent: \'SONDAGE ID\',
  scheduledDeliveryDate: \'04/07/2023\',
  time: 11,
  minute: 55 //tous les 5 minutes ex: 00, 05, 10, 15, 20, etc.
});

let options = {
  hostname: \'api.smspartner.fr\',
  path: \'/v1/sondage/to/send\',
  method: \'POST\',
  headers: {
    \'Content-Type\': \'application/json\',
    \'Content-Length\': data.length
  }
};

let req = https.request(options, (res) => {
  let data = \'\';
  res.on(\'data\', (chunk) => {
    data += chunk;
  });

  res.on(\'end\', () => {
    console.log(JSON.parse(data));
  });

}).on("error", (err) => {
  console.log("Erreur: " + err.message);
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

public class SondageParSMS {
    public static void main(String[] args) {
        try {
            // Prepare data for POST request
            String apiKey = "your_api_key";
            String phoneNumbers = "+336XXXXXXXX";
            String sondageIdent = "your_sondage_ident";
            String scheduledDeliveryDate = "05/07/2023";
            int time = 10;
            int minute = 35;

            // Create JSON payload
            String jsonPayload = "{\"apiKey\": \"" + apiKey + "\", \"phoneNumbers\": \"" + phoneNumbers +
                    "\", \"sondageIdent\": \"" + sondageIdent + "\", \"scheduledDeliveryDate\": \"" +
                    scheduledDeliveryDate + "\", \"time\": " + time + ", \"minute\": " + minute + "}";

            // Create POST request
            URL url = new URL("https://api.smspartner.fr/v1/sondage/to/send");
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

struct SondageSMS: View {
    @State private var result: String = "Loading..."

    var body: some View {
        VStack {
            Text("Sondage SMS")
                .font(.title)
                .padding()

            Text(result)
                .font(.system(size: 20))
                .padding()
        }
        .onAppear(perform: sendSondage)
    }

    func sendSondage() {
        let apiKey = "YOUR_API_KEY"
        let phoneNumber = "+336xxxxxxxx"
        let sondageIdent = "SONDAGE_IDENT"
        let scheduledDeliveryDate = "05/07/2023"
        let time = 9
        let minute = 0

        let urlString = "https://api.smspartner.fr/v1/sondage/to/send"
        let url = URL(string: urlString)!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "apiKey": apiKey,
            "phoneNumbers": phoneNumber,
            "sondageIdent": sondageIdent,
            "scheduledDeliveryDate": scheduledDeliveryDate,
            "time": time,
            "minute": minute
        ]

        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
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

struct SondageSMS_Previews: PreviewProvider {
    static var previews: some View {
        SondageSMS()
    }
}
   </code></pre>
  </div>
  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
    <!-- GO code example goes here -->
    <pre><code class="language-go">
package main

import (
	"bytes"
	"encoding/json"
	"io/ioutil"
	"log"
	"net/http"
	"time"
)

func main() {
	// Prepare data for POST request
	data := map[string]interface{}{
		"apiKey":                "YOUR API KEY",
		"phoneNumbers":          "+336xxxxxxxx",
		"sondageIdent":          "SONDAGE_IDENT",
		"scheduledDeliveryDate": "21/10/2024",
		"time":                  9,
		"minute":                0,
	}

	payload, err := json.Marshal(data)
	if err != nil {
		log.Fatalf("Error preparing data: %v", err)
	}

	// Create POST request
	client := &http.Client{Timeout: 10 * time.Second}
	req, err := http.NewRequest("POST", "https://api.smspartner.fr/v1/sondage/to/send", bytes.NewBuffer(payload))
	if err != nil {
		log.Fatalf("Error creating request: %v", err)
	}

	req.Header.Set("Content-Type", "application/json")

	// Send POST request
	resp, err := client.Do(req)
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
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;

class Program
{
    private static readonly HttpClient client = new HttpClient();

    static async Task Main(string[] args)
    {
        var request = new
        {
            apiKey = "YOUR_API_KEY",
            phoneNumbers = "+336xxxxxxxx",
            sondageIdent = "SONDAGE_IDENT",
            scheduledDeliveryDate = "21/10/2014",
            time = 9,
            minute = 0
        };

        var content = new StringContent(
            JsonConvert.SerializeObject(request),
            Encoding.UTF8,
            "application/json");

        HttpResponseMessage response = await client.PostAsync("https://api.smspartner.fr/v1/sondage/to/send", content);

        if (response.IsSuccessStatusCode)
        {
            var result = await response.Content.ReadAsStringAsync();
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

## Responses

### JSON
```json
{
   "success":true,
   "code":200,
   "message_id":307,
   "nb_sms": 1,
   "cost": 0.038,
   "currency": "EUR"
}
```
',
'en', 22);

-- Insertion dans la table Suitecode 
INSERT INTO erreur_controlecode (textcode, langue, id_chemin) VALUES 
('
## Errors
Example of an error message:

### JSON
```json
{
    "success": false,
    "code":9,
    "error": [{
        "elementId": "children[message].data",
        "message": "Le message est requis"
    }, {
        "elementId": "children[phoneNumber].data",
        "message": "Ce numero de telephone n\'est pas valide (922264)"
    }, {
        "elementId": "children[sender].data",
        "message": "L\'emetteur ne peut pas etre plus long que 11 caracteres"
    }, {
        "elementId": "children[scheduledDeliveryDate].data",
        "message": "La date (21/11/2014 \u00e0 :) est anterieure a la date actuelle."
    }, {
        "elementId": "children[minute].data",
        "message": "La minute est requise"
    }, {
        "elementId": "children[time].data",
        "message": "L\'heure est requise"
    }]
}
```

## Control Codes

| _  | Code erreurs |
| :---------------: |:---------------|
|1 | 	The API Key is required |
|2 | 	The phone number is required |
|9 | At least one constraint was not respected during sending :<br> L’émetteur ne peut pas être plus long que 11 caractères.<br>Numéro de téléphone non valide.<br> Si **scheduledDeliveryDate** est défini:<ul><li>La date (dd/mm/yyyy) est antérieure à la date actuelle.</li><li>La minute est requise.</li><li>L’heure est requise..</li></ul>|
|10 | Clé API incorrecte |
|11 | Manque de crédits |
', 'en', 22);