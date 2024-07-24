---
title: Envoi par lots
description: >
---
# Envoyer des SMS
Cette requête est utilisée pour envoyer des SMS en temps réel ou en différé...



## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/bulk-send</span>
</div>

## Paramètres

   <div class="alert alert-info">
        La plateforme n\'envoie pas de SMS commerciaux entre <strong> 20h et 8h en semaine et les dimanches et jours fériés </strong>(restriction légale). Si un message SMS est envoyé, le message est <strong>en pause jusqu\'au prochain jour ouvrable à 8h </strong>. Ne vous envoyez pas de SMS commerciaux? contactez-nous pour désactiver cette restriction : <a href="mailto:help@smspartner.fr">help@smspartner.fr</a>
    </div>
           
| Paramètre       | Description |
|:-----------------:|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l\'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **SMSList** | **phoneNumber:** <br> Numéros de téléphone des destinataires. Pour l\'envoi de plusieurs SMS les numéros doivent être séparés par des virgules. **La limite d\'envoi sur une seule requête est de 500 numéros.** <ul><li>Au format national (0600000000) et international (+33600000000) pour des numéros français.</li><li>Au format international (+496xxxxxxxx), pour des numéros hors France.</li></ul>**message** <br> Contenu du SMS. **160 caractères** maximum par SMS (au-delà, il vous sera décompté un SMS supplémentaire par tranche de 153 caractères). <br>Attention, certains caractères spéciaux et accents sont remplacés lors de l\'envoi : <a href="#" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">Voir la liste</a> <br> <br>Le caractère ” doit obligatoirement être échappé (”) pour que le texte du SMS soit valide. Dans le cas contraire une erreur 400 sera retournée. <br>Le tag `:br:` permet de faire un saut de ligne. **Attention le saut de ligne compte pour deux caractères.** <br>**La mention STOP SMS est obligatoire pour les SMS à caractères commerciaux (voir le paramètre `isStopSms` ci-dessous).** <br>Si c\'est un compte marketing la mention STOP SMS est ajoutée automatiquement. |

## Paramètres optionnels

| Paramètre               | Description |
|:-------------------------:|-------------|
| **gamme**               | Gamme du SMS, sa valeur doit être : <ul><li>1 pour les SMS Premium</li><li>2 pour les SMS Low Cost</li></ul> ⚠️ Si ce paramètre est omis, les SMS seront envoyés dans la gamme Premium |
| **sender**              | Nom d’émetteur du message. Si l’émetteur est laissé vide, vos SMS seront acheminés avec un shortcode opérateur en guise d’expéditeur (exemple : 36xxx). <br>⚠️ Le nombre de caractères pour le nom de l\'émetteur est compris **entre 3 et 11 inclus** et ne doit pas comporter de caractères spéciaux. <br>Certains modèles de téléphone n\'interprètent pas les caractères spéciaux dans le nom d\'émetteur. |
| **tag**                 | Chaîne de caractères de 20 caractères maximum sans espace(s) et vous permettant de tagger vos envois. |
| **scheduledDeliveryDate** | Date d\'envoi du SMS, au format `dd/MM/yyyy`, à définir uniquement si vous souhaitez que les SMS soient envoyés en différé. |
| **time**                | Heure d\'envoi du SMS (format 0-24), obligatoire si `scheduledDeliveryDate` est définie. |
| **minute**              | Minute d\'envoi du SMS (format 0-55, par intervalle de cinq minutes), obligatoire si `scheduledDeliveryDate` est définie. |
| **urlResponse**         | URL de retour des Réponses (ex: https://www.monurlderesponse). |
| **urlDlr**              | URL de retour des Accusé de réception (ex: https://www.monurldlr). |
| **isStopSms**           | Gamme Premium : 1 pour ajouter la mention STOP à la fin du SMS (obligatoire pour les SMS commerciaux).<br> ⚠️ Gamme ÉCO : Ce paramètre n’est pas applicable pour cette gamme, il est nécessaire d\'ajouter manuellement la mention NoPub=STOP pour les SMS commerciaux. |
| **isUnicode**           | Si 1 : Active le mode Unicode, le nombre de caractères maximum par SMS sera de 70. <br>**Important :** le SMS unicode doit être activé sur votre compte par un administrateur pour que les envois soient disponibles. Merci de prendre contact avec le service technique pour l’activation de cette fonctionnalité. <br> [Voir la liste](https://www.smspartner.fr/blog/liste-complete-des-emoticones-a-copier-coller). |
| **sandbox**             | Pour tester l’envoi de SMS, vous pouvez utiliser le paramètre `sandbox:` **1** pour activer le mode bac à sable. ⚠️ Aucun SMS ne sera envoyé, et il n’y aura aucun débit sur votre compte. Ces SMS seront supprimés de vos listes d’envois automatiquement tous les jours.|
| **_format**             | Format de la réponse. Vous pouvez choisir entre `JSON` ou `XML`. Par défaut, le format de réponse est `JSON` |


## Requête
Exemple de requête :

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
            'sender' => 'mycompany',
            'scheduledDeliveryDate'=> '21/10/2014',
            'time'=> 9,
            'minute'=> 0,
            'SMSList'=> array(
                array(
                    'phoneNumber'=> '06xxxxxxx1',
                    'message'=> 'msg 0'
                ),
                array(
                    'phoneNumber'=> '06xxxxxxx2',
                    'message'=> 'msg 1'
                )
 
            )
        );
 
 
        $curl = curl_init();
        curl_setopt($curl, CURLOPT_URL,'https://api.smspartner.fr/v1/bulk-send');
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
    url = base_url & "bulk-send"
    #note : utiliser une librairie JSON en production, par exemple :
    #https//www.nuget.org/packages/Newtonsoft.Json/
    Dim parameters As String = String.Format(
        "{{""apiKey"":""{0}"",""sender"":""{1}"",""SMSList"":""{2}""}}",
        apiKey,
        "mycompany",
        {{ ""phoneNumber"":"06xxxxxxx1",""message"":"msg1"},{ ""phoneNumber"":"06xxxxxxx2",""message"":"msg2"}}
        )
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
    def send_sms(self,phone_numbers, msg, sender = "SMSPartner"):
		#sender = "DEMOSMS"
		print(phone_numbers)
 
 
		data = {"apiKey":APIKEY,"sender":sender,"SMSList":[{"phoneNumber":"06xxxxxxx1","message":"msg1"},{"phoneNumber":"06xxxxxxx2","message":"msg2"}]}
 
 
		url = URL + "/bulk-send"
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
    curl -H  "Content-Type: application/json" -X POST -d '{"apiKey":"xxxxx","to":"xxxx","from":"xxx","message":"test"}' https://api.smspartner.fr/v1/vn/send
   </code></pre>
  </div>
  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code class="language-javascript">
const https = require('https');

// Remplacez par votre clé API
const apiKey = 'VOTRE_CLÉ_API';

// Objet JSON qui contient les informations nécessaires pour envoyer les SMS en lots
const data = JSON.stringify({
    apiKey: apiKey,
    sender: 'mycompany',
    scheduledDeliveryDate: '21/10/2014',
    time: 9,
    minute: 0,
    SMSList: [
        {
            phoneNumber: '06xxxxxxx1',
            message: 'msg 0',
        },
        {
            phoneNumber: '06xxxxxxx2',
            message: 'msg 1',
        },
    ],
});

// Définir les options pour la requête HTTP POST vers l'API SMS Partner
const options = {
  hostname: 'api.smspartner.fr',
  port: 443,
  path: '/v1/send',
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'Content-Length': data.length,
    'cache-control': 'no-cache',
  },
};

// Demande HTTP POST avec les options et les données définies précédemment
const req = https.request(options, (res) => {
  console.log(`statusCode: ${res.statusCode}`);
  
  // Afficher les données de réponse de l'API sur la sortie standard
  res.on('data', (d) => {
    process.stdout.write(d);
  });
});

// Affichage en cas d'erreur lors de l'exécution de la requête HTTP POST
req.on('error', (error) => {
  console.error(error);
});

// Envoyer les données de l'objet 'data' à la demande
req.write(data);
// Terminer la demande HTTP POST
req.end();
   </code></pre>
  </div>
  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code class="language-java">
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.OutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.stream.Collectors;
import org.json.JSONArray;
import org.json.JSONObject;

public class SMSRequest {
    public static void main(String[] args) {
        try {
        // Création de l'objet URL avec l'adresse de l'API SMS
               URL url = new URL("https://api.smspartner.fr/v1/bulk-send"
        // Ouverture de la connexion HTTP avec l'API
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("cache-control", "no-cache");
            conn.setDoOutput(true);

            // Création de l'objet JSON contenant les paramètres des SMS à envoyer en lot
            JSONObject json = new JSONObject();
            json.put("apiKey", "VOTRE_API_KEY"); // Remplacez par votre clé API
            json.put("sender", "mycompany");
            json.put("scheduledDeliveryDate", "21/10/2014");
            json.put("time", 9);
            json.put("minute", 0);

            JSONArray SMSList = new JSONArray();
            JSONObject sms1 = new JSONObject();
            sms1.put("phoneNumber", "06xxxxxxx1");
            sms1.put("message", "msg 0");
            SMSList.put(sms1);

            JSONObject sms2 = new JSONObject();
            sms2.put("phoneNumber", "06xxxxxxx2");
            sms2.put("message", "msg 1");
            SMSList.put(sms2);

            json.put("SMSList", SMSList);

        
        // Écriture des données JSON dans le corps de la requête HTTP
            OutputStream os = conn.getOutputStream(); 
            os.write(json.toString().getBytes());
            os.flush();

        // Lecture de la réponse de l'API
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String response = br.lines().collect(Collectors.joining());
            System.out.println(response);
            
        // Fermeture de la connexion HTTP
            conn.disconnect();
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

// Cette requête est utilisée pour envoyer des SMS par lot de 500 en temps réel ou en différé
struct SMSParLotsView: View {
    var body: some View {
        // Un bouton qui appelle la fonction sendSMSParLots() lorsqu'il est pressé
        Button(action: {
            sendSMSParLots()
        }) {
            Text("Send Bulk SMS")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity(0.8)]), startPoint: .top, endPoint: .bottom))
                .cornerRadius(10)
                .padding(.horizontal)
        }
    }
    

    func sendSMSParLots() {
        // Liste des SMS à envoyer
        let smsList: [[String: String]] = [
            [
                "phoneNumber": "06XXXXXXXX", // Numéro de téléphone du destinataire
                "message": "msg 0 en temps réel" // Message à envoyer
            ],
            [
                "phoneNumber": "06XXXXXXXX", // Un autre numéro de téléphone
                "message": "msg 1 en temps réel" // Un autre message
            ]
        ]

        // Données à envoyer à l'API
        let data: [String: Any] = [
            "apiKey": "XXXXXXXXXXXX YOUR API KEY XXXXXXXXXXXXX", // Votre clé API
            "sender": "mycompany", // L'expéditeur du SMS
            // Ces 3 lignes permettent de programmer un envoi différé.
            //"scheduledDeliveryDate": "12/05/2023", // Date de livraison prévue
            //"time": 9, // Heure de livraison
            //"minute": 0, // Minute de livraison
            "SMSList": smsList // La liste des SMS à envoyer
        ]

        // Conversion des données en JSON
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
            fatalError("Error converting data to JSON.")
        }

        // Création de la requête HTTP
        let url = URL(string: "https://api.smspartner.fr/v1/bulk-send")! // URL de l'API
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // Méthode HTTP
        request.httpBody = jsonData // Corps de la requête
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // Type de contenu
        request.addValue("(jsonData.count)", forHTTPHeaderField: "Content-Length") // Longueur du contenu
        request.addValue("no-cache", forHTTPHeaderField: "cache-control") // Contrôle du cache

        // Envoi de la requête HTTP
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Vérification de la réponse HTTP
            guard let httpResponse = response as? HTTPURLResponse else {
                fatalError("Error: Invalid HTTP response.")
            }
            print("statusCode: (httpResponse.statusCode)") // Impression du code d'état HTTP

            // Gestion des erreurs éventuelles
            if let error = error {
                print("Error: (error.localizedDescription)")
            }

            // Impression de la réponse de l'API
            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Response: (responseString)")
                }
            }
        }
        task.resume()
    }
}
// Un aperçu de la vue
struct BulkSMSView_Previews: PreviewProvider {
    static var previews: some View {
        SMSParLotsView()
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
	"fmt"
	"net/http"
)

func main() {
	apiKey := "VOTRE CLE API"
	sender := "monentreprise"
	scheduledDeliveryDate := "21/10/2014"
	time := 9
	minute := 0

	// Construire les données JSON pour la requête POST
	data := map[string]interface{}{
		"apiKey":               apiKey,
		"sender":               sender,
		"scheduledDeliveryDate": scheduledDeliveryDate,
		"time":                 time,
		"minute":               minute,
		"SMSList": []map[string]string{
			{"phoneNumber": "06xxxxxxx1", "message": "msg 0"},
			{"phoneNumber": "06xxxxxxx2", "message": "msg 1"},
		},
	}

	// Convertir les données en JSON
	jsonData, err := json.Marshal(data)
	if err != nil {
		fmt.Println("Erreur lors de la conversion en JSON:", err)
		return
	}

	// Effectuer la requête POST
	url := "https://api.smspartner.fr/v1/bulk-send"
	resp, err := http.Post(url, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		fmt.Println("Erreur lors de l'envoi de la requête:", err)
		return
	}
	defer resp.Body.Close()

	// Traiter la réponse
	if resp.StatusCode == http.StatusOK {
		body := new(bytes.Buffer)
		_, err := body.ReadFrom(resp.Body)
		if err != nil {
			fmt.Println("Erreur lors de la lecture de la réponse:", err)
			return
		}
		fmt.Println(body.String())
	} else {
		fmt.Println("La requête POST a échoué. Code de réponse:", resp.StatusCode)
	}
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
            sender = "mycompany",
            scheduledDeliveryDate = "21/10/2014",
            time = 9,
            minute = 0,
            SMSList = new[]
            {
                new
                {
                    phoneNumber = "06xxxxxxx1",
                    message = "msg 0"
                },
                new
                {
                    phoneNumber = "06xxxxxxx2",
                    message = "msg 1"
                }
            }
        };

        var content = new StringContent(
            JsonConvert.SerializeObject(request),
            Encoding.UTF8,
            "application/json");

        HttpResponseMessage response = await client.PostAsync("https://api.smspartner.fr/v1/bulk-send", content);

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

## Réponses

### JSON
```json
{
       "success": true,
    "code": 200,
    "message_id": xxxxxx,
    "currency": "EUR",
    "cost": 0.076,
    "nbSMS": 2,
    "SMSResponse_List": [
        {
            "success": true,
            "code": 200,
            "nbSms": 1,
            "cost": 0.038,
            "phoneNumber": "+336xxxxxxx1"
        },
        {
            "success": true,
            "code": 200,
            "nbSms": 1,
            "cost": 0.038,
            "phoneNumber": "+336xxxxxxx2"
        }
    ]
}
```
### XML
```xml
    <?xml version='1.0' encoding='UTF-8'?>
<result>
    <entry>true</entry>
    <entry>200</entry>
    <entry>xxxxxx</entry>
    <entry>
        <![CDATA[EUR]]>
    </entry>
    <entry>0.076</entry>
    <entry>2</entry>
    <entry>
        <entry>
            <entry>true</entry>
            <entry>200</entry>
            <entry>1</entry>
            <entry>0.038</entry>
            <entry>
                <![CDATA[+336xxxxxxx1]]>
            </entry>
        </entry>
        <entry>
            <entry>true</entry>
            <entry>200</entry>
            <entry>1</entry>
            <entry>0.038</entry>
            <entry>
                <![CDATA[+336xxxxxxx2]]>
            </entry>
        </entry>
    </entry>
</result>
  ```



## Erreurs
Exemple de message d’erreur:

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
        "message": "Ce numero de telephone n'est pas valide (922264)"
    }, {
        "elementId": "children[sender].data",
        "message": "L'emetteur ne peut pas etre plus long que 11 caracteres"
    }, {
        "elementId": "children[scheduledDeliveryDate].data",
        "message": "La date (21/11/2014 u00e0 :) est anterieure a la date actuelle."
    }, {
        "elementId": "children[minute].data",
        "message": "La minute est requise"
    }, {
        "elementId": "children[time].data",
        "message": "L'heure est requise"
    }]
}
```
### XML
```xml
<?xml version='1.0' encoding='UTF-8'?>
 <result>
          <entry>false</entry>
          <entry>9</entry>
          <entry>
                <entry>
                  <entry>children[message].data</entry>
                  <entry>Le message est requis</entry>
                </entry>
                <entry>
                   <entry>children[phoneNumbers].data</entry>
                   <entry>Ce numéro de téléphone n'est pas valide (922264)</entry>
                </entry>
                <entry>
                    <entry>children[sender].data</entry>
                    <entry>L'émetteur ne peut pas être plus long que 11 caractères</entry>
                </entry>
                <entry>
                    <entry>children[scheduledDeliveryDate].data</entry>
                    <entry>La date (21/11/2014 à :) est anterieure à la date actuelle. Si vous
                     souhaitez l'envoyer maintenant vous devez sélectionner [Envoi immédiat]</entry>
                </entry>
                <entry>
                    <entry>children[minute].data</entry>
                    <entry>La minute est requise</entry>
                </entry>
                <entry>
                    <entry>children[time].data</entry>
                    <entry>L'heure est requise</entry>
                </entry>
      </entry>
</result>
```
## Code de contrôle

| _  | Code erreurs |
| :---------------: |:---------------|
|1 | La Clé API est requise |
|2 | 	Le numéro de téléphone est requis |
|9 | Au moins une contrainte n’a pas été respectée lors de l’envoi :<br> L’émetteur ne peut pas être plus long que 11 caractères.<br>Numéro de téléphone non valide.<br> Si **scheduledDeliveryDate** est défini:<ul><li>La date (dd/mm/yyyy) est antérieure à la date actuelle.</li><li>La minute est requise.</li><li>L’heure est requise..</li></ul>|
|10 | Clé API incorrecte |
|11 | Manque de crédits |

## Liste des caractères remplacés
Consulter la table des caractéres remplacés <a href="/docs/sms/envoyer-des-sms/envois_smsp4" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;"> 📒 Voir table</a> <br> <br>


