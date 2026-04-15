// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:16 PM EDT
//******************************************************************************
//*  Component:   BF9278-I.js                                                  *
//*  Description: Used by  Update Adjustment/Exclusion                         *
//*               screen tables                                                *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  HCL106  HIN/CL   ADJUDICATORS DECISION PART A & B (HCL106A)               *
//*  23774A  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*                                                                            *
//******************************************************************************
 
//******************************************************************************
// THE SOFTWARE COMPRISING THIS SYSTEM IS THE PROPERTY OF INSURANCE SOFTWARE
// SOLUTIONS CORP. OR ITS LICENSORS.
//
// ALL COPYRIGHT, PATENT, TRADE SECRET, AND OTHER INTELLECTUAL PROPERTY RIGHTS
// IN THE SOFTWARE COMPRISING THIS SYSTEM ARE, AND SHALL REMAIN, THE VALUABLE
// PROPERTY OF INSURANCE SOFTWARE SOLUTIONS CORP. OR ITS LICENSORS.
//
// USE, DISCLOSURE, OR REPRODUCTION OF THIS SOFTWARE IS STRICTLY PROHIBITED,
// EXCEPT UNDER WRITTEN LICENSE FROM INSURANCE SOFTWARE SOLUTIONS CORP. OR ITS
// LICENSORS.
// 
// (C) COPYRIGHT 1999 INSURANCE SOFTWARE SOLUTIONS CORP.  ALL RIGHTS RESERVED
//******************************************************************************

//-----------------------------------------------------------------------------
// Global variables
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//
//	Function:	onLoadCustom()
//
//	Description:	Enable, display and make mandatory the relevant Adjustment
//                      or Exclusion fields depending on the value of the hidden field
//                      MIR-DV-EXCL-ADJ-IND.
//                      
//	Arguments:	none required
//	Returns:	Nothing
//
//-----------------------------------------------------------------------------
//------------------------------------------

function onLoadCustom()

{
          var dvExclAdjInd = document.getElementById("MIR-DV-EXCL-ADJ-IND").value;

          if (dvExclAdjInd == "A")          // Update is to an Adjustment
          {
                document.getElementById("MIR-EXCL-STRT-DT").disabled   = true;
                document.getElementById("MIR-EXCL-END-DT").disabled    = true;
                document.getElementById("MIR-EXCL-REASN-CD").disabled  = true;     
                document.getElementById("MIR-EXCL-STRT-DT").setAttribute("mandatory", "no");
                document.getElementById("MIR-EXCL-END-DT").setAttribute("mandatory", "no");
                document.getElementById("MIR-EXCL-REASN-CD").setAttribute("mandatory", "no");
                document.getElementById("MIR-ADJ-STRT-DT").setAttribute("mandatory", "yes");
                document.getElementById("MIR-ADJ-END-DT").setAttribute("mandatory", "yes");
                document.getElementById("MIR-ADJ-REASN-CD").setAttribute("mandatory", "yes");  
                ExclSection.style.display                   = "none";
               

          }
          
          if (dvExclAdjInd == "E")          // Update is to an Exclusion
          {
                document.getElementById("MIR-ADJ-STRT-DT").disabled    = true;
                document.getElementById("MIR-ADJ-END-DT").disabled     = true;
                document.getElementById("MIR-ADJ-REASN-CD").disabled   = true;       
                document.getElementById("MIR-EXCL-STRT-DT").setAttribute("mandatory", "yes");
                document.getElementById("MIR-EXCL-END-DT").setAttribute("mandatory", "yes");                                
                document.getElementById("MIR-EXCL-REASN-CD").setAttribute("mandatory", "yes");
                document.getElementById("MIR-ADJ-STRT-DT").setAttribute("mandatory", "no");
                document.getElementById("MIR-ADJ-END-DT").setAttribute("mandatory", "no");
                document.getElementById("MIR-ADJ-REASN-CD").setAttribute("mandatory", "no");  
                AdjSection.style.display                    = "none";

                
          }          
          
}






