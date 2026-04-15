# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF0514-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     code cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PF20    PF 2.0   DisplayOnly flds with DefaultSession must be IN not INOUT *
#*  B11236  PF 2.0   these DefaultSession fields needed to be INOUT            *
#*                   DisplayOnly parameter removed                             *
#*  UY3004  STREAM3  UNISYS POST MIGRATION DUPLICATION POLICY                  *
#*******************************************************************************

S-STEP BF0514-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
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

#UY3004 CHANGES START
    INOUT Dispolval
    {
        SType = "Hidden";
    }

    INOUT Dissfxval
    {
        SType = "Hidden";
    }
#UY3004 CHANGES END

#*  PF20    PF 2.0   DisplayOnly parm incorrect on DefaultSession fields with INOUT *
    INOUT MIR-MTHV-FND-EFF-DT
    {
        Key;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

#*  PF20    PF 2.0   DisplayOnly parm incorrect on DefaultSession fields with INOUT *
    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

#*  PF20    PF 2.0   DisplayOnly parm incorrect on DefaultSession fields with INOUT *
    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-MTHV-FND-EFF-DT-T[20]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table20";
        KeyColumn;
        Link;
        SType = "Text";
        Label = "Effective Date";
        Action = "SelectItem";
        Index = "1";
    }

    IN MIR-MTHV-FND-STAT-CD-T[20]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "MTHV-FND-STAT-CD";
        SType = "Text";
        Label = "Selection Status";
        Index = "1";
    }

}

