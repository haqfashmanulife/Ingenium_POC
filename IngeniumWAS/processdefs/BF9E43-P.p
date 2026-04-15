# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:38 PM EDT

#*******************************************************************************
#*  Component:   BF9E43P.p                                                     *
#*  Description: Deferment Quote Screen                                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UY3066  19OCT23  Intial Version                                            *
#*******************************************************************************

P-STEP BF9E43-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9E43";
        BusinessFunctionName = "Deferment Quote";
        BusinessFunctionType = "Quotedefer";
        MirName = "CCWM9E43";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        DBTableName = "Derived";
        Label = "Process State";
    }
    
    INOUT MIR-DV-UNDO-VALID-CD
    {
        Length = "1";
        SType="Hidden";
    }
    
    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-EVNT-ACTV-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DEFR-ACTV-TYP-CD";
        SType = "Selection";
        Label = "Activity Type";
    }

    INOUT MIR-PRCES-DT
    {
      
        Length = "10";
        DBTableName = "TMAST";
        SType = "Date";
        Label = "Process Date";       
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        SType = "Text";
        Label = "Policyholder Name";
    }

    INOUT MIR-JRNL-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
        
    }

    OUT MIR-TOT-PD-PREM-AMT
    {
       Length = "17";
       Signed;
       SType = "Currency";
       Label = "Total Premium Paid for the Policy";
    } 
#UY3066 CHANGES STARTS HERE
 
    OUT MIR-CVG-NUM
    {
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }
#UY3066 CHANGES ENDS HERE

    OUT MIR-POL-BILL-MODE-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "PLAN-BILL-MODE-CD";
        SType = "Text";
        Label = "Billing Mode";
    }
    
    OUT MIR-MAT-DEFR-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Maturity Amount(Deferment Amount)";
    }
 
    OUT MIR-DEFR-INT
    {
        Length = "15";
        SType = "Currency";
        Label = "Deferment Interest";
    } 
    
    OUT MIR-POL-MAT-DT 
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TCVG";
        Label = "Maturity Date(Deferment Start Date)";
    }   

    OUT MIR-DEFR-INT-CAP-DT 
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TCVG";
        Label = "Next Deferment Interest Capitalization Date";
    }     
    
    OUT MIR-DEFR-MAT-DT 
    {
        Length = "10";
        SType = "Date";
        DBTableName = "TCVG";
        Label = "Deferment End Date";
    }
    
    OUT MIR-REMIT-AMT
    {
        Length = "15";
        SType = "Currency";
        Label = "Total Remittance Amount";
    }
     
 }   