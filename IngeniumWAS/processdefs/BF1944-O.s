# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:53 PM EDT

#*******************************************************************************
#*  Component:   BF1944-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  SESCAP  31DEC04  SESSION CAP ENHANCEMENT                                   *
#*                                                                             *
#*******************************************************************************

S-STEP BF1944-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-SECUR-CLAS-ID";
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

    INOUT MIR-SECUR-CLAS-ID
    {
        Key;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        SType = "Selection";
        Label = "Security Class";
    }

    IN MIR-CTL-ACCT-ACCS-IND-T[10]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "ACCT-CTL-IND";
        SType = "Text";
        Label = "Controllable Account Access";
        Index = "1";
    }

    IN MIR-SECUR-CLAS-ID-T[10]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table10";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "USCL";
        Link;
        SType = "Text";
        Label = "Security Class";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-SECUR-CLAS-MAX-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Security Maximum Amount";
        Index = "1";
    }

    IN MIR-SECUR-CLAS-UWG-AMT-T[10]
    {
        DisplayOnly;
        Signed;
        Length = "15";
        FieldGroup = "Table10";
        SType = "Currency";
        Label = "Underwriting Maximum Amount";
        Index = "1";
    }

    IN MIR-SECUR-CNFD-ACCS-CD-T[10]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Confidential Access Code";
        Index = "1";
    }

    IN MIR-SECUR-USER-CTR-T[10]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Number of Users";
        Index = "1";
    }

#SESCAP
    IN MIR-MAX-SESN-NUM-T[10]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Maximum Number of Users";
        Index = "1";
    }

    IN MIR-SESN-CTL-IND-T[10]
     {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        SType = "Indicator";
        Label = "User Session Control Indicator";
        Index = "1";
     }
}

