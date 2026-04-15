# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:35 PM EDT

#*******************************************************************************
#*  Component:   BF1204-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1204-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1204";
        BusinessFunctionName = "Rate Header File List";
        BusinessFunctionType = "List";
        MirName = "CCWM0131";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-RH-EFF-DT
    {
        Key;
        Length = "10";
        DBTableName = "TRH";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    INOUT MIR-RH-ID
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RHDR";
        DBTableName = "TRH";
        SType = "Selection";
        Label = "Rate Header ID";
    }

    OUT MIR-RH-EFF-DT-T[36]
    {
        Length = "10";
        FieldGroup = "Table36";
        DBTableName = "TRH";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    OUT MIR-RH-ID-T[36]
    {
        Length = "6";
        FieldGroup = "Table36";
        CodeSource = "EDIT";
        CodeType = "RHDR";
        DBTableName = "TRH";
        SType = "Text";
        Label = "Rate Header ID";
        Index = "1";
    }

}

