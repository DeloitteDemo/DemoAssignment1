/**
* @File Name:   NF_AccountTriggerHandler_Sample.cls
* @Description:   
* @Author:      MH
* @Group:       Apex
* @Modification Log :
*-------------------------------------------------------------------------------------
* Ver       Date        Author      Modification
* 1.0       2018-07-21  MH    Created the file/class
*/
public with sharing class NF_AccountTriggerHandler_Sample extends NF_AbstractTriggerHandler {
    public override void beforeUpdate(){

    }

    public override void afterUpdate(){

    }

    public override void beforeInsert(){

    }

    public override void afterInsert(List<SObject> newlstObj){

   List<Contact> contList = new List<Contact>();
    
    // Get the related Contacts for the accounts in this trigger
    Map<Id,Account> acctsWithCont = new Map<Id,Account>(
        [SELECT Id,(SELECT Id FROM Contacts) FROM Account WHERE Id IN : (List<Account>)newlstObj]);
    
    // Add a Contact for each account if it doesn't already have one.
    // Iterate through each account.
    for(Account a : (List<Account>)newlstObj) {
        
        // Check if the account already has a related contact.
        if (acctsWithCont.get(a.Id).Contacts.size() == 0) {
            // If it doesn't, add a default contact
          if(a.name!=null){
            contList.add(new Contact(LastName=a.Name,AccountID=a.id));
                         }
        }           
    }
    if (contList.size() > 0) {
        insert contList;
    }



    }

    public override void afterDelete(){

    }

    public override void andFinally(){

    }
}