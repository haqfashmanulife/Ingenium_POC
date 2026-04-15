# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1281-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00402  VAN      ADD JOURNAL DATE                                          *
#*  P00768  CLB      Correct spelling of LSIR-PRCES-DT.                        *
#*                   Match stype for MIR-OPER-CAT-CD to html page.             *
#*  U11151  CLB      Make correction to definition of MIR-JRNL-DT              *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund.                *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP                              *
#*******************************************************************************

S-STEP BF1281-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Curacct";
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

    IN MIR-ACCT-BASE-ID-T[10]
    {
        Key;
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    IN MIR-ACCT-CRNT-LOC-CD-T[10]
    {
        Key;
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        SType = "Text";
        Label = "Current Location (CL)";
        Index = "1";
    }

    IN MIR-ACCT-ISS-LOC-CD-T[10]
    {
        Key;
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        SType = "Text";
        Label = "Issue Location (IL)";
        Index = "1";
    }

    IN MIR-AGT-ID-T[10]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    IN MIR-BR-OR-DEPT-ID-T[10]
    {
        Key;
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
    #   CodeSource = "XTAB";
    #   CodeType = "BRCH";
        SType = "Text";
        Label = "Fund";
    #   Label = "Branch";
        Index = "1";
    }

    IN MIR-DV-ACCT-DESC-TXT
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Description";
    }

    IN MIR-DV-ACCT-DESC-TXT-T[10]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Account Description";
        Index = "1";
    }

    IN MIR-DV-AGT-REASN-CD-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "AGT-REASN-CD";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    IN MIR-DV-CHQ-VCHR-NUM
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Voucher Number";
    }

    IN MIR-DV-TRNXT-CR-AMT-T[10]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Credit Amount";
        Index = "1";
    }

    IN MIR-DV-TRNXT-DR-AMT-T[10]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Debit Amount";
        Index = "1";
    }

    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Length = "10";                                                                                              
     #  DefaultSession = "LSIR-PRCS-DT";
     #  DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
     #  Label = "Date";
    }    
    
    IN MIR-OPER-CAT-CD
    {
       DisplayOnly;
       Length = "20";
       CodeSource = "EDIT";
       CodeType = "OPNC";
       SType = "Text";
     # SType = "Selection";
       Label = "Operation Category";
    }

    IN MIR-PLAN-ID-T[10]
    {
        Key;
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan";
        Index = "1";
    }

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Suffix";
    }
     
    IN MIR-SBSDRY-CO-ID-T[10]
    {
        Key;
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company (SC)";
        Index = "1";
    }

    IN MIR-TRNXT-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
      # DefaultSession = "LSIR-PRCS-DT";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date";
    }

    IN MIR-USER-SESN-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DefaultSession = "MIR-USER-SESN-CRCY-CD";
        SType = "Text";
        Label = "Currency";
    }
    
    
#M245B2 CHANGES START HERE      
    IN MIR-PMT-CRCY-CD
    {      
      Length = "5";
      CodeSource = "EDIT";
      CodeType = "CRCY";
      SType = "Selection";
      Label = "Currency";
    }
#M245B2 CHANGES END HERE        
 #27549A - CHANGES START HERE
    IN MIR-ATO-NOT-APPL-IND
    {
      DisplayOnly;
      Length = "1";
      SType = "Indicator";
      Label = "ATO not applicable";
    }    
 #27549A- CHANGES ENDS HERE
}

