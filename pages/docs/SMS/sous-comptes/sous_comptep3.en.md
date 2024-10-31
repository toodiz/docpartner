---
title: Delete a sub-account
description: >
---
# Delete a sub-account


## URL

<div>
  <div style="background-color: red; color: white; display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">DELETE</div> 
  <span style="display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/subaccount/remove</span>
</div>




## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You can obtain it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **token**      | Contact identifier. |




## Request
Example request:

``` bash
{
curl --location --request DELETE 'http://api.smspartner.fr/v1/subaccount/remove' 
--header 'Content-Type: application/json' 
--data-raw '{
   "apiKey": "YOUR_API_KEY",
   "token": "TOKEN SUBACCOUNT"}'
}
```
 ## Responses
``` json   
{
   "success": true,
   "code": 200,
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
|1 | 	token is required |
|10 | API key is required |
|404 | Sub-account does not exist |

 <br>


