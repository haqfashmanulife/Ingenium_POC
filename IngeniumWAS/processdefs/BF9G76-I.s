# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF9G76-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  UYSD11  CTS      INITIAL VERSION OF UNISYS POLICY INQUIRY SCREEN           *
#*  UYDM28  CTS      UNISYS POLICY INQUIRY SCREEN CHANGES FOR STREAM3          *
#*******************************************************************************

S-STEP BF9G76-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "List";
        Type = "Input";
        FocusField = "MIR-POL-ID";
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


    INOUT MIR-POL-ID
    {
        Key;
        Mandatory;
        Length = "10";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }
#UYDM28 Changes Start
    #INOUT MIR-SMAL-TYP
    #{
    #    Length = "3";
    #    SType = "Text";
    #    Label = "Small Type Code";
    #}

    INOUT MIR-POL-IDENT-CD
    {
      Key;
      Mandatory;
      Length = "1";
      CodeSource = "DataModel";
      CodeType = "POL-IDENT-TYP-CD";
      SType = "Selection";
      Label = "Policy Identification Code";
    }
#UYDM28 Changes End
}


