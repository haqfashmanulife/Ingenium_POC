# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF1194-O.s                                                    *
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

S-STEP BF1194-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "ReqtType";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    INOUT ReqtType;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    INOUT MIR-CPREQ-CREAT-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Creation Dates";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    INOUT MIR-CPREQ-SEQ-NUM
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
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

    INOUT MIR-REQIR-ID
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Selection";
        Label = "Requirement";
    }

    IN MIR-CPREQ-DESGNT-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Requirement Requested By";
        Index = "1";
    }

#BU1581 CHANGES START
#   IN MIR-CPREQ-EFF-DT-T[12]
    IN MIR-PREV-UPDT-DT-T[12]
#BU1581 CHANGES END    
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Status Date";
        Index = "1";
    }

    IN MIR-CPREQ-FOLWUP-DT-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Follow-up Date";
        Index = "1";
    }

    IN MIR-CPREQ-FOLWUP-NUM-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Next Follow-up Notice Number";
        Index = "1";
    }

    IN MIR-CPREQ-SEQ-NUM-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-CPREQ-STAT-CD-T[12]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
    }

    IN MIR-CPREQ-TST-DT-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Test Date";
        Index = "1";
    }

    IN MIR-CPREQ-TST-RSLT-CD-T[12]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "RESLT";
        SType = "Text";
        Label = "Test Results";
        Index = "1";
    }

    IN MIR-CPREQ-VALID-DT-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Validity Date";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-REQIR-ID-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "REQTC";
        Link;
        SType = "Text";
        Label = "Requirement";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-REQIR-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "REQIR-TYP-CD";
        SType = "Text";
        Label = "Requirement Needed For";
        Index = "1";
    }

    IN MIR-USER-ID-T[12]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Updated By";
        Index = "1";
    }

#M328C2 CHANGES START
    IN MIR-REQIR-POL-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }
#M328C2 CHANGES END  
    IN MIR-REQIR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "REQIR-TYP-CD";
        SType = "Text";
        Label = "Requirement Needed For";
    }

    IN MIR-SERV-BR-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch";
    }

}

