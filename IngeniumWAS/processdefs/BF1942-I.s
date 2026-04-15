# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:53 PM EDT

#*******************************************************************************
#*  Component:   BF1942-I.s                                                    *
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

S-STEP BF1942-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-SECUR-LVL-CD";
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

    INOUT MIR-CTL-ACCT-ACCS-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCT-CTL-IND";
        SType = "Indicator";
        Label = "Controllable Account Access";
    }

    INOUT MIR-SECUR-CLAS-MAX-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Security Maximum Amount";
    }

    INOUT MIR-SECUR-CLAS-UWG-AMT
    {
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Underwriting Maximum Amount";
    }

    INOUT MIR-SECUR-CNFD-ACCS-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SECUR-CNFD-ACCS-CD";
        SType = "Selection";
        Label = "Confidential Access";
    }

    INOUT MIR-SECUR-LVL-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SECUR-LVL-CD";
        SType = "Selection";
        Label = "Security Class Level";
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

#SESCAP
    INOUT MIR-MAX-SESN-NUM  
    {
        Length = "5";
        SType = "Text";
        Label = "Maximum Number of User Sessions";
    }
     
    INOUT MIR-SESN-CTL-IND
    {
        Length = "1";
        DefaultConstant = "N";
        SType = "Indicator";
        Label = "User Session Control Indicator";
    }
     
}

