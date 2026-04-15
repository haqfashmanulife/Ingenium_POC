# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9422-P.p                                                    *
#*  Description: Update function for Monthly MCL GL Account Balance            *
#*                                                                             *
#*******************************************************************************
#*  Date    Author  Description                                                *
#*                                                                             *
#*  12DEC03 CLB     NEW FOR M26                                                *
#*******************************************************************************
 
P-STEP BF9422-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9422";
        BusinessFunctionName = "Monthly MCL GL Account Balance Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9422";
    }

    OUT LSIR-RETURN-CD;
    OUT MIR-RETRN-CD;

    INOUT MIR-MCL-ACCT-BASE-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TMBAL";
        SType = "Text";
        Label = "GL Account #";
    }

    INOUT MIR-OPER-CAT-CD
    {
        Key;
        Length = "6";
        DBTableName = "TMBAL";
        SType = "Text";
        Label = "Operation Category";
    }

    INOUT MIR-FROM-ACCT-YR
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TMBAL";
        SType = "Year";
        Label = "From Year";
    }

    INOUT MIR-FROM-ACCT-MO
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TMBAL";
        SType = "Month";
        Label = "From Month";
    }

    INOUT MIR-TO-ACCT-YR
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TMBAL";
        SType = "Year";
        Label = "To Year";
    }

    INOUT MIR-TO-ACCT-MO
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TMBAL";
        SType = "Month";
        Label = "To Month";
    }

    INOUT MIR-DV-MCL-GL-NUM-TXT
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "GL Account #";
    }
     
    INOUT MIR-DV-OPER-CAT-CD-TXT
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Operation Category";
    }

    INOUT MIR-DV-DT-FROM-TXT
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "From";
    }

    INOUT MIR-DV-DT-TO-TXT
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "To";
    }

    INOUT MIR-DV-MCL-GL-NM-TXT
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "GL Account Name";
    }

    INOUT MIR-ACCT-YR-T[25]
    {
        Length = "4";
        FieldGroup = "Table25";
        DBTableName = "TMBAL";
        SType = "Text";
        Label = "Year";
        Index = "1";
    }

    INOUT MIR-ACCT-MO-T[25]
    {
        Length = "2";
        FieldGroup = "Table25";
        DBTableName = "TMBAL";
        SType = "Text";
        Label = "Month #";
        Index = "1";
    }

    INOUT MIR-DV-MO-NM-TXT-T[25]
    {
        Length = "10";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Month";
        Index = "1";
    }

    INOUT MIR-ACCT-BAL-DR-AMT-T[25]
    {
        Length = "17";
        FieldGroup = "Table25";
        DBTableName = "TMBAL";
        SType = "Currency";
        Label = "Dr.";
        Index = "1";
    }

    INOUT MIR-ACCT-BAL-CR-AMT-T[25]
    {
        Length = "17";
        FieldGroup = "Table25";
        DBTableName = "TMBAL";
        SType = "Currency";
        Label = "Cr.";
        Index = "1";
    }
}

