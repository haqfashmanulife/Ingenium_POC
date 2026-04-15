# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A52-P.p                                                    *
#*  Description: Death Master Claim Update                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAMC  CTS      Intial Version                                            *
#*                                                                             *
#*  M213M2  CTS      CHANGES DONE TO ADD A CANCER TYPE AND TRANSPLANT TYPE     * 
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF9A52-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A52";
        BusinessFunctionName = "Death Master Claim Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9A52";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
    }

    INOUT MIR-CLM-ID
    {
        Length = "8";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim ID";
    }
    
    INOUT MIR-INSRD-CLI-NM
    {
        Length = "51";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }
    
    INOUT MIR-CLM-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLM-STAT-CD";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Death Master Claim Status";
    }
    
    INOUT MIR-INSRD-CLI-ID
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Insured Client ID";
    }
 
    INOUT MIR-POL-ID
    {
         Length = "10";
         DBTableName = "TDCLM";
         SType = "Text";
         Label = "Policy ID";
    }
    
    INOUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Date of Birth";
    }
    
    INOUT MIR-CLI-SEX-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    
    INOUT MIR-PREV-AUTO-ADJC-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Last Auto Adjudication Date";
    }
    
    INOUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Last Update Date";
    }
    
    INOUT MIR-PREV-UPDT-USER-ID
    {
        Length = "8";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Last Update User ID";
    }

    INOUT MIR-CLM-HO-NOTI-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Notification Date";
    }
    
    INOUT MIR-CLM-HO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Head Office Claim Form Acceptance Date";
    }
    
    INOUT MIR-CLM-AGT-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Agent Claim Form Acceptance Date";
    }
    
    INOUT MIR-CLM-SO-ACPT-DT
    {
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Sales Office Claim Form Acceptance Date";
    }
    
    INOUT MIR-CLM-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLM-TYP-CD";
        DBTableName = "TDCLM";
        SType = "Selection";
        Label = "Claim Type";
    }
    
    INOUT MIR-CLM-EFF-DT
    { 
        Length = "10";
        DBTableName = "TDCLM";
        SType = "Date";
        Label = "Effective Date";
    }
    
    INOUT MIR-CLI-DTH-REASN-CD
    { 
        Label = "3";
        DBTableName = "TDCLM";
        SType = "Text";        
        Label = "Cause Code";
    }

    INOUT MIR-CAUSE-DESC-TXT
    {
        Length = "40";
        DBTableName = "TDCLM";
        SType = "Text";
        Label = "Cause Description";
    }
 
    INOUT MIR-LNB-CLM-TYP-CD
    { 
        Length = "2";
        CodeSource = "Edit";
        CodeType = "LTAMT";
        DBTableName = "TDCLM";
        SType = "Selection";
        Label = "Living Needs Claim Type";
    }
        
    INOUT MIR-LNB-CLM-AMT
    { 
 #M245B2 CHANGES START HERE        
 #       Length = "15";
         Length = "16";
 #M245B2 CHANGES END HERE         
        SType = "Currency";
        Label = "Living Needs Claim Amount";
    }
        
    INOUT MIR-TCB-CLM-TYP-CD 
    {
        Length = "2";
        CodeSource = "Edit";
        CodeType = "LTAMT";
        DBTableName = "TDCLM";
        SType = "Selection";
        Label = "Terminal Care Claim Type"; 
    } 

    INOUT MIR-TCB-CLM-AMT
    {
#M245B2 CHANGES START HERE        
 #       Length = "15";
         Length = "16";
 #M245B2 CHANGES END HERE   
        SType = "Currency";
        Label = "Terminal Care Claim Mount";
    }
    
#* M213M2 CHANGES BEGIN
          
    INOUT MIR-CANCER-TYP-CD 
    {
        Length = "1";
        CodeSource = "Edit";
        CodeType = "CANCD";
        DBTableName = "TDCLM";
        SType = "Selection";
        Label = "Cancer Type";
    }
         
    INOUT MIR-TRANSPLT-TYP-CD
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
