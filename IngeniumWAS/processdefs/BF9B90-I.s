#*******************************************************************************
#*  Component:   BF9B90-I.s                                                    *
#*  Description: Rider Surrender/Rider FA Reduction Retrieve                   *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP1172  CTS      INITIAL VERSION                                           *
#*  Q13430  CTS     TRAIL CALC CHNAGES FOR APL PROCESS                         *
#*  Q11627  CTS     CHANGES FOR UNEARNED PREMIUM GUARD TO BE PLACED AFTER      *
#*                  VIRTUAL UNDO CALL                                          *
#*  MP245K  CTS      CHANGES DONE FOR FA-REDUCTION AND SURRENDER               *
#*  27549A  CTS      CHANGES DONE AS PART OF CDAP PROJECT                      *
#*******************************************************************************

S-STEP BF9B90-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        FocusField = "MIR-POL-ID-BASE";
        FocusFrame = "ContentFrame";
        Type = "Input";
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
        SType="Hidden";
    }

    INOUT MIR-POL-ID-BASE
    {
        DefaultSession = "MIR-POL-ID-BASE";
        Key;
        Label = "Policy Id";
        Length = "9";
        Mandatory;
        SType = "Text";
    }

    INOUT MIR-POL-ID-SFX
    {
        DefaultSession = "MIR-POL-ID-SFX";
        Key;
        Label = "Suffix";
        Length = "1";
        SType = "Text";
    }

    INOUT MIR-APPL-CTL-PRCES-DT
    {
        DefaultSession = "LSIR-PRCES-DT";
        Label = "Processing Date";
        Length = "10";
        Mandatory;
        SType = "Date";
    }

    INOUT MIR-MLJ-ACPT-DT
    {
        DefaultSession = "LSIR-PRCES-DT";
        Label = "Company Received Date";
        Length = "10";
        SType = "Date";
    }

    INOUT MIR-DV-TRNXT-PAYO-MTHD-CD
    {
        CodeSource = "DataModel";
        CodeType = "DV-TRNXT-PAYO-MTHD-CD";
        Label = "Pay Out Method";
        Length = "1";
        SType = "Selection";
    }

    INOUT MIR-JRNL-DT
    {
        DefaultSession = "LSIR-PRCES-DT";
        Label = "Journal Date";
        Length = "10";
        SType = "Date";
    }
#Q13430- Changes Start here

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
#Q13430- Changes End here    
#Q11627- Changes Start here
   INOUT MIR-DV-COMMIT-CD
   {
        Length = "1";
        SType="Hidden";
   }
#Q11627- Changes End here   
#MP245K- Changes Start here
    INOUT MIR-DV-PAYO-JPY-BNFT-CD
      {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "PAYO-JPY-BNFT-CD";
        SType = "Selection";
        Label = "JPY BENEFIT RIDER INDICATOR";
      } 
  INOUT MIR-DV-HO-RECV-DT
  {
    Length = "10";
    DefaultSession = "LSIR-PRCES-DT";
    SType = "Date";
    Label = "Head Office Received Date";
  }    
#MP245K- Changes End here 
#27549A - Changes Start here

    INOUT MIR-ATO-NOT-APPL-IND
     {
       Length = "1";
       SType = "Indicator";
       Label = "ATO not applicable";
  }
#27549A- Changes ends here

}
