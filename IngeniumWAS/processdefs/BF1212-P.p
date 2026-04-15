# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1212-P.p                                                    *
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

P-STEP BF1212-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1212";
        BusinessFunctionName = "Rate File Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM1212";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-RTBL-1-RT-T[121]
    {
        Mandatory;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        DBTableName = "TRT";
        SType = "Number";
        Label = "Rate 1";
        Index = "1";
    }

    INOUT MIR-RTBL-2-RT-T[121]
    {
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        DBTableName = "TRT";
        SType = "Number";
        Label = "Rate 2";
        Index = "1";
    }

    INOUT MIR-RTBL-3-RT-T[121]
    {
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        DBTableName = "TRT";
        SType = "Number";
        Label = "Rate 3";
        Index = "1";
    }

    INOUT MIR-RTBL-4-RT-T[121]
    {
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        DBTableName = "TRT";
        SType = "Number";
        Label = "Rate 4";
        Index = "1";
    }

    INOUT MIR-RTBL-5-RT-T[121]
    {
        Mandatory;
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        DBTableName = "TRT";
        SType = "Number";
        Label = "Rate 5";
        Index = "1";
    }

    INOUT MIR-RTBL-6-RT-T[121]
    {
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        DBTableName = "TRT";
        SType = "Number";
        Label = "Rate 6";
        Index = "1";
    }

    INOUT MIR-RTBL-7-RT-T[121]
    {
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        DBTableName = "TRT";
        SType = "Number";
        Label = "Rate 7";
        Index = "1";
    }

    INOUT MIR-RTBL-8-RT-T[121]
    {
        Signed;
        Length = "13";
        Decimals = "5";
        FieldGroup = "Table10";
        DBTableName = "TRT";
        SType = "Number";
        Label = "Rate 8";
        Index = "1";
    }

    INOUT MIR-RTBL-AGE-DUR-T[121]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TRT";
        SType = "Number";
        Label = "Age / Duration";
        Index = "1";
    }

    INOUT MIR-RTBL-REASN-CD-T[121]
    {
        Length = "1";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "RTBL-REASN-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Rate Reason Code";
        Index = "1";
    }

    IN MIR-DPOS-TRM-DY-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TRT";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Days";
    }

    IN MIR-DPOS-TRM-MO-DUR
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TRT";
        DefaultConstant = "000";
        SType = "Text";
        Label = "Deposit Term - Months";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-RTBL-AGE
    {
        Key;
        Length = "3";
        DBTableName = "TRT";
        SType = "Text";
        Label = "Issue or Attained Age";
    }

    IN MIR-RTBL-DB-OPT-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-DB-OPT-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Death Benefit Option";
    }

    IN MIR-RTBL-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RLTB";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Rate Load Table ID";
    }

    IN MIR-RTBL-IDT-NUM
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TRT";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-RTBL-JNT-LIFE-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-JNT-LIFE-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Joint Life Type";
    }

    IN MIR-RTBL-PAR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-PAR-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Dividend Option";
    }

    IN MIR-RTBL-PNSN-QUALF-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-PNSN-QUALF-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Pension Qualifier Code";
    }

    IN MIR-RTBL-RT-TYP-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "RTTYP";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Rate Type";
    }

    IN MIR-RTBL-SEX-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-SEX-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Sex";
    }

    IN MIR-RTBL-SMKR-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "RTBL-SMKR-CD";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Smoker Status";
    }

    IN MIR-RTBL-STBL-1-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB1";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Sub-table 1";
    }

    IN MIR-RTBL-STBL-2-CD
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "STB2";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Sub-table 2";
    }

    IN MIR-RTBL-STBL-3-CD
    {
        Key;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "STB3";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Sub-table 3";
    }

    IN MIR-RTBL-STBL-4-CD
    {
        Key;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "STB4";
        DBTableName = "TRT";
        SType = "Selection";
        Label = "Sub-table 4";
    }

    INOUT MIR-DV-MISC-HDG-TXT
    {
        Length = "79";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Key Is";
    }

    INOUT MIR-DV-RTBL-TXT-T[8]
    {
        Length = "16";
        FieldGroup = "Table4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Rate Heading 1";
        Index = "1";
    }

}

