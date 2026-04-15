# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:36 PM EDT

#*******************************************************************************
#*  Component:   BF1210-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00110  SC       Allow sign to display for all Rates (1-8)                 *
#*                                                                             *
#*******************************************************************************

S-STEP BF1210-O
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

    IN MIR-RTBL-ID
    {
        DisplayOnly;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RLTB";
        SType = "Text";
        Label = "Rate Load Table ID";
    }

    IN MIR-RTBL-IDT-NUM
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DPOS-TRM-DY-DUR
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
    }

    IN MIR-DPOS-TRM-MO-DUR
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        SType = "Text";
        Label = "Location Group";
    }

    IN MIR-RTBL-AGE
    {
        Key;
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Issue or Attained Age";
    }

    IN MIR-RTBL-DB-OPT-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-DB-OPT-CD";
        SType = "Text";
        Label = "Death Benefit Option";
    }

    IN MIR-RTBL-JNT-LIFE-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-JNT-LIFE-CD";
        SType = "Text";
        Label = "Joint Life Type";
    }

    IN MIR-RTBL-PAR-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-PAR-CD";
        SType = "Text";
        Label = "Dividend Option";
    }

    IN MIR-RTBL-PNSN-QUALF-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-PNSN-QUALF-CD";
        SType = "Text";
        Label = "Pension Qualifier Code";
    }

    IN MIR-RTBL-RT-TYP-CD
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RTTYP";
        SType = "Text";
        Label = "Rate Type";
    }

    IN MIR-RTBL-SEX-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-RTBL-SMKR-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-SMKR-CD";
        SType = "Text";
        Label = "Smoker Status";
    }

    IN MIR-RTBL-STBL-1-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        SType = "Text";
        Label = "Sub-table 1";
    }

    IN MIR-RTBL-STBL-2-CD
    {
        Key;
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        SType = "Text";
        Label = "Sub-table 2";
    }

    IN MIR-RTBL-STBL-3-CD
    {
        Key;
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STB3";
        SType = "Text";
        Label = "Sub-table 3";
    }

    IN MIR-RTBL-STBL-4-CD
    {
        Key;
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        SType = "Text";
        Label = "Sub-table 4";
    }

    IN MIR-DV-MISC-HDG-TXT
    {
        DisplayOnly;
        Length = "79";
        SType = "Text";
        Label = "Key Is";
    }

    IN MIR-DV-RTBL-TXT-T[8]
    {
        DisplayOnly;
        Length = "16";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Rate Heading 1";
        Index = "1";
    }

    IN MIR-RTBL-1-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 1";
        Index = "1";
    }

    IN MIR-RTBL-2-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 2";
        Index = "1";
    }

    IN MIR-RTBL-3-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 3";
        Index = "1";
    }

    IN MIR-RTBL-4-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 4";
        Index = "1";
    }

    IN MIR-RTBL-5-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 5";
        Index = "1";
    }

    IN MIR-RTBL-6-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 6";
        Index = "1";
    }

    IN MIR-RTBL-7-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 7";
        Index = "1";
    }

    IN MIR-RTBL-8-RT-T[121]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        SType = "Number";
        Label = "Rate 8";
        Index = "1";
    }

    IN MIR-RTBL-AGE-DUR-T[121]
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table10";
        KeyColumn;
        SType = "Number";
        Label = "Age / Duration";
        Index = "1";
    }

    IN MIR-RTBL-REASN-CD-T[121]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "RTBL-REASN-CD";
        SType = "Text";
        Label = "Rate Reason Code";
        Index = "1";
    }

}

