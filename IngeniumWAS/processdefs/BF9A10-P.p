# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF9A10-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MPCR15  CTS      Lumpsum Payout History Inquiry- Search Results            *
#*  ISLIMP  CTS      ADDED 2 NEW FIELDS AND COMMENTED OUT 2 EXISTING FIELDS AS *
#*                   PART OF INSURANCE LAW                                     *
#*  UY3049  CTS      ANNUITANT NAME                                            *
#*******************************************************************************

P-STEP BF9A10-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9A10";
        BusinessFunctionName = "Lump Sum Payout History Inquiry";
        BusinessFunctionType = "Retrieve";
        MirName = "CCWM9A14";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN  MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPAHS";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN  MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPAHS";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN  MIR-POL-PAYO-NUM
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TPAHS";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Payout Number";
    }


    OUT MIR-POL-PAYO-TYP-CD
    {
        Length = "1";
        DBTableName = "TPAHS";
        SType = "Text";
        Label = "Payout Type";
        Index = "1";
    }

    OUT MIR-NEW-MTHLY-BNFT-AMT
    {
        Length = "15";
        DBTableName = "TPAHS";
        SType = "Currency";
        Label = "New Monthly Benefit Amount";
    }

    OUT MIR-BNFT-REDC-REASN-CD
    {
        CodeSource = "DataModel";
        CodeType = "BNFT-REDC-REASN-CD";
        DBTableName = "TPAHS";
        Length = "2";
        SType = "Text";
        Label = "Reason For Reduction";
    }

    OUT MIR-LMPSM-WTHDR-AMT
    {
        Length = "15";
        DBTableName = "TPAHS";
        SType = "Currency";
        Label = "Lump Sum Withdrawal Amount";
    }

    OUT MIR-EFF-DT
    {
        Length = "10";
        DBTableName = "TPAHS";
        SType = "Date";
        Label = "Effective Date";
    }

    OUT MIR-WTHLD-TAX-AMT
    {
                     
        Length = "10";
        DBTableName = "TPAHS";
        SType = "Currency";
        Label = "Withholding Tax Amount";
    }

# ISLIMP - Changes start here

#    OUT MIR-HO-CLM-FRM-ACPT-DT
#    {
#                     
#        Length = "10";
#        DBTableName = "TPAHS";
#        SType = "Date";
#        Label = "HO Claim Form Acceptance Date";
#    }

    OUT MIR-CLM-CO-RECV-DT
    {
                     
        Length = "10";
        DBTableName = "TPAHS";
        SType = "Date";
        Label = "Company Received Date";
    }

# ISLIMP - Changes ends here

    OUT MIR-DLAY-INT-AMT
    {
                     
        Length = "15";
        DBTableName = "TPAHS";
        SType = "Currency";
        Label = "Delay Interest";
    }

# ISLIMP - Changes start here

#    OUT MIR-DOC-COMPLT-DT
#    {             
#        Length = "10";
#        DBTableName = "TPAHS";
#        SType = "Date";
#        Label = "Document Completion Date";
#    }

    OUT MIR-FINAL-DOC-COMPLT-DT
    {             
        Length = "10";
        DBTableName = "TPAHS";
        SType = "Date";
        Label = "Company Received Date(Final)";
    }

# ISLIMP - Changes ends here

    OUT MIR-REMITTANCE-AMT
    {
                     
        Length = "15";
        DBTableName = "TPAHS";
        SType = "Currency";
        Label = "Remittance Amount";
    }

# MP113B CHANGE STARTS HERE    
    
    OUT MIR-UNPAY-SPLT-PMT-AMT
    {
        Length = "15";
        DBTableName = "TPAHS";
        SType = "Currency";
        Label = "Unpaid Split Payment Amount";
    }
    
    OUT MIR-SPLT-PMT-INT-AMT
    {
            Length = "15";
            DBTableName = "TPAHS";
            SType = "Currency";
            Label = "Interest for Split Payment Amount";
    }
    
# MP113B CHANGE ENDS HERE

    OUT MIR-TRXN-STAT-CD
    {
                     
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "TRXN-STAT-CD";
        DBTableName = "TPAHS";
        SType = "Text";
        Label = "Transaction Status";
    }

    OUT MIR-TAX-TYP-CD
    {
                     
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "TAX-TYP-CD";
        DBTableName = "TPAHS";
        SType = "Text";
        Label = "Tax Type";
    }
#UY3049 - STREAM3 ALS & DLS
    OUT MIR-DV-ANUTNT-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Annuitant Name";
	}
}
