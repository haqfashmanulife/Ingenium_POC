# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:32 PM EDT

#*******************************************************************************
#*  Component:   BF1002-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*  Q51537  CTS      CHANGES FOR CURRENCY HANDLING TO HANDLE DIFFERENT PRODUCTS*
#*  Q61577   CTS     FIX FOR CURRENCY CODE OF MODE PREMIUM                     *
#*  UYS133  CTS      Addition of PD group size field                           *
#*******************************************************************************

P-STEP BF1002-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1002";
        BusinessFunctionName = "Client Inquiry - Insured Details";
        BusinessFunctionType = "Insdtl";
        MirName = "CCWM5050";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCLI";
        DefaultSession = "MIR-CLI-ID";
        SType = "Text";
        Label = "Client Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    OUT MIR-AGT-ID-T[6]
    {
        Length = "6";
        FieldGroup = "Table6";
        DBTableName = "TCVGA";
        SType = "Text";
        Label = "Commissionable Agent Number";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TPOLC";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-CSN-AD-FACE-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TRI";
        SType = "Currency";
        Label = "Accidental Death (AD) Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-AD-FACE-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "ADB Amount";
        Index = "1";
    }

    OUT MIR-CVG-AD-MULT-FCT-T[6]
    {
        Signed;
        Length = "5";
        Decimals = "2";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "ADB Rating Multiplier";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-FACE-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Face Amount";
        Index = "1";
    }

    OUT MIR-CVG-FE-PREM-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Flat Extra Premium";
        Index = "1";
    }

    OUT MIR-CVG-FE-REASN-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "RFLAT";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Flat Extra Premium - Reason";
        Index = "1";
    }

    OUT MIR-CVG-ISS-EFF-DT-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Date";
        Label = "Issue Date";
        Index = "1";
    }

    OUT MIR-CVG-LIVES-INSRD-CD-T[6]
    {
        Length = "2";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Number of Lives Insured";
        Index = "1";
    }

    OUT MIR-CVG-ME-FCT-T[6]
    {
        Signed;
        Length = "6";
        Decimals = "2";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Rating";
        Index = "1";
    }

    OUT MIR-CVG-ME-RAT-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "TRATE";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "True Table Rating";
        Index = "1";
    }

#MP245J CHANGES STARTS HERE

    OUT MIR-SSTD-AGE-ADD-DUR-T[6]
    {
        DisplayOnly;
        FieldGroup = "Table6";
        Length = "2";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Substandard Age Duration";
    }

#MP245J CHANGES ENDS HERE

    OUT MIR-CVG-ME-REASN-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "RMULT";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Multiple Rating Reason";
        Index = "1";
    }

    OUT MIR-CVG-MPREM-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Mode Premium";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[6]
    {
        Length = "2";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-RT-AGE-T[6]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Rate Age";
        Index = "1";
    }

    OUT MIR-CVG-SPND-CSTAT-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Suspended Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-SUM-INS-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "Sum Insured Amount";
        Index = "1";
    }

    OUT MIR-CVG-WP-MULT-FCT-T[6]
    {
        Signed;
        Length = "6";
        Decimals = "2";
        FieldGroup = "Table6";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Waiver of Premium Multiplier";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    OUT MIR-DV-REINS-TOT-AMT-T[6]
    {
        Signed;
        Length = "17";
        FieldGroup = "Table6";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Total Reinsurance Amount";
        Index = "1";
    }

    OUT MIR-PLAN-ID-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Type of Plan";
        Index = "1";
    }

    OUT MIR-POL-BILL-MODE-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-MODE-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Premium Mode";
        Index = "1";
    }

    OUT MIR-POL-BILL-TYP-CD-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "POL-BILL-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Billing Type";
        Index = "1";
    }

    OUT MIR-POL-ID-BASE-T[6]
    {
        Length = "9";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Policy Id";
        Index = "1";
    }

    OUT MIR-POL-ID-SFX-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Suffix";
        Index = "1";
    }

    OUT MIR-POL-PD-TO-DT-NUM-T[6]
    {
        Length = "10";
        FieldGroup = "Table6";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Paid to Date";
        Index = "1";
    }

    OUT MIR-SBSDRY-CO-ID-T[6]
    {
        Length = "40";
        FieldGroup = "Table6";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }
    
#M245B2 CHANGES START HERE  
#Q51537 CHANGES STARTS HERE
#     INOUT MIR-POL-CRCY-CD
     INOUT MIR-POL-CRCY-CD-T[6]
#Q51537 CHANGES STOPS HERE
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        } 
#M245B2 CHANGES END HERE       
#Q61577 CHANGES START HERE  
     INOUT MIR-PREM-CRCY-CD-T[6]
        {
         
             Length = "2";
             SType = "Hidden";
             Label = "Currency";
        } 
#Q61577 CHANGES END HERE  
#UYS133 CHANGES START
    OUT MIR-PD-GR-TYP-CD-T[6]
    {
        Length = "1";
        FieldGroup = "Table6";
        CodeSource = "DataModel";
        CodeType = "PD-GR-TYP-CD";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "PD group size";
        Index = "1";
    }
#UYS133 CHANGES END
}

