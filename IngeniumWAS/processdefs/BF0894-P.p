# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:30 PM EDT

#*******************************************************************************
#*  Component:   BF0894-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0894-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0894";
        BusinessFunctionName = "TAMRA Activity History List";
        BusinessFunctionType = "List";
        MirName = "CCWM4000";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TTAMH";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TTAMH";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-TAMRA-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TTAMH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date Record Created";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-TAMRA-7PAY-ANN-AMT-T[11]
    {
        Length = "15";
        FieldGroup = "Table11";
        DBTableName = "TTAMH";
        SType = "Currency";
        Label = "7-Pay Annual Premium";
        Index = "1";
    }

    OUT MIR-TAMRA-7PAY-CUM-AMT-T[11]
    {
        Length = "17";
        FieldGroup = "Table11";
        DBTableName = "TTAMH";
        SType = "Currency";
        Label = "7-Pay Cumulative Premium";
        Index = "1";
    }

    OUT MIR-TAMRA-ACB-AMT-T[11]
    {
        Length = "15";
        FieldGroup = "Table11";
        DBTableName = "TTAMH";
        SType = "Currency";
        Label = "Adjusted Cost Basis Value";
        Index = "1";
    }

    OUT MIR-TAMRA-EFF-DT-T[11]
    {
        Length = "10";
        FieldGroup = "Table11";
        KeyColumn;
        DBTableName = "TTAMH";
        SType = "Date";
        Label = "Date Record Created";
        Index = "1";
    }

    OUT MIR-TAMRA-REASN-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "TAMRA-REASN-CD";
        DBTableName = "TTAMH";
        SType = "Text";
        Label = "Reason";
        Index = "1";
    }

    OUT MIR-TAMRA-STAT-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "DataModel";
        CodeType = "TAMRA-STAT-CD";
        DBTableName = "TTAMH";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

}

