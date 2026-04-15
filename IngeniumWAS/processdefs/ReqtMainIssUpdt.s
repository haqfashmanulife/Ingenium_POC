# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:14 PM EDT

#*******************************************************************************
#*  Component:   ReqtMainIssUpdt.s                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  016423  602J     New for release 602J                                      *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00432  DPK      Requirement Id change to input only                       *
#*  02GL57  DPK      CWA Suspense Account and Refund                           *
#*  PF20    PF 2.0   DisplayOnly flds with DefaultSession must be IN not INOUT *
#*  B11236  PF 2.0   these DefaultSession fields needed to be INOUT            *
#*                   DisplayOnly parameter removed                             *
#*                                                                             *
#*  Chg#    Date     Auth.  Description                                        *
#*                                                                             *
#*  BU1581  02NOV07  CTS    MIR-CPREQ-EFF-DT is replaced by MIR-PREV-UPDT-DT   *
#*******************************************************************************

S-STEP ReqtMainIssUpdt
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

    IN BannerPolicyID;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }

#*  PF20    PF 2.0   DisplayOnly parm incorrect on DefaultSession fields with INOUT *
    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

#*  PF20    PF 2.0   DisplayOnly parm incorrect on DefaultSession fields with INOUT *
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
     
    INOUT MIR-POL-CSH-RFND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-CSH-RFND-CD";
        SType = "Selection";
        Label = "Cash Refund";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
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

#BU1581 CHANGES START
#   INOUT MIR-CPREQ-EFF-DT-T[20]
    INOUT MIR-PREV-UPDT-DT-T[20]
#BU1581 CHANGES END    
    {
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Status Date";
        Index = "1";
    }

    INOUT MIR-CPREQ-FOLWUP-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Follow-up Date";
        Index = "1";
    }

    INOUT MIR-CPREQ-FOLWUP-NUM-T[20]
    {
        Length = "1";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Next Follow-up Notice Number";
        Index = "1";
    }

    IN MIR-CPREQ-SEQ-NUM-T[20]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    INOUT MIR-CPREQ-STAT-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        SType = "Selection";
        Label = "Requirement Status";
        Index = "1";
    }

    IN MIR-REQIR-ID-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        KeyColumn;
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }

    IN MIR-REQIR-TYP-CD-T[20]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "REQIR-TYP-CD";
        SType = "Text";
        Label = "Requirement Needed For";
        Index = "1";
    }

    INOUT MIR-USER-ID-T[20]
    {
        Length = "8";
        FieldGroup = "Table20";
        SType = "Text";
        Label = "Updated By";
        Index = "1";
    }

    IN MIR-CPREQ-CREAT-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        SType = "Date";
        Label = "Creation Date";
        Index = "1";
    }

    IN MIR-CLI-ID-T[40]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table40";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM-T[40]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table40";
        SType = "Text";
        Label = "Client Name";
        Index = "1";
    }

    IN MIR-CLI-UWGDECN-CD-T[40]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table40";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        SType = "Text";
        Label = "Client Decision";
        Index = "1";
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

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
    }

    IN MIR-DV-CLI-UWG-REQIR-IND-T[40]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table40";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Requirement Indicator";
        Index = "1";
    }

}

