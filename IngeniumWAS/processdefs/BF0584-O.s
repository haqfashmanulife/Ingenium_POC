# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:25 PM EDT

#*******************************************************************************
#*  Component:   BF0584-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  EN1768  IM       Changed length to 120                                     *
#*  MP310B  CTS      CHANGES DONE AS PART OF MP310B                            *
#*******************************************************************************

S-STEP BF0584-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
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

    INOUT MIR-CCAS-MSG-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CCAS-MSG-RESP-TXT-T[50]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Fail Response";
        Index = "1";
    }
#Adding new field as part of MP310B

    IN MIR-CCKO-POL-ID-T[50]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    } 
    
    IN MIR-CCAS-MSG-SEQ-NUM-T[50]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Sequence Number";
        Index = "1";
    }

    IN MIR-CLI-SUR-NM
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Last Name";
    }

    IN MIR-CPREQ-STAT-CD-T[11]
    {
        DisplayOnly;
        Length = "3";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "CPREQ-STAT-CD";
        SType = "Text";
        Label = "Requirement Status";
        Index = "1";
    }

    IN MIR-MISS-INFO-IND-T[50]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table50";
        SType = "Indicator";
        Label = "Clear case failure due to missing information";
        Index = "1";
    }

    IN MIR-MSG-TXT-T[50]
    {
        DisplayOnly;
#Changed length to 120 as part of EN001768
#       Length = "68";
        Length = "120";
        FieldGroup = "Table50";
        SType = "Text";
        Label = "Failure Message";
        Index = "1";
    }

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Clear Case Kickout Date";
    }

    IN MIR-REQIR-ID-T[11]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "REQTC";
        SType = "Text";
        Label = "Requirement";
        Index = "1";
    }

}

