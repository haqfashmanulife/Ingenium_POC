# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:56 PM EDT


#*******************************************************************************
#*  Component:   BF0942-P.p                                                    *
#*  Description: Pending Policy Payment Update                                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  AUTH.  Description                                        *
#*                                                                             *
#*  P00064           GW     New for Pending Policy Payment Update screen-NB33  *
#*  P00929  24APR03  ROC    REVISE RECPT NBR FROM 10 TO 8 DIGITAL              *
#*                                                                             *
#*******************************************************************************

P-STEP BF9042-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9042";
        BusinessFunctionName = "Pending Policy PaymentUpdate";
        BusinessFunctionType = "Retrieve";
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

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-DV-BUS-PRCES-ID
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Business Process";
    }    

    IN MIR-RECPT-NBR
    {
#*P00929        Length = "10";
        Length = "8";
        Mandatory;
        SType = "Number";
        Label = "Receipt Number";
    }
    
    OUT MIR-RECPT-DT 
    {
        Length = "10";
        Mandatory;
        SType = "Date";
        Label = "Receipt Date";
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

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-OLD-RECPT-NBR
    {
#*P00929      Length = "10";
        Length = "8";
        Mandatory;
        SType = "Number";
        Label = "Existing Receipt Number";
    }
    
    OUT MIR-OLD-RECPT-DT 
    {
        Length = "10";
        Mandatory;
        SType = "Date";
        Label = "Existing Receipt Date";
    }


}
