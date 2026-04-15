# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:27 PM EDT

#*******************************************************************************
#*  Component:   BF0702-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF0702-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0702";
        BusinessFunctionName = "Licence Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM0841";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-LIC-DESC-TXT-T[100]
    {
        Length = "34";
        FieldGroup = "Table100";
        DBTableName = "TLI";
        SType = "Text";
        Label = "License Description";
        Index = "1";
    }

    INOUT MIR-LIC-EFF-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TLI";
        SType = "Date";
        Label = "Effective Date";
        Index = "1";
    }

    INOUT MIR-LIC-XPRY-DT-T[100]
    {
        Length = "10";
        FieldGroup = "Table100";
        DBTableName = "TLI";
        SType = "Date";
        Label = "Expiration Date";
        Index = "1";
    }

    IN MIR-LIC-BUS-CLAS-CD
    {
        Key;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLASS";
        DBTableName = "TLI";
        SType = "Selection";
        Label = "Class of Business";
    }

    IN MIR-LIC-ID
    {
        Key;
        Mandatory;
        Length = "6";
        DBTableName = "TLI";
        SType = "Text";
        Label = "Agent/Plan ID";
    }

    IN MIR-LIC-LOC-CD
    {
        Key;
        Mandatory;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "LOCAT";
        DBTableName = "TLI";
        SType = "Selection";
        Label = "Location";
    }

}

