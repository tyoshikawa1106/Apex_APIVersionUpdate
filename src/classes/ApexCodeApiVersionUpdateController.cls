/**
 * ApexCodeApiVersionUpdate
 * © 2013 Force.com Developer
 * ----------------------------------------
 * @createdName      : Taiki,Yoshikawa
 * @lastModifiedName : Taiki,Yoshikawa
 * ----------------------------------------
 */
public with sharing class ApexCodeApiVersionUpdateController {

    private ApexCodeApiVersionUpdateAction action = new ApexCodeApiVersionUpdateAction();
    private ApiVersionUpdateCtrl__c ctrl = ApiVersionUpdateCtrl__c.getOrgDefaults();
    
    public String searchName {get; set;}
    public List<Wrapper> wrappers {get; set;}
    public Boolean isCheckedHeader {get; set;}
    
    public List<SelectOption> searchApiVersionListItem {get; set;}
    public String searchApiVersion {get; set;}
    
    public List<SelectOption> updateApiVersionListItem {get; set;}
    public String updateApiVersion {get; set;}
    
    public String apexCodeType {get; set;}
    public List<SelectOption> apexCodeTypeListItem {get; set;}
    
    /**
     * Constructor
     */
    public ApexCodeApiVersionUpdateController() {
        System.debug('ApexCodeApiVersionUpdateController:START');
    
        this.searchName = '';
        this.wrappers = new List<Wrapper>();
        this.isCheckedHeader = false;
        
        try {
            if (this.ctrl.MaxApiVersion__c == null || this.ctrl.MinApiVersion__c == null) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, System.Label.Not_CustomSetting));
                return;
            }
            
            this.searchApiVersionListItem = this.action.getApiVersionListItem(true, this.ctrl.MaxApiVersion__c, this.ctrl.MinApiVersion__c);
            this.searchApiVersion = this.searchApiVersionListItem[0].getValue();
            
            this.updateApiVersionListItem = this.action.getApiVersionListItem(false, this.ctrl.MaxApiVersion__c, this.ctrl.MinApiVersion__c);
            this.updateApiVersion = this.updateApiVersionListItem[0].getValue();
            
            this.apexCodeTypeListItem = this.action.getCodeTypeListItem();
            this.apexCodeType = this.apexCodeTypeListItem[0].getValue();
        } catch(Exception e) {
            msgError(e);
            return;
        }
        
        System.debug('ApexCodeApiVersionUpdateController:END');
    }
    
    /**
     * Search Button
     */
    public void doSearch() {
        System.debug('doSearch:START');
        
        this.wrappers = new List<Wrapper>();
        this.isCheckedHeader = false;
        
        try {
            if (this.ctrl.MaxApiVersion__c == null || this.ctrl.MinApiVersion__c == null) {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.Warning, System.Label.Not_CustomSetting));
                return;
            }
            
            Decimal apiVersion = String.isNotEmpty(this.searchApiVersion) ? decimal.valueOf(this.searchApiVersion) : null;
            Set<String> notTargets = this.action.getNotTargets();
            String targetName = this.searchName;
        
            String query = '';
            
            query += this.action.getSelectQuery(this.apexCodeType);
            query += this.action.getWhereQuery(apiVersion, notTargets, targetName);
            query += this.action.getOptionQuery();
            
            if (this.apexCodeType == System.Label.ApiUpdate_CodeType_Page) {
                List<ApexPage> apexs = Database.query(query);
                for (ApexPage a : apexs) {
                    this.wrappers.add(new Wrapper(a));
                }
            } else if (this.apexCodeType == System.Label.ApiUpdate_CodeType_Component) {
                List<ApexComponent> apexs = Database.query(query);
                for (ApexComponent a : apexs) {
                    this.wrappers.add(new Wrapper(a));
                }
            } else if (this.apexCodeType == System.Label.ApiUpdate_CodeType_Class) {
                List<ApexClass> apexs = Database.query(query);
                for (ApexClass a : apexs) {
                    this.wrappers.add(new Wrapper(a));
                }
            } else if (this.apexCodeType == System.Label.ApiUpdate_CodeType_Trigger) {
                List<ApexTrigger> apexs = Database.query(query);
                for (ApexTrigger a : apexs) {
                    this.wrappers.add(new Wrapper(a));
                }
            }
        } catch(Exception e) {
            msgError(e);
            return;
        }
        
        System.debug('doSearch:END');
    }
    
    /**
     * Exception Message
     */
    public void msgError(Exception e) {
        System.debug('msgError:START');
        
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, System.Label.ApiUpdate_System_Error_Message));
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMessage()));
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,
            'Line:' + String.valueOf(e.getLineNumber()) + '【' + e.getTypeName() + '】'));
            
       System.debug('msgError:END');
    }
    
    /**
     * Wrapper Class
     */
    public class Wrapper {
    
        public Boolean isChecked {get; set;}
        public ApexPage apexPage {get; set;}
        public ApexComponent apexComponent {get; set;}
        public ApexClass apexClass {get; set;}
        public ApexTrigger apexTrigger {get; set;}
    
        /**
         * Constructor
         */
        public wrapper(ApexPage apexPage) {
            this.isChecked  = false;
            this.apexPage = apexPage;
        }
        
        /**
         * Constructor
         */
        public wrapper(ApexComponent apexComponent) {
            this.isChecked  = false;
            this.apexComponent = apexComponent;
        }
        
        /**
         * Constructor
         */
        public wrapper(ApexClass apexClass) {
            this.isChecked  = false;
            this.apexClass = apexClass;
        }
        
        /**
         * Constructor
         */
        public wrapper(ApexTrigger apexTrigger) {
            this.isChecked  = false;
            this.apexTrigger = apexTrigger;
        }
    }
}