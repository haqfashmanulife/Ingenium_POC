# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:18 PM EDT

#*******************************************************************************
#*  Component:   BF0236-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  016736  611J     Code cleanup                                              *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0236-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0236";
        BusinessFunctionName = "Cheque Reconciliation Paid";
        BusinessFunctionType = "Paid";
        MirName = "CCWM0175";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CHQ-PD-OR-CNCL-DT
    {
        Mandatory;
        Length = "10";
        DBTableName = "TCR";
        SType = "Date";
        Label = "Date Cheque was Paid";
    }

    IN MIR-CHQ-ID
    {
        Key;
        Mandatory;
        Length = "16";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Reference Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
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

    OUT MIR-CHQ-AMT
    {
        Length = "17";
        DBTableName = "TCR";
        SType = "Currency";
        Label = "Amount";
    }

    OUT MIR-CHQ-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TCR";
        SType = "Selection";
        Label = "Currency";
    }

    OUT MIR-CHQ-DT
    {
        Length = "10";
        DBTableName = "TCR";
        SType = "Date";
        Label = "Date";
    }

    OUT MIR-CHQ-MICR-NUM
    {
        Length = "8";
        DBTableName = "TCR";
        SType = "Text";
        Label = "MICR Number";
    }

    OUT MIR-CHQ-PAYE-1-TXT
    {
        Length = "50";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Payee (1)";
    }

    OUT MIR-CHQ-PAYE-2-TXT
    {
        Length = "50";
        DBTableName = "TCR";
        SType = "Text";
        Label = "Payee (2)";
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

