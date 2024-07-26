---
title: Delete a contact group
description: >
---
# Delete a contact group


## URL

<div>
  <div style="background-color: red; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">DELETE</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;">  http://api.smspartner.fr/v1/group/delete</span>
</div>




## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You can obtain it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **groupId** |Group identifier| 





## Request

Request example:

``` bash
curl --location --request POST 'http://api.smspartner.fr/v1/group/delete' 
--header 'Content-Type: application/json' 
--data-raw '{
  "apiKey": "YOUR_API_KEY",
  "groupId": "GROUP ID"
}'

```
 ## Response
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
|404 | Group does not exist |

 <br>


