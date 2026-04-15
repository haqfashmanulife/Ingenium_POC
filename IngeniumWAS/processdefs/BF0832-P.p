# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF0832-P.p                                                    *
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

P-STEP BF0832-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0832";
        BusinessFunctionName = "Activity Notification Table Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM3100";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ACTN-LEAD-DY-DUR
    {
        Mandatory;
        Length = "3";
        DBTableName = "TACTN";
        SType = "Text";
        Label = "Lead Time - Day";
    }

    INOUT MIR-ACTN-LEAD-MO-DUR
    {
        Mandatory;
        Length = "3";
        DBTableName = "TACTN";
        SType = "Text";
        Label = "Lead Time - Month";
    }

#EN0306
    INOUT MIR-ACTN-BUS-DY-DUR-IND
    {
        Length = "1";
        DBTableName = "TACTN";
        SType = "Indicator";
        Label = "Business Day Indicator";
    }
    
    INOUT MIR-ACTN-RECIP-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "DataModel";
        CodeType = "ACTN-RECIP-CD";
        DBTableName = "TACNR";
        SType = "Selection";
        Label = "Recipient";
        Index = "1";
    }

    INOUT MIR-ACTN-RECIP-RPT-CD-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "ACTR";
        DBTableName = "TACNR";
        SType = "Selection";
        Label = "Activity Register Code";
        Index = "1";
    }

    INOUT MIR-DOC-ID-T[10]
    {
        Length = "40";
        FieldGroup = "Table10";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TACNR";
        SType = "Selection";
        Label = "Document";
        Index = "1";
    }

    IN MIR-ACTN-COLCT-ID
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

    IN MIR-ACTN-TYP-CD
    {
        Key;
        Mandatory;
        Length = "5";
        CodeSource = "DataModel";
        CodeType = "ACTN-TYP-CD";
        DBTableName = "TACTN";
        SType = "Selection";
        Label = "Activity Type";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TACTN";
        SType = "Selection";
        Label = "Location Group";
    }

    IN MIR-SBSDRY-CO-ID
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

}

