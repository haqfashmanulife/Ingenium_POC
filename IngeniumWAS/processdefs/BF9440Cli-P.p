# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:14:00 PM EDT

#*******************************************************************************
#*  Component:   BF9440Cli-P.p                                                 *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP4FB1  H.L      NEW RELEASE FOR FIRM BANKING          12AUG2004           *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT     22JAN2010           *    
#*  M271AA  CTS      FRA CHANGES FOR POST LAPSE SURRENDER  01SEP2015           *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP  PROJECT                                                                           *
#*******************************************************************************

P-STEP BF9440Cli-P
{

 ATTRIBUTES
 {
  BusinessFunctionId = "9440";
  BusinessFunctionName = "Post Lapse Surrender";
  BusinessFunctionType = "TPlaps";
  MirName = "CCWM9440";
 }


  

 OUT LSIR-RETURN-CD;

 OUT MIR-RETRN-CD;

 INOUT MIR-APPL-CTL-PRCES-DT
 {
  Mandatory;
  Length = "10";
  DBTableName = "TMAST";
  DefaultSession = "LSIR-PRCES-DT";
  SType = "Date";
  Label = "Process Date";
 }

 IN MIR-DV-PRCES-STATE-CD
 {
  Length = "1";
  DBTableName = "Derived";
  SType = "Hidden";
  Label = "Process State";
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

 OUT MIR-POST-LAPS-SURR-AMT
 {
  Signed;
  Length = "17";
  DBTableName = "TPOL";
  SType = "Currency";
  Label = "Post Lapse Surrender Amount";
 }

 OUT MIR-DV-OWN-CLI-NM
 {
  Length = "75";
  DBTableName = "Derived";
  SType = "Text";
  Label = "Owner Name";
 }

#  P00891 YC      06JUN2003  Add 8 lines for Adding Journal Date
    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

#  MP4FB1 H.L  ADD BELOW FIELDS FOR FIRM BANKING
#              AND ALL KEY FIELDS ARE CHANGES TO DISPLAY-ONLY
 
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
#  M271AA Changes Start here        
    INOUT MIR-DV-HO-RECV-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Head Office Received Date";
    }
  INOUT MIR-DV-PAYO-JPY-BNFT-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "PAYO-JPY-BNFT-CD";
    SType = "Selection";
    Label = "JPY BENEFIT RIDER INDICATOR";
  }  
#  M271AA Changes End here
#27549A - Changes Start here 
   INOUT MIR-ATO-NOT-APPL-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "ATO not applicable";
    }    
#27549A- Changes ends here
}
