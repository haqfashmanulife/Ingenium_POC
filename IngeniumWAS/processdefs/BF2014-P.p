# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:48 PM EDT

#*******************************************************************************
#*  Component:   BF2014-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF2014-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "2014";
        BusinessFunctionName = "Printer Record List";
        BusinessFunctionType = "List";
        MirName = "XCWM0210";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-PRTR-ID
    {
        Key;
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

    OUT MIR-PRTR-ID-T[11]
    {
        Length = "8";
        FieldGroup = "Table11";
        CodeSource = "XTAB";
        CodeType = "PRTID";
        DBTableName = "TPRTR";
        SType = "Text";
        Label = "Printer ID";
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

}

