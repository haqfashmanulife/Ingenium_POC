# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:50 PM EDT
#*******************************************************************************
#*  Component:   BF9A10-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MPCR15  CTS      Lumpsum Payout History Inquiry - Search Screen            *
#*  ISLIMP  CTS      ADDED 2 NEW FIELDS AND COMMENTED OUT 2 EXISTING FIELDS AS *
#*                   PART OF INSURANCE LAW                                     *
#*  UY3049  CTS      ANNUITANT NAME                                            *
#*******************************************************************************

S-STEP BF9A10-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Output";
        DelEmptyRows;
        FocusField = "OKButton";
        FocusFrame = "ButtonFrame";
    }

    IN Title;

    IN TitleBar;

    IN TitleBarSize;

    IN ButtonBar;

    IN ButtonBarSize;

    IN MessageFrame;

    IN MessageFrameSize;

    OUT action
    {
        SType = "Hidden";
    }

    OUT index
    {
        SType = "Hidden";
    }


    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }


    IN MIR-POL-PAYO-NUM
    {
        Key;
        DisplayOnly;
        Mandatory;
        Length = "5";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    IN MIR-POL-PAYO-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        DBTableName = "TPAHS";
        SType = "Text";
        Label = "Payout Type";
        Index = "1";
    }

    IN MIR-NEW-MTHLY-BNFT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "New Monthly Benefit Amount";
        Index = "1";
    }

    IN MIR-BNFT-REDC-REASN-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "BNFT-REDC-REASN-CD";
        SType = "Text";
        Label = "Reason For Reduction";
        Index = "1";
    }

    IN MIR-LMPSM-WTHDR-AMT
    {

        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Lump Sum Withdrawal Amount";
    }

    IN MIR-EFF-DT
    {

        DisplayOnly;
        Length = "10";
        DBTableName = "TPAHS";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-WTHLD-TAX-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Withholding Tax Amount";
    }

# ISLIMP - Changes start here

#    IN MIR-HO-CLM-FRM-ACPT-DT
#    {
#        DisplayOnly;
#        Length = "10";
#        CodeSource = "TPAHS";
#        CodeType = "HO-CLM-FRM-ACPT-DT";
#        SType = "Date";
#        Label = "HO Claim Form Acceptance Date";
#    }

    IN MIR-CLM-CO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "TPAHS";
        CodeType = "CLM-CO-RECV-DT";
        SType = "Date";
        Label = "Company Received Date";
    }

# ISLIMP - Changes ends here

    IN MIR-DLAY-INT-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Delay Interest";
    }

# ISLIMP - Changes start here

#    IN MIR-DOC-COMPLT-DT
#    {
#        DisplayOnly;
#        Length = "10";
#        CodeSource = "TPAHS";
#        CodeType = "DOC-COMPLT-DT";
#        SType = "Date";
#        Label = "Document Completion Date";
#    }

    IN MIR-FINAL-DOC-COMPLT-DT
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "TPAHS";
        CodeType = "FINAL-DOC-COMPLT-DT";
        SType = "Date";
        Label = "Company Received Date(Final)";
    }

# ISLIMP - Changes ends here

    IN MIR-REMITTANCE-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Remittance Amount";
    }
    
# MP113B CHANGE STARTS HERE    
    
    IN MIR-UNPAY-SPLT-PMT-AMT
    {
        DisplayOnly;             
        Length = "15";
        SType = "Currency";
        Label = "Unpaid Split Payment Amount";
    }
    
    IN MIR-SPLT-PMT-INT-AMT
    {
            DisplayOnly;             
            Length = "15";
            SType = "Currency";
            Label = "Interest for Split Payment Amount";
    }
    
# MP113B CHANGE ENDS HERE    

    IN MIR-TRXN-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "TRXN-STAT-CD";
        DBTableName = "TPAHS";
        SType = "Text";
        Label = "Transaction Status";

    }

    IN MIR-TAX-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "TAX-TYP-CD";
        DBTableName = "TPAHS";
        SType = "Text";
        Label = "Tax Type";
    }
#UY3049 - STREAM3 ALS & DLS
    IN MIR-DV-ANUTNT-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Annuitant Name";
    }
}

