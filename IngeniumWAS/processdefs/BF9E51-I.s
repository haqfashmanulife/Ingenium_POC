# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF9E51-I.s                                                    *
#*  Description: WL Premium Payment Completion quote                           *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3064  CTS      WHOLE LIFE QUOTE CHANGES                                  *
#*******************************************************************************

S-STEP BF9E51-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Input";
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

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Key;
        Mandatory;
        Length = "9";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Company Received Date";
    }

    IN MIR-JRNL-DT 
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Journal Date";
    }

    INOUT MIR-POL-PREM-PMT-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MEDIC-CVG-PMT-TYP-CD";
        DefaultConstant = "OP";
        SType = "Selection";
        Label = "Payment type of Medical Rider";
    }

    INOUT MIR-ACCU-DIV-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "ACCU-DIV-IND";
        DefaultConstant = "Y";
        SType = "Selection";
        Label = "Accumulated Dividend Amount";
    }

    INOUT MIR-INCR-PURCH-SRVBNFT-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "INCR-PURCH-SRVBNFT-IND";
        DefaultConstant = "Y";
        SType = "Selection";
        Label = "Increased purchase of survival benefit Amount";
    }

    INOUT MIR-VEST-AMT-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "VEST-AMT-IND";
        DefaultConstant = "Y";
        SType = "Selection";
        Label = "Vesting/Special dividend deferred";
    }

    INOUT MIR-HLTH-CNGLTY-BNFT-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "HLTH-CNGLTY-BNFT-IND";	
        DefaultConstant = "Y";
        SType = "Selection";
        Label = "Health Congratulatory Benefit";
    }

    INOUT MIR-LOAN-REPAY-IND
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "LOAN-REPAY-IND";
        DefaultConstant = "Y";
        SType = "Selection";
        Label = "Loan Repayment";
    }
}