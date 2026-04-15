# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:55 PM EDT

#*******************************************************************************
#*  Component:   BF2070-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01NB31  KJ       CWA Total                                                 *
#*                                                                             *
#*******************************************************************************

S-STEP BF2070-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Total";
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

    IN MIR-USER-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        DefaultSession = "MIR-USER-ID";
        SType = "Text";
        Label = "User ID";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
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

    IN MIR-CO-REG-CUT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Registered Policies Cutoff Date:";
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

    IN MIR-TOT-CHQ-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Bank Transfer Amount";
    }

    IN MIR-TOT-CLI-SUSP-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Client Suspense Account";
    }
#
# 01NB31 CWA total
#
    IN MIR-TOT-CWA-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Cash With Application";
    }

    IN MIR-TOT-CSH-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Cash Amount";
    }

    IN MIR-TOT-MISC-SUSP-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Miscellaneous Suspense";
    }

    IN MIR-TOT-PREM-SUSP-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Premium Suspense";
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

