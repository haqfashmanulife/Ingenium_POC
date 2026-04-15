#*******************************************************************************
#*  Component:   BF9B60HO-O.s                                                  *
#*  Description: COVERAGE LIST BY INSURED FOR HO SCREEN                        *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  EN6928  03SEP09  COVERAGE LIST BY INSURED FOR HO SCREEN                    *
#*******************************************************************************

S-STEP BF9B60HO-O
{
        ATTRIBUTES
        {
                BusinessFunctionType = "List";
                DelEmptyRows;
                FocusField = "OKButton";
                FocusFrame = "ButtonFrame";
                Type = "Output";
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

        IN MIR-POL-ID-BASE 
        {
                DefaultSession = "MIR-POL-ID-BASE";
                DisplayOnly;
                FieldGroup = "Table99";
                Key;
                Label = "Policy ID";
                Length = "9";
                SType = "Text";
        }

        IN MIR-DV-POL-ID
        {
                DisplayOnly;
                Label = "Type-Policy Number";
                Length = "13";
                SType = "Text";
        }

        IN MIR-DV-CLI-NM
        {
                DisplayOnly;
                Label = "Insured Name";
                Length = "60";
                SType = "Text";
        }

        IN MIR-CVG-NUM-T[99]
        {
                DisplayOnly;
                FieldGroup = "Table99";
                Index = "1";
                Label = "Coverage Number";
                Length = "2";
                SType = "Text";              
        }

        IN MIR-PLAN-ID-T[99]
        {
                Length = "60";
                FieldGroup = "Table99";
                DBTableName = "TCVG";
                SType = "Text";
                Label = "Rider Name";
                Index = "1";
        }

        IN MIR-CVG-FACE-AMT-T[99]
        {
                DisplayOnly;
                Length = "17";
                FieldGroup = "Table99";
                DBTableName = "TCVG";
                SType = "Number";
                Signed;
                Label = "Face Amount/Daily Benefit Amount";
                Index = "1";
        }

        IN MIR-CVG-ISS-EFF-DT-T[99]
        {
                DisplayOnly;
                FieldGroup = "Table99";
                Label = "Rider Addition Date";
                Length = "10";
                SType = "Date";
                Index = "1";
        }

        IN MIR-CVG-STBL-1-CD-T[99]
        {
                DisplayOnly;
                FieldGroup = "Table99";
                CodeSource = "EDIT";
                CodeType = "STB1";
                Label = "Insurance Period";
                Length = "02";
                SType = "Text";
                Index = "1";
        }

        IN MIR-CVG-MPREM-AMT-T[99]
        {
                DisplayOnly;
                Length = "13";
                FieldGroup = "Table99";
                DBTableName = "TCVG";
                SType = "Number";
                Signed;
                Label = "Rider Premium";
                Index = "1";
        }
        
        IN MIR-DV-FOOTER-TXT
        {
                DisplayOnly;
                Label = "Date Time";
                Length = "35";
                SType = "Text";
        }


}
