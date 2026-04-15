#*******************************************************************************
#*  Component:   BF9D42-I.s                                                    *
#*  Description: TRAD DEPOSIT HISTORY MODIFICATION UPDATE SCREEN               *
#*                                                                             *
#*******************************************************************************
#*  Chg#    Release  Description                                               *
#*  MP251B  CTS     TRAD DEPOSIT HISTORY MODIFICATION UPDATE SCREEN            *
#*  Q50806  25JUN14 CHANGES FOR PREMIUM DUE MONTH                              *
#*******************************************************************************

S-STEP BF9D42-I
{
        ATTRIBUTES
        {
        Type = "Input";
        FocusField = "MIR-COLCT-MTHD-CD";
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
               SType="Hidden";
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
          
          IN MIR-APPL-CTL-PRCES-DT 
          {
                DefaultSession = "LSIR-PRCES-DT";
                DisplayOnly;
                Key;
                Label = "Process Date";
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
                
         INOUT MIR-COLCT-MTHD-CD
          {
              Length = "3";
              DBTableName = "TDH";
              CodeSource = "DataModel";
              CodeType = "COLCT-MTHD-CD";
              SType = "Selection";
              Label = "Collection Method";
          }

        INOUT MIR-COLCT-CATG-CD
        {
            Length = "3";
            DBTableName = "TDH";
            CodeSource = "DataModel";
            CodeType = "COLCT-CATG-CD";
            SType = "Selection";
            Label = "Collection Category";
        }
        
                
        IN MIR-TRAD-SO-JRNL-DT
        {
            Length = "10";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Trad SO Journal Date";
         }
        
        IN MIR-TRAD-JRNL-DT
        {
            Length = "10";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Trad Journal Date";
        }        
        
        IN MIR-TRAD-RECV-DT
        {
            Length = "10";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Trad Received Date";
       }
        
        INOUT MIR-PREM-DUE-MO-NUM
        {
            Length = "7";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Premium Due Month";
        }
        
        INOUT MIR-DPOS-RFND-QTY
        {
            Length = "3";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Number of Deposits/ Refunds";
        }
        
        INOUT MIR-TRXN-AMT
        {
            CurrencyCode ="MIR-PMT-CRCY-CD";
            Signed;
#* Q50806 CHANGES STARTS
#            Length = "15";
            Length = "17";
#* Q50806 CHANGES  ENDS
            DBTableName = "TDH";
            SType = "Currency";
            Label = "Transaction Amount";
        }
        
        IN MIR-TRXN-PRCES-DT
        {
            Length = "10";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Transaction Process Date";
        }
        
        IN MIR-SEQ-NUM
        {
            Length = "3";
            DBTableName = "TDH";
            SType = "Text";
            Label = "Sequence Number";
         }
        
        IN MIR-PREV-UPDT-DT
        {
            Length = "10";
            DBTableName = "TDH";
            SType = "Date";
            Label = "Previous Update Date";
  
        }
        
        IN MIR-PREV-UPDT-USER-ID
        {
             Length = "8";
             DBTableName = "TDH";
             SType = "Text";
             Label = "Previous Update User ID";
        } 
        
        IN MIR-POL-ID-BASE
        {
                DefaultSession = "MIR-POL-ID-BASE";
                Key;
                Label = "Suffix";
                Length = "9";
                SType = "Text";
        }        
        IN MIR-POL-ID-SFX
        {
                DefaultSession = "MIR-POL-ID-SFX";
                Key;
                Label = "Suffix";
                Length = "1";
                SType = "Text";
        }
        
        INOUT MIR-PMT-CRCY-CD
        {
                Length = "2"; 
                SType = "Hidden";
                 Label = "Currency";
            }  
        
}
