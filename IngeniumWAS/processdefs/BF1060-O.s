# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:34 PM EDT

#*******************************************************************************
#*  Component:   BF1060-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  MFFFU4  ACR      ADD MIR-CLI-FIN-ASSET-CD, remove CLI-NET-WRTH-AMT         *
#*                                                                             *
#*  26878B   CTS      CHANGES DONE FOR ADDITION OF NEW FIELD                   *
#*                    AS PART OF ELDERLY PHASE 2                               *
#*******************************************************************************

S-STEP BF1060-O
{
    ATTRIBUTES
    {
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

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-INCM-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date";
    }

    IN MIR-CLI-EARN-INCM-AMT
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Earned Income";
    }

#    IN MIR-CLI-NET-WRTH-AMT
#    {
#        DisplayOnly;
#        Length = "15";
#        Decimals = "0";
#        SType = "Currency";
#        Label = "Net Worth";
#    }

    IN MIR-CLI-OTHR-INCM-AMT
    {
        DisplayOnly;
        Length = "13";
        Decimals = "0";
        SType = "Currency";
        Label = "Other Income";
    }

    IN MIR-DV-INSRD-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-EARN-INCM-MODE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "EARN-INCM-MODE-CD";
        SType = "Text";
        Label = "Earned Income Mode";
    }

    IN MIR-OTHR-INCM-MODE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OTHR-INCM-MODE-CD";
        SType = "Text";
        Label = "Other Income Mode";
    }

    IN MIR-CLI-FIN-ASSET-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "FASST";
        DBTableName = "TCLII";
        SType = "Text";
#26878B CHANGES START HERE
#       Label = "Total Financial Assets";
        Label = "Total Financial Assets Code";
#26878B CHANGES END HERE
    }
    
#26878B CHANGES START HERE
    IN MIR-CLI-FIN-ASSET-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Total Financial Assets Amount";
    }
#26878B CHANGES END HERE  

}

