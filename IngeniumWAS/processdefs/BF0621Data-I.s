# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:25 PM EDT

#*******************************************************************************
#*  Component:   BF0621Data-I.s                                                *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01BL14  EKM      New code table CF-REASN-CD-X to allow only                *
#*                   transfers from Suspense for Annuity Payments              *
#*  P00065  KRW      ADD OPERATION CATEGORY                                    *
#*  P00891  YC       Add Journal Date with no limitation   30MAY2003           *
#*                                                                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF0621Data-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Payment";
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

    INOUT MIR-CF-REG-FND-SRC-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CF-REG-FND-SRC-CD";
        SType = "Selection";
        Label = "Source of Deposit";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    INOUT MIR-DPOS-OVRID-EFF-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Override Payment Effective Date";
    }

    INOUT MIR-DV-CF-CLI-TRXN-AMT
    {
#M271O1 CHANGES START HERE 
	CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE          
        Key;
        Mandatory;
        Length = "15";
        SType = "Currency";
        Label = "Gross Amount";
    }

    INOUT MIR-DV-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-DV-CF-REASN-CD
    {
        Key;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD-X";
        SType = "Selection";
        Label = "Transaction Reason";
    }

    INOUT MIR-DV-CF-TAX-YR
    {
        Length = "4";
        DefaultConstant = "0000";
        SType = "Year";
        Label = "Tax Year";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }

    INOUT MIR-OPER-CAT-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        SType = "Selection";
        Label = "Operation Category";
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

    INOUT MIR-SUPRES-CNFRM-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

#  P00891 YC      30MAY2003  Add 8 lines for Adding Journal Date
    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 

}

