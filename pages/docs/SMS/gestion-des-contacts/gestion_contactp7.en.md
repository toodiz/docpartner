---
title: Get the list of groups
description: >
---
# Get the list of contact groups


## URL
<div>
  <div style="background-color: red; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;">https://api.smspartner.fr/v1/group/list</span>
</div>




## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You can obtain it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |



## Request

Request example:

``` bash
{
  "curlCommand": {
    "location": true,
    "request": "GET",
    "url": "https://api.smspartner.fr/v1/group/list?
    apiKey=YOUR_API_KEY"
  }

```
 ## Responses
``` json   
{
  "success": false,
  "groups": [
    {
      "id": "identifiant du groupe",
      "name": "groupe name",
      "createdAt": "2020-10-02T16:40:05+02:00",
      "isSpecialFile": false,
      "isLocationFile": false
    }
  ]
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
|10 | API key is required |

 <br>


