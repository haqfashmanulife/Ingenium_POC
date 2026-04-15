# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:59 PM EDT

#*******************************************************************************
#*  Component:   BF9C40-P.p                                                    *
#*  Description: GET CLAIM DETAILS                                             *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  R12732  CTS      CHANGES DONE FOR MISSION LEARNING                         *
#*******************************************************************************

P-STEP BF9C40-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9C40";
        BusinessFunctionName = "Get Claim Details";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9C40";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CLM-ID
    {
        Key;
        Length = "8";
        DBTableName = "TCLMA";
        SType = "Text";
        Label = "Master Claim ID";
    }

    INOUT MIR-CLI-ID
    {
        Key;
        Length = "10";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client ID";
    }    

    OUT MIR-TOT-RECENT-CLM-RECV
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Total Recent claims Received";
    }    

    OUT MIR-TOT-RECENT-CLM-ACPT
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Total Recent claims Accepted";
    }    

    OUT MIR-TOT-RECENT-CLM-PD-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Total Recent claims Paid Amount";
    } 

    OUT MIR-TOT-PAST-CLM-RECV
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Total Past claims Received";
    }    

    OUT MIR-TOT-PAST-CLM-ACPT
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Total Past claims Accepted";
    }    

    OUT MIR-TOT-PAST-CLM-PD-AMT
    {
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Total Past claims Paid Amount";
    } 
    

    OUT MIR-CLM-ID-T[100]
    {
        DisplayOnly;
        Length = "8";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Master Claim ID";
        Index = "1";
    }  
    
    OUT MIR-POL-ID-T[100]
    {
        DisplayOnly;
        Length = "10";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Policy ID";
        Index = "1";    
    }

    OUT MIR-CVG-NUM-T[100]
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";    
    }

    OUT MIR-BNFT-NM-ID-T[100]
    {
        DisplayOnly;
        Length = "5";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Benefit name ID";
        Index = "1";        
    }

    OUT MIR-CLBD-STAT-CD-T[100]
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Claim Status";
        Index = "1";    
    }

    OUT MIR-REASN-CD-T[100]
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Exclusion Reason code";
        Index = "1";    
    }

    OUT MIR-CLM-AGG-NUM-T[100]
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TCLBD";
        SType = "Text";
        Label = "Aggregate number";
        Index = "1";    
    }

    OUT MIR-EVNT-PAYBL-AMT-T[100]
    {
        DisplayOnly;
        Length = "15";
        DBTableName = "TCLBD";
        SType = "Currency";
        Label = "Event Payable Amount";
        Index = "1";    
    }
}
