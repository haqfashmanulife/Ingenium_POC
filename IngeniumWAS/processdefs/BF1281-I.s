# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:37 PM EDT

#*******************************************************************************
#*  Component:   BF1281-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00402  VAN      ADD JOURNAL DATE                                          *
#*  M00086  AT       ADD COVERAGE NUMBER                                       *
#*  U11151  CLB      Make correction to definition of MIR-JRNL-DT. Add         *
#*                   Mandatory to OPER-CAT-CD to match html input page.        *
#*  PF20    PF 2.0   DisplayOnly flds with DefaultSession must be IN not INOUT *
#*  MFFACC  CLB      Change usage of Branch/Department to Fund.                *
#*  P03415  CTS      Add Mandatory to POL-ID-BASE.                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP  PROJET                      *
#*******************************************************************************

S-STEP BF1281-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Curacct";
        Type = "Input";
        FocusField = "MIR-TRNXT-DT";
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
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-ACCT-BASE-ID-T[10]
    {
        Key;
        Length = "6";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-ACCT-CRNT-LOC-CD-T[10]
    {
        Key;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Current Location (CL)";
        Index = "1";
    }

    INOUT MIR-ACCT-ISS-LOC-CD-T[10]
    {
        Key;
        Length = "2";
        FieldGroup = "Table10";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Issue Location (IL)";
        Index = "1";
    }

    INOUT MIR-AGT-ID-T[10]
    {
        Length = "6";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Agent ID";
        Index = "1";
    }

    INOUT MIR-BR-OR-DEPT-ID-T[10]
    {
        Key;
        Length = "5";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
    #   CodeSource = "XTAB";
    #   CodeType = "BRCH";
        SType = "Selection";
        Label = "Fund";
    #   Label = "Branch";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-DESC-TXT
    {
        Mandatory;
        Length = "20";
        SType = "Text";
        Label = "Description";
    }

    INOUT MIR-DV-ACCT-DESC-TXT-T[10]
    {
        Length = "20";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Account Description";
        Index = "1";
    }

    INOUT MIR-DV-AGT-REASN-CD-T[10]
    {
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "AGT-REASN-CD";
        SType = "Selection";
        Label = "Reason";
        Index = "1";
    }

    INOUT MIR-DV-CHQ-VCHR-NUM
    {
        Length = "7";
        SType = "Text";
        Label = "Voucher Number";
    }

    INOUT MIR-DV-TRNXT-CR-AMT-T[10]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Credit Amount";
        Index = "1";
    }

    INOUT MIR-DV-TRNXT-DR-AMT-T[10]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-PMT-CRCY-CD";
#M245B2 CHANGES END HERE 
        Signed;
        Length = "13";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Debit Amount";
        Index = "1";
    }
    
    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    #   Label = "Date";
    }
        
    INOUT MIR-OPER-CAT-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        SType = "Selection";
        Label = "Operation Category";
    }

    INOUT MIR-PLAN-ID-T[10]
    {
        Key;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Selection";
        Label = "Plan";
        Index = "1";
    }

    INOUT MIR-POL-ID-BASE
    {
        Mandatory;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-CVG-NUM
    {
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-SBSDRY-CO-ID-T[10]
    {
        Key;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company (SC)";
        Index = "1";
    }

    INOUT MIR-TRNXT-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date";
    }

#   INOUT MIR-USER-SESN-CRCY-CD
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

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process code";
    }
    
 #M245B2 CHANGES START HERE     
    INOUT MIR-PMT-CRCY-CD
    {
         Key;
         Mandatory;
         Length = "5";
         CodeSource = "EDIT";
         CodeType = "CRCY";
         SType = "Selection";
         Label = "Currency";
       }
#M245B2 CHANGES END HERE 
#27549A - Changes Start here
    INOUT MIR-ATO-NOT-APPL-IND
      {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
  }
#27549A- Changes ends here
}

