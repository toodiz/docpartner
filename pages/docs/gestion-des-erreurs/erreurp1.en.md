---
title: Error Codes
description: >
---
# API Error Codes
Below you will find the error codes for the SMS API:

* Sending SMS
* SMS Cancellation
* Status Retrieval
* Status List
* Status Error Codes
* Number Verification
* Location
* Sub-account
* Sending Voice Messages / VMS
* Sending Emails





## Sending SMS

992 Unauthorized sender

| Codes | Message                                                                                      |
|:-----:|----------------------------------------------------------------------------------------------|
| 1     | The API key is required                                                                      |
| 2     | The phoneNumbers field is required                                                            |
| 4     | message not found                                                                             |
| 10    | Incorrect API key                                                                             |
| 11    | Insufficient credit                                                                           |
| 13    | No default price was found for the following numbers                                          |
| 14    | The number is in the STOP SMS list                                                            |
| 15    | The number is already present in the list                                                     |
| 20    | Account disabled                                                                              |
| 22    | SMS Marketing: The sending time is not valid; it must be between 8 AM and 10 PM.           |
| 23    | SMS Marketing: The date [...] is not valid; sending SMS is not possible on Sundays and holidays. |
| 30    | Account blocked                                                                                |
| 40    | Access to the API is denied                                                                    |
| 42    | The number of characters for a Low Cost SMS is 160 characters                               |
| 43    | The message is required                                                                        |
| 44    | The sender is invalid                                                                          |
| 45    | The date is required                                                                          |
| 46    | The time is required                                                                          |
| 47    | The minutes digit is invalid                                                                   |
| 48    | Minutes must be between 5 and 55 in intervals of 5 minutes                                   |
| 49    | The date is invalid                                                                            |
| 50    | The number of allowed numbers is a maximum of 500                                             |
| 51    | The low-cost range is not eligible                                                             |
| 52    | The number of concatenated SMS cannot exceed 10 SMS                                           |
| 55    | No number to send                                                                              |
| 90    | The JSON is malformed: syntax error                                                           |
| 96    | The IP is not authorized                                                                       |
| 500   | Problem adding the SMS to the queue                                                            |

## SMS Cancellation

| Codes | Message                                                                                      |
|:-----:|----------------------------------------------------------------------------------------------|
| 2     | The phoneNumber field is required                                                             |
| 3     | The MessageId field is required                                                                |
| 4     | This message is not found                                                                      |
| 5     | The list of numbers is empty                                                                    |
| 6     | The format is not correct                                                                      |
| 9     | Does not appear to be a mobile number                                                          |
| 50    | The number of allowed numbers is a maximum of 500                                             |
| 96    | The IP is not authorized                                                                       |

## Status Retrieval

| Codes | Message                                                                                      |
|:-----:|----------------------------------------------------------------------------------------------|
| 2     | The phoneNumber field is required                                                             |
| 3     | The MessageId field is required                                                                |
| 4     | This message is not found                                                                      |
| 5     | The list of numbers is empty                                                                    |
| 6     | The format is not correct                                                                      |
| 9     | Does not appear to be a mobile number                                                          |
| 50    | The number of allowed numbers is a maximum of 500                                             |
| 96    | The IP is not authorized                                                                       |

## Status List

| Codes        | Message                                                                                      |
|--------------|----------------------------------------------------------------------------------------------|
| delivered    | The SMS has been delivered                                                                    |
| not delivered | The SMS has not been delivered                                                                |
| waiting      | The SMS has been sent, awaiting at the operator                                               |
| ko           | The SMS was not sent, a problem occurred, please contact customer service                    |

## Status Error Codes

### SMS Status

| Codes        | Description                                                                                  |
|--------------|----------------------------------------------------------------------------------------------|
| DELIVRD      | The message has been processed and delivered successfully.                                   |
| PENDING      | The message has been processed and sent to the next instance. The delivery report has not yet been received and is awaited, the status is still pending. |
| UNDELIV      | The message has been sent to the operator, but could not be delivered, as a receipt with the status "UNDELIV" was canceled by the operator. |
| ACCEPTD      | The SMS has been accepted and will be sent.                                                 |
| UNKNOWN      | An unknown error occurred.                                                                   |
| ENROUTE      | The message is en route.                                                                     |
| EXPIRED      | The message has been sent and has expired due to exceeding its validity period (our default platform is 48 hours), or the operator returned EXPIRED as the final status. |
| REJECTD      | The message has been sent, but it was rejected by the operator and returned REJECTD as the final status. |

## Number Verification

| Codes | Message                                                                                      |
|:-----:|----------------------------------------------------------------------------------------------|
| 2     | The phoneNumber field is required                                                             |
| 11    | Insufficient credit                                                                           |
| 13    | No default price has been found for this destination                                          |
| 14    | The number is in the STOP SMS list                                                            |
| 19    | The numbers must be separated by a comma                                                      |
| 50    | The number of allowed numbers is a maximum of 500                                             |
| 55    | No number to send                                                                              |

## Location

| Codes | Message                                                                                      |
|:-----:|----------------------------------------------------------------------------------------------|
| 3     | The parameters field is required                                                               |
| 4     | The op parameter is required                                                                   |
| 5     | The urlNotification parameter is not a valid URL                                             |
| 6     | This operation is not authorized                                                               |
| 7     | The sex parameter is required                                                                   |
| 8     | The sex parameter must be only m, h, or f                                                    |
| 9     | The minAge parameter is required                                                               |
| 11    | Insufficient credit                                                                           |
| 12    | The minAge parameter must be greater than 17                                                 |
| 13    | The maxAge parameter is required                                                               |
| 14    | The maxAge parameter must be less than 99                                                    |
| 15    | The interest parameter must be greater than 0                                                |
| 16    | The interest parameter cannot be empty                                                         |
| 17    | The subInterest parameter must not be empty                                                   |
| 18    | The subInterest parameter must be greater than 0                                             |
| 19    | The interest or subInterest parameters are required                                           |
| 22    | The category parameter must not be empty                                                      |
| 23    | The category parameter must be greater than 0                                                |
| 24    | The Type parameters are required                                                               |
| 25    | The Localite parameter is required                                                             |
| 26    | The Volume parameter is required                                                               |
| 27    | The desired volume cannot exceed the available volume                                         |
| 28    | The DesiredVolume parameter cannot exceed the total volume                                     |
| 31    | The token parameter is required                                                                 |
| 32    | The rental request is not found                                                                |
| 33    | The rental file is not found                                                                    |
| 34    | The rental file has already been used                                                          |
| 35    | The rental file is being downloaded                                                             |
| 36    | The rental of the file has failed                                                               |
| 61    | The request seems invalid and returned no results                                              |
| 96    | The IP is not authorized                                                                        |

## Sub-account

| Codes | Message                                                                                      |
|:-----:|----------------------------------------------------------------------------------------------|
| 2     | You are not authorized to create sub-accounts                                               |
| 3     | The Credit field is required                                                                  |
| 4     | The tokenSubaccount field is required                                                         |
| 5     | The credit field must be greater than 0                                                      |
| 6     | The sub-account is not found                                                                  |
| 7     | Insufficient credit for the sub-account                                                      |
| 11    | Insufficient credit                                                                           |
| 96    | The IP is not authorized                                                                       |

## HLR

### Code Status: PENDING (statusGrpId: 1)

The message has been processed and sent to the mobile operator.

| statusId | Status                           | Description                                                                                      |
|:--------:|:--------------------------------:|--------------------------------------------------------------------------------------------------|
| 3        | PENDING_WAITING_DELIVERY         | The message has been processed and sent. The delivery report has not yet been received and is awaited, so the status is still pending. |
| 7        | PENDING_ENROUTE                  | The message has been processed and sent to the mobile operator.                                   |
| 26       | PENDING_ACCEPTED                 | The message has been accepted and processed, and is ready to be sent to the operator.            |

### UNDELIVERABLE (statusGrpId: 2)

The message has not been delivered.

| statusId | Status                           | Description                                                                                      |
|:--------:|:--------------------------------:|--------------------------------------------------------------------------------------------------|
| 4        | UNDELIVERABLE_REJECTED_OPERATOR  | A message has been sent to the operator, a delivery report with the status "REJECTED" has been returned. |
| 9        | UNDELIVERABLE_NOT_DELIVERED      | The message has been sent to the operator, but could not be delivered, a delivery report with the status "UNDELIVERED" has been returned by the operator. |

### DELIVERED (statusGrpId: 3)

The message has been processed and delivered successfully.

| statusId | Status                           | Description                                                                                      |
|:--------:|:--------------------------------:|--------------------------------------------------------------------------------------------------|
| 2        | DELIVERED_TO_OPERATOR            | The message has been sent and delivered successfully to the operator.                          |
| 5        | DELIVERED_TO_HANDSET             | The message has been processed and successfully delivered to the recipient.                     |

### EXPIRED (statusGrpId: 4)

The message has been sent and has expired either because it was pending beyond its validity period (our platform is configured by default for 48 hours), or because the operator's delivery report restored the status "EXPIRED" as the final status.

| statusId | Status                           | Description                                                                                      |
|:--------:|:--------------------------------:|--------------------------------------------------------------------------------------------------|
| 15       | EXPIRED_EXPIRED                  | The message has been received and sent to the operator. However, it remained pending until the validity period expired or until the operator returned the status EXPIRED. |
| 29       | EXPIRED_DLR_UNKNOWN              | The message has been received and transmitted to the operator for delivery. However, the operator's delivery report has not been formatted correctly or has not been recognized as valid. |

### REJECTED (statusGrpId: 5)

The message has been received but has been rejected by the operator.

| statusId | Status                           | Description                                                                                      |
|:--------:|:--------------------------------:|--------------------------------------------------------------------------------------------------|
| 6        | REJECTED_NETWORK                 | The message has been received, but the network is out of our coverage.                         |
| 8        | REJECTED_PREFIX_MISSING          | The message has been received but has been rejected because the number is not recognized due to a prefix or incorrect number length. This information varies for each network and is regularly updated. |
| 10       | REJECTED_DND                     | The message has been received and rejected because the user is subscribed to DND services (Do Not Disturb), which disables any service traffic to their number. |
| 11       | REJECTED_SOURCE                  | Your account is configured to accept only registered sender IDs while the sender ID defined in the request has not been registered on your account. |
| 21       | REJECTED_SYSTEM_ERROR            | The request has been rejected due to a system error, please try resubmitting or contact our technical support team for more details. |
| 52       | REJECTED_DESTINATION             | The request has been received, but the destination is not valid – the number prefix is incorrect as it does not match a valid prefix of any mobile operator. The number length is also taken into consideration to verify the validity of the number. |

## Error Codes (HLR)

### OK (errorGrpId: 0)

The request has been processed successfully.

| errorId | Permanent | Error      | Description                                                                                      |
|---------|-----------|------------|--------------------------------------------------------------------------------------------------|
| 0       | false     | NO_ERROR   | No error description is provided. Generally returned for successful delivery or when the error code has not been returned by the operator. |

### HANDSET_ERRORS (errorGrpId: 1)

The request has not been completed due to issues related to the mobile phone.

| errorId | Permanent | Error                          | Description                                                                                      |
|---------|-----------|--------------------------------|--------------------------------------------------------------------------------------------------|
| 1       | true      | EC_UNKNOWN_SUBSCRIBER          | The number does not exist or has not been assigned to an active subscriber in the operator's user database. |
| 5       | false     | EC_UNIDENTIFIED_SUBSCRIBER     | Unidentified subscriber                                                                          |
| 6       | false     | EC_ABSENT_SUBSCRIBER_SM        | The subscriber is detected as being unavailable, as there has been no response to the device's radiomessaging. This is often due to the device being turned off or located in a low signal area. Applies to version 3 of the MAP protocol. |
| 7       | false     | EC_UNKNOWN_EQUIPMENT            | The mobile device has not been recognized by the EIR (Equipment Identity Register) during the device check at the MAP protocol level on the operator's infrastructure. |
| 8       | false     | EC_ROAMING_NOT_ALLOWED          | The subscriber is currently roaming in another country or in another operator's infrastructure – roaming provision is not guaranteed due to the absence of roaming agreements between many different operators. |
| 9       | true      | EC_ILLEGAL_SUBSCRIBER          | Illegal subscriber                                                                              |
| 11      | true      | EC_TELESERVICE_NOT_PROVISIONED  | The subscriber's mobile service has been suspended by the operator.                             |
| 12      | true      | EC_ILLEGAL_EQUIPMENT            | Illegal equipment                                                                                |
| 13      | false     | EC_CALL_BARRED                  | The message is rejected due to messaging service prohibition, the blocking is set by the operator or the subscriber for the number. |
| 27      | false     | EC_ABSENT_SUBSCRIBER            | The subscriber is offline in the network, as confirmed by the device's response to the radiomessaging. This is often due to the device being turned off. |
| 31      | false     | EC_SUBSCRIBER_BUSY_FOR_MT_SMS   | The subscriber is busy for MT SMS                                                               |
| 32      | false     | EC_SM_DELIVERY_FAILURE          | Delivery failure                                                                                |
| 33      | false     | EC_MESSAGE_WAITING_LIST_FULL    | Message waiting list full                                                                       |
| 34      | false     | EC_SYSTEM_FAILURE                | System failure                                                                                  |
| 35      | false     | EC_DATA_MISSING                  | Missing data                                                                                   |
| 36      | false     | EC_UNEXPECTED_DATA_VALUE         | Unexpected data value                                                                           |
| 255     | false     | EC_UNKNOWN_ERROR                 | Unknown error                                                                                   |
| 256     | false     | EC_SM_DF_MEMORYCAPACITYEXCEEDED | There was a mobile subscriber equipment error, while the device memory has been exceeded.      |
| 257     | false     | EC_SM_DF_EQUIPMENTPROTOCOLERROR  | There was an error in the mobile subscriber equipment.                                         |
| 258     | false     | EC_SM_DF_EQUIPMENTNOTSM_EQUIPPED | There was an error in the mobile subscriber equipment.                                         |
| 259     | false     | EC_SM_DF_UNKNOWNSERVICECENTRE    | There was an error in the mobile subscriber equipment.                                         |
| 260     | false     | EC_SM_DF_SC_CONGESTION           | There was an error in the mobile subscriber equipment.                                         |
| 261     | false     | EC_SM_DF_INVALIDSME_ADDRESS      | There was an error in the mobile subscriber equipment.                                         |
| 262     | false     | EC_SM_DF_SUBSCRIBERNOTSC_SUBSCRIBER | There was an error in the mobile subscriber equipment.                                         |
| 500     | false     | EC_PROVIDER_GENERAL_ERROR         | General network protocol error, caused by operator network protocol version or incompatible settings between two network components. |
| 502     | false     | EC_NO_RESPONSE                    | The message has been processed and successfully transmitted to the operator, but the operator did not respond to the message submission request, or the error was canceled by the operator. The error also applies to similar errors at the SS7 network level. |
| 503     | false     | EC_SERVICE_COMPLETION_FAILURE      | General network protocol error, caused by operator network protocol version or incompatible settings between two network components. |
| 504     | false     | EC_UNEXPECTED_RESPONSE_FROM_PEER   | General network protocol error, caused by operator network protocol version or incompatible settings between two network components. |
| 507     | false     | EC_MISTYPED_PARAMETER              | General network protocol error, caused by operator network protocol version or incompatible settings between two network components. |
| 508     | false     | | 509 | false | EC_DUPLICATED_INVOKE_ID | General network protocol error, caused by operator network protocol versions or incompatible parameters between two network components. |
| 1024 | false | EC_OR_APPCONTEXTNOTSUPPORTED | General network protocol error, caused by operator network protocol versions or incompatible parameters between two network components. |
| 1025 | false | EC_OR_INVALIDDESTINATIONREFERENCE | General network protocol error, caused by operator network protocol versions or incompatible parameters between two network components. |
| 1026 | false | EC_OR_INVALIDORIGINATINGREFERENCE | General network protocol error, caused by operator network protocol versions or incompatible parameters between two network components. |
| 1027 | false | EC_OR_ENCAPSULATEDAC_NOTSUPPORTED | General network protocol error, caused by operator network protocol versions or incompatible parameters between two network components. |
| 1028 | false | EC_OR_TRANSPORTPROTECTIONNOTADEQUATE | General network protocol error, caused by operator network protocol versions or incompatible parameters between two network components. |
| 1029 | false | EC_OR_NOREASONGIVEN | General network protocol error, caused by operator network protocol versions or incompatible parameters between two network components. |
| 1030 | false | EC_OR_POTENTIALVERSIONINCOMPATIBILITY | General network protocol error, caused by operator network protocol versions or incompatible parameters between two network components. |
| 1031 | false | EC_OR_REMOTENODENOTREACHABLE | The mobile subscriber was not reachable due to a network operator protocol error. |
| 1152 | false | EC_NNR_NOTRANSLATIONFORANADDRESSOFSUCHNATURE | The mobile subscriber was not reachable due to a network operator protocol error. |
| 1153 | false | EC_NNR_NOTRANSLATIONFORTHISSPECIFICADDRESS | No translation for this specific address. |
| 1154 | false | EC_NNR_SUBSYSTEMCONGESTION | The mobile subscriber was not reachable due to a network operator protocol error. |
| 1155 | false | EC_NNR_SUBSYSTEMFAILURE | The mobile subscriber was not reachable due to a network operator protocol error. |
| 1156 | false | EC_NNR_UNEQUIPPEDUSER | The mobile subscriber was not reachable due to a network operator protocol error. |
| 1157 | false | EC_NNR_MTPFAILURE | The mobile subscriber was not reachable due to a network operator protocol error. |
| 1158 | false | EC_NNR_NETWORKCONGESTION | The mobile subscriber was not reachable due to a network operator protocol error. |

### USER_ERRORS (errorGrpId: 2)

An user error has occurred.

| errorId | Permanent | Error | Description |
|:---------:|:-----------:|:-------:|-------------|
| 2049 | true | EC_IMSI_BLACKLISTED | IMSI is blacklisted. |
| 2052 | true | EC_BLACKLISTED_DESTINATIONADDRESS | The destination number has been blacklisted either at the request of the operator or on your account via the SMSPartner web portals – please remove the blacklist from your account via portal.infobip.com or contact support for more information. |
| 2053 | true | EC_BLACKLISTED_SENDERADDRESS | The sender number has been blacklisted either at the request of the operator or on your account via the SMSPartner web portals – please remove the blacklist from your account via portal.infobip.com or contact support for more information. |
| 2053 | true | EC_SOURCE_ADDRESS_BLACKLISTED | The source address is blacklisted on the SMSPartner account. |
| 4096 | true | EC_INVALID_PDU_FORMAT | Invalid PDU format. |
| 4100 | true | EC_MESSAGE_CANCELED | The request has been received, but has not been sent to the next instance during its validity period, and has expired with the appropriate error code EC_MESSAGE_CANCELED, or the same error code has been returned by the operator. |
| 4101 | true | EC_VALIDITYEXPIRED | The message has been sent to the next instance, and has not been delivered within the message validity period, it has therefore expired with the appropriate error code EC_VALIDITYEXPIRED or the error code has been returned by the operator. |
| 4102 | true | EC_NOTSUBMITTEDTOSMPPCHANNEL | Cannot be transferred via SMPP due to lack of SMPP connectivity. |
| 4103 | true | EC_DESTINATION_FLOODING | Regarding the REJECTED_FLOODING_FILTER status, the message is rejected due to the number of messages sent to a single number. |
| 4104 | true | EC_DESTINATION_TXT_FLOODING | Regarding the REJECTED_FLOODING_FILTER status, the message is rejected due to the number of identical messages sent to a single number. |

### OPERATOR_ERRORS (errorGrpId: 3)

The request has not been completed due to operator-related issues.

| errorId | Permanent | Error | Description |
|:---------:|:-----------:|:-------:|-------------|
| 10 | true | EC_BEARER_SERVICE_NOT_PROVISIONED | Bearer service not provided. |
| 20 | false | EC_SS_INCOMPATIBILITY | SS incompatibility. |
| 51 | true | EC_RESOURCE_LIMITATION | Indicates that the invoked MAP operation could not be completed due to network congestion – this is a network congestion error at the SS7 level in the MAP protocol. |
| 71 | false | EC_UNKNOWN_ALPHABET | Unknown alphabet. |
| 501 | false | EC_INVALID_RESPONSE_RECEIVED | Received an invalid response. |
| 2048 | false | EC_TIME_OUT | Time Out. |
| 2050 | true | EC_DEST_ADDRESS_BLACKLISTED | The number has been found on the DND (Do Not Disturb) blacklist provided by the operator, or the same error code has been returned by the operator. |

## Sending Voice Messages / VMS

| Codes                      | Message                                      |
|:----------------------------:|----------------------------------------------|
| PHONE_NUMBER_REQUIRED      | The phone number is required                  |
| PHONE_NUMBER_SIZE_ERROR    | The number of phone numbers exceeds 500       |
| TOKEN_AUDIO_REQUIRED       | The audio token is required                    |
| NOTIFY_URL_INVALID         | The notification URL is invalid                |
| SENDER_NOT_AUTHORIZED      | The sender is not authorized                   |
| SENDER_INVALID             | The sender is invalid                          |
| AUDIO_FILE_NOT_FOUND       | The audio file is not found                    |
| DESTINATION_INVALID        | The phone number is not authorized             |
| NOT_CREDIT                 | Insufficient credit                            |

## Sending Mail

| Codes | Message                                                      |
|:-------:|--------------------------------------------------------------|
| 1     | The API key is required                                       |
| 2     | The content of the mail is required                          |
| 3     | The API key is required                                       |
| 4     | The sender email is required                                  |
| 5     | The sender name cannot be empty                              |
| 8     | The URL of the attachment is required                        |
| 9     | The attachment extension is not allowed                      |
| 10    | Incorrect API key                                            |
| 11    | Insufficient credit                                          |
| 14    | The mail is in the unsubscribe list                          |
| 15    | The mail is already in the sending list                      |
| 16    | The name of the attachment cannot be empty                   |
| 17    | Maximum number of recipients exceeded                         |
| 18    | The recipient's email is required                            |
| 19    | The recipient's email seems invalid                          |
| 20    | Account disabled                                             |
| 21    | The recipient's name cannot be empty                        |
| 22    | The recipient list is required                               |
| 23    | The recipient's reply email is required                     |
| 24    | The recipient's reply email seems invalid                   |
| 25    | The recipient's reply name cannot be empty                  |
| 30    | Account blocked                                             |
| 40    | Access to the API is denied                                  |
| 45    | The date is required                                         |
| 46    | The time is required                                         |
| 47    | The minutes digit is invalid                                 |
| 48    | Minutes must be between 5 and 55 in intervals of 5 minutes  |
| 49    | The date is invalid                                         |
| 50    | The number of allowed mails is a maximum of 500             |
| 55    | No default price has been found                              |
| 90    | The JSON is malformed: syntax error                          |
| 96    | The IP is not authorized                                     |
| 429   | Too many requests made in one minute (limit: 2000 requests / minute / IP Address) |
| 500   | Problem adding the mail to the queue                         |


