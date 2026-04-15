# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9A64-P.p                                                    *
#*  Description: Manual Modification Screen                                    *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  IPCAAD  CTS      Intial Version                                            *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  Q94540  CTS      NET PAYABLE AMT CALC FOR FXWL                             *
#*******************************************************************************


P-STEP BF9A64-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A64";
        BusinessFunctionName = "Manual Modification";
        BusinessFunctionType = "Update";
        MirName = "CCWM9A64";
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
    
    INOUT MIR-CLM-INSRD-CD
    {
              Length = "1";
              DBTableName = "Derived";
              SType = "Hidden";
              Label = "Death Claim Insured Code";
    }
    
    INOUT MIR-CVG-NUM
    {
           Length = "2";
           DBTableName = "TDCBD";
           SType = "Hidden";
           Label = "Coverage Number";
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

    INOUT MIR-PLAN-ID
    {
    	Length = "5";
    	SType = "Text";
    	CodeSource = "EDIT";
    	CodeType = "PLAN";
    	Label = "Rider Name";
    }
    	 
    INOUT MIR-CVG-FACE-AMT
    {
    	 Length = "15";
    	 DBTableName = "TCVG";
    	 SType = "Currency";
    	 Label = "Face Amount";
     }
    
     INOUT MIR-BNFT-DED-AMT
     {
         Length = "15";
         SType = "Currency";
    	 Label = "Deduction Amount";		
     }
    
     INOUT MIR-DTH-MTHLY-BNFT-AMT
     {
          Length = "15";
    	  SType = "Currency";
    	  Label = "Amount to be Deducted";               
     }
    
     INOUT MIR-BNFT-DED-REASN-CD
     {
    	  Length = "02";
    	  SType = "Text";
    	  CodeSource = "DataModel";
    	  CodeType = "DED-REASN-CD";
    	  SType = "Selection";
    	  Label = "Deduction Reason";		
     }
    
    INOUT MIR-BNFT-ADDL-AMT
    {
    	Length = "15";
    	SType = "Currency";
    	Label = "Additional Amount";		
    }
    
    INOUT MIR-BNFT-ADDL-REASN-CD
    {
    	Length = "2";
    	CodeSource = "DataModel";
    	CodeType = "ADDL-REASN-CD";		
    	SType = "Selection";
    	Label = "Additional Reason";		
    }
    
    INOUT MIR-OTHR-RFND-AMT
    {
    	Length = "15";
    	SType = "Currency";
    	Label = "Other Refund Amount";		
    }
    
    INOUT MIR-OTHR-RFND-REASN-CD
    {
    	Length = "02";
        CodeSource = "DataModel";		
        CodeType = "OTHR-RFND-REASN-CD";
    	SType = "Selection";
        Label = "Other Refund Reason";
    }
    
    INOUT MIR-PREM-CHNG-REASN-CD
    {
        Length = "02";
        CodeSource = "DataModel";		
    	CodeType = "MODIF-REASN-CD";
    	SType = "Selection";
    	Label = "Modification Reason";		
    }
    
    INOUT MIR-LN-TC-INT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Interest";
     }
     
    INOUT MIR-LN-TC-PREM-AMT
    {
    	Length = "15";
    	SType = "Currency";
    	Label = "Premium(next 6 months)";		
    		
    }
#M245B2 CHANGES START HERE     
    INOUT MIR-POL-CRCY-CD
    	     {   
    	         Length = "2";
    	         SType = "Hidden";
    	         Label = "Currency";
	     } 
#M245B2 CHANGES END HERE 
#Q94540  changes begins here
    INOUT MIR-PREV-LN-TC-INT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Interest";
     }
#Q94540  changes ends here     
  }
