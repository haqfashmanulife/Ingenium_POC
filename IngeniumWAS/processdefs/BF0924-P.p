# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:31 PM EDT

#*******************************************************************************
#*  Component:   BF0924-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0924-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0924";
        BusinessFunctionName = "Annuity Destination Instruction List";
        BusinessFunctionType = "List";
        MirName = "CCWM4200";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CDI-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TCDSI";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Length = "2";
        DBTableName = "TCDSI";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TCAIN";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CDI-EFF-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "TCDSI";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[10]
    {
        Length = "2";
        FieldGroup = "Table10";
        KeyColumn;
        DBTableName = "TCDSI";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

}

