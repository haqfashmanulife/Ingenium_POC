# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9090-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  DBL63   25JAN02  Module created                                            *
#*  MP0016  01NOV05  2nd Bank Transfer - changed keys and added Low Pick Day   *                 
#*                   and High Pick Day                                         *
#*                                                                             *
#*******************************************************************************

S-STEP BF9090-O
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


    IN MIR-PRCES-DT-YYYY
    {
        Key;
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    IN MIR-PRCES-DT-MM
    {
        Key;
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Month";
    }

    IN MIR-PRCES-DT-DD
    {
        Key;
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Day";
    }

    IN MIR-BT-BILL-RUN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Bank Transfer Billing Run Date";
    }

    IN MIR-BT-BILL-HIGH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Bank Transfer High Billing Date";
    }

    IN MIR-BT-BILL-LOW-PICK-DY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Low Pick Day";
    }

    IN MIR-BT-BILL-HIGH-PICK-DY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "High Pick Day";
    }


}

