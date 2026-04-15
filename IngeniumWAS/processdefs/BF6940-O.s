# Converted from PathFinder 2.2 to 3.0 Jun 18, 2004 3:13:00 PM EDT

#*******************************************************************************
#*  Component:   BF6940-O.s                                                    *
#*  Description:                                                               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  014590  6.0      New for release 6.0                                       *
#*  017150  612J     Remove Currency Decimals = "2"                            *
#*  01AD05  BMB      Remove JP-ADDR-CD                                         *
#*  B00189  DPK      Removed Owner's Relationship to Insured                   *
#*  B00222  BMB      Fix label for Samakata-bu                                 *
#*                   removed MIR-CLI-ADDR-ADDL-TXT-2,                          *
#*                           MIR-CLI-ADDR-CHNG-DT-2,                           *
#*                           MIR-CLI-ADDR-STAT-CD-2                            *
#*  B10590  YUC      DISPLAY KANJI NAME   09AUG02  Add KANJI field             *
#*  TDMG24  CTS      INQUIRY SCREEN CHANGES                                    * 
#*******************************************************************************

S-STEP BF6940-O
{
    ATTRIBUTES
    {
        BusinessFunctionType = "Relpol";
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

    IN MIR-APPL-CTL-PRCES-DT
    {
        DisplayOnly;
        Length = "10";
        DefaultSession = "LSIR-PRCES-DT";
        SType = "Date";
        Label = "Date";
    }

    IN MIR-POL-ID-BASE
    {
        Key;
        DisplayOnly;
        Length = "9";
        DefaultSession = "MIR-POL-ID-BASE";
        SType = "Text";
        Label = "Policy Id";
    }

    IN MIR-POL-ID-SFX
    {
        Key;
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Suffix";
    }

    IN MIR-CLI-ADDR-CHNG-DT
    {
        DisplayOnly;
        Length = "10";
        SType = "Date";
        Label = "Address Changed Date";
    }

    IN MIR-CLI-ADDR-LN-1-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-ADDR-LN-1-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-ADDR-LN-2-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-ADDR-LN-2-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-ADDR-LN-3-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-ADDR-LN-3-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-DV-CLI-ADDR-LN-4-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-DV-CLI-ADDR-LN-4-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-DV-CLI-ADDR-LN-5-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-DV-CLI-ADDR-LN-5-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-CLI-ADDR-STAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "CLI-ADDR-STAT-CD";
        SType = "Text";
        Label = "Address Status";
    }

    IN MIR-CLI-ADDR-TYP-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "ADTYP";
        SType = "Text";
        Label = "Address Type";
    }

    IN MIR-CLI-ID-T[12]
    {
        DisplayOnly;
        Length = "10";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Client Number";
        Index = "1";
    }

    IN MIR-DV-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Mailing Name";
    }

    IN MIR-DV-CLI-NM-2
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Mailing Name";
    }

    IN MIR-DV-CLI-NM-2-T[12]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Name";
        Index = "1";
    }

    IN MIR-DV-CLI-NM-T[12]
    {
        DisplayOnly;
        Length = "75";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Name";
        Index = "1";
    }

    IN MIR-DV-OWN-CLI-NM
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-DV-OWN-CLI-NM-KJ
    {
        DisplayOnly;
        Length = "75";
        SType = "Text";
        Label = "Owner Name";
    }

    IN MIR-POL-CLI-REL-SUB-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        CodeSource = "DataModel";
        CodeType = "POL-CLI-REL-SUB-CD";
        SType = "Text";
        Label = "Policy / Client Relationship Type (2)";
        Index = "1";
    }

    IN MIR-POL-CLI-REL-TYP-CD-T[12]
    {
        DisplayOnly;
        Length = "40";
        FieldGroup = "Table12";
        SType = "Text";
        Label = "Policy / Client Relationship Type";
        Index = "1";
    }

    IN MIR-POL-CSTAT-CD
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "DataModel";
        CodeType = "POL-CSTAT-CD";
        SType = "Text";
        Label = "Policy Status";
    }
    
    #TDMG24 CHANGES START HERE
            IN MIR-PREM-PMT-CMPLT-IND
            {
                DisplayOnly;
                Length = "1";
                SType = "Indicator";
                Label = "Base Policy Premium Payment Completion";
        
            }    
    #TDMG24 CHANGES END HERE    


    IN MIR-POL-INS-PURP-CD
    {
        DisplayOnly;
        Length = "1";
        SType = "Text";
        Label = "Purpose of Insurance";
    }

    IN MIR-SBSDRY-CO-ID
    {
        DisplayOnly;
        Length = "40";
        CodeSource = "EDIT";
        CodeType = "SUBCO";
        SType = "Text";
        Label = "Sub Company";
    }


    # added for LOC006

    IN MIR-CLI-ADDR-CNTCT-TXT
    {
        DisplayOnly;
        Length = "50";
        SType = "Text";
        Label = "Phone Number";
    }


    #added for LOC014 

    IN MIR-DV-CLI-ADDR-LN-6-TXT
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }

    IN MIR-DV-CLI-ADDR-LN-6-TXT-2
    {
        DisplayOnly;
        Length = "35";
        SType = "Text";
        Label = "Address";
    }
     
    #fixed B00222

    IN MIR-CLI-ADDR-ADDL-TXT
    {
        DisplayOnly;
        Length = "72";
        SType = "Text";
        Label = "Samakata-bu";
    }

}

