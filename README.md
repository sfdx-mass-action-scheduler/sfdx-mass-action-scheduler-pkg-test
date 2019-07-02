# Mass Action Scheduler Package Test

Simple repository to speed up configuring a scratch org to test new package installs.

## Enable Dev Hub

If you're new to Salesforce DX, or don't have a Dev Hub org,
complete [Quick Start: Salesforce DX](https://trailhead.salesforce.com/en/content/learn/projects/quick-start-salesforce-dx)
project on Trailhead before you go on.

## Set Default Dev Hub Username
_Provide the alias of your Dev Hub org for creating scratch orgs._

```
sfdx force:config:set defaultdevhubusername=DevHub
```

## Create a Scratch Org

```
sfdx force:org:create -a mas-test-pkg -s -f config/project-scratch-def.json
```

## Install Mass Action Scheduler Package
_Get the latest package id from the [release notes](https://github.com/douglascayers-org/sfdx-mass-action-scheduler/wiki/Release-Notes)._

```
sfdx force:package:install --package PACKAGE_ID --publishwait 30 --wait 10
```

## Push Metadata
_This creates our source Apex class and target Flow to test with._

```
sfdx force:source:push
```

## Assign Permission Set

```
sfdx force:user:permset:assign -n dca_mass_action__Mass_Action_Admin
```

## Load Test Data
_This creates a configuration record that wires together the Apex class and Flow deployed earlier._

```
sfdx force:data:tree:import -f assets/data/dca_mass_action__Mass_Action_Configuration__c-dca_mass_action__Mass_Action_Mapping__c.json
```

## Open Org and Run a Configuration
_Run the configuration record then check that Task records were created soon after._

```
sfdx force:org:open --path //lightning/o/dca_mass_action__Mass_Action_Configuration__c/list
```