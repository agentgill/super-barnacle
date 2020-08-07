#!/usr/bin/env bash

# Some demo showing creating demo scratch org automatically, uploading and parsing a CSV in apex!!!

set -e

echo "Creating scratch org against a devhub org with alais devhub0 (change to own)"
sfdx force:org:create -f config/project-scratch-def.json -s -a demo -d 30 -v devhub0 -w 10

echo "Creating a Demo Billing Custom Oject in Salesforce..."
sfdx shane:object:create -a billing_usage__c -l "Billing Usage" -p "Billing Usage" -t custom --autonumberformat={0000} --enterprise --nametype=AutoNumber

echo "There is my custom object, now adding a custom field..."
sfdx shane:object:field -a ExternalId__c -l 255 -n "External Id" -t Text -o billing_usage__c
sfdx force:source:push
echo "That is in my org now, how cool is that?"
sleep 10

sfdx shane:object:tab -o billing_usage__c -i 18
sfdx force:source:push
echo "Forgot the tab, no problem..."
sleep 10
echo "What about permissions?, no problem... hold on one sec"

sfdx shane:permset:create -n Access_Billing_Usage -o billing_usage__c -t
sfdx shane:permset:create -o billing_usage__c -f ExternalId__c -n Access_Billing_Usage
sfdx force:source:push
sfdx force:user:permset:assign -n Access_Billing_Usage
echo "All done, oh and we assigned it to you as well!"
sleep 10

echo "Ready for the next trick?"
sleep 10
bash 2_uploadFile.sh




