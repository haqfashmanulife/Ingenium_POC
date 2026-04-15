# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9322-P.p                                                    *
#*  Description: Firm Banking Table (FBNK) Update step                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL   FIRM BANKING - ONLINE            (HAC002A)                 *
#* MP168D  CTS      FIX TO ENSURE MP1172 AS WELL AS MP168D WORKS               *
#*                  MP1172 - NEEDS ALL 4 STATUS IN DROPDOWN                    *
#*                  MP168D - NEEDS ONLY PAID & FAILED                          *
#* M245K2  CTS      INCLUDING OF BANK DETAILS IN UPDATE SCREEN                 *
#*                                                                             *
#*******************************************************************************

P-STEP BF9322-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9322";
        BusinessFunctionName = "Firm Banking Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9322";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-FBNK-REMIT-DT	      
    {				     
        Key;			     
        DisplayOnly;		     
        Length = "10";		     
        SType = "Date";		     
        Label = "Remittance Date";   
    }				     
    
    INOUT MIR-FBNK-CAT-CD
    {
        Key;  
        DisplayOnly;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "FBNK-CAT-CD";
        SType = "Text";
        Label = "Operation Category";
    }
    
    INOUT MIR-FBNK-REF-ID
    {
        Key; 
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Master Claim ID";
    }
    
    INOUT MIR-POL-ID
    {
        Key;          
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }
    
    INOUT MIR-FB-CLI-ID
    {
        Key;     
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Insured Client ID";
    }    
    
    INOUT MIR-FBNK-SEQ-NUM
    {
        Key;     
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Reference Number";
    }   
    
    OUT MIR-DV-INS-CLI-NM
    {
        Key;     
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }  

    INOUT MIR-FBNK-STAT-CD
    {
        Length = "1";
        Mandatory;
        CodeSource = "DataModel";
# MP168D CHANGES BEGIN #
#       CodeType = "FBNK-STAT-UPD-CD"; #
        CodeType = "FBNK-STAT-CD";
# MP168D CHANGES END #
        SType = "Selection";
        Label = "Firm Banking Status";
    }
    
    INOUT MIR-FBNK-FAIL-RSN-TXT
    {
        Length = "40";
        SType = "Text";
        Label = "Fail Reason";
    }   

    INOUT MIR-FBNK-RE-REMIT-DT
    {
        Length = "10";
        SType = "Text";
        Label = "Re-Remittance Date";
    }        
# M245K2 CHANGES BEGIN  
    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-NM
    {
        Length = "36";
        SType = "Text";
        Label = "Bank Name";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-BR-NM
    {
        Length = "36";
        SType = "Text";
        Label = "Branch Name";
    }

    INOUT MIR-ACCT-TYP-CD
    {
        Length = "3";
        SType = "Selection";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        Label = "Account Type";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        SType = "Text";
        Label = "Account Number";
    }

    INOUT MIR-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }
    
    INOUT MIR-BNFT-PMT-AMT
    {
        Length = "16";
        SType = "Currency";
        Label = "Outstanding Amount";
    }
    
    INOUT MIR-DLAY-INT-AMT
    {
 
        Length = "16";
        SType = "Currency";
        Label = "Remittance Amount";
    }
   
    INOUT MIR-XCHG-EFF-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Exchange Effective Date";
    }
    
    INOUT MIR-ORIG-PMT-CRCY-CD
    {

        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CRCY";
        SType = "Text";
        Label = "Currency Of Outstanding Amount";
    }
    
    INOUT MIR-REMIT-CRCY-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CRCY";
        SType = "Text";
        Label = "Payout Currency";
    }
    
    INOUT MIR-JRNL-DT 
    {
        DefaultSession = "LSIR-PRCES-DT";       
        Length = "10";
        SType = "Date";
        Label = "Remittance Date";
    }
# M245K2 CHANGES END  
}
