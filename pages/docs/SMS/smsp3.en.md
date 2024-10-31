---
title: Manage Call Forwarding
description: >
---
# Call Forwarding


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/vn/callforward</span>
</div>




## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You can obtain it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **number**      |Virtual number |
| **type**      |Type of forwarding: <br> 0 => Disabled <br> 1 => Call forwarding <br> 2 => Voicemail|
| **param**      |If type = 0 leave empty <br> If type = 1 add the forwarding number. <br> If type = 2 add the email that will be notified of a new message |




## Request
Example request:

``` bash
{
curl --location 'https://api.smspartner.fr/v1/vn/callforward' 
--header 'Content-Type: application/json' 
--data '{
    "apiKey": "API_KEY",
    "number": "NUMBET",
    "type": 0, 
    "param": ""
}'
 ```
  ## Responses
``` json   
{
    "success": true,
    "code": 2,
    "message": "Callforward disabled"
}
``` 



## Errors
Error message example:
 ``` json
{
    "success": false,
    "code": 5,
    "message": "email is not valid"
}
```
 
 ## Control Code

| _  | Error Codes |
| :---------------: |:---------------|
| 10   | The API key is required |
| 1    | Name is required |
| 5    | The virtual number is required |
| 6    | The type is required |
| 7    | The type is not valid |
| 8    | Parameter is required |
| 9    | The email is not valid |
| 12   | The transfer number is not valid |
| 13   | The virtual number does not exist |
| 14   | Call forwarding is not enabled |
| 15   | The number is disabled |
| 16   | Call forwarding is already enabled |
| 17   | Voicemail is already enabled |
| 18   | Call forwarding is already disabled |

 <br>


