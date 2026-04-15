# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:58 PM EDT

#*******************************************************************************
#*  Component:   BF9188-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PR006I  26JUN03  New for ManuMed Riders                                    *
#*  MP142D  22APR11  CHANGES FOR WEBSERVICES                                   *
#*                                                                             *
#*******************************************************************************

P-STEP BF9188-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9188";
        BusinessFunctionName = "Valid Manumed Rider Plan List Retrieve"; 
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9188";
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

#* MP142D CHNAGES START HERE

    IN MIR-CVG-RENW-PLAN-ID
    {
        Length = "6";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "New Rider";
    }
    
#* MP142D CHNAGES START HERE    
 
    IN MIR-DV-CVG-RENEW-CD
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Renew Code";
    }

#* MP142D CHNAGES START HERE

#*    OUT MIR-CODE-T[100]
#*    {
#*        Length = "6";
#*        FieldGroup = "Table100";
#*        DBTableName;
#*        SType = "Text";
#*        Label = "Override Renewal Plan ID";
#*        Index = "1";
#*    }

    OUT MIR-DV-SBOX-CD-T[100]
    {
        Length = "40";
        FieldGroup = "Table100";
        DBTableName = "TEDIT";
        SType = "Text";
        Label = "Override Renewal Plan ID";
        Index = "1";
    }

#* MP142D CHNAGES END HERE

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

