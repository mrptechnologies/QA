/**
 * AJAX - Populating the Risk Application thru ajax
 * @author Mohan R
 */ 
 function chooseRiskType()
 {
  url="/risk/CommercialRiskTypeChooser.jsp"; 
  panel="RISK_CONTAINER";
  var riskType=document.getElementById("RiskType").value;
  var ownerId=document.getElementById("ownerIdfrmjsp").value;
  var custId=document.getElementById("custId").value;
  var params='RISK_TYPE='+riskType+'&ownerId='+ownerId+'&Navigation='+'&answer(TabPanelName)=Insured_Panel'+'&answer(teritory)='
  +'&answer(state)='+'&answer(territoryName)='+'&answer(zone)='+'&answer(showOnetTab)=N'+'&answer(Object::Risk::ComProperty::CustomerId)='+custId+
  '&answer(Object::Risk::ComProperty::ComPropertyId)=-1';

   try {
    autologout();
    new Ajax.Updater(
      panel,
      url,
      {
       synchronous:true, parameters:params, onComplete:function(){
    	  if(document.getElementById(panel) != null && document.getElementById(panel) != undefined) {
    		forwardToLoginPageIfInvalidSession(document.getElementById(panel).innerHTML);
       }},
       onException:function(){alert("Exception");}
      }
     );
   }catch(err) {
    txt="There was an error on this page.\n\n";
    txt+="Error description: " + err.description + "\n\n";
    txt+="Click OK to continue.\n\n";
    alert(txt);
   }   
 
  return false;
 
 }
 
 							
 
 function reloadPage(cusId,ownerId,agencyId,RiskId,riskType){
	document.location = '../AddResProperty1.do?answer(TabPanelName)=Insured_Panel&customerId='+cusId+'&SearchObjectId='+cusId+'&answer(Object::UserDetail::ownerId)='+ownerId+'&answer(Object::Customer::CustomerId)='+cusId+'&answer(Object::Risk::ResProperty::CustomerId)='+cusId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(objectId)=0&answer(Object::Risk::ResProperty::ResPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(state)=&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=&answer(Object::Risk::ComProperty::CustomerId)='+cusId+'&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(OwnerId)='+ownerId+'&answer(SelectedRiskType)='+riskType.value;           
 }
 
  function reloadEILRiskPage(cusId,ownerId,agencyId,RiskId,riskType){
	document.location = '../AddEILProperty.do?answer(TabPanelName)=Insured_Panel&customerId='+cusId+'&SearchObjectId='+cusId+'&answer(Object::UserDetail::ownerId)='+ownerId+'&answer(Object::Customer::CustomerId)='+cusId+'&answer(Object::Risk::ResProperty::CustomerId)='+cusId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(objectId)=0&answer(Object::Risk::ResProperty::ResPropertyId)=-1&answer(objectVerId)=0&answer(objectName)=HOME_RISK&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(state)=&answer(showOnetTab)=Y&tabNo=0&answer(Object::Employee::PageNum)=0&answer(Object::Customer::State)=&answer(Object::Risk::ComProperty::CustomerId)='+cusId+'&answer(Object::Risk::ComProperty::ComPropertyId)=-1&answer(OwnerId)='+ownerId+'&answer(SelectedRiskType)='+riskType.value+'&answer(Object::Risk::RiskId)=-1';            
 }
 
 
 //to populate the Available Risks in productBrowse based on effective Date
 
 function getRiskList(){
  var effectiveDate=document.getElementById("txtDate").value;
  var customerId=document.getElementById("customerId").value;
  var url='../CommercialRiskSelectorAction.do?answer(effectiveDate)='+effectiveDate+'&answer(customerId)='+customerId; 
  var panel="RiskListPanel";
  var form=document.forms[0];

  
  try {
    autologout();
    new Ajax.Updater(
				panel,
				url,
				{
					method: "get",
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
 
  return false;
 
 
 }
 
 function validateDateCL(submit){
	var frm = document.forms[0];
	var vardate = frm.txtDate.value
	var ddate = new Date(vardate);	
	if(!isDate(vardate)){
		alert("Invalid Date")
		frm.txtDate.select();
		return false;
	}
	if (vardate=="")
	{
		alert("Please enter the Effective Date");
		frm.txtDate.focus();
		return false;
	}
	var dmonth = parseInt(vardate.substring(0, 2), 10);
	var dday = parseInt(vardate.substring(3, 5), 10);
	var dyear = parseInt(vardate.substring(6, 10), 10);

	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
	{
		alert("Please enter date in 'MM/DD/YYYY' format");
		frm.txtDate.select();
		return false;
	}
	var reqDate = new Date("01/01/2005");
	
	if (ddate < reqDate)
	{
	
		alert("Effective Date cannot be prior to Jan 1, 2005");
		frm.txtDate.select();
		frm.txtDate.focus();
		return false;
	}

	if(submit!=null && submit=="submit") {
		if(frm.selectGroup!=null) {
			frm.selectGroup.value=0;
		}
		ProductBrowse();
	}
	if(frm.effDatefrmRequest!=null && frm.effDatefrmRequest!=undefined ){
		frm.effDatefrmRequest.value=vardate;
	}
	
	getRiskList()
	return true;
}
 