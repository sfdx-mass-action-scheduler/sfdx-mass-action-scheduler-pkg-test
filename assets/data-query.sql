/*
 * Join the lines of this query together onto one line
 * and use it with the Salesforce CLI requery data.
 *
 * sfdx force:data:tree:export -u ALIAS -d assets/data -q "QUERY"
 */

SELECT
    Id,
    Name,
    dca_mass_action__Active__c,
    dca_mass_action__Batch_Size__c,
    dca_mass_action__Description__c,
    dca_mass_action__DeveloperName__c,
    dca_mass_action__Schedule_Frequency__c,
    dca_mass_action__Source_Apex_Class__c,
    dca_mass_action__Source_Type__c,
    dca_mass_action__Target_Action_Name__c,
    dca_mass_action__Target_Type__c,
    (
        SELECT
            Id,
            dca_mass_action__Source_Field_Name__c,
            dca_mass_action__Target_Field_Name__c
        FROM
            dca_mass_action__Mass_Action_Mappings__r
    ),
    (
        SELECT
            Id,
            dca_mass_action__Job_ID__c,
            dca_mass_action__Message__c,
            dca_mass_action__Long_Message__c,
            dca_mass_action__Submitted_Date__c,
            dca_mass_action__Total_Batches__c,
            dca_mass_action__Processed_Batches__c,
            dca_mass_action__Failed_Batches__c
        FROM
            dca_mass_action__Mass_Action_Logs__r
    )
FROM
    dca_mass_action__Mass_Action_Configuration__c