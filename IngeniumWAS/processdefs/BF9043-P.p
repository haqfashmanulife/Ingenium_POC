# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT


#*******************************************************************************
#*  Component:   BF0943-P.p                                                    *
#*  Description: Pending Policy Payment Update                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* P00064   GW       09Oct02 - new for Pending Policy Payment Update - NB33    *
#* P00929   ROC      REVISE RECPT NBR FROM 10 TO 8 BIT                         *
#*                                                                             *
#*******************************************************************************

P-STEP BF9043-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9043";
        BusinessFunctionName = "Policy Payment Receipt Update";
        BusinessFunctionType = "Update";
        MirName = "NCWM9042";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;


    IN MIR-POL-ID-BASE
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

    IN MIR-OLD-RECPT-NBR
    {
#*P00929    Length = "10";
        Length = "8";
        Mandatory;
        SType = "Number";
        Label = "Existing Receipt Number";
    }
    
    IN MIR-OLD-RECPT-DT 
    {
        Length = "10";
        Mandatory;
        SType = "Date";
        Label = "Existing Receipt Date";
    }

    INOUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT MIR-RECPT-NBR
    {
#*P00929    Length = "10";
        Length = "8";
        Mandatory;
        SType = "Number";
        Label = "Receipt Number";
    }
    
    INOUT MIR-RECPT-DT 
    {
        Length = "10";
        Mandatory;
        SType = "Date";
        Label = "Receipt Date";
    }

    IN MIR-DV-BUS-PRCES-ID
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Business Process";
    }    
    
    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Current Policy Status";
    }

}
