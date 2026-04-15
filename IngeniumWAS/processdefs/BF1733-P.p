# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:44 PM EDT

#*******************************************************************************
#*  Component:   BF1733-P.p                                                    *
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

P-STEP BF1733-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1733";
        BusinessFunctionName = "Fund Inquiry - Common Information";
        BusinessFunctionType = "Comact";
        MirName = "SCWM0020";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CIA-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TFA";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Activity Effective Date";
    }

    INOUT MIR-CIA-SEQ-NUM
    {
        Key;
        Mandatory;
        Length = "3";
        DBTableName = "TFA";
        DefaultConstant = "999";
        SType = "Text";
        Label = "Sequence Number";
    }

    INOUT MIR-CIA-TYP-CD
    {
        Mandatory;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-TYP-CD";
        DBTableName = "TFA";
        SType = "Selection";
        Label = "Activity Type";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TFA";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TFA";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CFN-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CFN-STAT-CD";
        DBTableName = "TFS";
        SType = "Selection";
        Label = "Status";
    }

    OUT MIR-CIA-ALLOC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-ALLOC-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Allocation Method";
    }

    OUT MIR-CIA-CLI-TRXN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Total Premium Received";
    }

    OUT MIR-CIA-FND-TRXN-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Net Amount";
    }

    OUT MIR-CIA-LOAD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Transfer Charges";
    }

    OUT MIR-CIA-LOAD-FORCE-IND
    {
        Length = "1";
        DBTableName = "TFA";
        SType = "Indicator";
        Label = "Loads have been forced";
    }

    OUT MIR-CIA-PRCES-DT
    {
        Length = "10";
        DBTableName = "TFA";
        SType = "Date";
        Label = "Transaction Date";
    }

    OUT MIR-CIA-REASN-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REASN-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Surrender Reason";
    }

    OUT MIR-CIA-REG-FND-SRC-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-REG-FND-SRC-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Registered Fund Source";
    }

    OUT MIR-CIA-REVRS-PRCES-DT
    {
        Length = "9";
        DBTableName = "TFA";
        SType = "Date";
        Label = "Effective Date of Reversal";
    }

    OUT MIR-CIA-REVRS-REASN-CD
    {
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "CIA-REVRS-REASN-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Reversal Reason";
    }

    OUT MIR-CIA-SHRT-AMT
    {
        Signed;
        Length = "13";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "UL - Cost of Insurance (COI) Shortage";
    }

    OUT MIR-CIA-SRC-DEST-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-SRC-DEST-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Destination of Surrender Amount";
    }

    OUT MIR-CIA-UNIT-STAT-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CIA-UNIT-STAT-CD";
        DBTableName = "TFA";
        SType = "Text";
        Label = "Unit Status";
    }

    OUT MIR-CVG-GUAR-VALU-AMT
    {
        Length = "15";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Guaranteed Value";
    }

    OUT MIR-CVG-PMT-LTD-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Cumulative Gross Premiums Paid to Date";
    }

    OUT MIR-CVG-SHRT-LTD-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "UL - Cumulative COI Shortage";
    }

    OUT MIR-CVG-SURR-LTD-AMT
    {
        Length = "17";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Cumulative Surrenders";
    }

    OUT MIR-GUAR-VALU-ESTB-IND
    {
        Length = "1";
        DBTableName = "TFA";
        SType = "Indicator";
        Label = "Calculation is outstanding";
    }

    OUT MIR-PEND-DPOS-INT-PCT
    {
        Length = "9";
        Decimals = "6";
        DBTableName = "TFA";
        SType = "Percent";
        Label = "Pending Interest Rate";
    }

    OUT MIR-CIA-MAINT-COST-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Maintenance Cost";
    }

    OUT MIR-CIA-ACQ-COST-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Acquisition Cost";
    }

    OUT MIR-CIA-WP-COST-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Waiver of Premium Cost";
    }

    OUT MIR-CIA-RSK-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Risk Premium";
    }

    OUT MIR-CIA-SSTD-RSK-PREM-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Substandard Risk Premium";
    }

    OUT MIR-CIA-OS-INS-FEE-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Outstanding Insurance Fee";
    }
#NVCA05 CHANGES START HERE

    OUT MIR-CIA-WP-INS-FEE-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "The Cost of WoP by Rider";
    }

    OUT MIR-CIA-FND-MGMT-COST-AMT
    {
        Signed;
        Length = "17";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Cost for managing separate accounts";
    }
    
    OUT MIR-CIA-GUAR-BFA-COST-AMT    
    {
        Signed;
        Length = "17";
        DBTableName = "TFA";
        SType = "Currency";
        Label = "Cost related to Guaranteed Basic Face Amount";
    }
    
    OUT MIR-CIA-HIGH-FA-DSCNT-AMT    
    {
        Signed;
        Length = "17";
        DBTableName = "TFA";
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

