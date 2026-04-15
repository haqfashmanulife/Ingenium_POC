# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:55 PM EDT

#*******************************************************************************
#*  Component:   BF2071-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB31  KJ       CWA total                                                 *
#*                                                                             *
#*******************************************************************************

S-STEP BF2071-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Sesstotal";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-SBSDRY-CO-ID";
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

    IN MIR-USER-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    INOUT MIR-DV-DISPLAY-SEQ-NUM
    {
        Key;
        Length = "4";
        DefaultConstant = "0001";
        SType = "Text";
        Label = "Item Number";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }

    IN MIR-BR-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch ID";
    }

    IN MIR-CLI-ID-T[100]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-CO-REG-CUT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Registered Policies Cutoff Date:";
    }

    IN MIR-DV-DISPLAY-SEQ-NUM-T[100]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table100";
        SType = "Text";
        Label = "Item Number";
        Index = "1";
    }

    IN MIR-RPT-DSTRB-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "DIST";
        SType = "Text";
        Label = "Distribution Code";
    }

    IN MIR-TOT-CHQ-AMT-T[100]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Bank Transfer Amount";
        Index = "1";
    }

    IN MIR-TOT-CLI-SUSP-AMT-T[100]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Client Suspense Account";
        Index = "1";
    }

    IN MIR-TOT-CSH-AMT-T[100]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Cash Amount";
        Index = "1";
    }

    IN MIR-TOT-MISC-SUSP-AMT-T[100]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
        Index = "1";
    }

    IN MIR-TOT-PREM-SUSP-AMT-T[100]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Premium Suspense";
        Index = "1";
    }
#
# 01NB31 CWA Total
#
    IN MIR-TOT-CWA-AMT-T[100]
    {
        DisplayOnly;
        Length = "17";
        FieldGroup = "Table100";
        SType = "Currency";
        Label = "Cash With Application";
        Index = "1";
    }

    IN MIR-TRNXT-TIME
    {
        DisplayOnly;
        Length = "8";
        SType = "Time";
        Label = "Time";
    }

    IN MIR-USER-SESN-BTCH-NUM
    {
        DisplayOnly;
        Length = "7";
        Decimals = "0";
        SType = "Number";
        Label = "Batch Number";
    }

    IN MIR-USER-SESN-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        SType = "Text";
        Label = "Currency";
    }

    IN MIR-USER-SESN-CTRY-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
    }

    IN MIR-USER-SESN-PRCES-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Processing Date";
    }

}

