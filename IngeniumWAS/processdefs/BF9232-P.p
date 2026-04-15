# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9232-P.p                                                    *
#*  Description: Policy's bank detail update screen.                           *
#*               Simple client detail preceding current bank info.  Bank detail*
#*               revision section follows.                                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HNB001  HIN/AI   NEW BUSINESS SCREENS                                      *
#*  HIS068  HIN/AI   CHANGE FIELDS TO INOUT AS THEY WERE NOT BEING DISPLAYING  *
#*                   AFTER EDIT ERROR                                          *
#*  B10889  HIN/AI   ADD MIR-BNK-BR-NM                                         *
#*******************************************************************************

P-STEP BF9232-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9232";
        BusinessFunctionName = "Pending Policy Bank Account Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM9232";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
     }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    INOUT MIR-POL-APP-FORM-ID
    {
        Key;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Number";
    }

    INOUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
    }

    INOUT MIR-DV-PAYR-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Client ID";
    }

    INOUT MIR-DV-PAYR-CLI-KANA-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Katakana Name";
    }

    INOUT MIR-CLI-ADDR-LN-1-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-2-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Line 2";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-3-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Line 3";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
        MixedCase;
        Length = "72";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
    }

    INOUT MIR-CLI-PREFCT-TXT
    {
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    INOUT MIR-CLI-KA-PREFCT-TXT
    {
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    INOUT MIR-CLI-KA-CITY-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    INOUT MIR-CLI-KA-NGHBRHD-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }

    INOUT MIR-CLI-CITY-NM-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
    }
 
    INOUT MIR-CLI-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Country";
    }

    INOUT MIR-CLI-ADDR-CNTCT-TXT
    {
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
    }

    INOUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Code";
    }

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal Code";
    }

    INOUT MIR-BNK-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Current Bank Name";
    }

    INOUT MIR-BNK-BR-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Current Branch Name";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Number";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKA";
        Mandatory;
        SType = "Text";
        Label = "Branch Number";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "7";
        DBTableName = "BNKA";
        Mandatory;
        SType = "Text";
        Label = "Account Number";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        Mandatory;
        SType = "Selection";
        Label = "Account Type";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        Mandatory;
        SType = "Text";
        Label = "Account Holder Name";
    }
 
    INOUT MIR-ACCT-HLDR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-HLDR-TYP-CD";
        DBTableName = "TPOL";
        Mandatory;
        SType = "Selection";
        Label = "Account Holder Type";
    }

    INOUT MIR-COMB-BILL-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMB-BILL-IND";
        DBTableName = "TPOL";
        Mandatory;
        SType = "Selection";
        Label = "Combine Billing Indicator";
    }
                          
}
