-- Insertion dans la table chemin
INSERT INTO chemin (path) VALUES 
('pages/docs/sms/envoyer-des-sms/envois_smsp1.md');

-- Insertion dans la table introduction
INSERT INTO introduction (textcode, langue, id_chemin) VALUES 
('---
title: Single Send
description: >
---
# Sending SMS
This request is used to send SMS in real-time or scheduled.
', 'fr', 13); 

-- Insertion dans la table URLAPI
INSERT INTO URLAPI (textcode, id_chemin) VALUES 
('## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/me</span>
</div>
', 13);

-- Insertion dans la table PARAMETRE
INSERT INTO PARAMETRE (textcode, langue, id_chemin) VALUES 
('## Paramètres

   <div class="alert alert-info">
        La plateforme n\'envoie pas de SMS commerciaux entre <strong> 20h et 8h en semaine et les dimanches et jours fériés </strong>(restriction légale). Si un message SMS est envoyé, le message est <strong>en pause jusqu\'au prochain jour ouvrable à 8h </strong>. Ne vous envoyez pas de SMS commerciaux? contactez-nous pour désactiver cette restriction : <a href="mailto:help@smspartner.fr">help@smspartner.fr</a>
    </div>
           
| Paramètre       | Description |
|-----------------|-------------| 
| **apiKey**      | Clé API de votre compte. Vous l\'obtiendrez dans votre <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">compte SMS Partner</a>. |
| **phoneNumbers** | Numéros de téléphone des destinataires. Pour l\'envoi de plusieurs SMS les numéros doivent être séparés par des virgules. **La limite d\'envoi sur une seule requête est de 500 numéros.** <ul><li>Au format national (0600000000) et international (+33600000000) pour des numéros français.</li><li>Au format international (+496xxxxxxxx), pour des numéros hors France.</li></ul> |
| **message**     | Contenu du SMS. **160 caractères** maximum par SMS (au-delà, il vous sera décompté un SMS supplémentaire par tranche de 153 caractères). <br>Attention, certains caractères spéciaux et accents sont remplacés lors de l\'envoi : <a href="#" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">Voir la liste</a> <br>Le caractère ” doit obligatoirement être échappé (\”) pour que le texte du SMS soit valide. Dans le cas contraire une erreur 400 sera retournée. <br>Le tag `:br:` permet de faire un saut de ligne. **Attention le saut de ligne compte pour deux caractères.** <br>**La mention STOP SMS est obligatoire pour les SMS à caractères commerciaux (voir le paramètre `isStopSms` ci-dessous).** <br>Si c\'est un compte marketing la mention STOP SMS est ajoutée automatiquement. |

## Paramètres optionnels

| Paramètre               | Description |
|-------------------------|-------------|
| **gamme**               | Gamme du SMS, sa valeur doit être : <ul><li>1 pour les SMS Premium</li><li>2 pour les SMS Low Cost</li></ul> ⚠️ Si ce paramètre est omis, les SMS seront envoyés dans la gamme Premium |
| **sender**              | Nom d’émetteur du message. Si l’émetteur est laissé vide, vos SMS seront acheminés avec un shortcode opérateur en guise d’expéditeur (exemple : 36xxx). <br>⚠️ Le nombre de caractères pour le nom de l\'émetteur est compris **entre 3 et 11 inclus** et ne doit pas comporter de caractères spéciaux. <br>Certains modèles de téléphone n\'interprètent pas les caractères spéciaux dans le nom d\'émetteur. |
| **tag**                 | Chaîne de caractères de 20 caractères maximum sans espace(s) et vous permettant de tagger vos envois. |
| **scheduledDeliveryDate** | Date d\'envoi du SMS, au format `dd/MM/yyyy`, à définir uniquement si vous souhaitez que les SMS soient envoyés en différé. |
| **time**                | Heure d\'envoi du SMS (format 0-24), obligatoire si `scheduledDeliveryDate` est définie. |
| **minute**              | Minute d\'envoi du SMS (format 0-55, par intervalle de cinq minutes), obligatoire si `scheduledDeliveryDate` est définie. |
| **urlResponse**         | URL de retour des Réponses (ex: https://www.monurlderesponse). |
| **urlDlr**              | URL de retour des Accusé de réception (ex: https://www.monurldlr). |
| **isStopSms**           | Gamme Premium : 1 pour ajouter la mention STOP à la fin du SMS (obligatoire pour les SMS commerciaux).<br> ⚠️ Gamme ÉCO : Ce paramètre n’est pas applicable pour cette gamme, il est nécessaire d\'ajouter manuellement la mention NoPub=STOP pour les SMS commerciaux. |
| **isUnicode**           | Si 1 : Active le mode Unicode, le nombre de caractères maximum par SMS sera de 70. <br>**Important :** le SMS unicode doit être activé sur votre compte par un administrateur pour que les envois soient disponibles. Merci de prendre contact avec le service technique pour l’activation de cette fonctionnalité.<br> [Voir la liste](https://www.smspartner.fr/blog/liste-complete-des-emoticones-a-copier-coller). |
| **sandbox**             | Pour tester l’envoi de SMS, vous pouvez utiliser le paramètre `sandbox:` **1** pour activer le mode bac à sable. ⚠️ Aucun SMS ne sera envoyé, et il n’y aura aucun débit sur votre compte. Ces SMS seront supprimés de vos listes d’envois automatiquement tous les jours.|
| **_format**             | Format de la réponse. Vous pouvez choisir entre `JSON` ou `XML`. Par défaut, le format de réponse est `JSON` |


    ', 'fr', 13);

-- Insertion dans la table REQUETE_REPONSE
INSERT INTO REQUETE_REPONSE (textcode, langue, id_chemin) VALUES 
('## Requête
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
// Prepare data for POST request $fields = array( \'apiKey\'=> \'YOUR API KEY\', \'phoneNumbers\'=> \'
+336xxxxxxxx\', \'message\'=> \'This is your message\', \'sender\' => \'mycompany\',
 \'scheduledDeliveryDate\'=> \'21/10/2014\', \'time\'=> 9, \'minute\'=> 0 );
 $curl = curl_init(); 
 curl_setopt($curl, CURLOPT_URL,\'https://api.smspartner.fr/v1/send\');
curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 
curl_setopt($curl, CURLOPT_TIMEOUT, 10);
curl_setopt($curl, CURLOPT_POST, 1); 
curl_setopt($curl, CURLOPT_POSTFIELDS,json_encode($fields)); 
$result = curl_exec($curl); 
curl_close($curl);
 // Process your response here echo $result;
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
    url = base_url & "send"
    #note : utiliser une librairie JSON en production, par exemple :
    #https//www.nuget.org/packages/Newtonsoft.Json/
    Dim parameters As String = String.Format(
        "{{""apiKey"":""{0}"",""phoneNumbers"":""{1}"",""message"":""{2}""}}",
        apiKey,
        "+33XXXXXXXXX",
        "message de test")
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
    <pre><code>
import http.client
import json
conn = http.client.HTTPSConnection("api.smspartner.fr")

payload = json.dumps({
"apiKey": "your api key smspartner", #remplacez par votre clé API SMSPartner
"phoneNumbers": "+336xxxxxxxx", #remplacez par votre numéro de téléphone
"sender": "Your sender name",
"gamme": 1,
"message": "Cest un message test PYTHON", #remplacez par votre message
 "webhookUrl": "https://webhook.site/TOKEN" #remplacez TOKEN par votre token webhook.site
})

headers = {
\'Content-Type\': \'application/json\',
\'Content-Length\': str(len(payload)),
\'cache-control\': \'no-cache\'
}

conn.request("POST", "/v1/send", payload, headers) #Une requête POST est envoyée au serveur
 SMSPartner avec le chemin d\'URL "/v1/send"

res = conn.getresponse() #La réponse est ensuite stockée dans la variable res.

data = res.read() 

print(data.decode("utf-8")) #Cette ligne lit les données de la réponse HTTP.
   </code></pre>
  </div>
  <div class="tab-pane fade" id="curl" role="tabpanel" aria-labelledby="curl-tab">
    <!-- cURL code example goes here -->
    <pre><code>
curl -H  "Content-Type: application/json" -X POST -d \'{"apiKey":"xxxxx","phoneNumbers":"xxxx",
"message":"test","sender":"mycompany"}\' https://api.smspartner.fr/v1/send
   </code></pre>
  </div>
  <div class="tab-pane fade" id="nodejs" role="tabpanel" aria-labelledby="nodejs-tab">
    <!-- NodeJS code example goes here -->
    <pre><code>
// Importer le module \'https\' de Node.js
const https = require(\'https\');

// Objet JSON qui contient les informations nécessaires pour envoyer le SMS
const data = JSON.stringify({
    apiKey: \'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX\', //remplacez par votre clé API
    phoneNumbers: \'+336XXXXXXXX\',  //remplacez par votre numéro de téléphone
    sender: \'NodeJS\',
    gamme: 1,
    message: "Cest un message test NodeJS" //remplacez par votre message
});

// Définir les options pour la requête HTTP POST vers l\'API SMS Partner
const options = {
  hostname: \'api.smspartner.fr\',
  port: 443,
  path: \'/v1/send\',
  method: \'POST\',
  headers: {
    \'Content-Type\': \'application/json\',
    \'Content-Length\': data.length,
    \'cache-control\': \'no-cache\',
    \'webhookUrl\': \'https://webhook.site/TOKEN\' // Webhook URL *cette ligne est optionnel*
  }
};

// Demande HTTP POST avec les options et les données définies précédemment
const req = https.request(options, (res) => {
  console.log(`statusCode: ${res.statusCode}`);
  
  // Afficher les données de réponse de l\'API sur la sortie standard
  res.on(\'data\', (d) => {
    process.stdout.write(d);
  });
});

// Affichage en cas d\'erreur lors de l\'exécution de la requête HTTP POST
req.on(\'error\', (error) => {
  console.error(error);
});

// Envoyer les données de l\'objet \'data\' à la demande
req.write(data);
// Terminer la demande HTTP POST
req.end();
   </code></pre>
  </div>
  <div class="tab-pane fade" id="java" role="tabpanel" aria-labelledby="java-tab">
    <!-- JAVA code example goes here -->
   <pre><code>
import java.net.HttpURLConnection;
import java.net.URL;
import java.io.OutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.stream.Collectors;
import org.json.JSONObject;

public class SMSRequest {
    public static void main(String[] args) {
        try {
        // Création de l\'objet URL avec l\'adresse de l\'API SMS
            URL url = new URL("https://api.smspartner.fr/v1/send");
        // Ouverture de la connexion HTTP avec l\'API
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("cache-control", "no-cache");
            conn.setDoOutput(true);

        // Création de l\'objet JSON contenant les paramètres du SMS à envoyer   
            JSONObject json = new JSONObject();
            json.put("apiKey", "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"); //your api key smspartner
            json.put("phoneNumbers", "+336XXXXXXXX"); //your phone number
            json.put("virtualNumber", "+336XXXXXXXX");
            json.put("sender", "demo JAVA");
            json.put("gamme", 1);
            json.put("message", "C\'est un message test en JAVA !");
            json.put("webhookUrl", "https://webhook.site/TOKEN"); //your webhook url
        
        // Écriture des données JSON dans le corps de la requête HTTP
            OutputStream os = conn.getOutputStream(); 
            os.write(json.toString().getBytes());
            os.flush();

        // Lecture de la réponse de l\'API
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
    <pre><code>
import SwiftUI

struct SMSUnitaire: View {
    var body: some View {
        // Un bouton qui appelle la fonction sendSMS() lorsqu\'il est pressé
        Button(action: {
            sendSMS()
        }) {
            Text("Envoyer SMS unitaire")
                .font(.system(size: 20)) // Taille du texte
                .foregroundColor(.white) // Couleur du texte
                .frame(minWidth: 0, maxWidth: .infinity) // Taille du bouton, qui s\'ajuste automatiquement
                .padding() // Padding autour du texte
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue.opacity
                (0.8)]), startPoint: .top, endPoint: .bottom)) // Fond du bouton, un dégradé de bleu
                .cornerRadius(10) // Coins arrondis du bouton
                .padding(.horizontal) // Espacement horizontal autour du bouton
        }
    }

    func sendSMS() {
        // Objet JSON contenant les informations nécessaires pour envoyer le SMS
        let data = [
            "apiKey": "XXXXXXXXXXXX YOUR API KEY XXXXXXXXXXXXX", // remplacez par votre clé API
            "phoneNumbers": "+336XXXXXXXX", // remplacez par votre numéro de téléphone
            "sender": "Swift",
            "gamme": 1,
            "message": "C\'est un message test Swift" // remplacez par votre message
        ] as [String : Any]
        
        // Conversion de l\'objet JSON en données
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data, options: []) else {
            fatalError("Erreur lors de la conversion des données en JSON.")
        }
        
        // Définition des options pour la requête HTTP POST à l\'API SMS Partner
        let url = URL(string: "https://api.smspartner.fr/v1/send")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST" // Méthode HTTP
        request.httpBody = jsonData // Corps de la requête
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // Type de contenu 
        request.addValue("\(jsonData.count)", forHTTPHeaderField: "Content-Length") // Longueur du  contenu
        request.addValue("no-cache", forHTTPHeaderField: "cache-control") // Contrôle du cache 
        request.addValue("https://webhook.site/TOKEN", forHTTPHeaderField: "webhookUrl") // URL du
         webhook *cette ligne est facultative*
        
        // Exécution de la requête HTTP POST avec les options et données définies précédemment
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                fatalError("Erreur : réponse HTTP non valide.")
            }
            print("statusCode: \(httpResponse.statusCode)") // Impression du statut HTTP
            
            if let error = error {
                print("Error: \(error.localizedDescription)") // Impression de l\'erreur, si elle existe
            }
            
            if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    print("Réponse : \(responseString)") // Impression de la réponse, si elle existe
                }
            }
        }
        task.resume() // Démarrage de la tâche
    }
}
   </code></pre>
  </div>
  <div class="tab-pane fade" id="go" role="tabpanel" aria-labelledby="go-tab">
    <!-- GO code example goes here -->
    <pre><code>
package main

import (
	"bytes"
	"fmt"
	"net/http"
)

func main() {
	apiKey := "VOTRE CLE API"
	phoneNumbers := "+336xxxxxxxx"
	message := "Ceci est votre message"
	sender := "monentreprise"
	scheduledDeliveryDate := "21/10/2014"
	time := 9
	minute := 0

	// Construire le corps JSON pour la requête POST
	jsonData := fmt.Sprintf(`{
		"apiKey": "%s",
		"phoneNumbers": "%s",
		"message": "%s",
		"sender": "%s",
		"scheduledDeliveryDate": "%s",
		"time": %d,
		"minute": %d
	}`, apiKey, phoneNumbers, message, sender, scheduledDeliveryDate, time, minute)

	// Effectuer la requête POST
	url := "https://api.smspartner.fr/v1/send"
	req, err := http.NewRequest("POST", url, bytes.NewBuffer([]byte(jsonData)))
	if err != nil {
		fmt.Println("Erreur lors de la création de la requête:", err)
		return
	}
	req.Header.Set("Content-Type", "application/json")

	client := &http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		fmt.Println("Erreur lors de l\'envoi de la requête:", err)
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
    <pre><code>
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
            message = "This is your message",
            sender = "mycompany",
            scheduledDeliveryDate = "21/10/2014",
            time = 9,
            minute = 0
        };

        var content = new StringContent(
            JsonConvert.SerializeObject(request),
            Encoding.UTF8,
            "application/json");

        HttpResponseMessage response = await client.PostAsync("https://api.smspartner.fr/v1/send", content);

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
### XML
```xml
    <?xml version=\'1.0\' encoding=\'UTF-8\'?>
<result>
  <entry>true</entry>
  <entry>200</entry>
  <entry>306</entry>
  <entry>1</entry>
  <entry>0.038</entry>
  <entry>
        <![CDATA[EUR]]>
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
    "errors": [{
        "elementId": "children[message].data",
        "message": "Le message est requis"
    }, {
        "elementId": "children[phoneNumbers].data",
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
### XML
```xml
<?xml version=\'1.0\' encoding=\'UTF-8\'?>
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
                   <entry>Ce numéro de téléphone n\'est pas valide (922264)</entry>
                </entry>
                <entry>
                    <entry>children[sender].data</entry>
                    <entry>L\'émetteur ne peut pas être plus long que 11 caractères</entry>
                </entry>
                <entry>
                    <entry>children[scheduledDeliveryDate].data</entry>
                    <entry>La date (21/11/2014 à :) est anterieure à la date actuelle. Si vous
                     souhaitez l\'envoyer maintenant vous devez sélectionner [Envoi immédiat]</entry>
                </entry>
                <entry>
                    <entry>children[minute].data</entry>
                    <entry>La minute est requise</entry>
                </entry>
                <entry>
                    <entry>children[time].data</entry>
                    <entry>L\'heure est requise</entry>
                </entry>
      </entry>
</result>
  ```
', 
'fr', 13);

-- Insertion dans la table Suitecode 
INSERT INTO erreur_controlecode (textcode, langue, id_chemin) VALUES 
('## Code de contrôle

| _  | Code erreurs |
| :---------------: |:---------------|
|1 | La Clé API est requise |
|2 | 	Le numéro de téléphone est requis |
|9 | Au moins une contrainte n’a pas été respectée lors de l’envoi :<br> L’émetteur ne peut pas être plus long que 11 caractères.<br>Numéro de téléphone non valide.<br> Si **scheduledDeliveryDate** est défini:<ul><li>La date (dd/mm/yyyy) est antérieure à la date actuelle.</li><li>La minute est requise.</li><li>L’heure est requise..</li></ul>|
|10 | Clé API incorrecte |
|11 | Manque de crédits |', 'fr', 13);