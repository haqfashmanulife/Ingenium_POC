# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9189-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PR006I  26JUN03  New for ManuMed Riders                                    *
#*                                                                             *
#*******************************************************************************

P-STEP BF9189-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9189";
        BusinessFunctionName = "Valid Manumed Rider Plan List Retrieve"; 
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9189";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
                                                                                                                    
    IN MIR-PLAN-ID
    {
        Key;
        #Mandatory;
        DisplayOnly;
        Length = "6";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Plan Id";
    }

     
    IN MIR-CVG-PREM-CHNG-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Premium Change Date";
    }
 
    IN MIR-DV-CVG-RENEW-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Renew Code";
    }
 
    OUT MIR-CODE-T[100]
    {
        Length = "6";
        FieldGroup = "Table100";
        DBTableName;
        SType = "Text";
        Label = "Override Renewal Plan ID";
        Index = "1";
    }

    OUT MIR-DESC-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        DBTableName;
        SType = "Text";
        Label = "Description";
        Index = "1";
    }

}

