# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:54 PM EDT

#*******************************************************************************
#*  Component:   BF2010-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF2010-O
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

    IN MIR-PRTR-ID
    {
        Key;
        DisplayOnly;
        Length = "8";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        SType = "Text";
        Label = "Printer ID";
    }

    IN MIR-PRTR-DEST-CD-T[11]
    {
        DisplayOnly;
        Length = "4";
        FieldGroup = "Table11";
        CodeSource = "XTAB";
        CodeType = "DEST";
        SType = "Text";
        Label = "Destination";
        Index = "1";
    }

    IN MIR-PRTR-LOGC-DEVC-CD-T[11]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table11";
        CodeSource = "XTAB";
        CodeType = "LDEV";
        SType = "Text";
        Label = "Logical Device Name";
        Index = "1";
    }

    IN MIR-PRTR-OUTPT-CLAS-CD-T[11]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "XTAB";
        CodeType = "OUTCL";
        SType = "Text";
        Label = "Output Class";
        Index = "1";
    }

    IN MIR-PRTR-PHYS-DEVC-CD-T[11]
    {
        DisplayOnly;
        Length = "8";
        FieldGroup = "Table11";
        CodeSource = "XTAB";
        CodeType = "PDEV";
        SType = "Text";
        Label = "Physical Device Name";
        Index = "1";
    }

}

