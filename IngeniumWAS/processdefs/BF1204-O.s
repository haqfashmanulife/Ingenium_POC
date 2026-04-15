# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF1204-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1204-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "moreButton";
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

    INOUT MIR-RH-EFF-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-RH-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RHDR";
        SType = "Selection";
        Label = "Rate Header ID";
    }

    IN MIR-RH-EFF-DT-T[36]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table36";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    IN MIR-RH-ID-T[36]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table36";
        CodeSource = "EDIT";
        CodeType = "RHDR";
        SType = "Text";
        Label = "Rate Header ID";
        Index = "1";
    }

}

