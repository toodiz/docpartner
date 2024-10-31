---
title: Response Management
description: >
---





# Response on a long number

SMS Partner offers you the rental of a long number (example: 06 XX XX XX XX).
To learn more about creating a dedicated number, [contact us](https://www.smspartner.fr/contact).

   <div class="alert alert-info">
Note: To receive responses: configure your <strong> response reception URL </strong> in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS API </a> </div>

## Example of a response on a simple SMS (160 characters maximum)

``` json
Array
(
    'msisdn' => '33xxxxxxxxx', //number of the person sending the SMS
    'to' => '33xxxxxxxxx',
    'messageId' => '02000000XXXXXXXXX',
    'text' => 'Test',
    'type' =>  'text',
    'keyword' => 'Test',
    'message-timestamp' => '2016-03-10 09:51:46'

)
```
## Example of a response on a long SMS (more than 160 characters)
``` json
Array
(
    'msisdn' => '33xxxxxxxxx', //number of the person sending the SMS
    'to' => '33xxxxxxxxx',
    'messageId' => '02000000YYYYYYYY',
    'concat' => 'true',
    'concat-ref' => '171',
    'concat-total' => '2',
    'concat-part' => '1',
    'text' => '   Long message....',
    'type' => 'text',
    'keyword' => 'LONGMESSAGE',
    'message-timestamp' => '2016-03-09 16:00:30'
)
 
Array
(
    'msisdn' => '33xxxxxxxxx', //number of the person sending the SMS
    'to' => '33xxxxxxxxx',
    'messageId' => '02000000XXXXXXXX',
    'concat' => 'true',
    'concat-ref' => '171',
    'concat-total' => '2',
    'concat-part' => '2',
    'text' => '....very long',
    'type' => 'text',
    'keyword' => 'VERYLONG',
    'message-timestamp' => '2016-03-09 16:00:31'
)
```
<br> 
# Response on a short number (SMS Premium) 

After sending a campaign from our short number, SMS Partner allows you to receive responses.
To learn more,  [contact us](https://www.smspartner.fr/contact). 
<div class="alert alert-info"> Note: To receive responses: configure your <strong> response reception URL </strong> in your <a href="https://my.smspartner.fr/connexion" style="background-color: #47a947; color: white; padding: 5px 8px; text-decoration: none; border-radius: 4px;">SMS API </a> </div>

## Example of a response from our short number

```json
Array (
  'type' => 'response',
  'phone_number' => '+336XXXXXXX1',
  'text' => 'My response',
  'message_id' => '123'
)
```


