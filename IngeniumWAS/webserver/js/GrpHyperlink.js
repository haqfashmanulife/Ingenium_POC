//******************************************************************************
//*  Chg#    Release  Description                                              *
//*                                                                            *
//*  23774B  CTS      Changes done for ie retirement project to make it        *
//*                   compatible for microsoft edge. Changes in html include   *
//*                   adding "id" attribute for all input fields and changes in*
//*                   java scripts to modify certain functions/commands which  *
//*                   are no longer compatilble with edge.                     *
//*                                                                            *
//******************************************************************************
function GrpHyperlink()
{
 var y = document.getElementById('basic').rows;
 var elementCount = y.length; 
      for (var i = 2; i < elementCount; i++)
      {
       j=i-1 ;        
       var gr=document.getElementById("MIR-GR-ID-TYP-CD-T[" + j + "]").value;
       if (gr != 'B')
          {             
            document.getElementById("MIR-CVG-PRIM-GR-ID-T[" + j + "]").removeAttribute("href");
            document.getElementById("MIR-CVG-PRIM-GR-ID-T[" + j + "]").removeAttribute("action");
           }
       }


}
