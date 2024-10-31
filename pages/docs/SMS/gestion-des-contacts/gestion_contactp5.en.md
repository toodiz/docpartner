---
title: Modify a contact
description: >
---
# Modify a contact


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/contact/update</span>
</div>




## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You will get it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **contactId** |Identifier of the contact to modify| 
| **phoneNumber** |Contact's phone numbers. <br> For sending multiple SMS, the numbers must be separated by commas. <br> They can be:  <ul><li>In national format (0600000000) and international format (+33600000000) for French numbers.</li><li>In international format (+496xxxxxxxx), for numbers outside France.</li></ul>| 
| **firstname** | First name (32 characters maximum). |
|**lastname** 	| Last name (32 characters maximum).| 
|**date** 	| Date in YYYY-MM-DD format. Can be used for automatic sending (e.g., birthday)| 
|**url** 	| URL, it must start with http:// or https://| 
|**custom1** 	| Custom field 1.| 
|**custom2** 	| Custom field 2.| 
|**custom3** 	| Custom field 3.| 
|**custom4** 	| Custom field 4.| 



## Request

Example of a request:

``` bash
{
  "url": "http://api.smspartner.fr/v1/contact/update",
  "method": "POST",
  "headers": {
    "Content-Type": "application/json"
  },
  "data": {
    "apiKey": "YOUR_API_KEY",
    "contactId": "CONTACT ID",
    "contact": {
      "phoneNumber": "+xxxxxxxxx",
      "firstname": "firstname",
      "lastname": "lastname",
      "url": "",
      "date": "12-06-2020",
      "custom2": "custom2"
    }
  }
}
```
 ## Responses
``` json   
{
  "success": true,
  "code": 200,
  "contact": {
    "phoneNumber": "+xxxxxxxx",
    "firstname": "firstname",
    "lastname": "lastname",
    "url": "",
    "date": "12-06-2020",
    "custom2": "custom2",
    "contactId": "CONTACT ID"
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
|1 | groupId is required |
|2 | Contact info is required |
|10 | API key is required |
|15 | The number is already in the group |

 <br>


