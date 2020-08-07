#!/usr/bin/env bash

dxoutput=$(sfdx force:data:record:create -s Billing_Usage__c -v "ExternalId__c=123")
recordId=$(echo $dxoutput | cut -c30-47)
echo $recordId
sfdx shane:data:file:upload -f data/billing-usage.csv -p $recordId
sed 's/123456789012345678/${recordId}/g' 3_readFile.apex > 4_outputFile.apex
sfdx force:apex:execute -f outputFile.apex > 5_output.log