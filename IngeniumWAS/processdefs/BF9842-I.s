# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:11 PM EDT

#*******************************************************************************
#*  Component:   BF9842-I.s                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  PR006Q  FB       CREATED FOR INQUIRY OLD POLICY INFORMATION (MY KEMPO)     *
#*******************************************************************************

S-STEP BF9842-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        FocusField = "MIR-SUB-CAT-CD";
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

    INOUT MIR-SUB-CAT-CD
    {
        Length = "3";
        SType = "Text";
        Label = "Sub Category";
    }
 
    INOUT MIR-ORIG-POL-ID
    {
        Length = "7";
        SType = "Text";
        Label = "Original Policy Number";
    }
 
    INOUT MIR-MY-KEMPO-TYP-CD
    {
        Length = "1";
        DBTableName = "TPOL";
        SType = "Text";
        Label = "My Kempo Type Code";
    }
     
    INOUT MIR-ORIG-POL-ISS-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Original Policy Issue Effective Date";
    }
    
    INOUT MIR-ORIG-POL-DUR
    {
        Length = "2";
        SType = "Text";
        Label = "Original Policy Term";
    }

}

