// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

Id leadRecordId = '00Qaj000003lfXSEAY';

try {
    // Query the Lead record
    Lead leadRecord = [SELECT Id, Region__c, State__c, NAICS_Code__c FROM Lead WHERE Id = :leadRecordId]; 
    System.debug('Lead Record: ' + leadRecord);

    // // Query the Funding Opportunity records
    // List<Funding_Opportunity__c> fundingOpportunity = [SELECT Id, Region__c, State__c, amount__c, NAICS_Code__c FROM Funding_Opportunity__c WHERE Region__c = :leadRecord.Region__c AND State__c = :leadRecord.State__c];
    // System.debug('Funding Opportunity: ' + fundingOpportunity);
    // Query the Funding Opportunity records
    AggregateResult[] fundingOpportunityTotal = [SELECT SUM(amount__c) FROM Funding_Opportunity__c WHERE Region__c = :leadRecord.Region__c AND State__c = :leadRecord.State__c];
    System.debug('Funding Opportunity: ' + fundingOpportunityTotal);
} catch (Exception e) {
    System.debug('An error occurred: ' + e.getMessage());

}

// List<Funding_Opportunity__c> fundingOpportunity = [SELECT Id, Region__c, State__c, amount__c, NAICS_Code__c FROM Funding_Opportunity__c WHERE Region__c = :leadRecord.Region__c AND State__c = :leadRecord.State__c];
// System.debug('Funding Opportunity: ' + fundingOpportunity);