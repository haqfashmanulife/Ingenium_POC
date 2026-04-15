# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF9234-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPMPPR  CTS      Add new fields to retrieve Annuitant's Address Information*
#*  ABF180  CTS      Modifications to display Annuitant's Client ID            *
#*  UY304A  CTS      CALL CENTER SCREEN ENHANCEMENT                            *
#*******************************************************************************

P-STEP BF9234-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9234";
        BusinessFunctionName = "Annuitant Address Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM9234";
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
        Label = "Policy Id";
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

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }
    
    OUT MIR-ANUTNT-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
    }
    
    OUT MIR-DV-ANUTNT-NM-KJ
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-ANUTNT-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }
    
    OUT MIR-ANUTNT-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }
    
    OUT MIR-ANUTNT-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Code";
    }

    OUT MIR-ANUTNT-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    OUT MIR-ANUTNT-PREFCT-TXT
    {
        Length = "11";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
    }
    
    OUT MIR-ANUTNT-CITY-NM-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
        Index = "1";
    }
    
    OUT MIR-ANUTNT-ADDR-LN-1-TXT-T[2]
    {
        Length = "30";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
        Index = "1";
    }

    OUT MIR-ANUTNT-ADDR-ADDL-TXT-T[2]
    {
        MixedCase;
        Length = "72";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Samakata-bu";
    }

    OUT MIR-ANUTNT-ADDR-CNTCT-TXT
    {
        Length = "50";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Phone Number";
    }

    OUT MIR-ANUTNT-KA-PREFCT-TXT
    {
        Length = "11";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Prefecture";
    }

    OUT MIR-ANUTNT-KA-CITY-TXT
    {
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
    }

    OUT MIR-ANUTNT-KA-NGHBRHD-TXT
    {
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Neighborhood";
    }

    OUT MIR-ANUTNT-ADDR-EFF-DT-NUM
    {
        Length = "10";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Effective Date";
    }
    
    OUT MIR-ANUTNT-ADDR-END-DT-NUM
    {
        Length = "10";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "End Date";
    }
    
    OUT MIR-ANUTNT-ADDR-YR-DUR
    {
        Length = "3";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Years at Address";
    }
    
    OUT MIR-ANUTNT-ADDR-CHNG-DT-T[2]
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Changed Date";
        Index = "1";
    }
    
    OUT MIR-ANUTNT-ADDR-STAT-CD-T[2]
    {
        Length = "40";
        FieldGroup = "Table5";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
        Index = "1";
    }
    
    OUT MIR-ANUTNT-STAT-CHNG-DT-T[2]
    {
        Length = "10";
        FieldGroup = "Table5";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Status Changed Date";
        Index = "1";
    }
   
    OUT MIR-ANUTNT-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Province/State";
    }

    OUT MIR-ANUTNT-CTRY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Country";
    }
#UY304A CHANGES STARTS HERE
    OUT MIR-ANTY-BNK-ID
    {
        Length = "4";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Bank Number";
    }

    OUT MIR-ANTY-BNK-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank Name";
    }

    OUT MIR-ANTY-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Branch Number";
    }

    OUT MIR-ANTY-BNK-BR-NM
    {
        Length = "36";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch Name";
    }

    OUT MIR-ANTY-BNK-ACCT-TYP-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Account Type";
    }

    OUT MIR-ANTY-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Bank Account Number";
    }

    OUT MIR-ANTY-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Account Holder Name";
    }
#UY304A CHANGES ENDS HERE

}
