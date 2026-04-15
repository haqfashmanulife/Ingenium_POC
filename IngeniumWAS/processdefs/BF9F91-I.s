# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:02 PM EDT

#*******************************************************************************
#*  Component:   BF9F91-I.s                                                  *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  CHG#    DATE      AUTH   DESCRIPTION                                       *
#*                                                                             *
#*  MP280X  13NOV15   CTS    PAYOUT POLICY CREATION                            *
#*  UY3100  15MAR24   CTS    JIKKO POLICY CHANGES                              *
#*******************************************************************************

S-STEP BF9F91-I
{
    ATTRIBUTES
    {
        Type = "Input";
        FocusField = "MIR-PLAN-ID";
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

    # the following field is used to provide a filtered
    # selection box to the user, providing them only with
    # products that match their input criteria.

#UY3100 CHANGES STARTS
    INOUT MIR-POL-ID
    {
        Key;
        Length = "10";
        SType = "Text";
        Label = "Policy Id";
    }

    INOUT MIR-SMAL-TYP
    {
        Length = "3";
        SType = "Text";
        Label = "Small Type Code";
    }
#UY3100 CHANGES ENDS

    INOUT MIR-PLAN-ID
    {
        Length = "40";
        Mandatory;
        CodeSource = "EDIT";
	CodeType = "POPOL";
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
        DefaultConstant = "JP";
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
        DefaultConstant = "S1";
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Sub Company";
    }
    
}
