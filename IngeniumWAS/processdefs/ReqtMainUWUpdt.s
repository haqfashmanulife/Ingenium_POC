# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:14 PM EDT

#*******************************************************************************
#*  Component:   ReqtMainUWUpdt.s                                              *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  016882  611J     Fix Syntax                                                *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PF20    PF 2.0   DisplayOnly flds with DefaultSession must be IN not INOUT *
#*  B11236  PF 2.0   these DefaultSession fields needed to be INOUT            *
#*                   DisplayOnly parameter removed                             *
#*                                                                             *
#*  Chg#    Date     Auth.  Description                                        *
#*                                                                             *
#*  EN1327  27Feb07  CLB    Add new field for requirement category             *
#*  BU1581  02NOV07  CTS    MIR-CPREQ-EFF-DT is replaced by MIR-PREV-UPDT-DT   *
#*******************************************************************************

S-STEP ReqtMainUWUpdt
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        DelEmptyRows;
        FocusField = "MIR-CPREQ-STAT-CD-T[1]";
        FocusFrame = "ContentFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    IN BannerClientID;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }

#*  PF20    PF 2.0   DisplayOnly parm incorrect on DefaultSession fields with INOUT *
    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
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

    INOUT MIR-CPREQ-DESGNT-ID-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "LABCD";
        SType = "Selection";
        Label = "Requirement Requested By";
        Index = "1";
    }

#BU1581 CHANGES START
#   INOUT MIR-CPREQ-EFF-DT-T[50]
    INOUT MIR-PREV-UPDT-DT-T[50]
#BU1581 CHANGES END    
    {
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Status Date";
        Index = "1";
    }

    INOUT MIR-CPREQ-FOLWUP-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Follow-up Date";
        Index = "1";
    }

    INOUT MIR-CPREQ-FOLWUP-NUM-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Next Follow-up Notice Number";
        Index = "1";
    }

    IN MIR-CPREQ-SEQ-NUM-T[50]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    INOUT MIR-CPREQ-STAT-CD-T[50]
    {
        Length = "3";
        FieldGroup = "Table50";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        SType = "Selection";
        Label = "Requirement Status";
        Index = "1";
    }

    INOUT MIR-CPREQ-TST-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Test Date";
        Index = "1";
    }

    INOUT MIR-CPREQ-TST-RSLT-CD-T[50]
    {
        Length = "4";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "RESLT";
        SType = "Selection";
        Label = "Test Results";
        Index = "1";
    }

    INOUT MIR-CPREQ-VALID-DT-T[50]
    {
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Validity Date";
        Index = "1";
    }

    IN MIR-REQIR-CAT-CD-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        CodeSource = "EDIT";
        CodeType = "RQCAT";
        SType = "Text";
        Label = "Category";
        Index = "1";
    }

    IN MIR-REQIR-ID-T[50]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table50";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }

    INOUT MIR-USER-ID-T[50]
    {
        Length = "8";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Updated By";
        Index = "1";
    }

    INOUT MIR-CPREQ-PD-IND-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        SType = "Indicator";
        Label = "Requirement fee paid";
        Index = "1";
    }

    IN MIR-CPREQ-CREAT-DT-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Date";
        Label = "Creation Date";
        Index = "1";
    }

    INOUT MIR-DV-REVW-REQIR-IND-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        SType = "Indicator";
        Label = "Resolve Indicator";
        Index = "1";
    }

    INOUT MIR-CPREQ-NEW-RSLT-IND-T[50]
    {
        Length = "1";
        FieldGroup = "Table50";
        SType = "Indicator";
        Label = "New Test Result Resolution";
        Index = "1";
    }

    IN MIR-POL-ID-BASE-T[10]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-POL-ID-SFX-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
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

    IN MIR-POL-CSTAT-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
        Index = "1";
    }

}

