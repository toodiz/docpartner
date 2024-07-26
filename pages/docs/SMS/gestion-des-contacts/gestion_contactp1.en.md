---
title: Add a group
description: >
---
# Add a group


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/group/add</span>
</div>




## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You can obtain it from your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **name** | Group name |




## Request
``` bash
curl --location --request POST 'http://api.smspartner.fr/v1/group/add' 
--header 'Content-Type: application/json' --data-raw '{   "apiKey": "YOUR_API_KEY",
   "name": "Group name"}'
```
## Response
``` json
{   
"success": true,   
"code": 2,   
"name": "Group name",   
"groupId": "GROUP ID" 
}

```



 ## Errors
Example of an error message:
 ``` json
{   
{ 
"success": false, 
"code": 10, 
"message": "Clef API incorrecte" 
}
}
```
 ## Control Code
 | _  | Error Codes |
| :---------------: |:---------------|
|1 | 	name is required |
|2 | 	API Key is required |
<br>
 

