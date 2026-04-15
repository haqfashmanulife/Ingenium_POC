# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:18 PM EDT

#*******************************************************************************
#*  Component:   BF0232-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0232-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0232";
        BusinessFunctionName = "Cheque Reconciliation Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0175";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CHQ-AMT
    {
        Length = "17";
        DBTableName = "TCR";
        SType = "Currency";
        Label = "Amount";
    }

    INOUT MIR-CHQ-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Currency";
    }

    INOUT MIR-CHQ-DT
    {
        Length = "10";
        DBTableName = "TCR";
        SType = "Date";
        Label = "Date";
    }

    INOUT MIR-CHQ-ID
    {
        Key;
        Mandatory;
        Length = "16";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Reference Number";
    }

    INOUT MIR-CHQ-MICR-NUM
    {
        Length = "8";
        DBTableName = "TCR";
        SType = "Text";
        Label = "MICR Number";
    }

    INOUT MIR-CHQ-PAYE-1-TXT
    {
        Mandatory;
        Length = "50";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Payee (1)";
    }

    INOUT MIR-CHQ-PAYE-2-TXT
    {
        Length = "50";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Payee (2)";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TCR";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-CHQ-PD-OR-CNCL-DT
    {
        Length = "10";
        DBTableName = "TCR";
        SType = "Date";
        Label = "Date Cheque was Paid/Cancelled";
    }

    OUT MIR-CHQ-SRC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CHQ-SRC-CD";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Origin of Cheque";
    }

    OUT MIR-CHQ-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CHQ-STAT-CD";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Status";
    }

}

