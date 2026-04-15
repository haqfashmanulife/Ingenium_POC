# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:47 PM EDT

#*******************************************************************************
#*  Component:   BF1631-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*                                                                             *
#*******************************************************************************

S-STEP BF1631-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Consoldte";
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

    IN MIR-ADDR-STAT-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Address Status Changed Date";
    }

    IN MIR-ADDR-STAT-CHNG-DT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Address Status Changed Date";
    }

    IN MIR-AGT-ID
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    IN MIR-AGT-ID-2
    {
        DisplayOnly;
        Length = "6";
        SType = "Text";
        Label = "Agent ID";
    }

    IN MIR-BEST-TIME-CALL-TXT
    {
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Best Time to Call";
    }

    IN MIR-BEST-TIME-CALL-TXT-2
    {
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Best Time to Call";
    }

    IN MIR-CLI-ADDR-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Address Changed Date";
    }

    IN MIR-CLI-ADDR-CHNG-DT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Address Changed Date";
    }

    IN MIR-CLI-ADDR-LN-1-TXT
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-ADDR-LN-1-TXT-2
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-ADDR-LN-2-TXT
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "MIR-CLI-ADDR-LN-2-TXT";
    }

    IN MIR-CLI-ADDR-LN-2-TXT-2
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "MIR-CLI-ADDR-LN-2-TXT-2";
    }

    IN MIR-CLI-ADDR-LN-3-TXT
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "MIR-CLI-ADDR-LN-3-TXT";
    }

    IN MIR-CLI-ADDR-LN-3-TXT-2
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "MIR-CLI-ADDR-LN-3-TXT-2";
    }

    IN MIR-CLI-ADDR-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
    }

    IN MIR-CLI-ADDR-STAT-CD-2
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
    }

    IN MIR-CLI-ADDR-YR-DUR
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Years at Address";
    }

    IN MIR-CLI-ADDR-YR-DUR-2
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Years at Address";
    }

    IN MIR-CLI-AGE-PROOF-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Proof of age submitted";
    }

    IN MIR-CLI-AGE-PROOF-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Proof of age submitted";
    }

    IN MIR-CLI-BTH-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

    IN MIR-CLI-BTH-DT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Birth Date";
    }

    IN MIR-CLI-BTH-LOC-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        SType = "Text";
        Label = "Birth Location";
    }

    IN MIR-CLI-BTH-LOC-CD-2
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "BTLOC";
        SType = "Text";
        Label = "Birth Location";
    }

    IN MIR-CLI-CHRTY-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Owner has been identified as a charity";
    }

    IN MIR-CLI-CHRTY-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Owner has been identified as a charity";
    }

    IN MIR-CLI-CITY-NM-TXT
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "City";
    }

    IN MIR-CLI-CITY-NM-TXT-2
    {
        DisplayOnly;
        Length = "25";
        SType = "Text";
        Label = "City";
    }

    IN MIR-CLI-CLAS-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLCD";
        SType = "Text";
        Label = "Classification";
    }

    IN MIR-CLI-CLAS-CD-2
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CLCD";
        SType = "Text";
        Label = "Classification";
    }

    IN MIR-CLI-CMPLT-CCAS-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Clear case processing attempted";
    }

    IN MIR-CLI-CMPLT-CCAS-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Clear case processing attempted";
    }

    IN MIR-CLI-CNFD-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    IN MIR-CLI-CNFD-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Access to client information is confidential";
    }

    IN MIR-CLI-COMNT-TXT
    {
        DisplayOnly;
        Length = "237";
        SType = "Text";
        Label = "Additional Comments";
    }

    IN MIR-CLI-COMNT-TXT-2
    {
        DisplayOnly;
        Length = "237";
        SType = "Text";
        Label = "Additional Comments";
    }

    IN MIR-CLI-CR-CARD-NUM
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Chargecard Account Number";
    }

    IN MIR-CLI-CR-CARD-NUM-2
    {
        DisplayOnly;
        Length = "20";
        SType = "Text";
        Label = "Chargecard Account Number";
    }

    IN MIR-CLI-CR-CARD-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CHGTP";
        SType = "Text";
        Label = "Chargecard Type";
    }

    IN MIR-CLI-CR-CARD-TYP-CD-2
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "CHGTP";
        SType = "Text";
        Label = "Chargecard Type";
    }

    IN MIR-CLI-CRNT-LOC-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        SType = "Text";
        Label = "Province/State";
    }

    IN MIR-CLI-CRNT-LOC-CD-2
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        SType = "Text";
        Label = "Province/State";
    }

    IN MIR-CLI-CTRY-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
    }

    IN MIR-CLI-CTRY-CD-2
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        SType = "Text";
        Label = "Country";
    }

    IN MIR-CLI-EMPLR-LOC-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        SType = "Text";
        Label = "Province/State";
    }

    IN MIR-CLI-EMPLR-LOC-CD-2
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        SType = "Text";
        Label = "Province/State";
    }

    IN MIR-CLI-EMPLR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Current Employer Name";
    }

    IN MIR-CLI-EMPLR-NM-2
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Current Employer Name";
    }

    IN MIR-CLI-EMPL-YR-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Years with Employer";
    }

    IN MIR-CLI-EMPL-YR-DUR-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Years with Employer";
    }

    IN MIR-CLI-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number A";
    }

    IN MIR-CLI-ID-2
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Client Number B";
    }

    IN MIR-CLI-INCM-EARN-CD
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "INCCD";
        SType = "Text";
        Label = "Income Class";
    }

    IN MIR-CLI-INCM-EARN-CD-2
    {
        DisplayOnly;
        Length = "5";
        CodeSource = "EDIT";
        CodeType = "INCCD";
        SType = "Text";
        Label = "Income Class";
    }

    IN MIR-CLI-LANG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Correspondence Language";
    }

    IN MIR-CLI-LANG-CD-2
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "LANG";
        SType = "Text";
        Label = "Correspondence Language";
    }

    IN MIR-CLI-LEGIT-DUP-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Legitimate duplicate - Do not consolidate";
    }

    IN MIR-CLI-LEGIT-DUP-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Legitimate duplicate - Do not consolidate";
    }

    IN MIR-CLI-MAIL-TITL-TXT
    {
        DisplayOnly;
        Length = "15";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        SType = "Text";
        Label = "Title";
    }

    IN MIR-CLI-MAIL-TITL-TXT-2
    {
        DisplayOnly;
        Length = "15";
        CodeSource = "EDIT";
        CodeType = "TITLE";
        SType = "Text";
        Label = "Title";
    }

    IN MIR-CLI-MARIT-STAT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "MARST";
        SType = "Text";
        Label = "Marital Status";
    }

    IN MIR-CLI-MARIT-STAT-CD-2
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "MARST";
        SType = "Text";
        Label = "Marital Status";
    }

    IN MIR-CLI-MIB-IND-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "MIB Indicator";
    }

    IN MIR-CLI-MIB-IND-CD-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "MIB Indicator";
    }

    IN MIR-CLI-MID-INIT-NM
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Initial";
    }

    IN MIR-CLI-MID-INIT-NM-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Initial";
    }

    IN MIR-CLI-NM-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Name Change Date";
    }

    IN MIR-CLI-NM-CHNG-DT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Name Change Date";
    }

    IN MIR-CLI-OCCP-CLAS-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Text";
        Label = "Occupation Class";
    }

    IN MIR-CLI-OCCP-CLAS-CD-2
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "OCCCL";
        SType = "Text";
        Label = "Occupation Class";
    }

    IN MIR-CLI-PREV-DCLN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Declined Date";
    }

    IN MIR-CLI-PREV-DCLN-DT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Declined Date";
    }

    IN MIR-CLI-PREV-DCLN-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Client previously declined by company";
    }

    IN MIR-CLI-PREV-DCLN-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Client previously declined by company";
    }

    IN MIR-CLI-PREV-EMPLR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Previous Employer Name";
    }

    IN MIR-CLI-PREV-EMPLR-NM-2
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Previous Employer Name";
    }

    IN MIR-CLI-PRST-RT
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Persistency Rate";
    }

    IN MIR-CLI-PRST-RT-2
    {
        DisplayOnly;
        Length = "3";
        Decimals = "0";
        SType = "Percent";
        Label = "Persistency Rate";
    }

    IN MIR-CLI-PSTL-CD
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    IN MIR-CLI-PSTL-CD-2
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    IN MIR-CLI-SELF-EMPL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Self-employed";
    }

    IN MIR-CLI-SELF-EMPL-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Self-employed";
    }

    IN MIR-CLI-SEX-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CLI-SEX-CD-2
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SEX-CD";
        SType = "Text";
        Label = "Sex";
    }

    IN MIR-CLI-SFX-NM
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CLI-SFX-NM-2
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "SUFFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CLI-SMKR-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        SType = "Text";
        Label = "Smoker";
    }

    IN MIR-CLI-SMKR-CD-2
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-SMKR-CD";
        SType = "Text";
        Label = "Smoker";
    }

    IN MIR-CLI-STMT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Statement Date";
    }

    IN MIR-CLI-STMT-DT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Statement Date";
    }

    IN MIR-CLI-TAX-ID
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    IN MIR-CLI-TAX-ID-2
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Tax Identification Number";
    }

    IN MIR-CLI-TXEMP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-TXEMP-CD";
        SType = "Text";
        Label = "Tax Exempt";
    }

    IN MIR-CLI-TXEMP-CD-2
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-TXEMP-CD";
        SType = "Text";
        Label = "Tax Exempt";
    }

    IN MIR-CLI-UIC-QUALF-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "UIC Qualified";
    }

    IN MIR-CLI-UIC-QUALF-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "UIC Qualified";
    }

    IN MIR-CLI-UWGDECN-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        SType = "Text";
        Label = "Underwriting Decision";
    }

    IN MIR-CLI-UWGDECN-CD-2
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "CLI-UWGDECN-CD";
        SType = "Text";
        Label = "Underwriting Decision";
    }

    IN MIR-CLI-UWGDECN-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "UW Decision Changed Date";
    }

    IN MIR-CLI-UWGDECN-DT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "UW Decision Changed Date";
    }

    IN MIR-CLI-UWGDECN-TYP-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Text";
        Label = "Decision Type";
    }

    IN MIR-CLI-UWGDECN-TYP-CD-2
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "EDIT";
        CodeType = "CLDEC";
        SType = "Text";
        Label = "Decision Type";
    }

    IN MIR-CLI-WRK-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-CD";
        SType = "Text";
        Label = "Worked/Period";
    }

    IN MIR-CLI-WRK-CD-2
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-CD";
        SType = "Text";
        Label = "Worked/Period";
    }

    IN MIR-CLI-WRK-DUR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-DUR-CD";
        SType = "Text";
        Label = "Worked/Period";
    }

    IN MIR-CLI-WRK-DUR-CD-2
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CLI-WRK-DUR-CD";
        SType = "Text";
        Label = "Worked/Period";
    }

    IN MIR-CLI-WRK-PT-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Part-time";
    }

    IN MIR-CLI-WRK-PT-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Part-time";
    }

    IN MIR-CLI-WRK-QTY
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Hours Worked";
    }

    IN MIR-CLI-WRK-QTY-2
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Hours Worked";
    }

    IN MIR-DV-APP-INFO-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Application Information";
    }

    IN MIR-DV-APP-INFO-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Application Information";
    }

    IN MIR-DV-BNK-ACCT-QTY
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Number of Bank Accounts";
    }

    IN MIR-DV-BNK-ACCT-QTY-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Number of Bank Accounts";
    }

    IN MIR-DV-BTH-JP-DT-DY-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Birth Day in Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-DY-TXT-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Birth Day in Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-EMPRR-NM
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Emperor Name";
    }

    IN MIR-DV-BTH-JP-DT-EMPRR-NM-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Emperor Name";
    }

    IN MIR-DV-BTH-JP-DT-MO-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Birth Month in Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-MO-TXT-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Birth Month in Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-YR-TXT
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Birth Year in Emperor Format";
    }

    IN MIR-DV-BTH-JP-DT-YR-TXT-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Birth Year in Emperor Format";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-DV-CLI-NM-2
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Client Name";
    }

    IN MIR-DV-CLI-PREV-NM-1
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Previous Name";
    }

    IN MIR-DV-CLI-PREV-NM-1-2
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Previous Name";
    }

    IN MIR-DV-CLI-PREV-NM-2
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Previous Name";
    }

    IN MIR-DV-CLI-PREV-NM-2-2
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Previous Name";
    }

    IN MIR-DV-CLI-PREV-NM-3
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Previous Name";
    }

    IN MIR-DV-CLI-PREV-NM-3-2
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Previous Name";
    }

    IN MIR-DV-CNTCT-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Contact Information";
    }

    IN MIR-DV-CNTCT-QTY-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Contact Information";
    }

    IN MIR-DV-INCM-QTY
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Income Information";
    }

    IN MIR-DV-INCM-QTY-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Income Information";
    }

    IN MIR-DV-OTHR-ADDR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Other Mailing Address";
    }

    IN MIR-DV-OTHR-ADDR-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Other Mailing Address";
    }

    IN MIR-DV-PREV-ADDR-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Previous Address";
    }

    IN MIR-DV-PREV-ADDR-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Previous Address";
    }

    IN MIR-OCCP-ID
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Text";
        Label = "Occupation";
    }

    IN MIR-OCCP-ID-2
    {
        DisplayOnly;
        Length = "10";
        CodeSource = "EDIT";
        CodeType = "OCCCD";
        SType = "Text";
        Label = "Occupation";
    }

    IN MIR-PREV-EMPL-YR-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Years with Employer";
    }

    IN MIR-PREV-EMPL-YR-DUR-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Number of Years with Employer";
    }

    IN MIR-PREV-UPDT-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Record";
    }

    IN MIR-PREV-UPDT-DT-2
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Client Record";
    }

    IN MIR-SELCT-ADDL-ADDR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-ADDL-ADDR-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-ADDL-FILE-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-ADDL-FILE-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-BEST-TIME-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-BEST-TIME-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-BNK-ACCT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-BNK-ACCT-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-BTH-LOC-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "BTH-LOC-AGE-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-BTH-SEX-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-BTH-SEX-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-CLI-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-CLI-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-CLI-NM-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-CLI-NM-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-CNTCT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-CNTCT-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-COMNT-TXT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-COMNT-TXT-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-CR-CARD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-CR-CARD-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-EMPLMNT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-EMPLMNT-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-INCM-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-INCM-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-LANG-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-LANG-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-MKT-INFO-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-MKT-INFO-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-PREV-NM-1-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-PREV-NM-1-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-PREV-NM-2-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-PREV-NM-2-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-PREV-NM-3-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-PREV-NM-3-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-PRIM-ADDR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-PRIM-ADDR-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-SERV-AGT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-SERV-AGT-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-SMKR-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-SMKR-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-STMT-DT-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-STMT-DT-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-TAX-INFO-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-TAX-INFO-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-SELCT-UWG-INFO-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "SELCT-UWG-INFO-CD";
        SType = "Text";
        Label = "Select A / B";
    }

    IN MIR-UNMTCH-MAIL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Unmatched mail";
    }

    IN MIR-UNMTCH-MAIL-IND-2
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Unmatched mail";
    }

    IN MIR-UWG-WRKSHT-NUM
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Worksheet Number";
    }

    IN MIR-UWG-WRKSHT-NUM-2
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Worksheet Number";
    }

    IN MIR-UW-USER-1-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    IN MIR-UW-USER-1-ID-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "1st Underwriter Initials";
    }

    IN MIR-UW-USER-2-ID
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "2nd Underwriter Initials";
    }

    IN MIR-UW-USER-2-ID-2
    {
        DisplayOnly;
        Length = "8";
        SType = "Text";
        Label = "2nd Underwriter Initials";
    }

}

