# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:23 PM EDT

#*******************************************************************************
#*  Component:   BF9F99Pol-I.s                                                 *
#*  Description: CWA REFUND APPROVAL/REJECTION LISTSCREEN                      *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  CA0002  CTS      Intial version                                            *
#*******************************************************************************

S-STEP BF9F99Pol-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Output";
        DelEmptyRows;
        FocusField = "MIR-REJ-RQST-DT";
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

    INOUT MIR-REJ-RQST-DT
    {
        Key;
        Length = "10";
        SType = "Date";
        Label = "Rejection Request Date";
    }

    INOUT MIR-POL-CHNL-CD
    {       
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CHNL-CD";
        SType = "Selection";
        Label = "Channel";
    }
           
    INOUT MIR-OPER-CAT-CD
    {
        Key;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "OPER-CAT-CD";
        SType = "Selection";
        Label = "Operation Category code";
    }
      
    INOUT MIR-SRCH-RSLT-CNT
    {
        Key;
        Length = "3";
        SType = "Number";
        Label = "Search result count";
    }
    
    IN MIR-SEQ-NUM-T[10]
    {
        Length = "3";
        SType = "Hidden";
        Label = "SEQ NUM";
    }
    
    IN MIR-APPL-ID-T[10] 
    {
       DisplayOnly;
       FieldGroup = "Table10";
       Index = "1";
       Label = "Application Number";
       Length = "15";
       SType = "Text";
    }

    IN MIR-POL-ID-T[10] 
    {
      DisplayOnly;
      Length = "10";
      FieldGroup = "Table10";
      Index = "1";
      SType = "Text";
      Label = "Policy Number";
    }

    IN MIR-CLI-OWN-GIV-NM-T[10]
    {
        DisplayOnly;
        Length = "25";
        FieldGroup = "Table10";
        SType = "Text";
        Label = "Owner Name";
        Index = "1";
    }

    IN MIR-POL-CWA-SUSP-AMT-T[10]
    {
        DisplayOnly;
        Length = "19";
        FieldGroup = "Table10";
        SType = "Decimal";
        Index = "1";
        Label = "Cash refund suspense amount";
    }

    IN MIR-POL-CRCY-CD-T[10]
    {
        DisplayOnly;
        Length = "2";
        DBTableName = "TPOL";
        SType = "Text";
        Index = "1";
        Label = "Currency ";
    }

    IN MIR-RFND-COMNT-IND-T[10]
    {
        DisplayOnly;
        Length = "1";
        SType = "Indicator";
        Index = "1";
        Label = "Comment Y/N";
    }

    IN MIR-RFND-STAT-CD-T[10]
    {
        DisplayOnly;
        Length = "3";
        CodeSource = "DataModel";
        CodeType = "RFND-STAT-CD";
        SType = "Text";
        Label = "Status";
        Index = "1";
    }
    IN MIR-DV-PRCES-STATE-CD
    {
        Length = "1";
        SType = "Hidden";
        Label = "MIR-DV-PRCES-STATE-CD";
    }
    INOUT MIR-RECORD-CTR
    {
        Length = "3";
        SType = "Hidden";
        Label = "Rec Count";
    }                
}

