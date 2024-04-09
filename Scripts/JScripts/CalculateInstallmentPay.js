/**
 * AJAX - Populating the Installment Pay List thru ajax
 * @author vijayakumar_k@solartis.net
 */ 
 
 function calculate(submit){
  
  var url="/CalculateInstallmentPayAction.do"; 
  var panel="InstallmentListPanel";
  var form=document.forms[0];
  
  try {
  
    autologout();  
    new Ajax.Updater(
				panel,
				url,
				{
					synchronous:true, parameters:$(document.forms[0]).serialize(this),
					onComplete: function(){
					if(document.getElementById(panel) != null && document.getElementById(panel) != undefined) {
						forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);
					}

						//Do something
					}
				}
			);
   }catch(err) {
    txt="There was an error on this page.\n\n";
    txt+="Error description: " + err.description + "\n\n";
    txt+="Click OK to continue.\n\n";
    alert(txt);
   }   
 
 return true;
  
 }
 
 