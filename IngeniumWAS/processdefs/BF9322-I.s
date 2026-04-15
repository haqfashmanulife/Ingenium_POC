# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:09 PM EDT

#*******************************************************************************
#*  Component:   BF9322-I.s                                                    *
#*  Description: Firm Banking Table (FBNK) Update Step                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL   FIRM BANKING - ONLINE            (HAC002A)                 *
#* MP168D  CTS      FIX TO ENSURE MP1172 AS WELL AS MP168D WORKS               *
#*                  MP1172 - NEEDS ALL 4 STATUS IN DROPDOWN                    *
#*                  MP168D - NEEDS ONLY PAID & FAILED                          *
#* M245K2  CTS      INCLUDING BANK DETAILS IN UPDATE SCREEN                 *
#*                                                                             *
#*******************************************************************************

S-STEP BF9322-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-FBNK-STAT-CD";
        FocusFrame = "ContentFrame";
    }

       IN Title;

       IN TitleBar;
       IN TitleBarSize;

       IN ButtonBar;
       IN ButtonBarSize;

       IN MessageFrame;
       IN MessageFrameSize;

       OUT action
       {
              SType="Hidden";
       }

       IN MIR-FBNK-REMIT-DT 
       {
              Key;         
              DisplayOnly;
              Length = "10";
              SType = "Date";
              Label = "Remittance Date";
       }

       IN MIR-FBNK-CAT-CD 
       {
              Key;
              DisplayOnly;
              Length = "5";
              CodeSource = "DataModel";
              CodeType = "FBNK-CAT-CD";
              SType = "Text";
              Label = "Operation Category";
       }

       IN MIR-FBNK-REF-ID 
       {
              Key;
              DisplayOnly;
              Length = "10";
              SType = "Text";
              Label = "Master Claim ID";
       }

       IN MIR-POL-ID 
       {
              Key;
              DisplayOnly;
              Length = "9";
              SType = "Text";
              Label = "Policy ID";
       }

       IN MIR-FB-CLI-ID 
       {
              Key;
              DisplayOnly;
              Length = "10";
              SType = "Text";
              Label = "Insured Client ID";
       }

       IN MIR-FBNK-SEQ-NUM 
       {
              Key;
              DisplayOnly;
              Length = "3";
              SType = "Text";
              Label = "Reference Number";
       }

       IN MIR-DV-INS-CLI-NM 
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
#             CodeType = "FBNK-STAT-UPD-CD"; #
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
              SType = "Date";
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
              DisplayOnly;
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
              DisplayOnly;
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
              CurrencyCode = "MIR-REMIT-CRCY-CD";
              Length = "16";
              SType = "Currency";
              Label = "Outstanding Amount";
       }
          
       INOUT MIR-DLAY-INT-AMT
       {
              CurrencyCode = "MIR-REMIT-CRCY-CD"; 
              Length = "16";
              SType = "Currency";
              Label = "Remittance Amount";
       }    
       IN MIR-ORIG-PMT-CRCY-CD
       {
              Length = "5";
              CodeSource = "EDIT";
              CodeType = "CRCY";
              SType = "Text";
              Label = "Currency Of Outstanding Amount";
       }
       
       IN MIR-REMIT-CRCY-CD
       {
              Length = "5";
              CodeSource = "EDIT";
              CodeType = "CRCY";
              SType = "Text";
              Label = "Payout Currency";
       }
       
       IN MIR-XCHG-EFF-DT
       {
              DisplayOnly;
              Length = "10";
              SType = "Date";
              Label = "Exchange Effective Date";
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
