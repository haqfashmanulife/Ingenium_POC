# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF9E93-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Changes to the Japanese address fields                    *
#*                   - Address Code is now the driver field                    *
#*                   - JP-ADDR has been replaced by PREFCT-TXT                 *
#*                   - Samakata-bu (ADDR-ADDL) changed to 72 bytes             *
#*                   - Prefecture, City and Nieghborhood added for KA          *
#*  M00024  AT       Add corporate tax report month                            *
#*  EN001604         - Add Hazardous occupation field                          * 
#*  IPCAMC  CTS      - Change the length of Cause of Death field               *
#*                   - Add Cause Description field                             *
#*                                                                             *
#*  C18250  CTS      Display the new TCLIA Kanji samakata-bu field in address  *
#*                   and client inquiry screen                                 *
#*  R10424  CTS      Changes to add Bank name and Branch name                  *
#*  MP334A  CTS      ADDDED CHANGES FOR SUCCESSOR CLIENT CATEGORY  FIELD       *
#*  M27077  CTS      SETTING OF KANJI SAMAKATA BU AS HIDDEN                    *
#*  TLB041  CTS      CORPORATE POLICY HOLDER NAME & ADDRESS EXPANSION          *
#*  TLCR16  CTS      Change of insured address retention method                *
#*******************************************************************************

S-STEP BF9E93-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "QuoteTerm";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
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
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Number";
    }
 
    INOUT MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Process Date";
    
    }

    INOUT MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Policyholder Name";
    }

    INOUT MIR-POL-BILL-MODE-CD
    {       
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    } 

    
    INOUT MIR-LOAN-REPAY-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Policy Loan Balance";
    }

    INOUT MIR-NO-ACC-BNFT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Non Accidental Benefit";
    }  

    INOUT MIR-LOAN-INT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Policy Loan Interest";
    }
    
    INOUT MIR-PRE-PAY-INT-AMT
    { 
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Pre pay interest";
    }
    
    INOUT MIR-SHRT-PREM-AMT
    { 
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Short prem amt";
    }

    
    INOUT MIR-OVR-PAID-PREM-AMT
    {
    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Over paid premium";
    }
    
    INOUT MIR-SHRT-INT-AMT
    {
    
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Short interest amount";
    }   
   
    INOUT MIR-UNEARN-LOAN-INT-AMT
    {   
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Unearned Loan interest";
    }
    
    INOUT MIR-LOAN-XCES-SHRT-AMT
    {  
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Excess interest";
    }
    
    INOUT MIR-HLT-BNFT-AMT
    {   
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Health Congradulatory benefit";
    }

    INOUT MIR-DIV-AMT
     {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Dividend Amount";
     }    
    INOUT MIR-DEFR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Deffered amt";
    }
    INOUT MIR-INC-SRV-BNFT-AMT
    {   
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Inc Sur ben amt";
    }
    INOUT MIR-SRV-BNFT-AMT
    {   
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Survival benefit amt";
    }
    
    INOUT MIR-REMIT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "total remittance amt";
    }

}

    