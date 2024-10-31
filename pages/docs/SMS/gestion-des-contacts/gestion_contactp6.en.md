---
title: Delete a contact
description: >
---
# Delete a contact


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;">http://api.smspartner.fr/v1/contact/delete</span>
</div>




## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You can obtain it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **contactId** | Contact identifier | 



## Request

Request example:

``` bash
curl --location --request 
POST 'http://api.smspartner.fr/v1/contact/delete' 
--header 'Content-Type: application/json' 
--data-raw '{
   "apiKey": "YOUR_API_KEY",
   "contactId": "CONTACT_ID"}'
```
 ## Responses
``` json   
{
   "success": true,
   "code": 200
}
``` 



## Errors
Error message example:
 ``` json
{ 
"success": false, 
"code": 10, 
"message": "Incorrect API key" 
}

```
 
 ## Control Code

| _  | Error Codes |
| :---------------: |:---------------|
|1 | groupId is required |
|10 | API key is required |
|404 | The group does not exist |

 <br>


