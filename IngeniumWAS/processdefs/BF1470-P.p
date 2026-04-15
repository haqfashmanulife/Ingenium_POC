# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:40 PM EDT

#*******************************************************************************
#*  Component:   BF1470-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00272  BMB      Text length adjusted to match MIR and record layout (76)  *
#*                   Adjust display field to show spaces (INOUT)               *
#*                   Note: The HTML element that matches this has special      *
#*                   formatting for online letter writing. Do not use UIGEN.   *
#*******************************************************************************

P-STEP BF1470-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1470";
        BusinessFunctionName = "Page Design Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM0731";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DOC-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "DOCM";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Document Id";
    }

    IN MIR-DOC-LANG-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Language Code";
    }

    IN MIR-LOC-GR-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "LOCGP";
        DBTableName = "TPF";
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
        DBTableName = "TPF";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-PG-FRMT-LN-NUM-T[80]
    {
        Length = "2";
        FieldGroup = "Table80";
        KeyColumn;
        DBTableName = "TPFLN";
        SType = "Text";
        Label = "Page scroll";
        Index = "1";
    }

#B00272 - change length to match MIR
 
    INOUT MIR-PG-FRMT-LN-TXT-T[80]
    {
        Length = "76";
        FieldGroup = "Table80";
        DBTableName = "TPFLN";
        SType = "Text";
        Label = "Documentation text";
        Index = "1";
    }

}

