

function showSubmissionHazards(){
//activateTabs('SubmissionHazards');
		var objectId = 0;
		var objectVerId =0;
		var objectName = "HAZARDS";	
		var objectType = 'QUOTE';
		var Applicationtype = 'SUBMISSION_APPLICATION'
		var applicationType = 'QUOTE';
		var ownerId = document.getElementById('ownerId').value;
		var custId = document.getElementById('customerId').value;
		var submissionStatus = '';
		var actionName = escape('/saveSubmissionHazards.go');		
		var riskId=-1;
		var	submissionId = document.getElementById('submissionId').value;
		var submissionVerId = document.getElementById('submissionVerId').value;
		var panelName = 'Submission_Panel';
		var cancelButtonRequired = "False";
		var buttonName = "Save";
		displayPanelName = "Hazards";
		var status = document.getElementById("SubmissionStatus").value;
		if(status == 'In Progress'){
			appEnabled = 'Y';
		}else{
			appEnabled = 'N';
		}
		
		var pars = 'answer(ApplicationName)=Submission Hazards&InsuredSummaryActiveTab=SubmissionHazards&answer(InsuredSummaryActiveTab)=SubmissionHazards&answer(requestForm)=Submission&answer(objectId)='+objectId+'&answer(customerId)='+custId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=QUOTE&answer(objectType)="location"&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId;		
		var pars1 = 'answer(objectId)='+objectId+'&answer(customerId)='+custId+'&answer(objectVerId)='+objectVerId+'&answer(applicationType)=QUOTE&answer(objectType)="location"&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&OwnerId='+ownerId+
		'&answer(objectName)='+objectName+'&answer(Object::Application::OwnerId)='+ownerId+'&answer(ButtonName)='+buttonName+'&answer(cancelButtonRequired)='+cancelButtonRequired+
		'&answer(State)=&answer(riskTerritory)=&answer(zone)=&answer(TabPanelName)='+panelName+'&answer(isApplicationEnabled)='+appEnabled+
		'&answer(Object::Submission::InsuredId)='+custId+'&answer(Object::Submission::SubmissionStatus)='+status+
		'&answer(PrimaryKey_Object::Customer::CustomerId)='+custId+'&answer(PrimaryKey_Object::Submission::SubmissionId)='+submissionId+'&answer(PrimaryKey_Object::Submission::SubmissionVerId)='+ submissionVerId +
		'&answer(PrimaryKey_Object::Location::LocationId)='+riskId+'&answer(Object::Risk::RiskId)='+riskId+'&answer(Object::Application::ApplicationType)='+Applicationtype+
		'&answer(Object::Customer::CustomerId)='+custId+'&answer(Object::Submission::InsuredId)='+custId+'&answer(actionName)='+actionName+'&answer(Object::Submission::SubmissionId)='+submissionId+'&answer(Object::Customer::SubmissionId)='+submissionId+'&answer(Object::Submission::SubmissionVerId)='+submissionVerId+
		'&answer(Object::Customer::SubmissionVerId)='+submissionVerId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;

		var url = '../DisplayApplication3.0.do?'+pars1;	
		new Ajax.Request(url, {method: 'post',parameters:pars,onComplete:function(transport){},onSuccess: function(transport){showHazardContent(transport);
		if(document.getElementById("submitButton")!=null&&document.getElementById("submitButton")!='undefined'){
			document.getElementById("submitButton").className="covsmallbutton"; }
		}});
	}
	function showHazardContent(data){
	//document.getElementById('hazardtab').className="todotab_active";
 	//document.getElementById('coveragetab').className="todotab_inactive";
 	document.getElementById('CoveragesandLimits').style.display='inline';
	document.getElementById('SubmissionHazards').style.display='inline';
	document.getElementById('Locations').style.display='none';
	document.getElementById('Insured').style.display='none';
	document.getElementById('Quotes').style.display='none';
	document.getElementById('Policy').style.display='none';
	document.getElementById('AdditionalInsured').style.display='none';
	document.getElementById('applicationcontent').style.display='none';
	document.getElementById('SubmissionHazards').innerHTML = data.responseText;
	document.getElementById("submitButton").value ="Save";
 }
 
