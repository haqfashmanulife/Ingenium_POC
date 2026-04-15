# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

#*******************************************************************************
#*  Component:   BF9840-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PR006Q  FB       CREATED FOR INQUIRY OLD POLICY INFORMATION (MY KEMPO)     *
#*******************************************************************************

S-STEP BF9840-O
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

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy ID";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        DefaultSession = "MIR-POL-ID-SFX";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-SUB-CAT-CD
    {
        DisplayOnly;
        Length = "3";
        SType = "Text";
        Label = "Sub Category";
    }
 
    IN MIR-ORIG-POL-ID
    {
        DisplayOnly;
        Length = "7";
        SType = "Text";
        Label = "Original Policy Number";
    }
 
    IN MIR-MY-KEMPO-TYP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "My Kempo Type Code";
    }
 
    IN MIR-ORIG-POL-ISS-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Original Policy Issue Effective Date";
    }
    
    IN MIR-ORIG-POL-DUR
    {
        DisplayOnly;
        Length = "2";
        SType = "Text";
        Label = "Original Policy Term";
    }
}

