# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1194-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  Chg#    Date     Auth.  Description                                        *
#*                                                                             *
#*  BU1581  02NOV07  CTS    MIR-CPREQ-EFF-DT is replaced by MIR-PREV-UPDT-DT   *
#*  M328C2  23FEB18  CTS    ADDITION OF A NEW FIELD MIR-REQIR-POL-ID FOR UW REQ*
#*******************************************************************************

P-STEP BF1194-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1194";
        BusinessFunctionName = "Client or Policy Requirements List";
        BusinessFunctionType = "List";
        MirName = "NCWM0090";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CPREQ-CREAT-DT
    {
        Length = "10";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Creation Dates";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-CPREQ-SEQ-NUM
    {
        Key;
        Length = "3";
        DBTableName = "TREQT";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

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

    INOUT MIR-REQIR-ID
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Selection";
        Label = "Requirement";
    }

    OUT MIR-CPREQ-DESGNT-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Requested By";
        Index = "1";
    }

#BU1581 CHANGES START
#   OUT MIR-CPREQ-EFF-DT-T[12]
    OUT MIR-PREV-UPDT-DT-T[12]
#BU1581 CHANGES END    
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Status Date";
        Index = "1";
    }

    OUT MIR-CPREQ-FOLWUP-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Follow-up Date";
        Index = "1";
    }

    OUT MIR-CPREQ-FOLWUP-NUM-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Next Follow-up Notice Number";
        Index = "1";
    }

    OUT MIR-CPREQ-SEQ-NUM-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    OUT MIR-CPREQ-STAT-CD-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
    }

    OUT MIR-CPREQ-TST-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Test Date";
        Index = "1";
    }

    OUT MIR-CPREQ-TST-RSLT-CD-T[12]
    {
        Length = "4";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "RESLT";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Test Results";
        Index = "1";
    }

    OUT MIR-CPREQ-VALID-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TREQT";
        SType = "Date";
        Label = "Validity Date";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

    OUT MIR-REQIR-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "REQTC";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }

    OUT MIR-REQIR-TYP-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "REQIR-TYP-CD";
        DBTableName = "TRTAB";
        SType = "Text";
        Label = "Requirement Needed For";
        Index = "1";
    }

    OUT MIR-USER-ID-T[12]
    {
        Length = "8";
        FieldGroup = "Table12";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Updated By";
        Index = "1";
    }

#M328C2 CHANGES START
    OUT MIR-REQIR-POL-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TREQT";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }
#M328C2 CHANGES END
}

