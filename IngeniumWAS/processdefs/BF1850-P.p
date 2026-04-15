# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:46 PM EDT

#*******************************************************************************
#*  Component:   BF1850-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1850-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1850";
        BusinessFunctionName = "Valuation Label Record Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "VCWM0010";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-VALN-LBL-ID
    {
        Key;
        Mandatory;
        Length = "6";
        CodeSource = "EDIT";
        CodeType = "RLBL";
        DBTableName = "TVL";
        SType = "Selection";
        Label = "Plan ID";
    }

    OUT MIR-DV-VALN-LBL-CD-T[12]
    {
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "EDIT";
        CodeType = "VLBL";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Label Description";
        Index = "1";
    }

}

