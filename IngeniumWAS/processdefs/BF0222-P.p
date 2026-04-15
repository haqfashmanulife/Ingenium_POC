# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:18 PM EDT

#*******************************************************************************
#*  Component:   BF0222-P.p                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  B00499  VAN      Change BF name to Firm Banking Disbursements              *     
#*  U11151  CLB      Add DefaultSession to MIR-JRNL-DT; Add Mandatory to       *
#*                   MIR-JRNL-DT and OPER-CAT-CD to match html input page.     *
#*                                                                             *
#*  Chg#    Date     Auth.  Description                                        *
#*  BU3283  26NOV08  CTS    CHANGED THE SType = "Selection" TO SType = "Text"  *
#*                          FOR THE FIELD MIR-DV-TRNXT-PAYO-MTHD-CD and        *
#*                          COMMENTED THE FIELD MIR-CLI-JP-ADDR-CD             *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*******************************************************************************

P-STEP BF0222-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0222";
        BusinessFunctionName = "Firm Banking Disbursements";
        BusinessFunctionType = "Disb";
        MirName = "CCWM0174";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-ACCT-BASE-ID-T[7]
    {
        Length = "6";
        FieldGroup = "Table7";
        KeyColumn;
        DBTableName = "TAC";
        SType = "Text";
        Label = "Account Number";
        Index = "1";
    }

    INOUT MIR-ACCT-CRCY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CURR";
        DBTableName = "TAC";
        DefaultSession = "MIR-USER-SESN-CRCY-CD";
        SType = "Selection";
        Label = "Currency";
    }

    INOUT MIR-OPER-CAT-CD
    {
        Mandatory;
        Length = "20";
        CodeSource = "EDIT";
        CodeType = "OPNC";
        SType = "Selection";
        Label = "Operation Category";
    }

    INOUT MIR-ACCT-CRNT-LOC-CD-T[7]
    {
        Length = "2";
        FieldGroup = "Table7";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TAC";
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
        DBTableName = "TAC";
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
        DBTableName = "TAC";
        SType = "Selection";
        Label = "Branch / Departments";
        Index = "1";
    }

    INOUT MIR-JRNL-DT
    {
        Mandatory;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
     }

    INOUT MIR-CHQ-PAYE-NM-T[2]
    {
        MixedCase;
        Length = "50";
        FieldGroup = "Table2";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Payee's Name";
        Index = "1";
    }

    INOUT MIR-CLI-ADDR-LN-1-TXT
    {
        MixedCase;
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    INOUT MIR-CLI-ADDR-LN-2-TXT
    {
        MixedCase;
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    INOUT MIR-CLI-ADDR-LN-3-TXT
    {
        MixedCase;
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Address";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
        MixedCase;
        Length = "60";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Additional Information";
    }

    #BU3283 CHANGES BEGIN   
    #INOUT MIR-CLI-JP-ADDR-CD
    #{
    #    MixedCase;
    #    Length = "11";
    #    DBTableName = "TCLIA";
    #    SType = "Text";
    #    Label = "Address Code";
    #}
    #BU3283 CHANGES END

    INOUT MIR-CLI-CITY-NM-TXT
    {
        MixedCase;
        Length = "30";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "City";
    }

    INOUT MIR-CLI-CRNT-LOC-CD
    {
        Length = "2";
        CodeSource = "CTLC";
        CodeType = "CLOC";
        DBTableName = "TCLIA";
        SType = "Selection";
        Label = "Province/State";
    }

    INOUT MIR-CLI-CTRY-CD
    {
        Length = "2";
        CodeSource = "XTAB";
        CodeType = "CNTRY";
        DBTableName = "TCLIA";
        DefaultSession = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Country";
    }

    INOUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Postal/Zip Code";
    }

    INOUT MIR-CLI-RES-NUM
    {
        Length = "5";
        DBTableName = "TCLIA";
        SType = "Text";
        Label = "Apt/Unit #";
    }

    INOUT MIR-CLI-RES-TYP-CD
    {
        Length = "1";
        CodeSource = "EDIT";
        CodeType = "RESD";
        DBTableName = "TCLIA";
        SType = "Selection";
        Label = "Residence Type";
    }

    INOUT MIR-DV-ACCT-CR-AMT-T[7]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table7";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Credit";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-DESC-TXT-T[7]
    {
        MixedCase;
        Length = "20";
        FieldGroup = "Table7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Accounting Entry Description";
        Index = "1";
    }

    INOUT MIR-DV-ACCT-DR-AMT-T[7]
    {
        Signed;
        Length = "13";
        FieldGroup = "Table7";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Debit";
        Index = "1";
    }

    INOUT MIR-DV-CHQ-DESC-TXT-T[4]
    {
        MixedCase;
        Length = "120";
        FieldGroup = "Table4";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Cheque Description";
        Index = "1";
    }

    INOUT MIR-DV-CHQ-MANL-IND
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Indicator";
        Label = "Accounting entry was a manual cheque";
    }

    INOUT MIR-DV-CHQ-VCHR-NUM
    {
        Length = "7";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Voucher Number";
    }

    INOUT MIR-SBSDRY-CO-ID-T[7]
    {
        Length = "40";
        FieldGroup = "Table7";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        DBTableName = "TSCOM";
        SType = "Selection";
        Label = "Sub Company";
        Index = "1";
    }

    IN MIR-CHQ-REF-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCHQI";
        SType = "Text";
        Label = "Policy Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        DBTableName = "Derived";
#BU3283 CHANGES START
#       SType = "Selection";
        SType = "Text";
#BU3283 CHANGES END        
        Label = "Pay Out Method";
    }

    INOUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Bank ID";
    }

    INOUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKB";
        SType = "Text";
        Label = "Branch ID";
    }

    INOUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Account Number";
    }

    INOUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name";
    }

    INOUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Selection";
        Label = "Account Type";
    }
#M245B2 CHANGES START HERE    
    INOUT MIR-PMT-CRCY-CD-T[7]
    {
       Length = "5";
       CodeSource = "EDIT";
       CodeType = "CRCY";
       SType = "Selection";
       Label = "Currency";
    } 
#M245B2 CHANGES END  HERE
}

