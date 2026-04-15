# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:34 PM EDT

#*******************************************************************************
#*  Component:   BF1140-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016107  602J     Automatic Face Reduction for Variable Products            *
#*  016736  6.1.1J   Code Cleanup - Changed default constant for confirm field *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF1140-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Fsurra";
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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

    INOUT MIR-CIA-SRC-DEST-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        SType = "Selection";
        Label = "Destination of Surrender Amount";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Selection";
        Label = "Account Type";
    }

    INOUT MIR-CIA-TAXWH-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-TAXWH-IND";
        DefaultConstant = "N";
        SType = "Selection";
        Label = "Bypass the tax withholding process";
    }

    INOUT MIR-DV-CIA-REASN-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-CIA-REASN-CD";
        SType = "Selection";
        Label = "DV_CIA_REASN_CD";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUPRES-CNFRM-IND";
        DefaultConstant = "N";
        SType = "Selection";
        Label = "Suppress confirmation statement";
    }

    INOUT MIR-DV-REDC-FACE-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-REDC-FACE-IND";
        SType = "Indicator";
        Label = "Override automatic face reduction";
    }

    INOUT MIR-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    INOUT MIR-DV-POL-SURR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        Mandatory;
        Length = "15";
        SType = "Currency";
        Label = "Surrender Amount";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process code";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
#M245B2 CHANGES START HERE    
    INOUT MIR-POL-CRCY-CD
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

}

