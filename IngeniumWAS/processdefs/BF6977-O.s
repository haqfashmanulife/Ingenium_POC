# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF6977-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF6977-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Eidtl";
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

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-CF-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Index Date";
    }

    IN MIR-CF-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Index Sequence Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CF-FND-BAL-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Current Amount";
    }

    IN MIR-CF-FND-BAL-AMT-2
    {
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Current Amount";
    }

    IN MIR-CF-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-STAT-CD";
        SType = "Text";
        Label = "Cash Flow Status";
    }

    IN MIR-DV-CRNT-FND-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Agent card";
    }

    IN MIR-DV-INDX-GRWTH-FCT
    {
        DisplayOnly;
        Signed;
        Length = "6";
        Decimals = "3";
        SType = "Number";
        Label = "Index Growth Factor";
    }

    IN MIR-DV-INDX-GRWTH-FCT-2
    {
        DisplayOnly;
        Signed;
        Length = "6";
        Decimals = "3";
        SType = "Number";
        Label = "Index Growth Factor";
    }

    IN MIR-DV-INDX-INCR-AMT
    {
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Index Increase Amount";
    }

    IN MIR-DV-INDX-INCR-AMT-2
    {
        DisplayOnly;
        Signed;
        Length = "16";
        SType = "Currency";
        Label = "Index Increase Amount";
    }

    IN MIR-DV-INDX-INCR-PCT
    {
        DisplayOnly;
        Signed;
        Length = "14";
        Decimals = "5";
        SType = "Percent";
        Label = "Index Increase Percent";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }

    IN MIR-POL-CVG-REC-CTR
    {
        DisplayOnly;
        Length = "40";
        SType = "Text";
        Label = "Number of Coverages";
    }

    IN MIR-PURCH-PRIC-1-AMT
    {
        DisplayOnly;
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Buy Price";
    }

    IN MIR-PURCH-PRIC-1-AMT-2
    {
        DisplayOnly;
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Buy Price";
    }

    IN MIR-PURCH-PRIC-1-AMT-3
    {
        DisplayOnly;
        Signed;
        Length = "18";
        Decimals = "9";
        SType = "Currency";
        Label = "Buy Price";
    }

    IN MIR-RTBL-1-RT
    {
        DisplayOnly;
        Signed;
        Length = "14";
        Decimals = "5";
        SType = "Percent";
        Label = "Rate 1";
    }

    IN MIR-RTBL-2-RT
    {
        DisplayOnly;
        Signed;
        Length = "14";
        Decimals = "5";
        SType = "Percent";
        Label = "Rate 2";
    }

    IN MIR-RTBL-3-RT
    {
        DisplayOnly;
        Signed;
        Length = "14";
        Decimals = "5";
        SType = "Percent";
        Label = "Rate 3";
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

}

