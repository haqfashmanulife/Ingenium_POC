# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:26 PM EDT

#*******************************************************************************
#*  Component:   BF0654-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0654-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0654";
        BusinessFunctionName = "Cheque Cancellation";
        BusinessFunctionType = "List";
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

    OUT MIR-CHQ-AMT-T[100]
    {
        Length = "17";
        FieldGroup = "Table100";
        DBTableName = "TCHQI";
        SType = "Currency";
        Label = "Cheque Amount";
        Index = "1";
    }

    OUT MIR-CHQ-ID-T[100]
    {
        Length = "16";
        FieldGroup = "Table100";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Cheque Reference Number";
        Index = "1";
    }

    OUT MIR-CHQ-PAYE-NM-T[100]
    {
        Length = "50";
        FieldGroup = "Table100";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Payee's Name";
        Index = "1";
    }

    OUT MIR-CHQ-REF-ID-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Reference Number";
        Index = "1";
    }

    OUT MIR-CHQ-STAT-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CHQ-STAT-CD";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }

    OUT MIR-CHQ-TYP-CD-T[100]
    {
        Length = "1";
        FieldGroup = "Table100";
        CodeSource = "DataModel";
        CodeType = "CHQ-TYP-CD";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Cheque Type";
        Index = "1";
    }

}

