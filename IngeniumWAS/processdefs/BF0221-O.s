# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF0221-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  BU3283  CTS      COMMENTED THE FIELD MIR-CLI-JP-ADDR-CD                    *
#*******************************************************************************

S-STEP BF0221-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Claim";
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

    IN MIR-ACCT-BASE-ID-T[7]
    {
        DisplayOnly;
        Length = "6";
        FieldGroup = "Table7";
        KeyColumn;
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    IN MIR-ACCT-CRCY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DefaultSession = "MIR-USER-SESN-CRCY-CD";
        SType = "Text";
        Label = "Currency";
    }

    IN MIR-ACCT-CRNT-LOC-CD-T[7]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table7";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        SType = "Text";
        Label = "Current Location";
        Index = "1";
    }

    IN MIR-ACCT-ISS-LOC-CD-T[7]
    {
        DisplayOnly;
        Length = "2";
        FieldGroup = "Table7";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        SType = "Text";
        Label = "Issue Location";
        Index = "1";
    }

    IN MIR-BR-OR-DEPT-ID-T[7]
    {
        DisplayOnly;
        Length = "5";
        FieldGroup = "Table7";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Text";
        Label = "Branch / Departments";
        Index = "1";
    }

    IN MIR-CHQ-PAYE-NM-T[2]
    {
        DisplayOnly;
        Length = "50";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Payee's Name";
        Index = "1";
    }


    #LOC014 increased length 20 to 30

    IN MIR-CLI-ADDR-LN-1-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-ADDR-LN-2-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-ADDR-LN-3-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-CITY-NM-TXT
    {
        DisplayOnly;
        Length = "30";
        SType = "Text";
        Label = "City";
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

    IN MIR-CLI-CTRY-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Text";
        Label = "Country";
    }

    IN MIR-CLI-PSTL-CD
    {
        DisplayOnly;
        Length = "9";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    IN MIR-CLI-RES-NUM
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Apt/Unit #";
    }

    IN MIR-CLI-RES-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Text";
        Label = "Residence Type";
    }

    IN MIR-DV-ACCT-CR-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Credit";
        Index = "1";
    }

    IN MIR-DV-ACCT-DESC-TXT-T[7]
    {
        DisplayOnly;
        Length = "20";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Accounting Entry Description";
        Index = "1";
    }

    IN MIR-DV-ACCT-DR-AMT-T[7]
    {
        DisplayOnly;
        Signed;
        Length = "13";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Debit";
        Index = "1";
    }

    IN MIR-DV-CHQ-DESC-TXT-T[4]
    {
        DisplayOnly;
        Length = "120";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Cheque Description";
        Index = "1";
    }

    IN MIR-DV-CHQ-MANL-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Accounting entry was a manual cheque";
    }

    IN MIR-DV-CHQ-VCHR-NUM
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Voucher Number";
    }

    IN MIR-SBSDRY-CO-ID-T[7]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table7";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-CHQ-REF-ID
    {
        Key;
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy Number";
    }

    IN MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Text";
        Label = "Pay Out Method";
    }

    IN MIR-BNK-ID
    {
        DisplayOnly;
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    IN MIR-BNK-BR-ID
    {
        DisplayOnly;
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    IN MIR-BNK-ACCT-ID
    {
        DisplayOnly;
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    IN MIR-BNK-ACCT-HLDR-NM
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    IN MIR-BNK-ACCT-TYP-CD
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Text";
        Label = "Account Type";
    }


    #added for LOC014

    IN MIR-CLI-ADDR-ADDL-TXT
    {
        DisplayOnly;
        Length = "60";
        SType = "Text";
        Label = "Additional Information";
    }

    #BU3283 CHANGES BEGIN   
    #IN MIR-CLI-JP-ADDR-CD
    #{
    #   DisplayOnly;
    #   Length = "11";
    #   SType = "Text";
    #   Label = "JP Address Code";
    #}
    #BU3283 CHANGES END

}

