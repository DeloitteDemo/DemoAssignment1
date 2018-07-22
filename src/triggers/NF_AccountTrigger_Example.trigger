/**
* @File Name:   NF_AccountTrigger_Example.trigger
* @Description: An example trigger for testing  
* @Author:      MH
* @Group:       Trigger
* @Modification Log :
*-------------------------------------------------------------------------------------
* Ver       Date        Author      Modification
* 1.0       2018-07-21  MH    Created the file/class
*/
trigger NF_AccountTrigger_Example on Account (
    before insert, 
    before update, 
    before delete,
    after insert,
    after update, 
    after delete, 
    after undelete) {
    NF_TriggerFactory.CreateHandlerAndExecute(Account.sObjectType);
}