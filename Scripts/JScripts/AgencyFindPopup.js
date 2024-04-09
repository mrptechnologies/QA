
var mAgentId,mAgentNumber,mAgentFirstName,mAgentMiddleName,mAgentLastName,mAgencyIdSel,mBusinessName,mAgentBusinessEmailId,mAgentPhone,mAgentFax;

function setAgencyAgentInfo(agentId,agentNumber,agentFirstName,agentMiddleName,agentLastName,agencyIdSel,businessName,AgentBusinessMailId,AgentPhone,AgentFax){
	
	    // alert(AgentBusinessMailId);
		mAgentId=""+agentId;
		mAgentNumber=""+agentNumber;
		mAgentFirstName=""+agentFirstName;
		mAgentMiddleName=""+agentMiddleName;
		mAgentLastName=""+agentLastName;
		mAgencyIdSel=""+agencyIdSel;
		mBusinessName=""+businessName.replace(/&/g,"___");
		mAgentBusinessEmailId=encodeURIComponent(""+AgentBusinessMailId);
		mAgentPhone = ""+AgentPhone;
		mAgentFax = ""+AgentFax;
		

}
	
function submitToParent(){
      var formElement=document.forms[0];
		window.opener.document.forms[0].StyleAgencyId.value = mAgencyIdSel;
		window.opener.document.forms[0].StyleBusinessName.value = mBusinessName.replace(/___/g,'&');
		if(window.opener.document.forms[0].autoCompAgentId!=undefined  && window.opener.document.forms[0].autoCompAgentId!=null )
		{
			window.opener.document.forms[0].autoCompAgentId.value = mAgentId;
		}

		window.opener.document.forms[0].StyleAgentId.value = mAgentId;		
		window.opener.document.forms[0].StyleAgentNumber.value = mAgentNumber;
		window.opener.document.forms[0].StyleAgentFirstName.value = mAgentFirstName;
		window.opener.document.forms[0].StyleAgentLastName.value = mAgentLastName;
		window.opener.document.forms[0].StyleAgentMiddleName.value = mAgentMiddleName;
		window.opener.document.forms[0].Agenname.value =  mBusinessName.replace(/___/g,'&');
		// window.opener.document.forms[0].ObjectAgencyId.value=mAgencyIdSel;
		
		window.opener.document.getElementById("AgencyNameHeader").innerHTML =""+mBusinessName.replace(/___/g,'&amp;');
		window.opener.document.getElementById("AgentNameHeader").innerHTML = mAgentLastName + " " + mAgentFirstName +" " + mAgentMiddleName;
		if(window.opener.document.forms[0].StyleAgentBusinessID!=undefined && window.opener.document.forms[0].StyleAgentBusinessID!=null ){
				window.opener.document.forms[0].StyleAgentBusinessID.value = mAgentBusinessEmailId;
			}
		
		if(window.opener.document.forms[0].StyleAgentPhone!=undefined && window.opener.document.forms[0].StyleAgentPhone!=null ){
				window.opener.document.forms[0].StyleAgentPhone.value = mAgentPhone;
			}
		
		if(window.opener.document.forms[0].StyleAgentFax!=undefined && window.opener.document.forms[0].StyleAgentFax!=null ){
				window.opener.document.forms[0].StyleAgentFax.value = mAgentFax;
			}
		if(window.opener.document.forms[0].StyleAgentFullName!=undefined && window.opener.document.forms[0].StyleAgentFullName!=null){
		
			window.opener.document.forms[0].StyleAgentFullName.value = mAgentFirstName  +" "+ mAgentMiddleName +" "+ mAgentLastName;
		    }
		window.close();
		
}
function setBusinessName(businessName){
document.forms[0].StyleBusinessName.value=""+businessName;
}