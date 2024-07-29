---
title: Get contact details
description: >
---
# Get contact details


## URL

<div>
  <div style="background-color: red; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">GET</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> https://api.smspartner.fr/v1/contact/detail</span>
</div>




## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You can obtain it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **contactId**      | Contact identifier. |




## Request

Request example:

``` bash
{
  "url": "https://api.smspartner.fr/v1/contact/detail?apiKey=YOUR_API_KEY&contactId=CONTACT_ID",
  "method": "GET",
  "location": true
}

```
 ## Responses
``` json   
{
   "success": true,
   "code": 200,
   "contact": {
       "contactId": "CONTACT ID",
       "phone": "+xxxxxxxxxxx",
       "firstname": "",
       "lastname": "",
       "url": "",
       "shortUrl": "",
       "date": "",
       "custom1": "",
       "custom2": "",
       "custom3": "",
       "custom4": "",
       "createdAt": "2020-10-02T16:40:05+02:00",
       "stopSms": false,
       "groupId": 6363
   }
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
|1 | 	contactId is required |
|10 | API key is required |
|404 | 	The contact does not exist |

 <br>


