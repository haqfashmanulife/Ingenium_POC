# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:22 PM EDT

#*******************************************************************************
#*  Component:   BF9958-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Auth Date    Description                                           *
#*                                                                             *
#*  MP142D  CTS  22APR11 Initial Version                                       *
#*******************************************************************************

P-STEP BF9958-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9958";
        BusinessFunctionName = "Webservice Access Validation";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9958";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-RQSTR-ID
    {
        Mandatory;
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Requestor Id";
    }

    IN MIR-RQSTR-TYP-CD
    {
        Mandatory;
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Requestor Type";
    }
#*S51045 CHANGES STARTS
    IN MIR-SKIP-DUPL-POL-CHK
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Duplicate policy check";
    }
#*S51045 CHANGES ENDS
}

