# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:49 PM EDT

#*******************************************************************************
#*  Component:   BF1733-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  16AUG12 CTS      CHANGES FOR NEWLY ADDED AMOUNT FIELDS FOR                 *
#*                   INSURANCE FEE CHANGES                                     *
#*  M245B2  CTS      Foreign Currency Formatting                               *
#*  NVCA05  CTS      CHANGES ARE DONE FOR ONTARIO                              *
#*******************************************************************************

S-STEP BF1733-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Comact";
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

    IN MIR-CIA-EFF-DT
    {
        Key;
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    IN MIR-CIA-SEQ-NUM
    {
        Key;
        DisplayOnly;
        Length = "3";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    IN MIR-CIA-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        SType = "Text";
        Label = "Activity Type";
    }

    IN MIR-CVG-NUM
    {
        Key;
        DisplayOnly;
        Length = "2";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
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

    IN MIR-CFN-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        SType = "Text";
        Label = "Status";
    }

    IN MIR-CIA-ALLOC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-ALLOC-CD";
        SType = "Text";
        Label = "Allocation Method";
    }

    IN MIR-CIA-CLI-TRXN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Total Premium Received";
    }

    IN MIR-CIA-FND-TRXN-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Net Amount";
    }

    IN MIR-CIA-LOAD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "Transfer Charges";
    }

    IN MIR-CIA-LOAD-FORCE-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Loads have been forced";
    }

    IN MIR-CIA-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Transaction Date";
    }

    IN MIR-CIA-REASN-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REASN-CD";
        SType = "Text";
        Label = "Surrender Reason";
    }

    IN MIR-CIA-REG-FND-SRC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-REG-FND-SRC-CD";
        SType = "Text";
        Label = "Registered Fund Source";
    }

    IN MIR-CIA-REVRS-PRCES-DT
    {
        DisplayOnly;
        Length = "9";
        SType = "Date";
        Label = "Effective Date of Reversal";
    }

    IN MIR-CIA-REVRS-REASN-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REVRS-REASN-CD";
        SType = "Text";
        Label = "Reversal Reason";
    }

    IN MIR-CIA-SHRT-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "13";
        SType = "Currency";
        Label = "UL - Cost of Insurance (COI) Shortage";
    }

    IN MIR-CIA-SRC-DEST-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        SType = "Text";
        Label = "Destination of Surrender Amount";
    }

    IN MIR-CIA-UNIT-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-UNIT-STAT-CD";
        SType = "Text";
        Label = "Unit Status";
    }

    IN MIR-CVG-GUAR-VALU-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Length = "15";
        SType = "Currency";
        Label = "Guaranteed Value";
    }

    IN MIR-CVG-PMT-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Cumulative Gross Premiums Paid to Date";
    }

    IN MIR-CVG-SHRT-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "15";
        SType = "Currency";
        Label = "UL - Cumulative COI Shortage";
    }

    IN MIR-CVG-SURR-LTD-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Length = "17";
        SType = "Currency";
        Label = "Cumulative Surrenders";
    }

    IN MIR-GUAR-VALU-ESTB-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Calculation is outstanding";
    }

    IN MIR-PEND-DPOS-INT-PCT
    {
        DisplayOnly;
        Length = "9";
        Decimals = "6";
        SType = "Percent";
        Label = "Pending Interest Rate";
    }

    IN MIR-CIA-MAINT-COST-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Maintenance Cost";
    }

    IN MIR-CIA-ACQ-COST-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Acquisition Cost";
    }

    IN MIR-CIA-WP-COST-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Waiver of Premium Cost";
    }

    IN MIR-CIA-RSK-PREM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Risk Premium";
    }

    IN MIR-CIA-SSTD-RSK-PREM-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Substandard Risk Premium";
    }
    
    IN MIR-CIA-OS-INS-FEE-AMT
    {
#M245B2 CHANGES START HERE    
        CurrencyCode = "MIR-POL-CRCY-CD";
#M245B2 CHANGES END HERE     
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Outstanding Insurance Fee";
    }
    
#NVCA05 CHANGES START HERE

    IN MIR-CIA-WP-INS-FEE-AMT
    {    
        CurrencyCode = "MIR-POL-CRCY-CD";    
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "the Cost for WoP by the Rider ";
    }

    IN MIR-CIA-FND-MGMT-COST-AMT
    {    
        CurrencyCode = "MIR-POL-CRCY-CD";    
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Cost for managing separate accounts";
    }
    
    IN MIR-CIA-GUAR-BFA-COST-AMT    
    {    
        CurrencyCode = "MIR-POL-CRCY-CD";    
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Cost related to Guaranteed Basic Face Amount";
    }
   
    IN MIR-CIA-HIGH-FA-DSCNT-AMT   
    {    
        CurrencyCode = "MIR-POL-CRCY-CD";   
        DisplayOnly;
        Signed;
        Length = "17";
        SType = "Currency";
        Label = "Discount for High Amounts";
    }
#NVCA05 CHANGES END HERE    
    
#M245B2 CHANGES START HERE  
    INOUT MIR-POL-CRCY-CD
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        } 
#M245B2 CHANGES END HERE      
}

