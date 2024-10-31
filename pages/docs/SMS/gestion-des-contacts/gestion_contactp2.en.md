---
title: Add a contact
description: >
---
# Add a contact


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/contact/add</span>
</div>




## Parameters

Each API request supports the following parameters:
           
| Parameter       | Description |
|:-----------------:|-------------| 
| **apiKey**      | API key of your account. You will get it in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS Partner account</a>. |
| **phoneNumber** | Contact phone numbers. <br> For sending multiple SMS, numbers should be separated by commas. <br> They can be:  <ul><li>In national format (0600000000) and international (+33600000000) for French numbers.</li><li>In international format (+496xxxxxxxx), for non-French numbers.</li></ul>| 

## Optional Parameters

| Parameter       | Description |
|:-----------------:|-------------| 
| **firstname** | First name (32 characters maximum). |
|**lastname** 	| Last name (32 characters maximum).| 
|**date** 	| Date in YYYY-MM-DD format. Can be used for automatic sending (e.g., birthday).| 
|**url** 	| URL, it must start with http:// or https://| 
|**custom1** 	| Custom field 1.| 
|**custom2** 	| Custom field 2.| 
|**custom3** 	| Custom field 3.| 
|**custom4** 	| Custom field 4.| 



## Request
Request example:

``` bash
{
  "curl_command": {
    "method": "POST",
    "url": "http://api.smspartner.fr/v1/contact/add",
    "headers": {
      "Content-Type": "application/json"
    },
    "data": {
      "apiKey": "YOUR_API_KEY",
      "groupId": "ID GROUP",
      "contact": {
        "phoneNumber": "xxxxxxxxx",
        "firstname": "first name",
        "lastname": "last name",
        "date": "YYYY-MM-DD",
        "shortUrlPartnr": "http://",
        "url": "http://",
        "custom1": "custom 1",
        "custom2": "custom 2",
        "custom3": "custom 3",
        "custom4": "custom 4"
      }
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
    "phoneNumber": "xxxxxxxx",
    "firstname": "First name",
    "lastname": "Last name",
    "date": "YYYY-MM-DD",
    "shortUrlPartnr": "http://",
    "url": "http://",
    "custom1": "custom 1",
    "custom2": "custom 2",
    "custom3": "custom 3",
    "custom4": "custom 4",
    "contactId": "ID CONTACT"
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


