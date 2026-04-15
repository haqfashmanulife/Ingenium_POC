#*******************************************************************************
#*  Component:   BF9B92-P.p                                                    *
#*  Description: Rider Surrender/Rider FA Reduction Update                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1172  CTS      INITIAL VERSION                                           *
#*  Q13430  CTS     TRAIL CALC CHNAGES FOR APL PROCESS                         *
#*  MP161J  CTS      CHANGES TO ADD WAIVER OF PREMIUM INDICATOR                *
#*  TVI15B  CTS      CHANGES FOR FA REDUCTION FOR TVI POLICIES                 *
#*  M245B2  CTS      Foreign Currency Formatting 			       *
#*  MP228F  CTS      Changes to include special wanrning message indicator     *
#*  MP228F           used only in webservice         	                       *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  MP265H  CTS      CHANGES AS PART OF NOMURA FOR MRF INDICATOR               *
#*  M271O1  CTS      Currency Related Screen Changes                           *
#*  CSCR02  CTS      NOMURA FOREIGN HOLIDAY REMITTANCE DATE                    *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

P-STEP BF9B92-P
{
    ATTRIBUTES
    {
        BusinessFunctionId = "9B92";
        BusinessFunctionName = "Rider Surrender/Rider FA Reduction Update";
        BusinessFunctionType = "Update";
        MirName = "CCWM9B92";
    }

    OUT LSIR-RETURN-CD;

    OUT MIR-RETRN-CD;

    INOUT MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        DBTableName = "Derived";
        SType = "Hidden";
        Label = "Process State";
    }

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        Length = "10";
        DBTableName = "TMAST";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Process Date";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        DBTableName = "Derived";
        SType = "Selection";
        Label = "Pay Out Method";
    }

    INOUT  MIR-NEW-FACE-AMT-T[99]
    {
        Signed;
        Length = "16";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Currency";
        Label = "New Face Amount";
        Index = "1";
    }

#MP161J STARTS
    INOUT  MIR-CVG-WP-IND-T[99]
    {
        Length = "1";
        FieldGroup = "Table99";
        DBTableName = "TCVG";
        SType = "Indicator";
        Label = "Waiver Of Premium";
        Index = "1";
    }
#MP161J ENDS

#MP265H CHANGES START HERE

    INOUT MIR-MRF-IND
    {
        Length = "1";
        SType = "Indicator";
        Label = "MRF Indicator";
    }

#MP265H CHANGES ENDS HERE

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
        CodeType = "FBACC";
        DBTableName = "TCLRL";
        SType = "Selection";
        Label = "Account Type";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DBTableName = "TPOL";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    INOUT MIR-DV-OWN-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Owner Name";
    }

    INOUT MIR-JRNL-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Journal Date";
    }

    INOUT MIR-DV-INSRD-CLI-NM
    {
        Length = "75";
        DBTableName = "Derived";
        SType = "Text";
        Label = "Insured Name";
    }

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "PLAN";
        SType = "Text";
        Label = "Plan Name";
    }

    INOUT MIR-MLJ-ACPT-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Company Received Date";
    }

    INOUT MIR-PAYE-CLI-FRST-NM
    {
        Length = "25";
        DBTableName = "CLNM";
        SType = "Text";
        Label = "Payee's First Name";
    }

    INOUT MIR-PAYE-CLI-LAST-NM
    {
       Length = "25";
       DBTableName = "CLNM";
       SType = "Text";
       Label = "Payee's Last Name";
    }

    INOUT MIR-PAYE-CO-NM
    {
       Length = "50";
       DBTableName = "CLNC";
       SType = "Text";
       Label = "Company Name";
    }

    INOUT MIR-CLI-ADDR-LOC-CD
    {
       Length = "8";
       DBTableName = "CLIA";
       SType = "Text";
       Label = "Address Code";
    }

    INOUT MIR-CLI-PSTL-CD
    {
       Length = "9";
       DBTableName = "CLIA";
       SType = "Text";
       Label = "Postal Code";
    }

    INOUT MIR-CLI-ADDR-ADDL-TXT
    {
       Length = "60";
       DBTableName = "CLIA";
       SType = "Text";
       Label = "Samakata-bu";
    }

    INOUT MIR-DV-CLI-ADDR
    {
       Length = "50";
       DBTableName = "Derived";
       SType = "Text";
       Label = "Kanji Address";
    }

    OUT MIR-BNK-NM
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Name";
    }

    OUT MIR-BNK-BR-NM
    {
      Length = "36";
      DBTableName = "TBNKB";
      SType = "Text";
      Label = "Bank Branch Name";
    }

    OUT MIR-POL-BILL-MODE-CD
    {
      Length = "1";
      CodeSource = "DataModel";
      CodeType = "POL-BILL-MODE-CD";
      SType = "Text";
      Label = "Payment Mode";
    }
    #MP1669- Changes Start here
    
        INOUT MIR-DV-EFF-DT
      {
        Length = "10";
        DBTableName = "Derived";
        SType = "Hidden";
      }
       INOUT MIR-DV-UNDO-VALID-CD
        {
            Length = "1";
            DBTableName = "Derived";
            SType = "Hidden";
        }
    #MP1669- Changes End here  
    #Q13430- Changes Start here  
        INOUT MIR-FARD-EFF-DT
      {
        Length = "10";
        DBTableName = "Derived";
        SType = "Hidden";
      }        
     #Q13430- Changes End here   
 
#TVI15B - Changes
    INOUT  MIR-DV-NET-PAY-AMT
    {
        Signed;
        Length = "16";
        DBTableName = "Derived";
        SType = "Currency";
        Label = "Net Payout Amount";
    }
    INOUT  MIR-TOT-CSV-AMT 
        {
             DisplayOnly;
             Label = "Total CSV";
             Length = "16";
             SType = "Currency";
             DBTableName = "Derived";
             Signed;
    }
#TVI15B - Changes     

#M245B2 CHANGES START HERE   
        INOUT MIR-POL-CRCY-CD
        {
            Length = "2";
            SType = "Hidden";
            Label = "Currency";
     } 
#M245B2 CHANGES END HERE     

#MP228F CHANGES START

    OUT MIR-WARN-MSG-CD
      {
        Length = "01";
        SType = "Text";
	Label = "Warning Message Indicator";        
      }
      
#MP228F CHANGES END

#MP245K CHANGES START HERE  
  INOUT MIR-DV-HO-RECV-DT
  {
    Length = "10";
    SType = "Hidden";
    Label = "Home Office Form Received Date";
  }   
     INOUT MIR-DV-PAYO-JPY-BNFT-CD
       {
         Length = "1";
         SType = "Hidden";
         Label = "JPY BENEFIT RIDER INDICATOR";
      }   
         
#MP245K CHANGES END HERE    
#M271O1 CHANGES START HERE  
         
    INOUT MIR-PREM-CRCY-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Currency";
    }  
#M271O1 CHANGES END HERE 

# CSCR02 CHANGES START HERE
     OUT MIR-REMIT-DT
     { 
         Length = "10";
         DBTableName = "TFBNK";
         SType = "Date";
         Label = "Remittance Date";
     
     }
# CSCR02 CHANGES END HERE
#27549A - CHANGES START HERE    
    INOUT  MIR-ATO-NOT-APPL-IND
    {
         Length = "1";
         SType = "Hidden";
         Label = "ATO not applicable";
    } 
#27549A- CHANGES ENDS HERE
}

