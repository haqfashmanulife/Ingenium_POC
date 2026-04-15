# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:01 PM EDT

#*******************************************************************************
#*  Component:   BF9851-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  MP270I  29JUN17  CHANGES FOR EPOS MGA                                      *
#*******************************************************************************

S-STEP BF9G50-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Inquiry";
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
        DefaultSession = "MIR-POL-ID-BASE";        
        Length = "09";
        SType = "Text";
        Label = "Policy ID";
    } 
    
    INOUT MIR-POL-ID-SFX
    {
        Length = "01";
        SType = "Text";
        Label = "Suffix";
    }     
    
    INOUT MIR-INSRD-STCKR-ID
    {
        Length = "11";
        SType = "Text";
        Label = "Insured Sticker Number";
    } 
    
    INOUT MIR-CLI-ID
    {    
        Length = "10";
        SType = "Text";
        Label = "Client ID";
    } 
 
}

