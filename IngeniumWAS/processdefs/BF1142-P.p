# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:34 PM EDT

#*******************************************************************************
#*  Component:   BF1142-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016107  602J     Automatic face reduction                                  *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF1142-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1142";
        BusinessFunctionName = "Policy Transaction";
        BusinessFunctionType = "Fsurrc";
        MirName = "CCWM8220";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CIA-SRC-DEST-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        DBTableName = "TFA";
        SType = "Selection";
        Label = "Destination of Surrender Amount";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Selection";
        Label = "Account Type";
    }

    INOUT MIR-CIA-TAXWH-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-TAXWH-IND";
        DBTableName = "TFA";
        SType = "Selection";
        Label = "Bypass the tax withholding process";
    }

    INOUT MIR-CVG-NUM-T[139]
    {
        Length = "2";
        FieldGroup = "Table139";
        KeyColumn;
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    INOUT MIR-DV-CIA-REASN-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "DV-CIA-REASN-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "CIA_REASN_CD";
    }

    INOUT MIR-FND-ID-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TFS";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SUPRES-CNFRM-IND";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Suppress confirmation statement";
    }

    INOUT MIR-DV-REDC-FACE-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-REDC-FACE-IND";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Override automatic face reduction";
    }

    IN MIR-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    IN MIR-DV-FROM-FND-AMT-T[139]
    {
        Mandatory;
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "From fund";
        Index = "1";
    }

    IN MIR-DV-POL-SURR-AMT
    {
        Mandatory;
        Length = "15";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Surrender Amount";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process code";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CIA-LOAD-AMT
    {
        Signed;
        Length = "16";
#M245B2 CHANGES START HERE         
#        Decimals = "0";
#M245B2 CHANGES END HERE 
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Charges";
    }

    OUT MIR-DV-CFN-APROX-AMT-T[139]
    {
        Signed;
        Length = "15";
        FieldGroup = "Table139";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Approximate Fund Value";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-FIA-OUT-ALLOC-PCT-T[139]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table139";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Percentage Out";
        Index = "1";
    }

    OUT MIR-FIA-VALU-SURR-PCT-T[139]
    {
        Length = "7";
        Decimals = "4";
        FieldGroup = "Table139";
        DBTableName = "TFD";
        SType = "Percent";
        Label = "Fund out";
        Index = "1";
    }

    OUT MIR-DV-FND-DESC-TXT-T[139]
    {
        Length = "40";
        FieldGroup = "Table139";
        KeyColumn;
        DBTableName = "Derived";
        SType = "Text";
        Label = "Fund Description";
        Index = "1";
    }
    
#M245B2 CHANGES START HERE      
      INOUT MIR-POL-CRCY-CD
        {
     
          Key;
          Mandatory;
          Length = "5";
	  SType = "Selection";
	  Label = "Currency";
        }
#M245B2 CHANGES END HERE     
}

