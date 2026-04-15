# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:51 PM EDT

#*******************************************************************************
#*  Component:   BF4900-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF4900-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "4900";
        BusinessFunctionName = "Product List Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM4900";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-APP-FORM-TYP-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        DBTableName = "TPH";
        SType = "Selection";
        Label = "Application Form Type";
    }

    IN MIR-POL-APP-SIGN-DT
    {
        Length = "10";
        DBTableName = "TPOL";
        SType = "Date";
        Label = "Application Signed Date";
    }

    IN MIR-POL-ISS-LOC-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        DBTableName = "TPOL";
        SType = "Selection";
        Label = "Issue Location";
    }

    IN MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPACK";
        SType = "Selection";
        Label = "Sub Company";
    }

    OUT MIR-CODE-T[50]
    {
        Length = "6";
        FieldGroup = "Table50";
        DBTableName;
        SType = "Text";
        Label = "Plan ID";
        Index = "1";
    }

    OUT MIR-DESC-T[50]
    {
        Length = "40";
        FieldGroup = "Table50";
        DBTableName;
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

}

