# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:12:11 PM EDT

#*******************************************************************************
#*  Component:   AppApplicationDataFTJULU.s                                    *
#*  Description: Cloned from AppApplicationDataFTJUL.s                         *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  B00386  WBP      New for App Update Flow                                   *
#*  02PR62  DPK      Joint to Single Change                                    *
#*  1CNB02  EKM      Added MIR-POL-CNVR-TYP-CD, MIR-POL-CNVR-KEY-NUM           *
#*                   and MIR-POL-FINAL-DISP-DT                                 *
#*  PR006D  WBP      ADD MIR-PROD-APP-TYP-CD                                   *
#*  PR006O  AC       MOVE MIR-AGT-UWG-FAIL-IND TO HERE                         *
#*  PR006Q  FB       ADD MIR-MY-KEMPO-TYP-CD                                   *
#*  NWLUWW  CTS      Remove MIR-APP-FORM-TYP-ID from the filter selection      *
#*                   program CSOM4900                                          *
#*                                                                             *
#*******************************************************************************

S-STEP AppApplicationDataFTJULU
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Update";
        Type = "Input";
        DelEmptyRows;
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

    IN BannerBar;

    IN BannerBarSize;

    IN BannerProductID
    {
        CodeSource = "EDIT";
        CodeType = "PLAN";
    }

    IN BannerPolicyID;

    IN BannerPrimaryInsured;

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
        Mandatory;
        Length = "15";
        SType = "Text";
        Label = "Application Number";
    }

    INOUT MIR-POL-APP-RECV-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Received Date";
    }

    INOUT MIR-POL-ISS-EFF-DT
    {
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Proposed Effective Date";
    }
  
   INOUT MIR-SBSDRY-CO-ID
    {
        Length = "2";
        Mandatory;
        DefaultConstant = "S1";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Selection";
        Label = "Company";
    }

    INOUT MIR-APP-FORM-TYP-ID
    {
        Length = "1";
        Mandatory;
        DefaultConstant = "L";
        CodeSource = "EDIT";
        CodeType = "AFTT";
        SType = "Selection";
        Label = "Application Form Type";
    }
     
    INOUT MIR-POL-ISS-LOC-CD
    {
        Length = "2";
        Mandatory;
        DefaultConstant = "41";
        CodeSource = "CTLC";
        CodeType = "ILOC";
        FilterFields = "1";
        FilterField1 = "MIR-POL-CTRY-CD";
        SType = "Selection";
        Label = "Issue Location";
    }
 
    # the following field is used to provide a filtered
    # selection box to the user, providing them only with
    # products that match their input criteria.

    INOUT MIR-PLAN-ID
    {
        Length = "50";
        Mandatory;
        CodeSource = "CSOM4900";
    # NWLUWW Changes begin
    #    FilterFields = "4";
    #    FilterField1 = "MIR-APP-FORM-TYP-ID";
    #    FilterField2 = "MIR-SBSDRY-CO-ID";
    #    FilterField3 = "MIR-POL-ISS-LOC-CD";
    #    FilterField4 = "MIR-POL-APP-RECV-DT";
        FilterFields = "3";
        FilterField1 = "MIR-SBSDRY-CO-ID";
        FilterField2 = "MIR-POL-ISS-LOC-CD";
        FilterField3 = "MIR-POL-APP-RECV-DT";
    # NWLUWW Changes end
        SType = "Selection";
        Label = "Product";
    }
     
    INOUT MIR-POL-APP-CALC-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Illustration Calculation Date";
    }

         
    INOUT MIR-POL-APP-REASN-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-APP-REASN-CD";
        SType = "Selection";
        Label = "Reason for Application";
    }

    INOUT MIR-POL-CNVR-TYP-CD
    {
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CNVR-TYP-CD";
        SType = "Selection";
        Label = "Conversion Policy Type Code";
    }    

    INOUT MIR-PROD-APP-TYP-CD
    {
        Length = "2";
        CodeSource = "DataModel";
        CodeType = "POL-PROD-APP-TYP";
        SType = "Selection";
        Label = "Product Application Type Code";
    }    

    INOUT MIR-AGT-UWG-FAIL-IND
    {
        Mandatory;
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "CNTRCT-REL-TYP";
        SType = "Selection";
        Label = "Contract Relationship Type";
    }
      
    INOUT MIR-POL-CNVR-KEY-NUM
    {
        Length = "10";
        SType = "Text";
        Label = "Conversion Key Number";
    }

    INOUT MIR-POL-FINAL-DISP-DT
    {
        Length = "10";
        SType = "Date";
        Label = "Conversion Expiry / Final Disposition Date";
    }

    INOUT MIR-MY-KEMPO-TYP-CD
    {
        Length = "1";
        CodeSource = "DataModel";
        CodeType = "MY-KEMPO-TYP-CD";
        SType = "Selection";
        Label = "My Kempo Type Code";
    }

}

