# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:42 PM EDT

#*******************************************************************************
#*  Component:   BF1630-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

P-STEP BF1630-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "1630";
        BusinessFunctionName = "Client Consolidation Retrieve";
        BusinessFunctionType = "Retrieve";
        MirName = "NCWM2900";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    IN MIR-CLI-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCCTX";
        SType = "Text";
        Label = "Client Number A";
    }

    IN MIR-CLI-ID-2
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCCTX";
        SType = "Text";
        Label = "Client Number B";
    }

    OUT MIR-ADDR-STAT-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Status Changed Date";
    }

    OUT MIR-ADDR-STAT-CHNG-DT-2
    {
        Length = "10";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Status Changed Date";
    }

    OUT MIR-AGT-ID
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    OUT MIR-AGT-ID-2
    {
        Length = "6";
        DBTableName = "TAG";
        SType = "Text";
        Label = "Agent ID";
    }

    OUT MIR-BEST-TIME-CALL-TXT
    {
        Length = "15";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Best Time to Call";
    }

    OUT MIR-BEST-TIME-CALL-TXT-2
    {
        Length = "15";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Best Time to Call";
    }

    OUT MIR-CLI-ADDR-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Changed Date";
    }

    OUT MIR-CLI-ADDR-CHNG-DT-2
    {
        Length = "10";
        DBTableName = "TCLIA";
        SType = "Date";
        Label = "Address Changed Date";
    }

    OUT MIR-CLI-ADDR-LN-1-TXT
    {
        Length = "25";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-LN-1-TXT-2
    {
        Length = "25";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-LN-2-TXT
    {
        Length = "25";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-LN-2-TXT-2
    {
        Length = "25";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-LN-3-TXT
    {
        Length = "25";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-LN-3-TXT-2
    {
        Length = "25";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    OUT MIR-CLI-ADDR-STAT-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
    }

    OUT MIR-CLI-ADDR-STAT-CD-2
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address Status";
    }

    OUT MIR-CLI-ADDR-YR-DUR
    {
        Length = "2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Years at Address";
    }

    OUT MIR-CLI-ADDR-YR-DUR-2
    {
        Length = "2";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Years at Address";
    }

    OUT MIR-CLI-AGE-PROOF-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Proof of age submitted";
    }

    OUT MIR-CLI-AGE-PROOF-IND-2
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Proof of age submitted";
    }

    OUT MIR-CLI-BTH-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }

    OUT MIR-CLI-BTH-DT-2
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Birth Date";
    }

    OUT MIR-CLI-BTH-LOC-CD
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Birth Location";
    }

    OUT MIR-CLI-BTH-LOC-CD-2
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Birth Location";
    }

    OUT MIR-CLI-CHRTY-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Owner has been identified as a charity";
    }

    OUT MIR-CLI-CHRTY-IND-2
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Owner has been identified as a charity";
    }

    OUT MIR-CLI-CITY-NM-TXT
    {
        Length = "25";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
    }

    OUT MIR-CLI-CITY-NM-TXT-2
    {
        Length = "25";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
    }

    OUT MIR-CLI-CLAS-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Classification";
    }

    OUT MIR-CLI-CLAS-CD-2
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Classification";
    }

    OUT MIR-CLI-CMPLT-CCAS-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Clear case processing attempted";
    }

    OUT MIR-CLI-CMPLT-CCAS-IND-2
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Clear case processing attempted";
    }

    OUT MIR-CLI-CNFD-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    OUT MIR-CLI-CNFD-IND-2
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    OUT MIR-CLI-COMNT-TXT
    {
        Length = "237";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Additional Comments";
    }

    OUT MIR-CLI-COMNT-TXT-2
    {
        Length = "237";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Additional Comments";
    }

    OUT MIR-CLI-CR-CARD-NUM
    {
        Length = "20";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Chargecard Account Number";
    }

    OUT MIR-CLI-CR-CARD-NUM-2
    {
        Length = "20";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Chargecard Account Number";
    }

    OUT MIR-CLI-CR-CARD-TYP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CHGTP";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Chargecard Type";
    }

    OUT MIR-CLI-CR-CARD-TYP-CD-2
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CHGTP";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Chargecard Type";
    }

    OUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Province/State";
    }

    OUT MIR-CLI-CRNT-LOC-CD-2
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Province/State";
    }

    OUT MIR-CLI-CTRY-CD
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Country";
    }

    OUT MIR-CLI-CTRY-CD-2
    {
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Country";
    }

    OUT MIR-CLI-EMPLR-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Province/State";
    }

    OUT MIR-CLI-EMPLR-LOC-CD-2
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Province/State";
    }

    OUT MIR-DV-EMPLR-CLI-CO-NM-1
    {
        Length = "50";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Current Employer Name";
    }

    OUT MIR-DV-EMPLR-CLI-CO-NM-1-2
    {
        Length = "50";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Current Employer Name";
    }

    OUT MIR-CLI-EMPL-YR-DUR
    {
        Length = "2";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Years with Employer";
    }

    OUT MIR-CLI-EMPL-YR-DUR-2
    {
        Length = "2";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Years with Employer";
    }

    OUT MIR-CLI-INCM-EARN-CD
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "INCCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Income Class";
    }

    OUT MIR-CLI-INCM-EARN-CD-2
    {
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "INCCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Income Class";
    }

    OUT MIR-CLI-JP-ADDR-CD
    {
        Length = "11";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Japanese Address Code";
    }

    OUT MIR-CLI-JP-ADDR-CD-2
    {
        Length = "11";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Japanese Address Code";
    }

    OUT MIR-CLI-LANG-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Correspondence Language";
    }

    OUT MIR-CLI-LANG-CD-2
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Correspondence Language";
    }

    OUT MIR-CLI-LEGIT-DUP-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Legitimate duplicate - Do not consolidate";
    }

    OUT MIR-CLI-LEGIT-DUP-IND-2
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Legitimate duplicate - Do not consolidate";
    }

    OUT MIR-CLI-INDV-TITL-TXT
    {
        Length = "15";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Title";
    }

    OUT MIR-CLI-INDV-TITL-TXT-2
    {
        Length = "15";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Title";
    }

    OUT MIR-CLI-MARIT-STAT-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "MARST";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Marital Status";
    }

    OUT MIR-CLI-MARIT-STAT-CD-2
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "MARST";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Marital Status";
    }

    OUT MIR-CLI-MIB-IND-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-MIB-IND-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "MIB Indicator";
    }

    OUT MIR-CLI-MIB-IND-CD-2
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-MIB-IND-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "MIB Indicator";
    }

    OUT MIR-CLI-MID-INIT-NM
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Initial";
    }

    OUT MIR-CLI-MID-INIT-NM-2
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Initial";
    }

    OUT MIR-CLI-NM-CHNG-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Client Name Change Date";
    }

    OUT MIR-CLI-NM-CHNG-DT-2
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Client Name Change Date";
    }

    OUT MIR-CLI-OCCP-CLAS-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Occupation Class";
    }

    OUT MIR-CLI-OCCP-CLAS-CD-2
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Occupation Class";
    }

    OUT MIR-CLI-PREV-DCLN-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Declined Date";
    }

    OUT MIR-CLI-PREV-DCLN-DT-2
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Declined Date";
    }

    OUT MIR-CLI-PREV-DCLN-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Client previously declined by company";
    }

    OUT MIR-CLI-PREV-DCLN-IND-2
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Client previously declined by company";
    }

    OUT MIR-DV-EMPLR-CLI-CO-NM-2
    {
        Length = "50";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Previous Employer Name";
    }

    OUT MIR-DV-EMPLR-CLI-CO-NM-2-2
    {
        Length = "50";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Previous Employer Name";
    }

    OUT MIR-CLI-PRST-RT
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCLI";
        SType = "Percent";
        Label = "Persistency Rate";
    }

    OUT MIR-CLI-PRST-RT-2
    {
        Length = "3";
        Decimals = "0";
        DBTableName = "TCLI";
        SType = "Percent";
        Label = "Persistency Rate";
    }

    OUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    OUT MIR-CLI-PSTL-CD-2
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    OUT MIR-CLI-SELF-EMPL-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Self-employed";
    }

    OUT MIR-CLI-SELF-EMPL-IND-2
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Self-employed";
    }

    OUT MIR-CLI-SEX-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CLI-SEX-CD-2
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Sex";
    }

    OUT MIR-CLI-INDV-SFX-NM
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CLI-INDV-SFX-NM-2
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Suffix";
    }

    OUT MIR-CLI-SMKR-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Smoker";
    }

    OUT MIR-CLI-SMKR-CD-2
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Smoker";
    }

    OUT MIR-CLI-STMT-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Statement Date";
    }

    OUT MIR-CLI-STMT-DT-2
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Statement Date";
    }

    OUT MIR-CLI-TAX-ID
    {
        Length = "9";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    OUT MIR-CLI-TAX-ID-2
    {
        Length = "9";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    OUT MIR-CLI-TXEMP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-TXEMP-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Exempt";
    }

    OUT MIR-CLI-TXEMP-CD-2
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-TXEMP-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Tax Exempt";
    }

    OUT MIR-CLI-UIC-QUALF-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "UIC Qualified";
    }

    OUT MIR-CLI-UIC-QUALF-IND-2
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "UIC Qualified";
    }

    OUT MIR-CLI-UWGDECN-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Underwriting Decision";
    }

    OUT MIR-CLI-UWGDECN-CD-2
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Underwriting Decision";
    }

    OUT MIR-CLI-UWGDECN-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "UW Decision Changed Date";
    }

    OUT MIR-CLI-UWGDECN-DT-2
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "UW Decision Changed Date";
    }

    OUT MIR-CLI-UWGDECN-TYP-CD
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Decision Type";
    }

    OUT MIR-CLI-UWGDECN-TYP-CD-2
    {
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Decision Type";
    }

    OUT MIR-CLI-WRK-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Worked/Period";
    }

    OUT MIR-CLI-WRK-CD-2
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Worked/Period";
    }

    OUT MIR-CLI-WRK-DUR-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-DUR-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Worked/Period";
    }

    OUT MIR-CLI-WRK-DUR-CD-2
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-DUR-CD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Worked/Period";
    }

    OUT MIR-CLI-WRK-PT-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Part-time";
    }

    OUT MIR-CLI-WRK-PT-IND-2
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Part-time";
    }

    OUT MIR-CLI-WRK-QTY
    {
        Length = "5";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Hours Worked";
    }

    OUT MIR-CLI-WRK-QTY-2
    {
        Length = "5";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Hours Worked";
    }

    OUT MIR-DV-APP-INFO-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Application Information";
    }

    OUT MIR-DV-APP-INFO-IND-2
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Application Information";
    }

    OUT MIR-DV-BNK-ACCT-QTY
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Bank Accounts";
    }

    OUT MIR-DV-BNK-ACCT-QTY-2
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Bank Accounts";
    }

    OUT MIR-DV-BTH-JP-DT-DY-TXT
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Birth Day in Emperor Format";
    }

    OUT MIR-DV-BTH-JP-DT-DY-TXT-2
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Birth Day in Emperor Format";
    }

    OUT MIR-DV-BTH-JP-DT-EMPRR-NM
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Emperor Name";
    }

    OUT MIR-DV-BTH-JP-DT-EMPRR-NM-2
    {
        Length = "10";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Emperor Name";
    }

    OUT MIR-DV-BTH-JP-DT-MO-TXT
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Birth Month in Emperor Format";
    }

    OUT MIR-DV-BTH-JP-DT-MO-TXT-2
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Birth Month in Emperor Format";
    }

    OUT MIR-DV-BTH-JP-DT-YR-TXT
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Birth Year in Emperor Format";
    }

    OUT MIR-DV-BTH-JP-DT-YR-TXT-2
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Birth Year in Emperor Format";
    }

    OUT MIR-DV-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

    OUT MIR-DV-CLI-NM-2
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Client Name";
    }

    OUT MIR-DV-PREV-CLI-NM-1
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Previous Name";
    }

    OUT MIR-DV-PREV-CLI-NM-1-2
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Previous Name";
    }

    OUT MIR-DV-PREV-CLI-NM-2
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Previous Name";
    }

    OUT MIR-DV-PREV-CLI-NM-2-2
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Previous Name";
    }

    OUT MIR-DV-PREV-CLI-NM-3
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Previous Name";
    }

    OUT MIR-DV-PREV-CLI-NM-3-2
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Previous Name";
    }

    OUT MIR-DV-CNTCT-QTY
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Contact Information";
    }

    OUT MIR-DV-CNTCT-QTY-2
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Contact Information";
    }

    OUT MIR-DV-INCM-QTY
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Income Information";
    }

    OUT MIR-DV-INCM-QTY-2
    {
        Length = "2";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Number of Income Information";
    }

    OUT MIR-DV-OTHR-ADDR-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Other Mailing Address";
    }

    OUT MIR-DV-OTHR-ADDR-IND-2
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Other Mailing Address";
    }

    OUT MIR-DV-PREV-ADDR-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Previous Address";
    }

    OUT MIR-DV-PREV-ADDR-IND-2
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Previous Address";
    }

    OUT MIR-OCCP-ID
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Occupation";
    }

    OUT MIR-OCCP-ID-2
    {
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Occupation";
    }

    OUT MIR-PREV-EMPL-YR-DUR
    {
        Length = "2";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Number of Years with Employer";
    }

    OUT MIR-PREV-EMPL-YR-DUR-2
    {
        Length = "2";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Number of Years with Employer";
    }

    OUT MIR-PREV-UPDT-DT
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Client Record";
    }

    OUT MIR-PREV-UPDT-DT-2
    {
        Length = "10";
        DBTableName = "TCLI";
        SType = "Date";
        Label = "Client Record";
    }

    OUT MIR-UNMTCH-MAIL-IND
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Unmatched mail";
    }

    OUT MIR-UNMTCH-MAIL-IND-2
    {
        Length = "1";
        DBTableName = "TCLI";
        SType = "Indicator";
        Label = "Unmatched mail";
    }

    OUT MIR-UWG-WRKSHT-NUM
    {
        Length = "2";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Worksheet Number";
    }

    OUT MIR-UWG-WRKSHT-NUM-2
    {
        Length = "2";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "Worksheet Number";
    }

    OUT MIR-UW-USER-1-ID
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    OUT MIR-UW-USER-1-ID-2
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    OUT MIR-UW-USER-2-ID
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "2nd Underwriter Initials";
    }

    OUT MIR-UW-USER-2-ID-2
    {
        Length = "8";
        DBTableName = "TCLI";
        SType = "Text";
        Label = "2nd Underwriter Initials";
    }

}

