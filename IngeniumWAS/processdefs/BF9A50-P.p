# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A50-P.p                                                    *
#*  Description: Death Master Claim Retrieve                                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      INITIAL VERSION                                           *
#*                                                                             *
#*  M213M2  CTS      CHANGES DONE TO ADD A CANCER TYPE AND TRANSPLANT TYPE     *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF9A50-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A50";
        BusinessFunctionName = "Death Master Claim Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9A50";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-PRCES-STAT-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }
    
    IN MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TDCLM";
        DefaultSession = "MIR-CLM-ID";
        SType = "Text";
        Label = "Death Master Claim ID";
    }
    
    OUT MIR-INSRD-CLI-NM
    {
        Length = "51";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Insured Name";
    }
    
    OUT MIR-CLM-STAT-CD
    {
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Master Claim Status";
    }
    
    OUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Insured Client ID";
    }

    OUT MIR-POL-ID
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Policy ID";
    }
    
    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";       
        SType = "Date";
        Label = "Date of Birth";
    }
    
    OUT MIR-CLI-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    
    OUT MIR-PREV-AUTO-ADJC-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Last Auto Adjudication Date";
    }
    
    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Last Update Date";
    }
    
    OUT MIR-PREV-UPDT-USER-ID
    {
        Length = "8";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Last Update User ID";
    }
    
    OUT MIR-CLM-HO-NOTI-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Notification Date";
    }

    OUT MIR-CLM-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    } 

    OUT MIR-CLM-AGT-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Agent Claim Form Acceptance Date";
    }

    OUT MIR-CLM-SO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Sales Office Claim Form Acceptance Date";
    }

    OUT MIR-CLM-TYP-CD
    {
        Mandatory;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLM-TYP-CD";
        DBTableName = "TDCLM";
        SType = "Selection";
        Label = "Claim Type";
    }
   
    OUT MIR-CLM-EFF-DT
    { 
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Effective Date";
    }
    
    OUT MIR-CLI-DTH-REASN-CD
    { 
        Mandatory;
        Length = "3";
        SType = "Text";        
        Label = "Cause Code";
    }
      
    OUT MIR-CAUSE-DESC-TXT
    {
        Length="40";
        SType = "Text";
        Label = "Cause Description";
    }
  
    OUT MIR-LNB-CLM-TYP-CD
    { 
        Length= "2";
        CodeSource = "Edit";
        CodeType = "LTAMT";
        DBTableName = "TDCLM";
        SType = "Selection";
        Label = "Living Needs Claim Type";
    }
        
    OUT MIR-LNB-CLM-AMT
    { 
        Length = "15";
        SType = "Currency";
        Label = "Living Needs Claim Amount";
    }
        
    OUT MIR-TCB-CLM-TYP-CD 
    {
        Length = "2";
        CodeSource = "Edit";
        CodeType = "LTAMT";
        DBTableName = "TDCLM";
        SType = "Selection";
        Label = "Terminal Care Claim Type"; 
    } 

    OUT MIR-TCB-CLM-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Terminal Care Claim Amount";
    }
    
#* M213M2 CHANGES BEGIN
          
    OUT MIR-CANCER-TYP-CD 
    {
        Length = "1";
        CodeSource = "Edit";
        CodeType = "CANCD";
        DBTableName = "TDCLM";
        SType = "Selection";
        Label = "Cancer Type";
    }
         
    OUT MIR-TRANSPLT-TYP-CD
    {
        Length = "2";
        CodeSource = "Edit";
        CodeType = "TRSTY";
        DBTableName = "TDCLM";
        SType = "Selection";
   	Label = "Transplant Type";
    }
          
#* M213M2 CHANGES END
#M245B2 CHANGES START HERE
    INOUT MIR-POL-CRCY-CD
    {
    	
    	Length = "2";
    	SType = "Hidden";
    	Label = "Currency";
    }        
#M245B2 CHANGES END HERE    
#M271O1 CHANGES START HERE      
    INOUT MIR-PREM-CRCY-CD
    {
               
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }
#M271O1 CHANGES END HERE 
    }        
