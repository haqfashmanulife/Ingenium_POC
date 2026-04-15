# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:44 PM EDT

#*******************************************************************************
#*  Component:   BF1460-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01GL02  EKM      Added new code source table to limit Payout Method        *
#*  02PR62  DPK      Joint to Single Change                                    *
#*  P00891  YC       Add Journal Date with no limitation   05JUN2003           *
#*  HCL106  HIN/CL   SUPPRESS SURRENDER               (HCL106B)                *
#*                   Add  MIR-DV-SURR-SUB-STAT-CD                              *
#*  B11067  HIN/LJ   Remove MIR-DV-SURR-SUB-STAT-CD                            *
#*  MP4FB1  H.L      Change existing fields to IN and display only             *
#*                   Change existing fields to Text SType                      *
#*                   Add HO-FORM-ACPT-DT and some other new fields, including: *
#*                   Kanji name and Address information                        *
#*  U40012  BP       Add Bank Name and Branch Name                             *
#*  U40013  H.L      Change kanji addr and postal code to display only         *
#*  ISLADM  CTS      CHANGES FOR INSURANCE LAW PROJECT                         *
#*  Q13367  CTS      CHANGES FOR VIRTUAL UNDO PROCESS                          *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  MP265H  CTS      ADDED MRF INDICATOR AS PART OF NOMURA                     *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

S-STEP BF1460-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Tsurr";
        Type = "Input";
        FocusField = "MIR-POL-ID-BASE";
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

   
    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
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
        CodeType = "FBACC";
        SType = "Selection";
        Label = "Account Type";
    }

    IN MIR-DV-SURR-TAX-CD
    {
        DisplayOnly;
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "DV-SURR-TAX-CD";
        SType = "Text";
        Label = "Tax Reporting Override";
    }

    IN MIR-DV-TAX-OVRID-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Tax Override";
    }

    IN MIR-SUPRES-CNFRM-IND
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Suppress confirmation statement";
    }

    IN MIR-CVG-NUM
    {
        DisplayOnly;
        Length = "2";
        DefaultConstant = "00";
        SType = "Text";
        Label = "Coverage Number";
    }

    IN MIR-DV-PRCES-STATE-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Hidden";
        Label = "Process State";
    }

    IN MIR-POL-ID-BASE
    {
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
     
    IN MIR-DV-SURR-REASN-CD
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-SURR-REASN-CD";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Reason for Surrender";
    }

#  P00891 YC      06JUN2003  Add 8 lines for Adding Journal Date
    IN MIR-JRNL-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

#  MP4FB1 H.L     21JUL2004 ADD BELOW FIELDS TO SUPPORT FIRM BANKING

#  ISLADM Changes Start here        
#    IN MIR-HO-FORM-ACPT-DT
#    {
#        DisplayOnly;
#        Length = "10";
#        DefaultSession = "LSIR-PRCES-DT";
#        SType = "Date";
#        Label = "Home Office Form Acceptance Date";
#    }
#
    IN MIR-CO-RECV-DT
    {
        DisplayOnly;    
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
    }
#  ISLADM Changes End here 

    INOUT MIR-PAYE-CLI-FRST-NM 
    {
        Length = "25";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-CLI-LAST-NM 
    {
       Length = "25";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    INOUT MIR-PAYE-CO-NM 
    {
       Length = "50";
       SType = "Text";
       Label = "Company Name";
    }

    INOUT MIR-CLI-ADDR-LOC-CD 
    {
       Length = "8";
       SType = "Text";
       Label = "Address Code";
    }
     
    IN MIR-CLI-PSTL-CD 
    {
       DisplayOnly;
       Length = "9";
       SType = "Text";
       Label = "Postal Code";
    }


    IN MIR-DV-CLI-ADDR 
    {
       DisplayOnly;
       Length = "50";
       SType = "Text";
       Label = "Kanji Address";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Length = "60";
       SType = "Text";
       Label = "Samakata-bu";
    }

#MP265H CHANGES START HERE

    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }


#MP265H CHANGES ENDS HERE

    IN MIR-BNK-NM 
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Name";
    }

    IN MIR-BNK-BR-NM
    {
      DisplayOnly;
      Length = "36";
      SType = "Text";
      Label = "Bank Branch Name";
    }

#   ISLADM - Changes start here     
    IN MIR-SURR-FORM-ACPT-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Surrender Request Form Acceptance Date";
    }
    
    IN MIR-ASIGN-SURR-EFF-DT
    { 
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Assigned Surrender Effective Date for Policy with Assignee";
    }
    
    IN MIR-POL-STEP-IN-RIGHT-IND
    { 
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Label = "Policy with Step-In Right";
    }    
#   ISLADM - Changes end here
#   Q13367 - CHANGES STARTS HERE
    INOUT MIR-SUR-TYP-IND
    {
          Length = "1";
          SType="Hidden";
    }
    INOUT MIR-DV-UNDO-VALID-CD
    {
          Length = "1";
          SType="Hidden";
    }
    INOUT MIR-DV-COMMIT-CD
    {
          Length = "1";
          SType="Hidden";
    }
#   Q13367 - CHANGES ENDS HERE
#  MP245K Changes Start here        
    IN MIR-DV-HO-RECV-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Head Office Received Date";
    }
  IN MIR-DV-PAYO-JPY-BNFT-CD
  {
    Length = "1";
    CodeSource = "DataModel";
    CodeType = "PAYO-JPY-BNFT-CD";
    SType = "Text";
    Label = "JPY BENEFIT RIDER INDICATOR";
  }  
#  MP245K Changes ends here 

#27549A - CHANGES START HERE
 IN MIR-ATO-NOT-APPL-IND
  {
    DisplayOnly;
    Length = "1";
    SType = "Indicator";
    Label = "ATO not applicable";
  }
#27549A- CHANGES ENDS HERE
}

