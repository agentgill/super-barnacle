#!/usr/bin/env bash

dxoutput=$(sfdx force:data:record:create -s Billing_Usage__c -v "ExternalId__c=123")
recordId=$(echo $dxoutput | cut -c30-47)
echo $recordId
sfdx shane:data:file:upload -f data/billing-usage.csv -p $recordId

