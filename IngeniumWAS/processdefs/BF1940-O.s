# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:53 PM EDT

#*******************************************************************************
#*  Component:   BF1940-O.s                                                    *
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

S-STEP BF1940-O
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

    IN MIR-SECUR-CLAS-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        CodeSource = "XTAB";
        CodeType = "USCL";
        SType = "Text";
        Label = "Security Class";
    }

    IN MIR-CTL-ACCT-ACCS-IND
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-CTL-IND";
        SType = "Indicator";
        Label = "Controllable Account Access";
    }

    IN MIR-SECUR-CLAS-MAX-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Security Maximum Amount";
    }

    IN MIR-SECUR-CLAS-UWG-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Underwriting Maximum Amount";
    }

    IN MIR-SECUR-CNFD-ACCS-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SECUR-CNFD-ACCS-CD";
        SType = "Text";
        Label = "Confidential Access";
    }

    IN MIR-SECUR-LVL-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SECUR-LVL-CD";
        SType = "Text";
        Label = "Security Class Level";
    }

    IN MIR-SECUR-USER-CTR
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Number of Users";
    }

#SESCAP
    IN MIR-MAX-SESN-NUM  
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Maximum Number of Users";
    }

    IN MIR-SESN-CTL-IND
    {
        DisplayOnly;
        Length = "1";
        DefaultConstant = "N";
        SType = "Indicator";
        Label = "User Session Control Indicator";
    }

}

