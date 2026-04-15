# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:26 PM EDT

#*******************************************************************************
#*  Component:   BF0650-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0650-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0650";
        BusinessFunctionName = "Cheque Cancellation";
        BusinessFunctionType = "Change";
        MirName = "CCWM0781";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CHQ-ID
    {
        Key;
        Length = "16";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Cheque Reference Number";
    }

    INOUT MIR-CHQ-PAYE-NM
    {
        Length = "50";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Payee's Name";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process code";
    }

    OUT MIR-CHQ-AMT-T[12]
    {
        Length = "17";
        FieldGroup = "Table12";
        DBTableName = "TCHQI";
        SType = "Currency";
        Label = "Cheque Amount";
        Index = "1";
    }

    OUT MIR-CHQ-REF-ID-T[12]
    {
        Length = "10";
        FieldGroup = "Table12";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Reference Number";
        Index = "1";
    }

    OUT MIR-CHQ-STAT-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CHQ-STAT-CD";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-CHQ-TYP-CD-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "CHQ-TYP-CD";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Cheque Type";
        Index = "1";
    }

}

