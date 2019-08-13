@isTest
public class nameClass_Test {

    static String variableFinal = 'fixedValue'; 

    //test mass
    @testSetup
    public static void createData() {

    Account accountTest         = new Account();
    accountTest.Name            = 'He-Man';
    accountTest.LastName        = 'Randorson';
    accountTest.FirstName       = 'Adam ';
    accountTest.BillingCountry  = 'Etérnia';
    System.Database.insert(accountTest);

    User userTest               = new User();
    userTest.Username           = 'He-Man';
    userTest.Country            = 'Etérnia';
    userTest.AccountId          = accountTest.Id;
    System.Database.insert(userTest);

    Opportunity opportunityTest = new Opportunity();
    opportunityTest.Name        = 'saveTheWorld';
    opportunityTest.AccountId   = accountTest.Id;
    System.Database.insert(opportunityTest);
    }

    static testMethod void nameMethod_Test(){

        string variable;

        //test catch value
        system.debug('testString'+ variable);
        
        System.Test.startTest();
            nameClass.nameMethod(variable);
            System.assert(!variable.isEmpty());
        System.Test.stopTest();
    }

    //other exemples//
    
    /*
    static testMethod void hasPreferredMethod_Test() {
        
        list<Account> listAcc = [Select Name, LastName, FirstName, BillingCountry FROM Account WHERE BillingCountry =: 'Etérnia' ];

        String jsonAccList = JSON.serialize(listAcc);

        User userTest = getUser();
        System.runAs(userTest) {
            
            System.Test.startTest();
            
            Product.productValid([SELECT Id FROM Opportunity LIMIT 1].Id , jsonAccList);
            Contact contTest = [SELECT Id , Email FROM Contact LIMIT 1];
            contTest.Email = 'E-mail';
            System.Test.stopTest();    
        }
    }*/

    // When the method is private, it must be placed next to  @TestVisible
        //ex:  @TestVisible privite static test(){...

}