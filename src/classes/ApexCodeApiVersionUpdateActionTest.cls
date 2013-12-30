/**
 * ApexCodeApiVersionUpdate
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
@isTest
private class ApexCodeApiVersionUpdateActionTest {
    
    private static final String APEX_PAGE = 'ApexPage';
    private static final String APEX_COMPONENT = 'ApexComponent';
    private static final String APEX_CLASS = 'ApexClass';
    private static final String APEX_TRIGGER = 'ApexTrigger';

    /**
     * ApexCodeApiVersionUpdateActionTest
     */
    static testMethod void ApexCodeApiVersionUpdateActionTest() {
        
        Test.startTest();
        
        ApexCodeApiVersionUpdateAction action = new ApexCodeApiVersionUpdateAction();
        
        Test.stopTest();
    }
    
    /**
     * getApiVersionListItemTest1
     */
    static testMethod void getApiVersionListItemTest1() {
        
        ApexCodeApiVersionUpdateAction action = new ApexCodeApiVersionUpdateAction();
        Decimal maxApiVersion = 29.0;
        Decimal minApiVersion = 24.0;
        
        Test.startTest();
        
        List<SelectOption> results = action.getApiVersionListItem(true, maxApiVersion, minApiVersion);
        System.assertEquals(results[0].getValue(), '');
        System.assertEquals(results[0].getLabel(), System.Label.ApiUpdate_Default);
        
        Test.stopTest();
    }
    
    /**
     * getApiVersionListItemTest2
     */
    static testMethod void getApiVersionListItemTest2() {
        
        ApexCodeApiVersionUpdateAction action = new ApexCodeApiVersionUpdateAction();
        Decimal maxApiVersion = 29.0;
        Decimal minApiVersion = 24.0;
        
        Test.startTest();
        
        List<SelectOption> results = action.getApiVersionListItem(false, maxApiVersion, minApiVersion);
        System.assertNotEquals(results[0].getValue(), '');
        System.assertNotEquals(results[0].getLabel(), System.Label.ApiUpdate_Default);
        
        Test.stopTest();
    }
    
    /**
     * getCodeTypeListItemTest
     */
    static testMethod void getCodeTypeListItemTest() {
        
        String apexPage = Schema.getGlobalDescribe().get(APEX_PAGE).getDescribe().getLabel();
        String apexComponent = Schema.getGlobalDescribe().get(APEX_COMPONENT).getDescribe().getLabel();
        String apexClass = Schema.getGlobalDescribe().get(APEX_CLASS).getDescribe().getLabel();
        String apexTrigger = Schema.getGlobalDescribe().get(APEX_TRIGGER).getDescribe().getLabel();
        
        ApexCodeApiVersionUpdateAction action = new ApexCodeApiVersionUpdateAction();
        
        Test.startTest();
        
        List<SelectOption> results = action.getCodeTypeListItem();
        
        System.assertEquals(results[0].getValue(), System.Label.ApiUpdate_CodeType_Page);
        System.assertEquals(results[0].getLabel(), apexPage);
        
        System.assertEquals(results[1].getValue(), System.Label.ApiUpdate_CodeType_Component);
        System.assertEquals(results[1].getLabel(), apexComponent);
        
        //System.assertEquals(results[2].getValue(), System.Label.ApiUpdate_CodeType_Class);
        //System.assertEquals(results[2].getLabel(), apexClass);
        
        //System.assertEquals(results[3].getValue(), System.Label.ApiUpdate_CodeType_Trigger);
        //System.assertEquals(results[3].getLabel(), apexTrigger);
        
        Test.stopTest();
    }
    
    /**
     * getNotTargetsTest
     */
    static testMethod void getNotTargetsTest() {
        
        ApexCodeApiVersionUpdateAction action = new ApexCodeApiVersionUpdateAction();
        
        Test.startTest();
        
        Set<String> results = action.getNotTargets();
        System.assertEquals(results.isEmpty(), false);
        
        Test.stopTest();
    }
    
    /**
     * getSelectQueryTest
     */
    static testMethod void getSelectQueryTest() {
        
        ApexCodeApiVersionUpdateAction action = new ApexCodeApiVersionUpdateAction();
        
        Test.startTest();
        
        String result = action.getSelectQuery(System.Label.ApiUpdate_CodeType_Page);
        System.assertEquals(String.isEmpty(result), false);
        
        result = '';
        
        result = action.getSelectQuery(System.Label.ApiUpdate_CodeType_Component);
        System.assertEquals(String.isEmpty(result), false);
        
        result = '';
        
        result = action.getSelectQuery(System.Label.ApiUpdate_CodeType_Class);
        System.assertEquals(String.isEmpty(result), false);
        
        result = '';
        
        result = action.getSelectQuery(System.Label.ApiUpdate_CodeType_Trigger);
        System.assertEquals(String.isEmpty(result), false);
        
        Test.stopTest();
    }
    
    /**
     * getWhereQueryTest1
     */
    static testMethod void getWhereQueryTest1() {
        
        Decimal apiVersion = null;
        String targetName = '';
        
        ApexCodeApiVersionUpdateAction action = new ApexCodeApiVersionUpdateAction();
        Set<String> notTargets = action.getNotTargets();
        
        Test.startTest();
        
        String result = action.getWhereQuery(apiVersion, notTargets, targetName);
        System.assertEquals(String.isEmpty(result), false);
        
        Test.stopTest();
    }
    
    /**
     * getWhereQueryTest2
     */
    static testMethod void getWhereQueryTest2() {
        
        Decimal apiVersion = 29.0;
        String targetName = 'Sample';
        
        ApexCodeApiVersionUpdateAction action = new ApexCodeApiVersionUpdateAction();
        Set<String> notTargets = action.getNotTargets();
        
        Test.startTest();
        
        String result = action.getWhereQuery(apiVersion, notTargets, targetName);
        System.assertEquals(String.isEmpty(result), false);
        
        Test.stopTest();
    }
    
    /**
     * getOptionQueryTest
     */
    static testMethod void getOptionQueryTest() {
        
        ApexCodeApiVersionUpdateAction action = new ApexCodeApiVersionUpdateAction();
        
        Test.startTest();
        
        String result = action.getOptionQuery();
        System.assertEquals(String.isEmpty(result), false);
        
        Test.stopTest();
    }
}