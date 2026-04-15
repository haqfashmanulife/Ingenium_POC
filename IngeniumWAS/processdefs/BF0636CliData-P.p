# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:24 PM EDT

#*******************************************************************************
#*  Component:   BF0636CliData-P.p                                             *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP4FB1  H.L Aug 05, 2004  New release to support firm banking              *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *
#*  M142F2  CTS      ADDED FIELDS FOR SURVIVOR BENIFIT                         *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

P-STEP BF0636CliData-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "0636";
        BusinessFunctionName = "Annuity Partial Surrender Amount";
        BusinessFunctionType = "Psramt";
        MirName = "CCWM0761";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-CF-SURR-CHRG-AMT
    {
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Surrender Charge";
    }

    IN MIR-CVG-NUM
    {
        Key;
        Mandatory;
        Length = "2";
        DBTableName = "TCVG";
        DefaultConstant = "01";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-CF-CLI-TRXN-AMT
    {
        Key;
        Signed;
        Length = "15";
        DBTableName = "TCFLW";
        SType = "Currency";
        Label = "Gross Amount";
    }

    IN MIR-DV-CF-EFF-DT
    {
        Key;
        Mandatory;
        Length = "10";
        DBTableName = "TCFLW";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Effective Date";
    }

    IN MIR-DV-CF-REASN-CD
    {
        Key;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CF-REASN-CD";
        DBTableName = "TCFLW";
        SType = "Selection";
        Label = "Transaction Reason";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "process code";
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

    INOUT MIR-DV-CF-REP-DT
    {
    # DisplayOnly;
      Length = "10";
      DefaultSession = "LSIR-PRCES-DT";
      SType = "Date";
      Label = "Journal Date";
    }

#   M142F2 - Changes end here
    IN MIR-DV-WTHDR-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-WTHDR-TYP-CD";
        SType = "Text";
        Label = "Withdrawal Reason";
    }
    
    IN MIR-DV-SRVBEN-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-SRVBEN-TYP-CD";
        SType = "Text";
        Label = "Type of Survivorship Benefit Requested";
    }
#   M142F2 - Changes end here  

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Pay Out Method";
    }
     
#  ISLADM Changes Start here        
#    INOUT MIR-HO-FORM-ACPT-DT
#    {
#        Length = "10";
#        DefaultSession = "LSIR-PRCES-DT";
#        SType = "Date";
#        Label = "Home Office Form Acceptance Date";
#    }
#
    INOUT MIR-CO-RECV-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
    }
#  ISLADM Changes End here    
      
    OUT MIR-PAYE-CLI-FRST-NM
    {
        Length = "25";
        DBTableName = "CLNM";
        SType = "Text";
        Label = "Payee's First Name";
    }
     
    OUT MIR-PAYE-CLI-LAST-NM
    {
        Length = "25";
        DBTableName = "CLNM";
        SType = "Text";
        Label = "Payee's Last Name";
    }
     
    OUT MIR-PAYE-CO-NM     
    {
        Length = "50";
        DBTableName = "CLNC";
        SType = "Text";
        Label = "Company Name";
    }
     
    OUT MIR-CLI-ADDR-LOC-CD
    {
        Length = "8";
        DBTableName = "CLIA";
        SType = "Text";
        Label = "Address Code";
    }
     
    OUT MIR-CLI-PSTL-CD
    {
        Length = "9";
        DBTableName = "CLIA";
        SType = "Text";
        Label = "Postal Code";
    }
     
    OUT MIR-CLI-ADDR-ADDL-TXT
    {
        Length = "60";
        DBTableName = "CLIA";
        SType = "Text";
        Label = "Samakata-bu";
    }
     
    OUT MIR-DV-CLI-ADDR
    {
        Length = "50";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Kanji Address";
    }
     
    OUT MIR-BNK-ID
    {
        Length = "4";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank ID";
    }

    OUT MIR-BNK-BR-ID
    {
        Length = "5";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Branch ID";
    }

    OUT MIR-BNK-ACCT-ID
    {
        Length = "17";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Bank Account Number";
    }

    OUT MIR-BNK-ACCT-HLDR-NM
    {
        Length = "50";
        DBTableName = "TBNKA";
        SType = "Text";
        Label = "Account Holder Name";
    }

    OUT MIR-BNK-ACCT-TYP-CD
    {
        Length = "3";
        CodeSource = "EDIT";
        CodeType = "ACTYP";
        DBTableName = "TBNKA";
        SType = "Selection";
        Label = "Account Type";
    }

#27549A - Changes Start here
    
     IN MIR-ATO-NOT-APPL-IND
     {
       Length = "1";
       SType = "Indicator";
       Label = "ATO not applicable";
     }
#27549A- Changes ends here  


}
