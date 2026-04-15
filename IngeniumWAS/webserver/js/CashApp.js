// Converted from PathFinder 2.2 to 3.0 on Jun 18, 2004 3:26:16 PM EDT
//******************************************************************************
//*  Component:   CashApp.jse>                                                 *
//*  Description:                                                              *
//*                                                                            *
//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  014590  6.0      New for release 6.0                                      *
//*                                                                            *
//******************************************************************************
 
// Custom script for CashWithApp.htm

// toggle the commission section based on the net commision selection box
function toggleCommissionSection()
{
  if(inputForm.PayNetCommiss.checked)
  {
     CommisDetails1.style.display = "Block";
     CommisDetails2.style.display = "Block";
     CommisDetails3.style.display = "Block";
     CommisDetails4.style.display = "Block";
  }
  else
  {
     CommisDetails1.style.display = "None";
     CommisDetails2.style.display = "None";
     CommisDetails3.style.display = "None";
     CommisDetails4.style.display = "None";
  }
}


