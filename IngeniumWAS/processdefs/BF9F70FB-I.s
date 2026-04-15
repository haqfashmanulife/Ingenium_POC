# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF9F70FB-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYS087  CTS      EASY ENTRY FOR BILL TYPE CHANGE                           *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

S-STEP BF9F70FB-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
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
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
    IN MIR-POL-HLDR-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "PolicyHolder Name";
    }    

    IN MIR-CRNT-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "15";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Current Billing Type";
    }
    
    IN MIR-CHNG-BILL-TYP-CD
    {
        DisplayOnly;
        Length = "15";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        SType = "Text";
        Label = "Billing Type to be changed";
    } 

    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank Number";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch Number";
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
    
   INOUT MIR-COMB-BILL-IND
   {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "COMB-BILL-IND";
        SType = "Selection";
        Label = "Combine Billing Indicator";
   }
    
    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "FBACC";
        SType = "Selection";
        Label = "Account Type";
    }
    
    INOUT MIR-POL-PAC-DRW-DY
    {
        Length = "2";
        SType = "Number";
        Label = "Billing Draw Day";
    }    
#UYS133 CHANGES START
    IN MIR-PD-GR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        SType = "Text";
        Label = "PD group size";
    } 
#UYS133 CHANGES END
}
    