# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:01 PM EDT

#*******************************************************************************
#*  Component:   BF9842-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  PR006Q  FB       CREATED FOR INQUIRY OLD POLICY INFORMATION (MY KEMPO)     *
#*******************************************************************************

P-STEP BF9842-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9842";
        BusinessFunctionName = "Policy Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9842";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
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

    INOUT MIR-SUB-CAT-CD
    {
        Length = "3";
        DBTableName = "TPOLK";
        SType = "Text";
        Label = "Sub Category";
    }
 
    INOUT MIR-ORIG-POL-ID
    {
        Length = "7";
        DBTableName = "TPOLK";
        SType = "Text";
        Label = "Original Policy Number";
    }
 
    INOUT MIR-MY-KEMPO-TYP-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "My Kempo Type Code";
    }
     
    INOUT MIR-ORIG-POL-ISS-DT
    {
        Length = "10";
        DBTableName = "TPOLK";
        SType = "Date";
        Label = "Original Policy Issue Effective Date";
    }
    
    INOUT MIR-ORIG-POL-DUR
    {
        Length = "2";
        DBTableName = "TPOLK";
        SType = "Text";
        Label = "Original Policy Term";
    }
}

