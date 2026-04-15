# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF0944-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  UY3049  CTS      ANNUITY PAYMENT SCREEN                                    *
#*******************************************************************************

P-STEP BF0944-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0944";
        BusinessFunctionName = "Automatic Payout Processing List";
        BusinessFunctionType = "List";
        MirName = "CCWM4300";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-POL-PAYO-NUM
    {
        Key;
        Length = "5";
        DBTableName = "TPOLP";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    INOUT MIR-POL-PAYO-TYP-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        DBTableName = "TPOLP";
        SType = "Selection";
        Label = "Payout Type";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CDA-EFF-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TCDSD";
        SType = "Date";
        Label = "Last Payment Date";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[12]
    {
        Length = "2";
        FieldGroup = "Table12";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-FND-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Fund";
        Index = "1";
    }

    OUT MIR-POL-PAYO-NUM-T[12]
    {
        Length = "5";
        FieldGroup = "Table12";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Payout Number";
        Index = "1";
    }

    OUT MIR-POL-PAYO-NXT-DT-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TPOLP";
        SType = "Date";
        Label = "Next Payout Date";
        Index = "1";
    }

    OUT MIR-POL-PAYO-STAT-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-STAT-CD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-POL-PAYO-TYP-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Payout Type";
        Index = "1";
    }

    OUT MIR-POL-PAYO-UNIT-QTY-T[12]
    {
        Length = "18";
        FieldGroup = "Table12";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Total Payout Units";
        Index = "1";
    }
#UY3049 CHANGES STARTS
    IN MIR-10-POL-ID
    {
        Length = "10";
        SType = "Hidden";
        Label = "Policy Id";
    }     
    IN MIR-STR3-PAYO-IND
    {
        Length = "1";
        SType = "Hidden";
    }
#UY3049 CHANGES ENDS
}

