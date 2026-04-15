# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:29 PM EDT

#*******************************************************************************
#*  Component:   BF9F50-I.s                                                    *
#*  Description: For Updating a Underwriter summary screnn                     *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP310A   CTS      INITIAL VERSION - NB IMPROVEMENTS                        *
#*******************************************************************************
S-STEP BF9F50-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        FocusField = "MIR-CLI-ID";
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

    INOUT MIR-POL-ID
    {
        DefaultSession = "MIR-POL-ID-BASE";
        Label = "Policy ID";
        Length = "10";
        SType = "Text";
    }
    INOUT MIR-CLI-ID 
    {
        DefaultSession = "MIR-CLI-ID";
        Key;
        Mandatory;
        Label = "Client Id";
        Length = "10";
        SType = "Text";
    }

}
