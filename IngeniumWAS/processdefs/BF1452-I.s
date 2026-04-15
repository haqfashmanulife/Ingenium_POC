# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:43 PM EDT

#*******************************************************************************
#*  Component:   BF1452-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01GL02  EKM      Added new code source table to limit Payout Method        *
#*  P00891  YC       Add Journal Date with no limitation   05JUN2003           *
#*  M29665  CTS      FIX DONE FOR ONE LEDGER CR CHANGES 		       *
#*                                                                             *
#*******************************************************************************

S-STEP BF1452-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Tlaps";
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

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD-X";
        SType = "Selection";
        Label = "Pay Out Method";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
#M29665 CHANGES START HERE         
#       CodeType = "ACTYP";
        CodeType = "FBACC";         
#M29665 CHANGES END HERE           
        SType = "Selection";
        Label = "Account Type";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
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

#  P00891 YC      06JUN2003  Add 8 lines for Adding Journal Date
    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

}

