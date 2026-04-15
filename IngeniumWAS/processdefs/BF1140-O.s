# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:34 PM EDT

#*******************************************************************************
#*  Component:   BF1140-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016107  602J     Automatic Face Reduction for Variable Products            *
#*  016736  6.1.1J   Code Cleanup - fixed focus on buttonframe                 *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF1140-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Fsurra";
        Type = "Output";
        DelEmptyRows;
        FocusField = "confirmButton";
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

    IN MIR-CIA-SRC-DEST-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        SType = "Text";
        Label = "Destination of Surrender Amount";
    }

    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    IN MIR-BNK-ACCT-ID
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-BNK-ACCT-HLDR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
    }

    IN MIR-CIA-TAXWH-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-TAXWH-IND";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Bypass the tax withholding process";
    }

    IN MIR-DV-CIA-REASN-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-CIA-REASN-CD";
        SType = "Text";
        Label = "DV_CIA_REASN_CD";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUPRES-CNFRM-IND";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Suppress confirmation statement";
    }

    IN MIR-DV-REDC-FACE-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-REDC-FACE-IND";
        SType = "Indicator";
        Label = "Override automatic face reduction";
    }

    IN MIR-CIA-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    IN MIR-DV-POL-SURR-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Surrender Amount";
    }

    IN MIR-DV-FROM-FND-AMT-T[139]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "From fund";
        Index = "1";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CIA-LOAD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE  
        DisplayOnly;
        Signed;
        Length = "16";
#M245B2 CHANGES START HERE        
#        Decimals = "0";
#M245B2 CHANGES END HERE
        SType = "Currency";
        Label = "Charges";
    }

    IN MIR-DV-CFN-APROX-AMT-T[139]
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE 
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-FIA-OUT-ALLOC-PCT-T[139]
    {
        DisplayOnly;
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table139";
        SType = "Percent";
        Label = "Percentage Out";
        Index = "1";
    }

    IN MIR-DV-FND-DESC-TXT-T[139]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table139";
        KeyColumn;
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }
    
#M245B2 CHANGES START HERE     
   IN MIR-POL-CRCY-CD
   {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "CRCY";
        SType = "Selection";
        Label = "Currency";
    }
#M245B2 CHANGES END HERE    

}

