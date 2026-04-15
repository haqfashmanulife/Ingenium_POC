# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:20 PM EDT

#*******************************************************************************
#*  Component:   BF0364-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0364-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0364";
        BusinessFunctionName = "Clear Case Test Table List";
        BusinessFunctionType = "List";
        MirName = "NCWM0360";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CCAS-TST-ID
    {
        Key;
        Length = "4";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Test Number";
    }

    INOUT MIR-CCAS-TST-SUBSET-ID
    {
        Key;
        Length = "1";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Subset Test";
    }

    OUT MIR-CCAS-TST-ID-T[12]
    {
        Length = "4";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Test Number";
        Index = "1";
    }

    OUT MIR-CCAS-TST-NM-T[12]
    {
        Length = "45";
        FieldGroup = "Table12";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Test Name";
        Index = "1";
    }

    OUT MIR-CCAS-TST-SUBSET-ID-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Subset Test";
        Index = "1";
    }

    OUT MIR-FLD-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        KeyColumn;
        DBTableName = "TUWMX";
        SType = "Text";
        Label = "Defined Field Name";
        Index = "1";
    }

}

