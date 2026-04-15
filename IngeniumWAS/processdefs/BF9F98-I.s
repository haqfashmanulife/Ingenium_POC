# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:32 PM EDT

#*******************************************************************************
#*  Component:   BF9F98-I.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  CA0002  CTS      CWA REFUND/REJECTION REQUEST INQUIRY SCREEN               *
#*                                                                             *
#*******************************************************************************

S-STEP BF9F98-I
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Retrieve";
        Type = "Input";
        FocusField = "MIR-POL-APP-FORM-ID";
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
    
    INOUT MIR-POL-APP-FORM-ID
    {
        Length = "15";
        SType = "Text";
        Label = "Application Number";
    }

    INOUT MIR-OWN-FRST-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Owner First Name";
    }
    
    INOUT MIR-OWN-SUR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Owner Last Name";
    }
    
    INOUT MIR-OWN-CO-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Owner Company Name";
    }
    
    INOUT MIR-INSRD-FRST-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Insured First Name";
    }
    
    INOUT MIR-INSRD-SUR-NM
    {
        Length = "50";
        SType = "Text";
        Label = "Insured Last Name";
    }
    
    INOUT MIR-SERV-AGT-ID
    {
        Length = "6";
        SType = "Text";
        Label = "Servicing Agent Id";
    }
    
    
    INOUT MIR-SRCH-PERI-STRT-DT
    {
        Length = "10";
        SType = "Text";
        Label = "Search Period";
    }
    
    INOUT MIR-SRCH-PERI-END-DT
    {
        Length = "10";
        SType = "Text";
        Label = "Search Period";
    }
    
    INOUT MIR-RFND-USER-ID
    {
        Length = "8";
        SType = "Text";
        Label = "Refund User Id";
    } 
}