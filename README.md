# Mass Action Scheduler Package Test

Simple repository to speed up configuring a scratch org to test new package installs.

## Enable Dev Hub

If you're new to Salesforce DX, or don't have a Dev Hub org,
complete [Quick Start: Salesforce DX](https://trailhead.salesforce.com/en/content/learn/projects/quick-start-salesforce-dx) project on Trailhead before you go on.

## Set Default DevHub Username

```
sfdx force:config:set defaultdevhubusername=DevHub
```

## Create Scratch Org

```
sfdx force:org:create -a mas-test-pkg -s -f config/project-scratch-def.json
```

## Install Mass Action Scheduler Package

```
sfdx force:package:install --package 04tf4000004IvKs --publishwait 30 --wait 10
```

## Push Metadata

```
sfdx force:source:push
```

## Assign Permission Set

```
sfdx force:user:permset:assign -n dca_mass_action__Mass_Action_Admin
```

## Load Test Data

```
sfdx force:data:tree:import -f assets/data/dca_mass_action__Mass_Action_Configuration__c-dca_mass_action__Mass_Action_Mapping__c.json
```

## Open Org and Run a Configuration

```
sfdx force:org:open --path //lightning/o/dca_mass_action__Mass_Action_Configuration__c/list
```