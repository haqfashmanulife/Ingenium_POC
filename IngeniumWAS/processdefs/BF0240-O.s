# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:18 PM EDT

#*******************************************************************************
#*  Component:   BF0240-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  M271O1  CTS      FRA Foreign Currency Formatting 			       *
#*******************************************************************************

S-STEP BF0240-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-CVGD-DUR
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Duration";
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

    IN MIR-COMM-ADV-1-AMT-T[3]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE 
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table3";
        KeyColumn;
        SType = "Currency";
        Label = "Commission Advance";
        Index = "1";
    }

    IN MIR-COMM-EARN-1-AMT-T[3]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE     
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commission Earned";
        Index = "1";
    }

    IN MIR-COMM-PD-1-AMT-T[3]
    {
#M271O1 CHANGES START HERE CHANGING CURRENCY CODE  
        CurrencyCode = "MIR-PREM-CRCY-CD";
#M271O1 CHANGES END HERE     
        DisplayOnly;
        Length = "13";
        FieldGroup = "Table3";
        SType = "Currency";
        Label = "Commission Paid";
        Index = "1";
    }

    IN MIR-CVGD-PMT-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cumulative Payments for Duration";
    }

    IN MIR-CVGD-PMT-LOAD-AMT
    {
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Cumulative Front-end Load";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-PLAN-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Type of Plan";
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

