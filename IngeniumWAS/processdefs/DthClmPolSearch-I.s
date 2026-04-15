# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:DthClmPolSearch-I.s                                              *
#*  Description:Supports the Death client claim search screen.A policy id      *
#*              will be entered                                                *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  IPCACS  CTS      DEATH CLAIM SEARCH - INPUT SCREEN                         *
#*                                                                             *
#*******************************************************************************

S-STEP DthClmPolSearch-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        DelEmptyRows;
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

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "09";
        DBTableName = "TPOL";
        DefaultSession ="MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Length = "01";
        DBTableName = "TPOL";
        DefaultSession="MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

}



