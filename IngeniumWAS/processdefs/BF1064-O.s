# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:34 PM EDT

#*******************************************************************************
#*  Component:   BF1064-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016878  611J     Default date change                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFFFU4  ACR      ADD MIR-CLI-FIN-ASSET-CD, remove CLI-NET-WRTH-AMT         *
#*                                                                             *
#*  26878B   CTS      CHANGES DONE FOR ADDITION OF NEW FIELD                   *
#*                    AS PART OF ELDERLY PHASE 2                               *
#*******************************************************************************

S-STEP BF1064-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-CLI-ID";
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

    INOUT MIR-CLI-INCM-EFF-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Date";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-EARN-INCM-AMT-T[12]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Earned Income";
        Index = "1";
    }

    IN MIR-CLI-INCM-EFF-DT-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Date";
        Label = "Date";
        Index = "1";
    }

#    IN MIR-CLI-NET-WRTH-AMT-T[12]
#    {
#        DisplayOnly;
#        Length = "15";
#        Decimals = "0";
#        FieldGroup = "Table12";
#        SType = "Currency";
#        Label = "Net Worth";
#        Index = "1";
#    }

    IN MIR-CLI-OTHR-INCM-AMT-T[12]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table12";
        SType = "Currency";
        Label = "Other Income";
        Index = "1";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-EARN-INCM-MODE-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "EARN-INCM-MODE-CD";
        SType = "Text";
        Label = "Earned Income Mode";
        Index = "1";
    }

    IN MIR-OTHR-INCM-MODE-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "OTHR-INCM-MODE-CD";
        SType = "Text";
        Label = "Other Income Mode";
        Index = "1";
    }

    IN MIR-CLI-FIN-ASSET-CD-T[12]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "FASST";
        DBTableName = "TCLII";
        SType = "Text";
#26878B CHANGES START HERE
#       Label = "Total Financial Assets";
        Label = "Total Financial Assets Code";
#26878B CHANGES END HERE
        Index = "1";
    }
#26878B CHANGES START HERE
    IN MIR-CLI-FIN-ASSET-AMT-T[12]
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        FieldGroup = "Table12";
        DBTableName = "TCLII";
        SType = "Currency";
        Label = "Total Financial Assets Amount";
        Index = "1";
    }
#26878B CHANGES END HERE
}

