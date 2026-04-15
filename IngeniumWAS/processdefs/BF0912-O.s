# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:31 PM EDT

#*******************************************************************************
#*  Component:   BF0912-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF0912-O
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

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }

    IN MIR-USTM-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-USTM-FED-TAXWH-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Federal Tax Withheld";
    }

    IN MIR-USTM-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "USTM-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-USTM-TAXBL-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Non-Employee Compensation";
    }

    IN MIR-USTM-TAXBL-EVNT-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "USTM-TAXBL-EVNT-CD";
        SType = "Text";
        Label = "Tax Reporting Event";
    }

    IN MIR-AGT-ID
    {
        Key;
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    IN MIR-USTM-EFF-YR
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Year";
        Label = "Tax Year";
    }

    IN MIR-USTM-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "001";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CLI-ID
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-CLI-TAX-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Agent Name";
    }

}

