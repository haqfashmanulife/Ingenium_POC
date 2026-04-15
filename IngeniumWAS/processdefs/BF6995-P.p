# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:54 PM EDT

#*******************************************************************************
#*  Component:   BF6995-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*******************************************************************************

P-STEP BF6995-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6995";
        BusinessFunctionName = "Policy Inquiry - Contractual Payouts";
        BusinessFunctionType = "Cpayout";
        MirName = "CCWM6995";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "10";
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

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    OUT MIR-DV-XPCT-PAYO-AMT-T[10]
    {
        Length = "15";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Payout Amount";
        Index = "1";
    }

    OUT MIR-DV-XPCT-PAYO-DT-T[10]
    {
        Length = "10";
        FieldGroup = "Table10";
        DBTableName = "Derived";
        SType = "Date";
        Label = "Payout Date";
        Index = "1";
    }

    OUT MIR-POL-CSTAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Status";
    }
    #TDMG24 CHANGES START HERE
    OUT MIR-PREM-PMT-CMPLT-IND
     {
     
        Length = "1";
        DBTableName = "TPOL";
        SType = "Indicator";
        Label = "Base Policy Premium Payment Completion";
     
     }    
#TDMG24 CHANGES END HERE    

    OUT MIR-POL-CVG-REC-CTR
    {
        Length = "40";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Number of Coverages";
    }

    OUT MIR-SBSDRY-CO-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
    }

}

