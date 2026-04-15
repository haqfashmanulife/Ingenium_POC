
#*******************************************************************************
#*  Component:   BF9405-O.s                                                    *
#*  Description: Bulk Application Inquiry Screen                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP176B  CTS      Intial Version                                            *
#*  M176B1  CTS      ADDED THREE NEW FILEDS                                    *                                                                            *
#*******************************************************************************

S-STEP BF9405-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
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

    IN MIR-POL-BULK-APP-ID
    {
        Key;
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Bulk Application ID";
    }
         IN MIR-POL-ID
        {
            Length = "10";
            DBTableName = "TPOL";
            SType = "Text";
            Label = "Policy ID";
    }

    IN MIR-POL-APP-FORM-ID-T[50]
    {
        DisplayOnly;
        Length = "15";
        SType = "Text";
        Label = "Application Form ID";
    }

    IN MIR-POL-ID-T[50]
      {
        DisplayOnly;
        Length = "10";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-DV-INSRD-CLI-NM-T[50]
      {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Insured Name";
    }

    IN MIR-POL-CSTAT-CD-T[50]
    {
        DisplayOnly;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "POL-STAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
#M176B1 CHANGES STARTS HERE
    
    IN MIR-LIAB-STRT-DT-T[50]
    {
       DisplayOnly;
       Length = "10";
       SType = "Date";
       Label = "Liability Commencement date";
    }

    IN MIR-POL-ISS-PRCES-DT-T[50]
    {
       DisplayOnly;
       Length = "10";
       SType = "Date";
       Label = "Policy Issue Processing Date";
    }
    
    IN MIR-POL-ISS-EFF-DT-T[50] 
    {
       DisplayOnly;
       Length = "10";
       SType = "Date";
       Label = "Policy Issue Effective Date";
    }
#M176B1 CHANGES ENDS HERE

}