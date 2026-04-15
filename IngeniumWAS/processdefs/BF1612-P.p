# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:42 PM EDT

#*******************************************************************************
#*  Component:   BF1612-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1612-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1612";
        BusinessFunctionName = "Occupation Class Table Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM2220";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-OCCP-CLAS-CD-T[11]
    {
        Length = "40";
        FieldGroup = "Table11";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        DBTableName = "TOCTB";
        SType = "Selection";
        Label = "Occupation Class";
        Index = "1";
    }

    INOUT MIR-OCCP-UWG-REQIR-IND-T[11]
    {
        Length = "1";
        FieldGroup = "Table11";
        DBTableName = "TOCTB";
        SType = "Indicator";
        Label = "Underwriter review required";
        Index = "1";
    }

    IN MIR-OCCP-ID
    {
        Key;
        Mandatory;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        DBTableName = "TOCTB";
        SType = "Selection";
        Label = "Occupation";
    }

}

