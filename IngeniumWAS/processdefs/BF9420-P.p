# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9420-P.p                                                    *
#*  Description: Inquiry function for Monthly MCL GL Account Balance           *
#*                                                                             *
#*******************************************************************************
#*  Date    Author  Description                                                *
#*                                                                             *
#*  12DEC03 CLB     NEW FOR M26                                                *
#*******************************************************************************
 
P-STEP BF9420-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9420";
        BusinessFunctionName = "Monthly MCL GL Account Balance Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9420";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-MCL-ACCT-BASE-ID
    {
        Key;
        Mandatory;
        Length = "8";
        CodeSource = "EDIT";
        CodeType = "MCLGL";
        DBTableName = "TEDIT";
        SType = "Selection";
        Label = "GL Account #";
    }

    INOUT MIR-OPER-CAT-CD
    {
        Key;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "AFOC";
        DBTableName = "TEDIT";
        SType = "Selection";
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

    OUT MIR-DV-MCL-GL-NUM-TXT
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "GL Account #";
    }

    OUT MIR-DV-OPER-CAT-CD-TXT
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Operation Category";
    }

    OUT MIR-DV-DT-FROM-TXT
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "From";
    }

    OUT MIR-DV-DT-TO-TXT
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "To";
    }

    OUT MIR-DV-MCL-GL-NM-TXT
    {
        Length = "40";
        DBTableName = "Derived";
        SType = "Text";
        Label = "GL Account Name";
    }

    OUT MIR-ACCT-YR-T[25]
    {
        Length = "4";
        FieldGroup = "Table25";
        DBTableName = "TMBAL";
        SType = "Text";
        Label = "Year";
        Index = "1";
    }

    OUT MIR-ACCT-MO-T[25]
    {
        Length = "2";
        FieldGroup = "Table25";
        DBTableName = "TMBAL";
        SType = "Text";
        Label = "Month #";
        Index = "1";
    }

    OUT MIR-DV-MO-NM-TXT-T[25]
    {
        Length = "10";
        FieldGroup = "Table25";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Month";
        Index = "1";
    }

    OUT MIR-ACCT-BAL-DR-AMT-T[25]
    {
        Length = "17";
        FieldGroup = "Table25";
        DBTableName = "TMBAL";
        SType = "Currency";
        Label = "Dr.";
        Index = "1";
    }

    OUT MIR-ACCT-BAL-CR-AMT-T[25]
    {
        Length = "17";
        FieldGroup = "Table25";
        DBTableName = "TMBAL";
        SType = "Currency";
        Label = "Cr.";
        Index = "1";
    }
}
 
