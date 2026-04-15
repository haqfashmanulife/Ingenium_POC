# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:48 PM EDT

#*******************************************************************************
#*  Component:   BF2010-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2010-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2010";
        BusinessFunctionName = "Printer Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "XCWM0210";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-PRTR-ID
    {
        Key;
        Mandatory;
        Length = "8";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        DBTableName = "TPRTR";
        SType = "Selection";
        Label = "Printer ID";
    }

    OUT MIR-PRTR-DEST-CD-T[11]
    {
        Length = "4";
        FieldGroup = "Table11";
        CodeSource = "XTAB";
        CodeType = "DEST";
        DBTableName = "TPRTR";
        SType = "Text";
        Label = "Destination";
        Index = "1";
    }

    OUT MIR-PRTR-LOGC-DEVC-CD-T[11]
    {
        Length = "8";
        FieldGroup = "Table11";
        CodeSource = "XTAB";
        CodeType = "LDEV";
        DBTableName = "TPRTR";
        SType = "Text";
        Label = "Logical Device Name";
        Index = "1";
    }

    OUT MIR-PRTR-OUTPT-CLAS-CD-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        CodeSource = "XTAB";
        CodeType = "OUTCL";
        DBTableName = "TPRTR";
        SType = "Text";
        Label = "Output Class";
        Index = "1";
    }

    OUT MIR-PRTR-PHYS-DEVC-CD-T[11]
    {
        Length = "8";
        FieldGroup = "Table11";
        CodeSource = "XTAB";
        CodeType = "PDEV";
        DBTableName = "TPRTR";
        SType = "Text";
        Label = "Physical Device Name";
        Index = "1";
    }

}

