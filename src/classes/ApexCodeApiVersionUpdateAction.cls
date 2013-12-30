/**
 * ApexCodeApiVersionUpdate
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class ApexCodeApiVersionUpdateAction {
    
    private static final String APEX_PAGE = 'ApexPage';
    private static final String APEX_COMPONENT = 'ApexComponent';
    private static final String APEX_CLASS = 'ApexClass';
    private static final String APEX_TRIGGER = 'ApexTrigger';
    
    private static final String NOT_TARGET_01 = 'ApexCodeApiVersionUpdate';
    private static final String NOT_TARGET_02 = 'ApexCodeApiVersionUpdateController';
    private static final String NOT_TARGET_03 = 'ApexCodeApiVersionUpdateControllerTest';
    private static final String NOT_TARGET_04 = 'ApexCodeApiVersionUpdateAction';
    private static final String NOT_TARGET_05 = 'ApexCodeApiVersionUpdateActionTest';
    
    /**
     * Constructor
     */
    public ApexCodeApiVersionUpdateAction() {
        
    }
    
    /**
     * getApiVersionListItem
     */
    public List<SelectOption> getApiVersionListItem(Boolean isDefault, Decimal maxApiVersion, Decimal minApiVersion) {
        System.debug('getApiVersionListItem:START');
        
        List<SelectOption> options = new List<SelectOption>();
        
        if (isDefault) {
            options.add(new SelectOption('', System.Label.ApiUpdate_Default));
        }
        
        for (Decimal i = maxApiVersion; i >= minApiVersion; i--) {
            options.add(new SelectOption(String.valueOf(i), String.valueOf(i)));
        }
        
        System.debug('getApiVersionListItem:END');
        return options;
    }
    
    /**
     * getCodeTypeListItem
     */
    public List<SelectOption> getCodeTypeListItem() {
        System.debug('getCodeTypeListItem:START');
        
        String apexPage = Schema.getGlobalDescribe().get(APEX_PAGE).getDescribe().getLabel();
        String apexComponent = Schema.getGlobalDescribe().get(APEX_COMPONENT).getDescribe().getLabel();
        String apexClass = Schema.getGlobalDescribe().get(APEX_CLASS).getDescribe().getLabel();
        String apexTrigger = Schema.getGlobalDescribe().get(APEX_TRIGGER).getDescribe().getLabel();
        
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(System.Label.ApiUpdate_CodeType_Page, apexPage));
        options.add(new SelectOption(System.Label.ApiUpdate_CodeType_Component, apexComponent));
        // options.add(new SelectOption(System.Label.ApiUpdate_CodeType_Class, apexClass));
        // options.add(new SelectOption(System.Label.ApiUpdate_CodeType_Trigger, apexTrigger));
        
        System.debug('getCodeTypeListItem:END');
        return options;
    }
    
    /**
     * getNotTargets
     */
    public Set<String> getNotTargets() {
        System.debug('getNotTarget:START');
        
        Set<String> notTargets = new Set<String>();
        notTargets.add(NOT_TARGET_01);
        notTargets.add(NOT_TARGET_02);
        notTargets.add(NOT_TARGET_03);
        notTargets.add(NOT_TARGET_04);
        notTargets.add(NOT_TARGET_05);
        
        System.debug('getNotTarget:END');
        return notTargets;
    }
    
    /**
     * getSelectQuery
     */
    public String getSelectQuery(String apexCodeType) {
        System.debug('getSelectQuery:START');
        
        String query = '';
        if (apexCodeType == System.Label.ApiUpdate_CodeType_Page) {
            query = getApexPageSelectQuery();
        } else if (apexCodeType == System.Label.ApiUpdate_CodeType_Component) {
            query = getApexComponentSelectQuery();
        } else if (apexCodeType == System.Label.ApiUpdate_CodeType_Class) {
            query = getApexClassSelectQuery();
        } else if (apexCodeType == System.Label.ApiUpdate_CodeType_Trigger) {
            query = getApexTriggerSelectQuery();
        }
        
        System.debug('getSelectQuery:END');
        return query;
    }
    
    /**
     * getApexPageSelectQuery
     */
    private String getApexPageSelectQuery() {
        System.debug('getApexPageSelectQuery:START');
        
        String query = '';
        query += ' SELECT ';
        query += '  Id ';
        query += ' ,Name ';
        query += ' ,MasterLabel ';
        query += ' ,ApiVersion ';
        query += ' ,Description ';
        query += ' ,LastModifiedById ';
        query += ' ,LastModifiedDate ';
        query += ' FROM ';
        query += ' ApexPage ';
        
        System.debug('getApexPageSelectQuery:END');
        return query;
    }
    
    /**
     * getApexComponentSelectQuery
     */
    private String getApexComponentSelectQuery() {
        System.debug('getApexComponentSelectQuery:START');
        
        String query = '';
        query += ' SELECT ';
        query += '  Id ';
        query += ' ,Name ';
        query += ' ,MasterLabel ';
        query += ' ,ApiVersion ';
        query += ' ,Description ';
        query += ' ,LastModifiedById ';
        query += ' ,LastModifiedDate ';
        query += ' FROM ';
        query += ' ApexComponent ';
        
        System.debug('getApexComponentSelectQuery:END');
        return query;
    }
    
    /**
     * getApexClassSelectQuery
     */
    private String getApexClassSelectQuery() {
        System.debug('getApexClassSelectQuery:START');
        
        String query = '';
        query += ' SELECT ';
        query += '  Id ';
        query += ' ,Name ';
        query += ' ,ApiVersion ';
        query += ' ,LastModifiedById ';
        query += ' ,LastModifiedDate ';
        query += ' FROM ';
        query += ' ApexClass ';
        
        System.debug('getApexClassSelectQuery:END');
        return query;
    }
    
    /**
     * getApexTriggerSelectQuery
     */
    private String getApexTriggerSelectQuery() {
        System.debug('getApexTriggerSelectQuery:START');
        
        String query = '';
        query += ' SELECT ';
        query += '  Id ';
        query += ' ,Name ';
        query += ' ,ApiVersion ';
        query += ' ,LastModifiedById ';
        query += ' ,LastModifiedDate ';
        query += ' FROM ';
        query += ' ApexTrigger ';
        
        System.debug('getApexTriggerSelectQuery:END');
        return query;
    }
    
    /**
     * getWhereQuery
     */
    public String getWhereQuery(Decimal apiVersion, Set<String> notTargets, String targetName) {
        System.debug('getWhereQuery:START');
        
        String query = '';
        query += ' WHERE ';
        query += ' Name NOT IN: notTargets ';
        
        query += ' AND ';
        query += ' NamespacePrefix = null';
        
        if (apiVersion != null) {
            query += ' AND ';
            query += ' ApiVersion =: apiVersion ';
        }
        
        if (String.isNotEmpty(targetName)) {
            query += ' AND ';
            query += ' Name LIKE ' + '\'' + String.escapeSingleQuotes(targetName + '%') + '\'';
        }
        
        System.debug('getWhereQuery:END');
        return query;
    }
    
    /**
     * getOptionQuery
     */
    public String getOptionQuery() {
        System.debug('getOptionQuery:START');
        
        String query = '';
        query += ' Order By Name ASC ';
        query += ' LIMIT 50 ';
        
        System.debug('getOptionQuery:END');
        return query;
    }
}