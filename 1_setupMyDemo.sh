#!/usr/bin/env bash

echo "Create a Azure Billing Oject in salesforce..."
sfdx shane:object:create -a billing_usage__c -l "Billing Usage" -p "Billing Usage" -t custom --autonumberformat={0000} --enterprise --nametype=AutoNumber
sfdx force:source:push
echo "That is in my org now, how cool is that?"
echo "Now adding a field..."
sfdx shane:object:field -a ExternalId__c -l 255 -n "External Id" -t Text -o billing_usage__c


sfdx shane:object:tab -o billing_usage__c -i 18
sfdx force:source:push
echo "There is my tab, are you impressed yet?"

echo "What about permissions, no problem... hold on one sec"

sfdx shane:permset:create -n Access_Billing_Usage -o billing_usage__c -t
sfdx shane:permset:create -o billing_usage__c -f ExternalId__c -n Access_Billing_Usage
sfdx force:source:push
sfdx force:user:permset:assign -n Access_Billing_Usage

echo "Done, oh and we assigned it to you!





