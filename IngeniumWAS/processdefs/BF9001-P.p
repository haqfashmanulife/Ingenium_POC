#<HEADER>
#<DESCRIPTION>
#Security Class Session Control List
#</DESCRIPTION>
#<COPYRIGHT>
#© 2001 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED
#</COPYRIGHT>
#</HEADER>

#*******************************************************************************
#*  Component:   BF9001-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  SESCAP  31OCT04  New for Session Cap Enhancement                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9001-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9001";
        BusinessFunctionType = "List";
        MirName = "XCWM9001";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-SECUR-CLAS-ID
    {
        Key;
        Length = "25";
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "TUSCL";
        SType = "Selection";
        Label = "Security Class";
    }

    INOUT MIR-DV-SESN-CTL-ONLY-IND
    {
        Key;
        Length = "1";
        SType = "Indicator";
        Label = "Display Session Control Only";
    }

    OUT MIR-DV-SESN-TOT-SESN-CTL
    {
        Length = "5";
        SType = "Text";
        Label = "Total Number of Sessions with Session Control";
    }

    OUT MIR-DV-SESN-TOT-ALL
    {
        Length = "5";
        SType = "Text";
        Label = "Total Number of Sessions (Approx)";
    }


    OUT MIR-SECUR-CLAS-ID-T[25]
    {
        Length = "25";
        FieldGroup = "Table25";
        KeyColumn;
        CodeSource = "XTAB";
        CodeType = "USCL";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Security Class";
        Index = "1";
    }

    OUT MIR-SESN-CTL-IND-T[25]
    {
        Length = "1";
        FieldGroup = "Table25";
        DBTableName = "TUSCL";
        SType = "Indicator";
        Label = "Session Control Indicator";
        Index = "1";
    }

    OUT MIR-MAX-SESN-NUM-T[25]
    {
        Length = "5";
        FieldGroup = "Table25";
        DBTableName = "TUSCL";
        SType = "Text";
        Label = "Maximum Sessions";
        Index = "1";
    }

    OUT MIR-DV-SESN-TOT-T[25]
    {
        Length = "5";
        FieldGroup = "Table25";
        SType = "Text";
        Label = "Number of Active Sessions";
        Index = "1";
    }

}


