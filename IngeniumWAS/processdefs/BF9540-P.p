# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT


#*******************************************************************************
#*  Component:   BF9540-P.p                                                    *
#*  Description: Select a Policy by Policy Number or Application Number        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00386  WBP      New for App Update Flow                                   *
#*                                                                             *
#*******************************************************************************

P-STEP BF9540-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9540";
        BusinessFunctionName = "Select a Policy";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9540";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;
    
    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-POL-APP-FORM-ID
    {
        Key;
        Length = "15";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Application Form ID";
    }
 
}
 

     
    
 


