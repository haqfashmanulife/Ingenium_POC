#*******************************************************************************
#*  Component:   BF9D44-O.s                                                    *
#*  Description: TRAD DEPOSIT HISTORY MODIFICATION LIST SCREEN                 *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*                                                                             *
#*  MP251B  CTS     TRAD DEPOSIT HISTORY MODIFICATION LIST SCREEN              *
#*******************************************************************************

S-STEP BF9D44-O
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
                Key;
                Label = "Policy Id";
                Length = "9";
                SType = "Text";

        }
        
        IN MIR-POL-ID-SFX 
        {
                DefaultSession = "MIR-POL-ID-SFX";
                DisplayOnly;
                Key;
                Label = "Suffix";
                Length = "1";
                SType = "Text";

        }
        
        IN MIR-TRAD-SO-JRNL-DT 
        {
                DisplayOnly;
                Label = "Trad SO Journal Date";
                Length = "10";

         }
        
        IN MIR-SEQ-NUM 
        {
                DisplayOnly;
                Label = "Sequence Number";
                Length = "3";

        }        
        
        IN MIR-APPL-CTL-PRCES-DT 
        {
                DefaultSession = "LSIR-PRCES-DT";
                DisplayOnly;
                Key;
                Label = "Process Date";
                Length = "10";
                SType = "Date";
 
        }
        
        IN MIR-DV-OWN-CLI-NM 
        {
                DisplayOnly;
                Label = "Owner Name";
                Length = "75";
                SType = "Text";
        }
        
        IN MIR-PLAN-ID 
        {
                CodeSource = "EDIT";
                CodeType = "PLAN";
                DisplayOnly;
                Label = "Plan ID";
                Length = "40";
                SType = "Text";
        }
        
        IN MIR-POL-ISS-EFF-DT 
        {
                DisplayOnly;
                Label = "Issue Date of the Policy";
                Length = "10";
                SType = "Date";
         }
        
        IN MIR-POL-PD-TO-MO-NUM 
        {
                DisplayOnly;
                Label = "Policy Paid to Month";
                Length = "7";
                SType = "Text";
         }
        
        IN MIR-POL-PD-TO-DT-NUM 
        {
                DisplayOnly;
                Label = "Policy Paid to Date";
                Length = "10";
                SType = "Text";
        }
        
        IN MIR-POL-PD-DURATION-NUM 
        {
                DisplayOnly;
                Label = "Policy Paid Duration";
                Length = "7";
                SType = "Text";
   
        }
        
        IN MIR-TRAD-PD-TO-MO-NUM 
        {
                DisplayOnly;
                Label = "Trad Paid to Month";
                Length = "7";
                SType = "Text";
        }
        
        IN MIR-TRAD-PD-TO-DT-NUM 
        {
                DisplayOnly;
                Label = "Trad Paid to Date";
                Length = "10";
                SType = "Text";
       
        }
        
        IN MIR-TRAD-PD-DURATION-NUM 
        {
                DisplayOnly;
                Label = "Trad Paid Duration";
                Length = "6";
                SType = "Text";
     
        }
        
        IN MIR-COLCT-MTHD-CD-T[50] 
        {
                CodeSource = "DataModel";
                CodeType = "COLCT-MTHD-CD";
                DisplayOnly;
                FieldGroup = "Table50";
                Index = "1";
                Label = "Collection Method";
                Length = "3";
                SType = "Text";
        }
        
        IN MIR-COLCT-CATG-CD-T[50] 
        {
                CodeSource = "DataModel";
                CodeType = "COLCT-CATG-CD";
                DisplayOnly;
                FieldGroup = "Table50";
                Index = "1";
                Label = "Collection Category";
                Length = "3";
                SType = "Text";
        }
        
        IN MIR-TRAD-JRNL-DT-T[50] 
        {
                DisplayOnly;
                FieldGroup = "Table50";
                Index = "1";
                Label = "Trad Journal Date";
                Length = "10";
                SType = "Text";
        }
                
        IN MIR-TRAD-SO-JRNL-DT-T[50] 
        {
        #        DisplayOnly;
                FieldGroup = "Table50";
                Index = "1";
                Label = "Trad SO Journal Date";
                Length = "10";
                SType = "Text";
         }
                
        IN MIR-TRAD-RECV-DT-T[50] 
        {
                DisplayOnly;
                FieldGroup = "Table50";
                Index = "1";
                Label = "Trad Received Date";
                Length = "10";
                SType = "Text";
        }
                
        IN MIR-PREM-DUE-MO-NUM-T[50] 
        {
                DisplayOnly;
                FieldGroup = "Table50";
                Index = "1";
                Label = "Premium Due Month";
                Length = "7";
                SType = "Text";
        }
                
        IN MIR-DPOS-RFND-QTY-T[50] 
        {
                DisplayOnly;
                FieldGroup = "Table50";
                Index = "1";
                Label = "Number of Deposits/ Refunds";
                Length = "3";
                SType = "Text";
         }
                
        IN MIR-TRXN-AMT-T[50] 
        {
                DisplayOnly;
                CurrencyCode="MIR-PMT-CRCY-CD";
                FieldGroup = "Table50";
                Index = "1";
                Label = "Transaction Amount";
                Length = "15";
                SType = "Currency";
                Signed;
        }
        
        IN MIR-TRXN-PRCES-DT-T[50] 
        {
                DisplayOnly;
                FieldGroup = "Table50";
                Index = "1";
                Label = "Transaction Process Date";
                Length = "10";
                SType = "Text";
         }
                
        IN MIR-SEQ-NUM-T[50] 
        {
        #        DisplayOnly;
                FieldGroup = "Table50";
                Index = "1";
                Label = "Sequence Number";
                Length = "3";
                SType = "Text";
         }
         
         IN MIR-PMT-CRCY-CD
         {
                Length = "2"; 
                SType = "Hidden";
                 Label = "Currency";
         }

                
}
