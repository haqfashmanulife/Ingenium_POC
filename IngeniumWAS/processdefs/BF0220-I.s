# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:17 PM EDT

#*******************************************************************************
#*  Component:   BF0220-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  PF20    PF 2.0   DisplayOnly flds with DefaultSession must be IN not INOUT *
#*  BU3283  CTS      COMMENTED THE FIELD MIR-CLI-JP-ADDR-CD                    *
#*******************************************************************************

S-STEP BF0220-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Agent";
        Type = "Input";
        FocusField = "MIR-CHQ-REF-ID";
        FocusFrame = "ContentFrame";
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

    INOUT MIR-ACCT-BASE-ID-T[7]
    {
        Length = "6";
        FieldGroup = "Table7";
        KeyColumn;
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

#   PF20 - change for Pathfinder Release 2.0
#   INOUT MIR-ACCT-CRCY-CD
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

    INOUT MIR-ACCT-CRNT-LOC-CD-T[7]
    {
        Length = "2";
        FieldGroup = "Table7";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        SType = "Selection";
        Label = "Current Location";
        Index = "1";
    }

    INOUT MIR-ACCT-ISS-LOC-CD-T[7]
    {
        Length = "2";
        FieldGroup = "Table7";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        SType = "Selection";
        Label = "Issue Location";
        Index = "1";
    }

    INOUT MIR-BR-OR-DEPT-ID-T[7]
    {
        Length = "5";
        FieldGroup = "Table7";
        CodeSource = "XTAB";
        CodeType = "BRCH";
        SType = "Selection";
        Label = "Branch / Departments";
        Index = "1";
    }

    INOUT MIR-CHQ-PAYE-NM-T[2]
    {
        Length = "50";
        FieldGroup = "Table2";
        SType = "Text";
        Label = "Payee's Name";
        Index = "1";
    }


    #LOC014 increased length 25 to 30

    INOUT MIR-CLI-ADDR-LN-1-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "Address";
    }

    INOUT MIR-CLI-ADDR-LN-2-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "Address";
    }

    INOUT MIR-CLI-ADDR-LN-3-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "Address";
    }

    INOUT MIR-CLI-CITY-NM-TXT
    {
        Length = "30";
        SType = "Text";
        Label = "City";
    }

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        FilterFields = "1";
        FilterField1 = "MIR-CLI-CTRY-CD";
        SType = "Selection";
        Label = "Province/State";
    }

    INOUT MIR-CLI-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    INOUT MIR-CLI-RES-NUM
    {
        Length = "5";
        SType = "Text";
        Label = "Apt/Unit #";
    }

    INOUT MIR-CLI-RES-TYP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RESD";
        SType = "Selection";
        Label = "Residence Type";
    }

    INOUT MIR-DV-ACCT-CR-AMT-T[7]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Credit";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-DESC-TXT-T[7]
    {
        Length = "20";
        FieldGroup = "Table7";
        SType = "Text";
        Label = "Accounting Entry Description";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-DR-AMT-T[7]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table7";
        SType = "Currency";
        Label = "Debit";
        Index = "1";
    }

    INOUT MIR-DV-CHQ-DESC-TXT-T[4]
    {
        Length = "120";
        FieldGroup = "Table4";
        SType = "Text";
        Label = "Cheque Description";
        Index = "1";
    }

    INOUT MIR-DV-CHQ-MANL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "Accounting entry was a manual cheque";
    }

    INOUT MIR-DV-CHQ-VCHR-NUM
    {
        Length = "7";
        SType = "Text";
        Label = "Voucher Number";
    }

    INOUT MIR-SBSDRY-CO-ID-T[7]
    {
        Length = "40";
        FieldGroup = "Table7";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    INOUT MIR-CHQ-REF-ID
    {
        Key;
        Mandatory;
        Length = "10";
        SType = "Text";
        Label = "Agent Number";
    }

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "process code";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        SType = "Selection";
        Label = "Pay Out Method";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        SType = "Selection";
        Label = "Account Type";
    }


    #added for LOC014

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
        Length = "60";
        SType = "Text";
        Label = "Additional Information";
    }

    #BU3283 CHANGES BEGIN   
    #INOUT MIR-CLI-JP-ADDR-CD
    #{
    #   Length = "11";
    #   SType = "Text";
    #   Label = "JP Address Code";
    #}
    #BU3283 CHANGES END

}

