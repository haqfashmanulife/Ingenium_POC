# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:03 PM EDT

#*******************************************************************************
#*  Component:   BF9902-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PR006C  26JUN03  New for release                                           *
#*                                                                             *
#*******************************************************************************

P-STEP BF9902-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9902";
        BusinessFunctionName = "Valid Plan List Retrieve"; 
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9902";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        #Mandatory;
        DisplayOnly;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
     
    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

