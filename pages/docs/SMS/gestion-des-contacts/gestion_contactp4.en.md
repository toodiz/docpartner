---
title: Add a batch of contacts
description: >
---
# Add a batch of contacts


## URL

<div>
  <div style="background-color: #49CC90; color: white;  display: inline-block; padding: 2px 6px; font-weight: bold; border-radius: 4px;">POST</div> 
  <span style=" display: inline-block; vertical-align: middle; margin-left: 10px;"> http://api.smspartner.fr/v1/contact/add</span>

</div>

This request is used to add a batch of 500 contacts (maximum).



## Request
Example of a request:

``` bash
 {
   "apiKey": "API_KEY",
   "groupId": "GROUP_ID",
   "contactsList": [
       {
           "firstname":"firstname_1",
           "lastname":"lastname_1",
           "date": "2023-01-01",
           "url": "http:...",
           "phoneNumber": "0600000000",
           "custom1": "email"
       },
       {
           "firstname":"firstname_2",
           "lastname":"lastname_2",
           "date": "2023-01-01",
           "url": "http:...",
           "phoneNumber": "0600000001",
           "custom1": "email"
       },
       …
   ]
}
```
## Responses
``` json
{
   "groupe": {
       "name": "GROUP NAME",
       "token": "GROUP_ID"
   },
   "results": [
       {
           "success": false,
           "code": 15,
           "phoneNumber": "+33600000000",
           "message": "The number is already in the group"
       },
       {
           "success": false,
           "code": 15,
           "phoneNumber": "+33600000001",
           "message": "The number is already in the group"
       }
   ],
   "rapport": 
       {
       "nbline": 2,
       "nbline_imported": 0,
       "nbline_updated": 0,
       "errors": 
       {
           "stopSms": 0,
           "invalidePhone": 0,
           "duplicatePhone": 0,
           "allreadyInGroupe": 2,
           "urlInvalide": 0,
           "dateInvalide": 0,
           "empty": 0,
           "unactivated": 0,
           "dateInvalid": 0
       }
   }
}
```


