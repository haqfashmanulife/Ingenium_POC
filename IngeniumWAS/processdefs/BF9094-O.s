# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:07 PM EDT

#*******************************************************************************
#*  Component:   BF9094-O.s                                                    *
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

S-STEP BF9094-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
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

    INOUT MIR-PRCES-DT-YYYY
    {
        Key;
        Length = "4";
        SType = "Text";
        Label = "Process Date:  Year";
    }

    INOUT MIR-PRCES-DT-MM
    {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Month";
    }

    INOUT MIR-PRCES-DT-DD
    {
        Key;
        Length = "2";
        SType = "Text";
        Label = "Day";
    }



    IN MIR-BT-BILL-RUN-DT-T[13]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table13";
        SType = "Date";
        Label = "Bank Transfer Billing Run Date";
        Index = "1";
    }

    IN MIR-BT-BILL-HIGH-DT-T[13]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table13";
        SType = "Date";
        Label = "Bank Transfer High Billing Date";
        Index = "1";
    }

    IN MIR-BT-BILL-LOW-PICK-DY-T[13]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Low Pick Day";
        Index = "1";
    }

    IN MIR-BT-BILL-HIGH-PICK-DY-T[13]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "High Pick Day";
        Index = "1";
    }


}

