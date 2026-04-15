# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF0523-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UY3060  CTS      Dividend Payout Process for stream3 product               * 
#*******************************************************************************

S-STEP BF0523-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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

    INOUT MIR-DV-ACCT-TRXN-AMT
    {
#UY3060 CHANGES STARTS HERE   
#UY3060 Mandatory;
#UY3060 CHANGES ENDS HERE   
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-DV-CHQ-CREAT-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Request cheque";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-POL-TRXN-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }
    
#UY3060 CHANGES STARTS HERE    
    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
       Length = "1";
       CodeSource = "DataModel";
       CodeType = "DV-TRNXT-PAYO-MTHD-CD";
       SType = "Selection";
       Label = "Pay Out Method";
    }
#UY3060 CHANGES ENDS HERE

}

