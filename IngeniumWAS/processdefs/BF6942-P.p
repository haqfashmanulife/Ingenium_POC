# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:53 PM EDT

#*******************************************************************************
#*  Component:   BF6942-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD25  BMB      Change MIR-CVG-NUM to control display of more than 20 cvgs*
#*  MP245J  CTS      ADD NEW FIELD FOR SUBSTANDARD AGE DURATION AS PART OF SPWL*
#*                                                                             *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*******************************************************************************

P-STEP BF6942-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "6942";
        BusinessFunctionName = "Policy Inquiry - Coverage Relationship";
        BusinessFunctionType = "Relcov";
        MirName = "CCWM6942";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

#01AD25 - Add in the coverage number
    INOUT MIR-CVG-NUM
    {
        Length = "2";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
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

    OUT MIR-CLI-BTH-DT-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
        Index = "1";
    }

    OUT MIR-CLI-ID-T[20]
    {
        Length = "10";
        FieldGroup = "Table20";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    OUT MIR-CLI-UWGDECN-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Underwriting Decision";
        Index = "1";
    }

    OUT MIR-CLI-UWGDECN-TYP-CD-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Decision Type";
        Index = "1";
    }

#MP245J CHANGES STARTS HERE

    OUT MIR-SSTD-AGE-ADD-DUR-T[20]
    {
        DisplayOnly;
        FieldGroup = "Table20";
        Length = "2";
        Decimals = "0";
        DBTableName = "TCVG";
        SType = "Number";
        Label = "Substandard Age Duration";
    }

#MP245J CHANGES ENDS HERE

    OUT MIR-CVG-CLI-ADJ-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Number";
        Label = "Adjusted Age";
        Index = "1";
    }

    OUT MIR-CVG-CLI-ISS-AGE-T[20]
    {
        Length = "3";
        Decimals = "0";
        FieldGroup = "Table20";
        DBTableName = "TCVGC";
        SType = "Number";
        Label = "Issue Age";
        Index = "1";
    }

    OUT MIR-CVG-CSTAT-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-NUM-T[20]
    {
        Length = "2";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Number";
        Index = "1";
    }

    OUT MIR-CVG-SEX-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-SEX-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Sex";
        Index = "1";
    }

    OUT MIR-CVG-SPND-CSTAT-CD-T[20]
    {
        Length = "3";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-CSTAT-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Suspended Coverage Status";
        Index = "1";
    }

    OUT MIR-CVG-UWGDECN-CD-T[20]
    {
        Length = "40";
        FieldGroup = "Table20";
        CodeSource = "DataModel";
        CodeType = "CVG-UWGDECN-CD";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Coverage Decision";
        Index = "1";
    }

    OUT MIR-DV-INSRD-CLI-NM-T[20]
    {
        Length = "75";
        FieldGroup = "Table20";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
        Index = "1";
    }

    OUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
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
        Length = "2";
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

    OUT MIR-UW-USER-1-ID
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    OUT MIR-UW-USER-ID-T[20]
    {
        Length = "8";
        FieldGroup = "Table20";
        DBTableName = "TCVG";
        SType = "Text";
        Label = "Underwriter's Initial";
        Index = "1";
    }

}

