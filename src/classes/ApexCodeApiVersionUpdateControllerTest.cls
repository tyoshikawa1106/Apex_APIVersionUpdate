/**
 * ApexCodeApiVersionUpdate
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class ApexCodeApiVersionUpdateControllerTest {

    /**
     * ApexCodeApiVersionUpdateControllerTest1
     */
    static testMethod void ApexCodeApiVersionUpdateControllerTest1() {
        
        Test.startTest();
        
        ApexCodeApiVersionUpdateController cls = new ApexCodeApiVersionUpdateController();
        System.assertEquals(String.isEmpty(cls.searchApiVersion), true);
        System.assertEquals(String.isEmpty(cls.updateApiVersion), true);
        System.assertEquals(String.isEmpty(cls.apexCodeType), true);
        
        Test.stopTest();
    }
    
    /**
     * ApexCodeApiVersionUpdateControllerTest2
     */
    static testMethod void ApexCodeApiVersionUpdateControllerTest2() {
        
        ApiVersionUpdateCtrl__c ctrl = createApiVersionUpdateCtrl();
        
        Test.startTest();
        
        ApexCodeApiVersionUpdateController cls = new ApexCodeApiVersionUpdateController();
        System.assertEquals(String.isEmpty(cls.searchApiVersion), true);
        System.assertEquals(String.isEmpty(cls.updateApiVersion), false);
        System.assertEquals(String.isEmpty(cls.apexCodeType), false);
        
        Test.stopTest();
    }
    
    /**
     * doSearchTest
     */
    static testMethod void doSearchTest() {
        
        ApexCodeApiVersionUpdateController cls = new ApexCodeApiVersionUpdateController();
        cls.apexCodeType = System.Label.ApiUpdate_CodeType_Page;
        
        Test.startTest();
        
        cls.doSearch();
        System.assertEquals(cls.wrappers.isEmpty(), true);
        
        Test.stopTest();
    }
    
    /**
     * doSearchForApexPageTest
     */
    static testMethod void doSearchForApexPageTest() {
        
        ApiVersionUpdateCtrl__c ctrl = createApiVersionUpdateCtrl();
        
        ApexCodeApiVersionUpdateController cls = new ApexCodeApiVersionUpdateController();
        cls.apexCodeType = System.Label.ApiUpdate_CodeType_Page;
        
        Test.startTest();
        
        cls.doSearch();
        //System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * doSearchForApexComponentTest
     */
    static testMethod void doSearchForApexComponentTest() {
        
        ApiVersionUpdateCtrl__c ctrl = createApiVersionUpdateCtrl();
        
        ApexCodeApiVersionUpdateController cls = new ApexCodeApiVersionUpdateController();
        cls.apexCodeType = System.Label.ApiUpdate_CodeType_Component;
        
        Test.startTest();
        
        cls.doSearch();
        //System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * doSearchForApexClassTest
     */
    static testMethod void doSearchForApexClassTest() {
        
        ApiVersionUpdateCtrl__c ctrl = createApiVersionUpdateCtrl();
        
        ApexCodeApiVersionUpdateController cls = new ApexCodeApiVersionUpdateController();
        cls.apexCodeType = System.Label.ApiUpdate_CodeType_Class;
        
        Test.startTest();
        
        cls.doSearch();
        //System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * doSearchForApexTriggerTest
     */
    static testMethod void doSearchForApexTriggerTest() {
        
        ApiVersionUpdateCtrl__c ctrl = createApiVersionUpdateCtrl();
        
        ApexCodeApiVersionUpdateController cls = new ApexCodeApiVersionUpdateController();
        //cls.apexCodeType = System.Label.ApiUpdate_CodeType_Trigger;
        
        Test.startTest();
        
        cls.doSearch();
        System.assertEquals(cls.wrappers.isEmpty(), false);
        
        Test.stopTest();
    }
    
    
    /**
     * msgErrorTest
     */
    static testMethod void msgErrorTest() {
        
        Test.startTest();
        
        ApexCodeApiVersionUpdateController cls = new ApexCodeApiVersionUpdateController();
        try {
            Id resultId = 'NG';
        } catch(Exception e) {
            cls.msgError(e);
        }
        
        Test.stopTest();
    }
    
    /**
     * WrapperClassTest
     */
    static testMethod void WrapperClassTest() {
        
        ApexPage aPage = new ApexPage();
        ApexComponent aComponent = new ApexComponent();
        ApexClass aClass = new ApexClass();
        ApexTrigger aTrigger = new ApexTrigger();
        
        Test.startTest();
        
        List<ApexCodeApiVersionUpdateController.Wrapper> results = new List<ApexCodeApiVersionUpdateController.Wrapper>();
        results.add(new ApexCodeApiVersionUpdateController.Wrapper(aPage));
        results.add(new ApexCodeApiVersionUpdateController.Wrapper(aComponent));
        results.add(new ApexCodeApiVersionUpdateController.Wrapper(aClass));
        results.add(new ApexCodeApiVersionUpdateController.Wrapper(aTrigger));
        System.assertEquals(results.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * createApiVersionUpdateCtrl
     * Test Data
     */
    private static ApiVersionUpdateCtrl__c createApiVersionUpdateCtrl() {
        ApiVersionUpdateCtrl__c ctrl = new ApiVersionUpdateCtrl__c(
             MaxApiVersion__c = 29.0
            ,MinApiVersion__c = 24.0
        );
        insert ctrl;
        return ctrl;
    }
}