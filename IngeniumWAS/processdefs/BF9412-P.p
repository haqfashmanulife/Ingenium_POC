# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9412-P.p                                                    *
#*  Description: Update function for Daily MCL GL Account Balance              *
#*                                                                             *
#*******************************************************************************
#*  Date    Author  Description                                                *
#*                                                                             *
#*  12DEC03 CLB     NEW FOR M26                                                *
#*******************************************************************************
 
P-STEP BF9412-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9412";
        BusinessFunctionName = "Daily MCL GL Account Balance Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9412";
    }

    OUT LSIR-RETURN-CD;
    OUT MIR-RETRN-CD;

    INOUT MIR-MCL-ACCT-BASE-ID
    {
        Key;
        Mandatory;
        Length = "8";
        DBTableName = "TDBAL";
        SType = "Text";
        Label = "GL Account #";
    }

    INOUT MIR-OPER-CAT-CD
    {
        Key;
        Length = "6";
        DBTableName = "TDBAL";
        SType = "Text";
        Label = "Operation Category";
    }

    INOUT MIR-ACCT-YR
    {
        Key;
        Mandatory;
        Length = "4";
        DBTableName = "TDBAL";
        SType = "Year";
        Label = "Year";
    }

    INOUT MIR-ACCT-MO
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TDBAL";
        SType = "Month";
        Label = "Month";
    }

    INOUT MIR-DV-OPER-CAT-CD-TXT
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Operation Category";
    }

    INOUT MIR-DV-MCL-GL-NUM-TXT
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "GL Account #";
    }

    INOUT MIR-DV-MCL-GL-NM-TXT
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "GL Account Name";
    }

    INOUT MIR-DV-DT-MTH-TXT
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Month";
    }

    INOUT MIR-ACCT-DY-T[32]
    {
        Length = "2";
        FieldGroup = "Table32";
        DBTableName = "TDBAL";
        SType = "Text";
        Label = "Day #";
        Index = "1";
    }

    INOUT MIR-DV-DY-NUM-T[32]
    {
        Length = "5";
        FieldGroup = "Table32";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Day";
        Index = "1";
    }

    INOUT MIR-ACCT-BAL-DR-AMT-T[32]
    {
        Length = "17";
        FieldGroup = "Table32";
        DBTableName = "TDBAL";
        SType = "Currency";
        Label = "Dr.";
        Index = "1";
    }

    INOUT MIR-ACCT-BAL-CR-AMT-T[32]
    {
        Length = "17";
        FieldGroup = "Table32";
        DBTableName = "TDBAL";
        SType = "Currency";
        Label = "Cr.";
        Index = "1";
    }
}

