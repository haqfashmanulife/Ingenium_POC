# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0834-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  EN0306  CTS      ADD NEW BUSINESS DAY INDICATOR                            *                                             
#*                                                                             *
#*******************************************************************************

P-STEP BF0834-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0834";
        BusinessFunctionName = "Activity Notification Table List";
        BusinessFunctionType = "List";
        MirName = "CCWM3100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ACTN-COLCT-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "ACTIV";
        DBTableName = "TACTN";
        SType = "Selection";
        Label = "Activity Pointer";
    }

    INOUT MIR-ACTN-TYP-CD
    {
        Key;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "ACTN-TYP-CD";
        DBTableName = "TACTN";
        SType = "Selection";
        Label = "Activity Type";
    }

    INOUT MIR-LOC-GR-ID
    {
        Key;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TACTN";
        SType = "Selection";
        Label = "Location Group";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TACTN";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-ACTN-LEAD-DY-DUR-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TACTN";
        SType = "Text";
        Label = "Lead Time - Day";
        Index = "1";
    }

    OUT MIR-ACTN-LEAD-MO-DUR-T[12]
    {
        Length = "3";
        FieldGroup = "Table12";
        DBTableName = "TACTN";
        SType = "Text";
        Label = "Lead Time - Month";
        Index = "1";
    }

#EN0306
    OUT MIR-ACTN-BUS-DY-DUR-IND-T[12]
    {
        Length = "1";
        FieldGroup = "Table12";
        DBTableName = "TACTN";
        SType = "Indicator";
        Label = "Business Day Indicator";
        Index = "1";
    }
    
    OUT MIR-ACTN-RECIP-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "ACTN-RECIP-CD";
        DBTableName = "TACNR";
        SType = "Text";
        Label = "Recipient";
        Index = "1";
    }

    OUT MIR-ACTN-RECIP-RPT-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "ACTR";
        DBTableName = "TACNR";
        SType = "Text";
        Label = "Activity Register Code";
        Index = "1";
    }

    OUT MIR-ACTN-TYP-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "ACTN-TYP-CD";
        DBTableName = "TACTN";
        SType = "Text";
        Label = "Activity Type";
        Index = "1";
    }

    OUT MIR-DOC-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TACNR";
        SType = "Text";
        Label = "Document";
        Index = "1";
    }

    OUT MIR-LOC-GR-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TACTN";
        SType = "Text";
        Label = "Location Group";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TACTN";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

}

