# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:03 PM EDT

#*******************************************************************************
#*  Component:   BF8021-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  P00768  CLB      Change several display only fields to SType of Text.      *
#*  PR006C  FB       Add filter for MIR-PLAN-ID select box                     *
#*                                                                             *
#*  MP253N  CTS      CHANGES DONE TO DISPLAY THE COMPLETE PLAN-NAMES OR FILTER *
#*                   PLAN-NAMES AS PART OF ULE-II                              *
#*******************************************************************************

S-STEP BF8021-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Create";
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

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Mandatory;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }
    
#MP253N CHANGES START HERE
    
    IN MIR-PLAN-LIST-CD
    {
       Length = "1";
       SType = "Hidden";
       Label = "Plan List";
    }
#MP253N CHANGES END HERE 
     
    # the following field is used to provide a filtered
    # selection box to the user, providing them only with
    # products that match their input criteria.

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        Mandatory;
        CodeSource = "CSOM9902";
#MP253N CHANGES START HERE        
#       FilterFields = "3";
        FilterFields = "4";
#MP253N CHANGES END HERE        
        FilterField1 = "MIR-POL-ID-BASE";
        FilterField2 = "MIR-POL-ID-SFX";
        FilterField3 = "MIR-CVG-NUM";
#MP253N CHANGES START HERE        
	FilterField4 = "MIR-PLAN-LIST-CD";
#MP253N CHANGES END HERE     
        SType = "Selection";
        Label = "Type of Plan";
    }
}

