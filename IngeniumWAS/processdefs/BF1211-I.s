# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF1211-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1211-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Create";
        Type = "Input";
        FocusField = "MIR-RTBL-ID";
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

    INOUT MIR-DPOS-TRM-DY-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
    }

    INOUT MIR-DPOS-TRM-MO-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    INOUT MIR-DV-END-RTBL-AGE-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        Decimals = "0";
        DefaultConstant = "000";
        SType = "Number";
        Label = "End Age / Duration";
    }

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-RTBL-AGE
    {
        Key;
        Length = "3";
        SType = "Text";
        Label = "Issue or Attained Age";
    }

    INOUT MIR-RTBL-AGE-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        Decimals = "0";
        DefaultConstant = "000";
        SType = "Number";
        Label = "Start Age / Duration";
    }

    INOUT MIR-RTBL-DB-OPT-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-DB-OPT-CD";
        SType = "Selection";
        Label = "Death Benefit Option";
    }

    INOUT MIR-RTBL-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RLTB";
        SType = "Selection";
        Label = "Rate Load Table ID";
    }

    INOUT MIR-RTBL-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-RTBL-JNT-LIFE-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-JNT-LIFE-CD";
        SType = "Selection";
        Label = "Joint Life Type";
    }

    INOUT MIR-RTBL-PAR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-PAR-CD";
        SType = "Selection";
        Label = "Dividend Option";
    }

    INOUT MIR-RTBL-PNSN-QUALF-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-PNSN-QUALF-CD";
        SType = "Selection";
        Label = "Pension Qualifier Code";
    }

    INOUT MIR-RTBL-RT-TYP-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RTTYP";
        SType = "Selection";
        Label = "Rate Type";
    }

    INOUT MIR-RTBL-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-SEX-CD";
        SType = "Selection";
        Label = "Sex";
    }

    INOUT MIR-RTBL-SMKR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-SMKR-CD";
        SType = "Selection";
        Label = "Smoker Status";
    }

    INOUT MIR-RTBL-STBL-1-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Selection";
        Label = "Sub-table 1";
    }

    INOUT MIR-RTBL-STBL-2-CD
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Selection";
        Label = "Sub-table 2";
    }

    INOUT MIR-RTBL-STBL-3-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Selection";
        Label = "Sub-table 3";
    }

    INOUT MIR-RTBL-STBL-4-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Selection";
        Label = "Sub-table 4";
    }

}

