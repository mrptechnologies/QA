var DisplayAircraftSchedule = false;
var InCountryMedical = false;
function LoadDocumentation(){var ajax = new Ajax.Updater({success: 'QuoteSummary'}, '../cvstarr/QuoteSummary.jsp', {method:'post'});}
function LoadCoverageandLimits(){var ajax = new Ajax.Updater({success: 'QuoteSummary'},'../cvstarr/QuoteSummary/PolicyCoverageandLimitsParent.jsp',{method: 'post'});}
function LoadPolicyInformation(){var ajax = new Ajax.Updater({success: 'QuoteSummary'},'../cvstarr/QuoteSummary/PolicyInformationParent.jsp',{method: 'post'});}
function LoadPolicyExclusions(){var ajax = new Ajax.Updater({success: 'QuoteSummary'},'../cvstarr/QuoteSummary/PolicyExclusionsParent.jsp',{method: 'post'});}
function LoadClassHazards(){var ajax = new Ajax.Updater({success: 'QuoteSummary'},'../cvstarr/QuoteSummary/ClassHazardsParent.jsp',{method: 'post'});}
function LoadClassBenefits(){var ajax = new Ajax.Updater({success: 'QuoteSummary'},'../cvstarr/QuoteSummary/ClassBenefitsParent.jsp',{method: 'post'});}
function LoadAircraft(){var ajax = new Ajax.Updater({success: 'QuoteSummary'},'../cvstarr/QuoteSummary/QuoteSummaryAircraftScheduleParent.jsp',{method: 'post'});}
function LoadRatingDetail(){var ajax = new Ajax.Updater({success: 'QuoteSummary'},'../cvstarr/QuoteSummary/RatingDetailParent.jsp',{method: 'post'});}
function LoadScheduleofForms(){var ajax = new Ajax.Updater({success: 'QuoteSummary'},'../cvstarr/QuoteSummary/ScheduleofFormsParent.jsp',{method: 'post'});}
function LoadWorksheet(){var ajax = new Ajax.Updater({success: 'QuoteSummary'},'../cvstarr/QuoteSummary/WorksheetParent.jsp',{method: 'post'});}
function LoadClassHazardsClassList(){var ajax = new Ajax.Updater({success: 'ClassList'}, '../cvstarr/QuoteSummary/ClassHazardsClassListParent.jsp' , {method: 'post'});}
function LoadClassHazardsClass1(){var ajax = new Ajax.Updater({success: 'ClassList'}, '../cvstarr/QuoteSummary/ClassHazardsClass1Parent.jsp' , {method: 'post'});}
function LoadClassHazardsClass2(){var ajax = new Ajax.Updater({success: 'ClassList'}, '../cvstarr/QuoteSummary/ClassHazardsClass2Parent.jsp' , {method: 'post'});}
function LoadClassHazardsClass3(){var ajax = new Ajax.Updater({success: 'ClassList'}, '../cvstarr/QuoteSummary/ClassHazardsClass3Parent.jsp' , {method: 'post'});}
function LoadClassBenefitsClassList(){var ajax = new Ajax.Updater({success: 'ClassListClassBenefits'}, '../cvstarr/QuoteSummary/ClassBenefitsClassListParent.jsp' , {method: 'post'});}
function LoadClassBenefitsClass1(){var ajax = new Ajax.Updater({success: 'ClassListClassBenefits'}, '../cvstarr/QuoteSummary/ClassBenefitsClass1Parent.jsp' , {method: 'post'});}
function LoadClassBenefitsClass2(){var ajax = new Ajax.Updater({success: 'ClassListClassBenefits'}, '../cvstarr/QuoteSummary/ClassBenefitsClass2Parent.jsp' , {method: 'post'});}
function LoadClassBenefitsClass3(){var ajax = new Ajax.Updater({success: 'ClassListClassBenefits'}, '../cvstarr/QuoteSummary/ClassBenefitsClass3Parent.jsp' , {method: 'post'});}
function LoadRatingDetailClassList(){var ajax = new Ajax.Updater({success: 'ClassListRatingDetail'}, '../cvstarr/QuoteSummary/RatingDetailClassListParent.jsp' , {method: 'post'});}
function LoadRatingDetailClass1(){var ajax = new Ajax.Updater({success: 'ClassListRatingDetail'}, '../cvstarr/QuoteSummary/RatingDetailClass1Parent.jsp' , {method: 'post'});}
function LoadRatingDetailClass2(){var ajax = new Ajax.Updater({success: 'ClassListRatingDetail'}, '../cvstarr/QuoteSummary/RatingDetailClass2Parent.jsp' , {method: 'post'});}
function LoadRatingDetailClass3(){var ajax = new Ajax.Updater({success: 'ClassListRatingDetail'}, '../cvstarr/QuoteSummary/RatingDetailClass3Parent.jsp' , {method: 'post'});}
//----------------------------------------------------------------------------------------------------------------------------------------
function LoadNewQuoteCoverageandLimits(){var ajax = new Ajax.Updater({success: 'NewQuote'},'../cvstarr/CreateQuote/NewQuoteCoverageandLimitsParent.jsp',{method: 'post',onComplete:function(transport){ShowAircraftScheduleInCoverageandLimits();}});}
function LoadNewQuotePolicyInformation(){var ajax = new Ajax.Updater({success: 'NewQuote'},'../cvstarr/CreateQuote/NewQuotePolicyInforamationParent.jsp',{method: 'post',onComplete:function(transport){ShowAircraftSchedule();showInCountryMedical();}});}
function LoadNewQuotePolicyExclusions(){var ajax = new Ajax.Updater({success: 'NewQuote'},'../cvstarr/CreateQuote/NewQuotePolicyExclusionParent.jsp',{method: 'post',onComplete:function(transport){ShowAircraftSchedule();}});}
function LoadNewQuoteClassHazards(){var ajax = new Ajax.Updater({success: 'NewQuote'},'../cvstarr/CreateQuote/NewQuoteClassHazardsParent.jsp',{method: 'post',onComplete:function(transport){ShowAircraftSchedule();}});}
function LoadNewQuoteClassBenefits(){var ajax = new Ajax.Updater({success: 'NewQuote'},'../cvstarr/CreateQuote/NewQuoteClassBenefitsParent.jsp',{method: 'post',onComplete:function(transport){ShowAircraftSchedule();}});}
function LoadNewQuoteAircraftSchedule(){var ajax = new Ajax.Updater({success: 'NewQuote'},'../cvstarr/CreateQuote/NewQuoteAircraftScheduleParent.jsp',{method: 'post',onComplete:function(transport){ShowAircraftSchedule();}});}
function LoadNewQuoteClassHazardsClassList(){var ajax = new Ajax.Updater({success: 'ClassList'}, '../cvstarr/CreateQuote/NewQuoteClassHazardsClasslistParent.jsp' , {method: 'post'});}
function LoadNewQuoteClassHazardsClass1(){var ajax = new Ajax.Updater({success: 'ClassList'}, '../cvstarr/CreateQuote/NewQuoteClassHazardsClass1Parent.jsp' , {method: 'post'});}
function LoadNewQuoteClassHazardsClass2(){var ajax = new Ajax.Updater({success: 'ClassList'}, '../cvstarr/CreateQuote/NewQuoteClassHazardsClass2Parent.jsp' , {method: 'post'});}
function LoadNewQuoteClassHazardsClass3(){var ajax = new Ajax.Updater({success: 'ClassList'}, '../cvstarr/CreateQuote/NewQuoteClassHazardsClass3Parent.jsp' , {method: 'post'});}
function LoadNewQuoteClassBenefitsClassList(){var ajax = new Ajax.Updater({success: 'ClassListClassBenefits'}, '../cvstarr/CreateQuote/NewQuoteClassBenefitsClassListParent.jsp' , {method: 'post'});}
function LoadNewQuoteClassBenefitsClass1(){var ajax = new Ajax.Updater({success: 'ClassListClassBenefits'}, '../cvstarr/CreateQuote/NewQuoteClassBenefitsClass1Parent.jsp' , {method: 'post'});}
function LoadNewQuoteClassBenefitsClass2(){var ajax = new Ajax.Updater({success: 'ClassListClassBenefits'}, '../cvstarr/CreateQuote/NewQuoteClassBenefitsClass2Parent.jsp' , {method: 'post'});}
function LoadNewQuoteClassBenefitsClass3(){var ajax = new Ajax.Updater({success: 'ClassListClassBenefits'}, '../cvstarr/CreateQuote/NewQuoteClassBenefitsClass3Parent.jsp' , {method: 'post'});}

//----------------------------------------------------------------------------------------------------------------------------------------
function LoadPolicySummaryDocumentation(){var ajax = new Ajax.Updater({success: 'PolicySummary'},'../cvstarr/PolicySummary/PolicySummaryDocumentation.jsp',{method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryCoverageandLimits(){var ajax = new Ajax.Updater({success: 'PolicySummary'},'../cvstarr/PolicySummary/PolicySummaryCoverageandLimitsParent.jsp',{method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryPolicyInformation(){var ajax = new Ajax.Updater({success: 'PolicySummary'},'../cvstarr/PolicySummary/PolicySummaryCaseInformationParent.jsp',{method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryPolicyExclusions(){var ajax = new Ajax.Updater({success: 'PolicySummary'},'../cvstarr/PolicySummary/PolicySummaryCaseExclusionParent.jsp',{method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryClassHazards(){var ajax = new Ajax.Updater({success: 'PolicySummary'},'../cvstarr/PolicySummary/PolicySummaryClassHazardsParent.jsp',{method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryClassBenefits(){var ajax = new Ajax.Updater({success: 'PolicySummary'},'../cvstarr/PolicySummary/PolicySummaryClassBenefitsParent.jsp',{method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryAircraft(){var ajax = new Ajax.Updater({success: 'PolicySummary'},'../cvstarr/PolicySummary/PolicySummaryAircraftParent.jsp',{method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryEndorsements(){var ajax = new Ajax.Updater({success: 'PolicySummary'},'../cvstarr/PolicySummary/PolicySummaryEndorsementsParent.jsp',{method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryInvoice(){var ajax = new Ajax.Updater({success: 'PolicySummary'},'../cvstarr/PolicySummary/PolicySummaryInvoiceParent.jsp',{method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryPayments(){var ajax = new Ajax.Updater({success: 'PolicySummary'},'../cvstarr/PolicySummary/PolicySummaryPaymentParent.jsp',{method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}

function LoadPolicySummaryClassBenefitsClassList(){var ajax = new Ajax.Updater({success: 'PolicySummaryClassBenefitsClassList'}, '../cvstarr/PolicySummary/PolicySummaryClassListParent.jsp' , {method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryClassBenefitsClass1(){var ajax = new Ajax.Updater({success: 'PolicySummaryClassBenefitsClassList'}, '../cvstarr/PolicySummary/PolicySummaryClassBenefitsClass1Parent.jsp' , {method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryClassBenefitsClass2(){var ajax = new Ajax.Updater({success: 'PolicySummaryClassBenefitsClassList'}, '../cvstarr/PolicySummary/PolicySummaryClassBenefitsClass2Parent.jsp' , {method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryClassBenefitsClass3(){var ajax = new Ajax.Updater({success: 'PolicySummaryClassBenefitsClassList'}, '../cvstarr/PolicySummary/PolicySummaryClassBenefitsClass3Parent.jsp' , {method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}

function LoadPolicySummaryClassHazardsClassList(){var ajax = new Ajax.Updater({success: 'PolicySummaryClassHazardsClassList'}, '../cvstarr/PolicySummary/PolicySummaryClassHazardsClassListParent.jsp' , {method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryClassHazardsClass1(){var ajax = new Ajax.Updater({success: 'PolicySummaryClassHazardsClassList'}, '../cvstarr/PolicySummary/PolicySummaryClassHazardsClass1Parent.jsp' , {method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryClassHazardsClass2(){var ajax = new Ajax.Updater({success: 'PolicySummaryClassHazardsClassList'}, '../cvstarr/PolicySummary/PolicySummaryClassHazardsClass2Parent.jsp' , {method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}
function LoadPolicySummaryClassHazardsClass3(){var ajax = new Ajax.Updater({success: 'PolicySummaryClassHazardsClassList'}, '../cvstarr/PolicySummary/PolicySummaryClassHazardsClass3Parent.jsp' , {method: 'post',onComplete:function(transport){ChangedBoundtoIssuePolicy();}});}

 function addInvoiceDebit(){
 	document.getElementById("invoice").style.display="none";
 	document.getElementById("addInvoiceDebit").style.display="inline";
 }

 function addPaymentCredit(){
 	document.getElementById("payment").style.display="none";
 	document.getElementById("addPaymentCredit").style.display="inline";
 }
 
 function backPaymentCredit(){
 	document.getElementById("payment").style.display="inline";
 	document.getElementById("addPaymentCredit").style.display="none";
 }
 
 function backInvoiceDebit(){
 	document.getElementById("invoice").style.display="inline";
 	document.getElementById("addInvoiceDebit").style.display="none";
 }
 
 function ChangedBoundtoIssuePolicy(){
 	if(document.getElementById("Issue_Policy").value=="Issued"){
 		document.getElementById('PolicyPdf').style.display='inline';
 	}
 }

function LoadAddAircraft(){
	document.getElementById("AircraftSchedule").style.display ="none";
	document.getElementById("AddAircraft").style.display ="inline";
}

function backAircraftSchedule(){
	document.getElementById("AircraftSchedule").style.display ="inline";
	document.getElementById("AddAircraft").style.display ="none";
}

function displayAircraftSchedule(obj){
	if(obj.value=="Y"){
		DisplayAircraftSchedule = true;
		document.getElementById("AircraftScheduleTab").style.display="";
	}else{
		DisplayAircraftSchedule = false;
		document.getElementById("AircraftScheduleTab").style.display="none";
	}
}

function ShowAircraftSchedule(){
	if(DisplayAircraftSchedule==true){
		document.getElementById("AircraftScheduleTab").style.display="";
	}
}

function ShowAircraftScheduleInCoverageandLimits(){
	if(DisplayAircraftSchedule==true){
		document.getElementById("pilot_Y").checked="true";
		document.getElementById("AircraftScheduleTab").style.display="";
	}
}

function setInCountryMedical(obj){
	if(obj.value=="Y"){
		InCountryMedical=true;
	}
}
function showInCountryMedical(){
	if(InCountryMedical == true){
		document.getElementById("inCountryMedical").style.display="inline";
		document.getElementById("inCountryMedicalQ1").style.display="inline";
		document.getElementById("inCountryMedicalQ2").style.display="inline";
		document.getElementById("inCountryMedicalQ3").style.display="inline";
	}else{
			document.getElementById("inCountryMedical").style.display="none";
			document.getElementById("inCountryMedicalQ1").style.display="none";
		document.getElementById("inCountryMedicalQ2").style.display="none";
		document.getElementById("inCountryMedicalQ3").style.display="none";
	}
}