# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF8001NB-I.s                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  1CNB02  DEL      ADD  MIR-POL-CNVR-TYP-CD                                  *
#*  PR006C  FB       Add filter for MIR-PLAN-ID select box                     *            
#*******************************************************************************

S-STEP BF8001NB-I
{
    ATTRIBUTES
    {
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

    INOUT MIR-POL-APPL-CTL-CD
    {
        Length = "2";
        SType = "Hidden";
        Label = "Application System Code";
    }

    INOUT MIR-POL-ID-BASE
    {
        Key;
        Length = "9";
        SType = "Text";
        Label = "Policy ID";
    }

    INOUT MIR-POL-ID-SFX
    {
        Key;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    # the following field is used to provide a filtered
    # selection box to the user, providing them only with
    # products that match their input criteria.

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        Mandatory;
        CodeSource = "CSOM9901";
        SType = "Selection";
        Label = "Plan ID";
    }
     
    INOUT MIR-POL-APP-SIGN-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Application Signed Date";
    }

    INOUT MIR-POL-ISS-LOC-CD
    {
        Mandatory;
        Length = "40";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-USER-SESN-CTRY-CD";
        SType = "Selection";
        Label = "Issue Location";
    }

    INOUT MIR-SBSDRY-CO-ID
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }
    
    INOUT MIR-POL-CNVR-TYP-CD
    {
        Key;
        Mandatory;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        SType = "Selection";
        Label = "Conversion Policy Type Code";
    }    

}

