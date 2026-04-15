# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF1500-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  IPMPPA  IPMP     New field MIR-DLAY-INT-AMT added for IPMPPA               *
#*  MPCR01  14DEC07  Added new fields 'One-Time Deduction' and 'Payout Activity*
#*                   Process Date'                                             *
#*  ISLIMP  18JAN10  ADDED 2 NEW FIELDS AS PART OF INSURANCE LAW IPMP          *
#*  MP113A  CTS      Changes for New Annuity Plan and addition of new field    *
#*  UY3049  CTS      STREAM 3 ANNUITY PAYOUT                                   *
#*******************************************************************************

S-STEP BF1500-O
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

    IN MIR-CDA-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Payout Date";
    }

    IN MIR-CDA-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
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
        Length = "5";
        DefaultConstant = "00000";
        SType = "Text";
        Label = "Payout Number";
    }

    IN MIR-CDAD-PAYO-MTHD-CD-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        KeyColumn;
        CodeSource = "DataModel";
        CodeType = "CDI-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Payout Method";
        Index = "1";
    }

    IN MIR-CDAD-TRXN-AMT-T[139]
    {
        DisplayOnly;
        Length = "15";
        FieldGroup = "Table139";
        SType = "Currency";
        Label = "Transferred Amount";
        Index = "1";
    }

    IN MIR-CDA-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CDA-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-CDA-TOT-TAXWH-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Total Amount of Tax Withheld";
    }

    IN MIR-CDA-TOT-TRXN-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Total Payout Amount";
    }

    #* New field added for MPCR01
    IN MIR-ONE-TIME-DED-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "One-Time Deduction";
    }

    #*  New field MIR-DLAY-INT-AMT added for IPMPPA
    IN MIR-DLAY-INT-AMT    
    {    
    	DisplayOnly;
    #	Decimals="2";
    	Length = "13";
    	SType = "Currency";
    	Label = "Delay Interest:";
    }
    # Change IPMPPA Ends here

    # New field added for MPCR01
    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Payout Activity Process Date";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DEST-CHQ-ID-T[139]
    {
        DisplayOnly;
        Length = "16";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Cheque Reference Number";
        Index = "1";
    }

    IN MIR-DEST-CVG-NUM-T[139]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Destination Coverage Number";
        Index = "1";
    }

    IN MIR-DEST-FND-ID-T[139]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table139";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund ID";
        Index = "1";
    }

    IN MIR-DEST-POL-ID-BASE-T[139]
    {
        DisplayOnly;
        Length = "9";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    IN MIR-DEST-POL-ID-SFX-T[139]
    {
        DisplayOnly;
        Length = "1";
        FieldGroup = "Table139";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    IN MIR-FND-ID
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "SEGFD";
        SType = "Text";
        Label = "Fund ID";
    }

    IN MIR-POL-PAYO-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-PAYO-TYP-CD";
        SType = "Text";
        Label = "Payout Type";
    }

# ISLIMP - Changes start here

    IN MIR-CLM-DYS-BFR-PMT-DUE
    {
        DisplayOnly;
        Length = "03";
        CodeSource = "DataModel";
        CodeType = "DYS-BFR-PMT-DUE";
        DBTableName = "TPOLP";
        SType = "Text";
        Label = "Days before Claim Payment Due";
    }

    IN MIR-DLY-INT-STRT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Delay Interest Start Date";
    }

# ISLIMP - Changes end here

# MP113A CTS  10NOV2010 New Payout Plan Setup Changes  

    IN MIR-MODE-PAYO-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Modal Payout Amount";
    }
    
    IN MIR-SPLT-INT-AMT
    {
        DisplayOnly;
        Length = "13";
        SType = "Currency";
        Label = "Split Payment Interest";
    }

#UY3049 CHANGES STARTS HERE 
    IN MIR-YEAR-NUM
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Year Number";
        Index = "1";
    }

    IN MIR-INSTL-NUM
    {
        DisplayOnly;
        Length = "3";
        DBTableName = "TCDSA";
        SType = "Text";
        Label = "Installment Number";
        Index = "1";
    }

    IN MIR-BASIC-ANTY-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Basic Annuity Amount";
    }

    IN MIR-ADDL-ANTY-AMT
    {
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Additional Annuity Amount";
    }
#UY3049 CHANGES ENDS HERE
}

