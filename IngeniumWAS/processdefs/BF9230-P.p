# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9230-P.p                                                    *
#*  Description: Policy's bank detail enquiry / confirmation screen.           *
#*               Simple client detail preceding bank info.                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  HNB001  HIN/AI   NEW BUSINESS SCREENS                                      *
#*  HIS052  HIN/AI   ADD MIR-COMB-BILL-IND                                     *
#*  B10889  HIN/AI   ADD MIR-BNK-BR-NM                                         *
#*******************************************************************************

P-STEP BF9230-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9230";
        BusinessFunctionName = "Pending Policy Bank Account Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM9230";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


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

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
    }

    OUT MIR-DV-PAYR-CLI-ID
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Client ID";
    }

    OUT MIR-DV-PAYR-CLI-KANA-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Payor Katakana Name";
    }

    OUT MIR-CLI-ADDR-LN-1-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-LN-2-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Line 2";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-LN-3-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Line 3";
        Index = "1";
    }

    OUT MIR-CLI-ADDR-ADDL-TXT
    {
        MixedCase;
        Length = "72";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
    }

    OUT MIR-CLI-PREFCT-TXT
    {
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    OUT MIR-CLI-KA-PREFCT-TXT
    {
        Length = "11";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
        Index = "1";
    }

    OUT MIR-CLI-KA-CITY-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    OUT MIR-CLI-KA-NGHBRHD-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
        Index = "1";
    }

    OUT MIR-CLI-CITY-NM-TXT
    {
        Length = "30";
        FieldGroup = "Table2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }

    OUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
    }
 
    OUT MIR-CLI-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Country";
    }

    OUT MIR-CLI-ADDR-CNTCT-TXT
    {
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
    }

    OUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Code";
    }

    OUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal Code";
    }

    OUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Current Bank Number";
    }

    OUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Current Branch Number";
    }

    OUT MIR-BNK-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Current Bank Name";
    }

    OUT MIR-BNK-BR-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Current Branch Name";
    }

    OUT MIR-BNK-ACCT-ID
    {
        Length = "7";
        DBTableName = "BNKA";
        SType = "Text";
        Label = "Current Account Number";
    }

    OUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Current Account Type";
    }

    OUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Current Account Holder Name";
    }

    OUT MIR-ACCT-HLDR-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-HLDR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Account Holder Type";
    }
    OUT MIR-COMB-BILL-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMB-BILL-IND";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Combine Billing Indicator";
    }       
   
}
