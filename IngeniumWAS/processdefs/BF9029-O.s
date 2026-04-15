# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:06 PM EDT

#*******************************************************************************
#*  Component:   BF9029-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00317  01AUG01  Module created                                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF9029-O
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


    IN MIR-PRCES-DT-YYYY-T[13]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Process Date:  Year";
        Index = "1";
    }


    IN MIR-PRCES-DT-MM-T[13]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table13";
        SType = "Text";
        Label = "Month";
        Index = "1";
    }



    IN MIR-APP-RECV-CUT-DT-T[13]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table13";
        SType = "Date";
        Label = "App Received Cut-off Date";
        Index = "1";
    }

    IN MIR-POL-ISS-CUT-DT-T[13]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table13";
        SType = "Date";
        Label = "Pol Issued Cut-off Date";
        Index = "1";
    }


}

