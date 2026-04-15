# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9F99Key-I.s                                                 *
#*  Description: CWA REFUND APPROVAL/REJECTION SCREEN                          *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS      Intial version                                            *
#*******************************************************************************

S-STEP BF9F99Key-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
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
        CodeSubType = "RFND";
        SType = "Selection";
        Label = "Operation Category code";
    }
      
}

