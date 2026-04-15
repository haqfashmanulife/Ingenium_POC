# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:13 PM EDT

#*******************************************************************************
#*  Component:   BF9895-O.s                                                    *
#*  Description: Insured Claim Policy List - Output                            *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#* HAC002  HIN/CL   HEAD AND BRANCH OFFICE CLAIM INQ (HAC002C)                 *
#*                                                                             *
#*******************************************************************************

S-STEP BF9895-O
{
        ATTRIBUTES
        {
            BusinessFunctionType = "List";
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
            SType="Hidden";
        }

        OUT index
        {
            SType = "Hidden";
        }

        IN MIR-CLI-ID 
        {
            Key;
            DisplayOnly;
            Length = "10";
            SType = "Text";
            Label = "Insured Client ID";
        }

        IN MIR-POL-ID 
        {
            DisplayOnly;
            Length = "10";
            SType = "Hidden";
            Label = "Policy ID";
        }

        IN MIR-CLI-NM 
        {
            DisplayOnly;
            Length = "60";
            SType = "Text";
            Label = "Insured Name";
        }

        IN MIR-CLI-BTH-DT 
        {
            DisplayOnly;
            Length = "10";
            SType = "Text";
            Label = "Birth Date";
        }

        IN MIR-CLI-SEX-CD 
        {
            DisplayOnly;
            Length = "40";
            CodeSource = "DataModel";
            CodeType = "CLI-SEX-CD";
            SType = "Text";
            Label = "Sex";
        }

        IN MIR-POL-ID-T[50] 
        {
            DisplayOnly;
            Length = "10";
            FieldGroup = "Table50";
            Index = "1";
            SType = "Text";
            Label = "Policy ID";
        }

        IN MIR-POL-ISS-EFF-DT-T[50] 
        {
            DisplayOnly;
            Length = "10";
            FieldGroup = "Table50";
            Index = "1";
            SType = "Text";
            Label = "Issue Date";
        }

        IN MIR-POL-CSTAT-CD-T[50] 
        {
            DisplayOnly;
            Length = "40";
            FieldGroup = "Table50";
            Index = "1";
            CodeSource = "DataModel";
            CodeType = "POL-CSTAT-CD";
            SType = "Text";
            Label = "Policy Status";
        }
}
