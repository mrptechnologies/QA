<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>	

<% response.setHeader("Cache-Control", "no-store"); %>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/QuoteSummary.js"> 
</SCRIPT>
<SCRIPT type="text/JavaScript">
var isStalePageErrorPresent = true;

</SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/CoveragesLimits.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/ValidateFieldEIL.js"></script>

<script type="text/javascript">
 var url1 = "/saveQuoteEILRiskApplicationAction3.0.go?";
</script>

<style type="text/css">
.yui-skin-sam .yui-panel{position:relative;left:0;top:0;border-style:solid;border-width:10px 0;border-color:#808080;z-index:1;*border-width:1px;*zoom:1;_zoom:normal;}
.yui-hidden {display:none;}

</style>




<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/container/assets/skins/sam/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/assets/skins/sam/menu.css">
<%-- <link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/assets/skins/sam/skin.css">--%>
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css"	href="../Scripts/YUI/2.7.0/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />  

<%--<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/editor/assets/skins/sam/simpleeditor.css" /> --%>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script> 
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CauseListTable.js"></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/Subjectivity.js" ></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/AttachmentTable.js" ></script>
<script type="text/JavaScript" SRC="../Scripts/YUI/2.7.0/build/menu/menu-min.js" ></script>
<%--<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/editor/simpleeditor-min.js"></script>--%>
 <script type="text/javascript" src="../Scripts/YUI/2.7.0/build/yuiloader/yuiloader-min.js"></script>



<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>

<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/LocationTank/QuoteLocationTank.js"></script>



<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/QuoteSummaryUI3.js"></script>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.9.0/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.9.0/build/editor/simpleeditor-min.js"></script>

<script type="text/javascript">

	var flag=0;
<!--
	function submitToRateCovLimits(){
		
		var frm = "";
	  	if(document.forms[0].IsOptionDisabled == undefined){
	  		frm = document.forms[1];
	  	}else{
	  		frm = document.forms[0];  	
 		}
 	
 		var url = "../RateCoverageLimitsEILV2.do";
		
		new Ajax.Request(url, 
	 	{method: 'post',
			asynchronous:true,parameters:$(frm).serialize(this),
			onLoading:function(){
				document.getElementById("loadercontent1").style.display ="block";document.getElementById("loadercontent2").style.display ="block";
			},
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				forwardToLoginPageIfInvalidSession(transport.responseText);
		 		document.getElementById("loadercontent1").style.display ="none";document.getElementById("loadercontent2").style.display ="none";
		 	},onSuccess: function(transport){	
			document.getElementById("QuoteDiv").style.display = "block";
		 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
		 	}
		}
	);		
	}	
	function SubmitToRecalculate(){
		var formElement=  "";
		if(document.forms[0].SIDnoOfEmployeesInPlan =="undefined" || document.forms[0].SIDnoOfEmployeesInPlan==null){
		
			formElement = document.forms[1];
			
		}else{
			formElement = document.forms[0];
		}
		if(formElement.submissionCheckId != null && formElement.submissionCheckId != "undefined"){
			formElement.submissionCheckId.value="no";
		}
		var IntnoOfEmployeesInPlan = "";
		if(formElement.SIDnoOfEmployeesInPlan != null && formElement.SIDnoOfEmployeesInPlan != "undefined"){
		 IntnoOfEmployeesInPlan=formElement.SIDnoOfEmployeesInPlan.value;
		}
		if(! validateFormEIL(formElement)){
			return false;
		}else{
				if(document.getElementById("isUWCalculate") != null && document.getElementById("isUWCalculate") != undefined) {
					document.getElementById("isUWCalculate").value = "true";
				}
				var url = "../CalculateUnderwriterWorkSheetEIL.do";
				new Ajax.Request(url, 
			 	{method: 'post',
					asynchronous:true,parameters:$(formElement).serialize(this),
					onLoading:function(){
						document.getElementById("loadercontent1").style.display ="block";document.getElementById("loadercontent2").style.display ="block";
					},
					onFailure:function(){},
					onException:function(){},
					onComplete:function(transport){
						forwardToLoginPageIfInvalidSession(transport.responseText);
				 		document.getElementById("loadercontent1").style.display ="none";document.getElementById("loadercontent2").style.display ="none";
				 	},onSuccess: function(transport){	
					document.getElementById("QuoteDiv").style.display = "block";
				 	document.getElementById("QuoteDiv").innerHTML= transport.responseText;
				 	}
				}
			);
		}
	}
//-->
function Ajaxsubmit(frm,submitBttn,actionName){
	var isManuscriptSave = "N";
	if(document.getElementById("Content") != null && document.getElementById("Content") != undefined) {
		if(myEditor != null && myEditor != undefined) {
			myEditor.saveHTML();
			if(document.getElementById("Content") != null && document.getElementById("Content") != undefined) {
				document.getElementById("Content").value = convertSpecialCharactersToAsciiValue(document.getElementById("Content").value);
			}
			isManuscriptSave = "Y";
		}
	}
 var remove =  removeObject;

 var validate = eval(validateDynamicForm1(frm));
 if(validate){
 if(submitBttn !=null && submitBttn != undefined && submitBttn!='Remove' ){
 	submitBttn.disabled = true;
 }
 if(frm.RemoveButtonForPopUp != null && frm.RemoveButtonForPopUp!=undefined && remove == false){
 	//frm.RemoveButtonForPopUp.value="";
 	frm.RemoveButtonForPopUp.disabled = true;
 	
 	}
 	 if(frm.RemoveButton != null && frm.RemoveButton!=undefined &&  remove == false ){
 			 	frm.RemoveButton.value="";
 	
 	}

 	var isSubmit = newCheckSubmit1();
 	if(isSubmit){
 	var url1="";
 	if(url1 == undefined){
 		 url1 = "/saveSubmissionRisk1.do?";
 	}else{}
 		autologout();
 		url1 = actionName;
	 	new Ajax.Request(url1, {method: 'post',parameters:$(frm).serialize(this),
	 	onLoading: function() {
		document.getElementById("loadercontent1").style.display ="block";document.getElementById("loadercontent2").style.display ="block";
		},onComplete:function(transport){forwardToLoginPageIfInvalidSession(transport.responseText);checkcount = false;doSpecificCompleteAction(transport);},onSuccess: function(transport){
			if(isManuscriptSave == "N") {
				doSpecificSuccessAction(transport);
			} else if(isManuscriptSave == "Y") {
				loadScheduleofFormsTabV2("ScheduleofFormsTab");
				if(document.getElementById("tempDiv") != null && document.getElementById("tempDiv") != undefined) {
					document.getElementById("tempDiv").innerHTML= "<input type='text' id='tempText' value=''/>";
					document.getElementById("tempText").focus();
					document.getElementById("tempDiv").innerHTML = "";
				}
			}
		}
		});
	 }
	}

}
</script>


<link rel="stylesheet" href="../styles/structure.css" type="text/css">
<script type="text/javascript" src="/Scripts/JScripts/UnderwriterWorksheet.js"></script>
<script type="text/javascript" src="/Scripts/JScripts/UnderwriterWorksheetEIL.js"></script>
<script type="text/javascript" src="/Scripts/JScripts/FactorCalculator.js"></script>		
<script type="text/javascript" src="/Scripts/JScripts/Application.js"></script>		

<div id="QuoteSummaryPage">
<bean:define id="parentQuoteId" name="QuoteDetail" property="answer(parentQuoteId)" scope="request" />

<bean:define id="prodId" name="QuoteDetail" property="answer(Object::Quote::ProductId)" scope="request" />
<bean:define id="ProductVerId" name="QuoteDetail" property="answer(Object::Quote::ProductVerId)" scope="request" />

<bean:define id="customerId" name="QuoteDetail" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="agencyId" name="QuoteDetail" property="answer(Object::Agency::AgencyId)" scope="request" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(ownerIdfrmjsp)" value='<%=ownerId+"" %>' styleId="ownerIdfrmjsp" />

<bean:define id="quoteStartDate" name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" 
scope="request" />
<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
<bean:define id="noOfMedicalEmployees" name="QuoteDetail" property="answer(Object::Quote::NoOfMedicalEmployees)"/> 
<bean:define id="paretQuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" />
<html:hidden styleId="paretQuoteStatus" property="answer(Object::Quote::QuoteStatus)" value='<%=""+paretQuoteStatus%>' />
<bean:define id="paretLockStatus" name="QuoteDetail" property="answer(Object::Quote::LockStatus)" />
<bean:define id="QuoteNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteNumber)" />
<bean:define id="QuoteSubNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteSubNumber)" />
<bean:define id="MedicalUWFactor" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactor)" />
<bean:define id="agentId" name="QuoteDetail" property="answer(Object::QuoteCommission::AgentId)" scope="request" />
<bean:define id="paymentPlan" property="answer(Object::Quote::PaymentPlan)" name="QuoteDetail"  />


<bean:define id="stateCode" property="answer(Object::Quote::PaymentPlan)" name="QuoteDetail"  />
<bean:define id="MedicalUWFactorPrefer" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorPrefer)" />
<bean:define id="MedicalUWFactorStand" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorStand)" />
<bean:define id="MedicalUWFactorMax" name="QuoteDetail" property="answer(Object::PlanFactor::MedicalUWFactorMax)" />
<bean:define id="DrugUWFactor" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactor)" />

<bean:define id="DrugUWFactorPrefer" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorPrefer)" />
<bean:define id="DrugUWFactorStand" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorStand)" />
<bean:define id="DrugUWFactorMax" name="QuoteDetail" property="answer(Object::PlanFactor::DrugUWFactorMax)" />
<bean:define id="HelthHra" name="QuoteDetail" property="answer(Object::Quote::HelthHra)" />
<bean:define id="CompositeRate" name="QuoteDetail" property="answer(Object::Quote::CompositeRate)" />
<bean:define id="AreaNetWorkKey" name="QuoteDetail" property="answer(Object::Quote::AreaNetWorkKey)" />
<bean:define id="AreaNetWorkKeyDesc" name="QuoteDetail" property="answer(Object::Quote::AreaNetWorkKeyDesc)" />
<bean:define id="State" name="QuoteDetail" property="answer(Object::Quote::CustomerState)" />

<bean:define id="TotalParentQuotePremium" name="QuoteDetail" property="answer(Object::Quote::TotalPremium)" />
<bean:define id="parentQuoteFee1" name="QuoteDetail" property="answer(Object::Quote::Fee1)" />
<bean:define id="parentQuoteFee2" name="QuoteDetail" property="answer(Object::Quote::Fee2)" />
<% String fullName =""; %>
<bean:define id="fname" property="answer(Object::UserDetail::UserFirstName)" name="LoginPage" scope="session"/>
<bean:define id="lname" property="answer(Object::UserDetail::UserLastName)" name="LoginPage" scope="session"/>

<bean:define id="GroupId" name="QuoteDetail" property="answer(Object::Quote::ProductGroupId)" />
<bean:define id="GroupVerId" name="QuoteDetail" property="answer(Object::Quote::ProductGroupVerId)" />
<bean:define id="productStatus" name="QuoteDetail" property="answer(Object::Quote::ProductStatus)" scope="request" />
<bean:define id="QuoteType" name="QuoteDetail" property="answer(Object::Quote::QuoteType)" />
<bean:define id="ProductFamilyId" name="QuoteDetail" property="answer(Object::Quote::ProductFamilyId)" />

<bean:define id="FirstSubQuoteId" name="QuoteDetail" property="answer(Object::Quote::FirstSubQuoteId)" />
<bean:define id="QuoteId" name="QuoteDetail" property="answer(Object::Quote::Id)" />
<html:hidden styleId="QuoteId" property="answer(Object::Quote::Id)" value='<%=""+QuoteId%>' />
<bean:define id="policyNumber" name="QuoteDetail" property="answer(Object::Quote::PolicyNumber)" />
<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
<bean:define id="ObjectId" name="QuoteDetail" property="answer(Object::Quote::Id)" />

<bean:define id="quoteName" name="QuoteDetail" property="answer(Object::Quote::QuoteName)" />
<bean:define id="quoteDesc" name="QuoteDetail" property="answer(Object::Quote::QuoteDesc)" />

<bean:define id="submissionId" name="QuoteDetail" property="answer(Object::Quote::SubmissionId)"  /> 
<bean:define id="submissionVerId" name="QuoteDetail" property="answer(Object::Quote::SubmissionVerId)" /> 

<bean:define id="RenewalPolicyNo" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicyNumber)" />
<bean:define id="RenewalPolicyCompany" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicyCompany)" />

<%String MandatoryDBACondition = "";
if(request.getAttribute("mandatoryDBAFlag")!=null){
	MandatoryDBACondition = request.getAttribute("mandatoryDBAFlag").toString();
}
%>
<bean:define id="RenewalSubmissionNumber" name="QuoteDetail" property="answer(Object::QuoteAdditional::RenewalPolicySubmission)" />
<bean:define id="companyPaperCode"  name="QuoteDetail" property="answer(Object::Company::Paper::CompanyPaperCode)" />
<%String parentQuoteVerId = ""; 
String quoteNum1 = "";%>
<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" />
	<logic:present name="parentQuoteDetail" scope="request">
			<bean:define id="paretQuoteVerId" name="parentQuoteDetail" property="quoteVerId"/>
			<bean:define id="quoteNumber1" name="parentQuoteDetail" property="quoteNumber"/>
			<bean:define id="QuoteSubNumber" name="QuoteDetail" property="answer(Object::Quote::QuoteSubNumber)" />
			<%parentQuoteVerId = ""+paretQuoteVerId; 
			quoteNum1 =""+quoteNumber1; %>
	</logic:present>
<%String docSubQuoteVerId=""; 
String CustomerState = ""; 
String CustomerName = "";
String subQuoteProductId1 = "";
String isProposalDocumentCreatedStr = "";
%>


<%!		
String strSubQuoteId1 = ""; 
String strSubQuoteVerId1="";
static final int beniRater = 0;
static final int MicaRater = 1;
static final int MicaIowa = 3;
%>
<%
int productGroup = beniRater;

if(State.toString().length()>0 ){
	if(State.toString().equals("IL")){
		productGroup = MicaRater;
	}else 	if(State.toString().equals("IA")){
		productGroup = MicaIowa;
	}
}	

			%>	



<%String strReason="";%>
<bean:define id="RejectReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::RejectedNotes)" scope="request" />
<bean:define id="LostReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::LostNotes)" scope="request" />
<bean:define id="LapseReason" name="QuoteDetail" property="answer(Object::QuoteAdditional::LapseReason)" scope="request" />
<bean:define id="LapseNotes" name="QuoteDetail" property="answer(Object::QuoteAdditional::LapseNotes)" scope="request" />




<%if(fname.toString()=="" && lname.toString()==""){
	fullName = userId.toString();
} else {
	fullName = fname+ " "+ lname;
}%>
<%double lgTotalParentQuotePremium=Double.parseDouble(TotalParentQuotePremium.toString()); %>

<%long numberOfSubQuotes=0;%>
<%String EmpGrpNum="";%>
<%long lgNoOfMedicalEmployees = Long.parseLong(""+noOfMedicalEmployees);%>


<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
			<html:hidden property="answer(deleteAttachment)" value="true" styleId="deleteAttachmentNotes"/>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="false">
			<html:hidden property="answer(deleteAttachment)" value="false" styleId="deleteAttachmentNotes"/>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="true">
			<html:hidden property="answer(EmailViewPrevilegeAvail)" value="true" styleId="EmailViewPrevilegeAvail"/>
</dmshtml:dms_static_with_connector>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="false">
			<html:hidden property="answer(EmailViewPrevilegeAvail)" value="false" styleId="EmailViewPrevilegeAvail"/>
</dmshtml:dms_static_with_connector>

<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>

<logic:present name="customerDetail1" scope="request">
	<bean:define id="tempCustomerName" name="customerDetail1" property="customerName" scope="request" />
	<% CustomerName = ""+tempCustomerName;	%>
</logic:present>

<% com.dms.ejb.customer.DMSCustomerDetail detail = new com.dms.ejb.customer.DMSCustomerDetail(); %>	
<logic:present name="customerDetail1" scope="request">
	<%
		Object obj=request.getAttribute("customerDetail1");
	    detail = (com.dms.ejb.customer.DMSCustomerDetail)obj;
	%>
	<html:hidden property="answer(CustomerName)" value='<%=CustomerName+""%>' styleId="CustomerName" />
<html:hidden property="answer(custState)" value='<%=""+detail.getCustomerState()%>' styleId="custState" />
<html:hidden property="answer(custCity)" value='<%=detail.getMCity()%>' styleId="custCity" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMCounty()%>' styleId="custCounty" />
<html:hidden property="answer(custCounty)" value='<%=detail.getMZip()%>' styleId="custZip" />
<html:hidden property="answer(custStName)" value='<%=detail.getStreetName()%>' styleId="custStName" />
<html:hidden property="answer(custStNo)" value='<%=detail.getStreetNumber()%>' styleId="custStNo" />
<html:hidden property="answer(custAdd2)" value='<%=detail.getMAddress2()%>' styleId="custAdd2" />
<html:hidden property="answer(custAdd1)" value='<%=detail.getMAddress1()%>' styleId="custAdd1" />
	
</logic:present>


<%String docSubQuoteId=""; %>
<%String subQuoteId1 = ""; %>
<dmshtml:Get_All_Plan_HeaderDetails nameInSession="subQuotes" parentQuoteId='<%=""+parentQuoteId%>'dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
<logic:present name="subQuotes" scope="request">
<bean:define id="subQuoteArr" name="subQuotes" scope="request" type="java.util.ArrayList" />
<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		<%docSubQuoteId=""+subQuoteId;%>
<%numberOfSubQuotes=subQuoteArr.size();%>	

<%subQuoteId1 = ""+subQuoteId;%>
</logic:iterate>											
</logic:present>
<html:hidden property="answer(Object::Quote::subQuoteId1)" value='<%=""+subQuoteId1 %>' styleId="subQuoteId11"/>
<html:hidden property="answer(Object::Quote::canoverride)" value='<%="N"%>' styleId="canoverride"/>
<dmshtml:Get_Customer_HeaderDetail_ByCustomerId 
nameInSession="customerMap" 
customerId='<%=""+customerId%>' 
dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' 
/>
<bean:define id="customerDetailMap" name="customerMap" scope="request"
												type="com.dms.ejb.data.QuestionHashMap" />
<%EmpGrpNum=customerDetailMap.getString("Object::Customer::Number");%>


<%java.util.ArrayList pdfList = new java.util.ArrayList();%>
	<%
			boolean editableQuoteHeader =false;
			boolean uwFactorDropDown =false;
			boolean modifyQuoteType = false;
	
	%>

<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">	
<tr><td><div id="manuScript"><div id='Manuscript_CONT'></div></div></td></tr>	
<tr><td><div id="subjDetail"><div id="SUB_CONT"></div></div></td></tr>
<tr><td><div id="AttachFiles"></div></td></tr>
<tr><td><div id="AddNotespopup" style="display:none"></div></td></tr>
</table>

<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
	<td>
	
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		
		<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >			
		<tr><td>
			<jsp:include page="../common/InsuredAgencyLinkspage.jsp" />
		</td></tr>
		</logic:notEqual>
    	</table>
    	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

				<logic:present name="QuoteTransactionStatus" scope="request">
					<tr>
						<td class="Error"><%= request.getAttribute("QuoteTransactionStatus") %>
						</td>
					</tr>
				</logic:present>
				
				<tr>
				<td>&nbsp;</td>
				
				<logic:present name="staleDataSubmissionMsgFormPolicyCreation" scope="request">
					<tr>
						<td class="Error">Please avoid using the Back/Refresh button.</td>
					</tr>
				</logic:present>
				
				<logic:present name="staleDataSubmissionMsgFormQuoteProposal" scope="request">
					<tr>
						<td class="Error">Please avoid using the Back/Refresh button.</td>
					</tr>
				</logic:present>
				
				<logic:present name="staleDataSubmissionMsg"  scope="request">
					<tr id="StalePageErrorMsg">
						<td class="Error" ><bean:message key="error.staleDataSubmissionMsg"/>
						</td>
					</tr>
			</logic:present>
					
			</tr>
			
			<tr>				
				<logic:present name="arrRiskInfo" scope="request">
					<td class="Error" width="20%">
						Following Policies do not qualify for this Quote, since its Effective Dates are out of range with this Quote's Effective Date.
						Pl. delete them from this Quote from the Risk List page
					</td>
					<tr><td>&nbsp;</td></tr>
					<tr>	
						<td  colspan = "2">
							<table width="40%" border="0" >	
								<%int indx=1; %>
								<tr>
									<td class="sectionhead" width="2%" align="center">			 						
			 							No.
			 						</td>
			 						<td class="sectionhead" width="18%" align="center">
			 							Risk Name
			 						</td>
			 						<td class="sectionhead" width="10%" align="center">
			 							Policy Number
			 						</td>
			 						<td class="sectionhead" width="10%" align="center">
			 							Policy Effective Date
			 						</td>
								</tr>									
								<logic:iterate id="arrRiskInfoMap" name="arrRiskInfo">
								<tr>
									<td class="Error" width="2%" align="center"><%=indx++ %></td>
									<td class="Error" width="8%" align="centre"><bean:write name="arrRiskInfoMap" property="RISK_NAME" /></td>
									<td class="Error" width="15%" align="centre"><bean:write name="arrRiskInfoMap" property="POLICY_NUMBER" /></td>
									<td class="Error" width="15%" align="centre"><bean:write name="arrRiskInfoMap" property="EFFECTIVE_DATE" /></td>
								</tr>	
								</logic:iterate>							
							
							</table>
						</td>
					</tr>
				</logic:present>
				</tr>

	<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>">

		<dmshtml:dms_isPresent property="<%=new String[]{"In Progress", "Submitted", "Referred","Sold", "Lost","Rejected"}%>" value="<%=paretQuoteStatus.toString()%>">
			<tr><td>
			<table WIDTH="100%">
			<tr>
			<td  align=left>
					&nbsp;This Quote Is Locked  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
			</table>
			</td></tr>
		</dmshtml:dms_isPresent>
	</dmshtml:dms_isPresent>

<% if(numberOfSubQuotes < 1){ %>
	<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
    <tr>
    	<td class="Error" COLSPAN="2">
    		There is no plan associated to the Quote. Please add a plan to the Quote.
    	</td>
    </tr>
    
	</dmshtml:dms_isPresent>
	
<%} if(numberOfSubQuotes > 0){ %>
<logic:present name="subQuotes" scope="request">
	
		<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		</logic:iterate>
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		<bean:define id="subQuoteVerId" name="aSubQuote" 	property="quoteVerId" />
		<bean:define id="subQuoteProductId" name="aSubQuote" 	property="productId" />
		<bean:define id="subQuoteProductVerId" name="aSubQuote" 	property="productVerId" />
		<bean:define id="planNum" name="aSubQuote" 	property="quoteNumber" />
		<bean:define id="planDetails" name="aSubQuote" 	property="healthInsPlanDetail" type="com.dms.ejb.insurance.quote.common.plan.PlanDetail" />
		<%long riskId =planDetails.getPLResRiskPropertyId() ;
		String riskName =planDetails.getPLResRiskPropertyName() ;
		String riskNumber =planDetails.getPLResRiskPropertyRiskNumber() ;
		long riskTerritory =planDetails.getTerritory() ;
		String planState = planDetails.getStateCode();
		String riskZone = planDetails.getZone();
		subQuoteProductId1 = ""+subQuoteProductId;
		%>
			<%docSubQuoteVerId=""+subQuoteVerId;%>	
			<html:hidden property="answer(Object::Quote::PlanState)" value='<%=""+planState%>' styleId="planState"/>
			<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+subQuoteVerId%>'/>
			<html:hidden value='<%=""+riskTerritory%>' styleId="riskTerritory1" property="answer(Object::Quote::RiskTerritory1)"/>
			<html:hidden property="answer(Object::Quote::subQuoteVerId1)" value='<%=""+subQuoteVerId %>' styleId="subQuoteVerId"/>
			<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value='<%=""+subQuoteVerId%>'/>			
			<bean:define id="referralNotes" name="QuoteDetail" property="answer(Object::QuoteAdditional::ReferralNotes)"/>
<tr>
	<td align="left">
		<table WIDTH="100%"  ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
		<td  style ="font-style:bolditalic;font-size:14pt ; "align="left" width="12%">
		<% String strQuoteSubNumber=QuoteSubNumber.toString(); 
			if(strQuoteSubNumber.length()>0) {
				quoteNum1=quoteNum1+"-"+strQuoteSubNumber;
				}%>
						
				Quote <%=""+quoteNum1%><a href="javascript:;"> 
		</td>
		</tr>
		<tr><td colspan="4">&nbsp;</td></tr>
		<tr>
		<!--<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="false"> 

		--><dmshtml:dms_isPresent property="<%=new String[]{"Bound","Issued","Referred"}%>" value="<%=paretQuoteStatus.toString()%>" negated="false">
		    <td class="links" align="left" width="7%">
		    <a href="../ModifyQuoteConfirmAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(modQuoteId)=<%=""+parentQuoteId%>&answer(modQuoteNumber)=<%=""+QuoteNumber%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>" title="<bean:message key='ToolTip.QuoteSummary.ModifyQuote'/>" class="button2" style="width:100px"  onclick="submit_form()">Modify Quote</a> 
	        </td>
		</dmshtml:dms_isPresent>
	<!--</dmshtml:dms_isPresent>
		--><dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ADD_PLAN_AVAILABLE" 
			property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">

	</dmshtml:isFeatureAvailableForProductRoleStatus>
	</dmshtml:dms_isPresent>
	
	<dmshtml:GetSubmissionDetailByQuoteId nameInSession="submissionDetailByQuoteId" quoteId="<%=Long.parseLong(parentQuoteId.toString())%>" ownerId='<%=Long.parseLong(ownerId.toString())%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
	<logic:present name="submissionDetailByQuoteId" scope="request">
		<bean:define id="subDetailMap" name="submissionDetailByQuoteId" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		<bean:define id="subId" name="subDetailMap" property="Object::Submission::SubmissionId" />
		<bean:define id="subVerId" name="subDetailMap" property="Object::Submission::SubmissionVerId" />
		<bean:define id="custId" name="subDetailMap" property="Object::Submission::CustomerId" />
			<logic:greaterThan name="subId" value="0">
				<logic:greaterThan name="subVerId" value="0">
					<logic:greaterThan name="custId" value="0">		
						<td class="links" align="left" width="16%">				
							<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=Long.parseLong(subVerId.toString())%>&answer(Object::Submission::SubmissionId)=<%=Long.parseLong(subId.toString())%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=Long.parseLong(custId.toString())%>&customerId=<%=Long.parseLong(""+custId)%>&answer(Object::Customer::CustomerId)=<%=Long.parseLong(""+custId)%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=Long.parseLong(""+custId)%>" title="<bean:message key='ToolTip.QuoteSummary.Submission'/>" class="button2" style="width:190px">
								Go to Submission Summary
							</a>			
						</td>	
					</logic:greaterThan>
				</logic:greaterThan>
			</logic:greaterThan>
	</logic:present>	

	
		
			<dmshtml:get_Installment_Types	nameInSession="arrInstallmentTypes"	productVerId="<%=""+ProductVerId %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrInstallmentTypes">
										<%
										java.util.ArrayList InstallmentType = (java.util.ArrayList)request.getAttribute("arrInstallmentTypes");
										com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) InstallmentType.get(0);
										%>
						
								</logic:present>
<bean:define id="custId" name="subDetailMap" property="Object::Submission::CustomerId" />
<td class="links" align="left" width="16%"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+custId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>" title="<bean:message key='ToolTip.QuoteSummary.InsuredRecord'/>" class="button2" style="width:190px" />Go to Insured Master Record</a> </td>

	<logic:present name="subQuotes" scope="request">
		
		<!-- <td  align="left" width="10%">
			 	<a  href="../CopyQuoteCL.do?TabPanelName=Quote_Panel&forwardKey=COPY_QUOTE3.0&PageType=COPY_QUOTE_SUMMARY&quoteId=<%=""+parentQuoteId%>&answer(Entity::Equals::OwnerId)=<%=ownerId.toString()%>&parentQuoteVerId=<%=""+parentQuoteVerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Customer::State)=<%=""+State %>"  class="button2" style="width:100px"/> Copy Quote</a>
			</td>-->
		
			<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="PROPOSAL_AVAILBLE" 
			property='<%=new String[]{"In Progress", "Referred"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			<td align="left" width="12%">
			<a href="../quote/CreateQuoteProposalEIL.jsp?TabPanelName=Quote_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(ProductId)=<%=""+prodId%>&answer(ProductFamilyId)=<%=ProductFamilyId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::QuoteAdditional::RenewalPolicyNumber)=<%=RenewalPolicyNo.toString()%>&answer(Object::QuoteAdditional::RenewalPolicyCompany)=<%=RenewalPolicyCompany.toString()%>&answer(Object::QuoteAdditional::RenewalPolicySubmission)=<%=RenewalSubmissionNumber.toString()%>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&subQuoteId=<%=subQuoteId.toString()%>&answer(suQuoteVerId)=<%=""+subQuoteVerId%>&answer(Object::Rules::ActionForward)=Y&answer(Object::QuoteAdditional::ReferralNotes)=<%=""+referralNotes.toString().replaceAll("<","&lt;").replaceAll(">","&gt;") %>" id="Create_Quote_Proposal" title="<bean:message key='ToolTip.QuoteSummary.QuoteProposal'/>" class="button2" style="width:130px">Create Quote Proposal</a>
		</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>

		<dmshtml:Is_Proposal_Document_Generated nameInSession="isProposalDocumentCreated" documentType='PROPOSAL' parentQuoteId='<%=Long.parseLong(""+QuoteId)%>' subQuoteId='<%=Long.parseLong(""+subQuoteId)%>' ownerId="<%=Long.parseLong(ownerId.toString())%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />			
			<logic:present name="isProposalDocumentCreated" scope="request">
				<bean:define id="isProposalDocumentCreated" name="isProposalDocumentCreated" type="java.lang.String" />
				<% isProposalDocumentCreatedStr = "" + isProposalDocumentCreated; %>
			</logic:present>
		<%if(!isProposalDocumentCreatedStr.equalsIgnoreCase("false")) { %>
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="BIND_REQUEST_AVAILABLE" 
			property='<%=new String[]{"Offered"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			<td align="left" width="10%">
				<a href="/quote/BindRequestEIL.jsp?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(suQuoteVerId)=<%=""+subQuoteVerId%>&answer(parentPolicyId)=<%=""%>&answer(Object::Policy::ParentPolicyVerId)=<%=""%>" id="Bind_Request" title="<bean:message key='ToolTip.QuoteSummary.Bind'/>" class="button2" style="width:100px">Bind Quote</a>  
				
				
			</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		<% } %>
		
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="ISSUE_AVAILABLE" 
			property='<%=new String[]{"Bind Request"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			<td  align="left" width="10%">
				<a href="../VerifyIssueBinderEIL.do?TabPanelName=Quote_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Quote::ParentQuoteId)=<%=""+parentQuoteId%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::Quote::ProductId)=<%=""+prodId%>&answer(parentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(Object::Quote::QuoteType)=<%=QuoteType%>&answer(Object::Quote::FirstSubQuoteId)=<%=""+docSubQuoteId%>&answer(Object::Quote::QuoteStartDate)=<%=quoteStartDate.toString()%>&answer(DocumentType)=ISSUANCE&answer(state)=<%=""+planState%>&answer(subQuoteId)=<%= subQuoteId.toString()%>&answer(Object::Quote::SubQuoteId)=<%= subQuoteId.toString()%>&answer(numberOfSubQuotes)=<%=""+numberOfSubQuotes %>&answer(teritory)=<%=""%>&Navigation=&answer(territoryName)=<%=""%>&answer(zone)=<%=""%>&tabNo=0&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(ParentQuoteVerId)=<%=""+parentQuoteVerId%>&answer(SubQuoteId)=<%=subQuoteId.toString()%>&ParentQuoteId=<%=parentQuoteId.toString()%>&ParentQuoteVerId=<%=""+parentQuoteVerId%>&SubQuoteId=<%=subQuoteId.toString()%>&subQuoteVerId=<%=subQuoteVerId.toString()%>&answer(Object::Quote::SuQuoteVerId)=<%=subQuoteVerId.toString()%>&answer(subQuoteVerId)=<%=subQuoteVerId.toString()%>" id="Issue_Binder" title="<bean:message key='ToolTip.QuoteSummary.IssueBinder'/>" class="button2" style="width:100px">Issue Binder</a>
			</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		
		<dmshtml:dms_isPresent property="<%=new String[]{"Unlocked"}%>" value="<%=paretLockStatus.toString()%>" negated="true">
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="REFERRAL_AVAILABLE" 
			property='<%=new String[]{"In Progress"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
			
			<td  align="left" width="10%">
					<a href="../SubmitQuoteEIL.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(policyNumber)=<%=""+policyNumber%>&answer(ParentQuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(subQuoteId)=<%=subQuoteId.toString()%>&answer(ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(GetadditionalInfo)=yes&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(ProductId)=<%=""+prodId%>&answer(ParentQuoteVerId)=<%=parentQuoteVerId.toString()%>&answer(ProductFamilyId)=<%=ProductFamilyId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(RULE_OBJECT_ID)=<%=""+prodId%>&answer(RULE_OBJECT_VER_ID)=<%=""+ProductVerId%>&answer(Object::Quote::PrevSubQuoteVerId)=<%=""+subQuoteVerId%>&answer(RULE_OBJECT_TYPE)=PRODUCT&answer(RULE_OBJECT_NAME)=APPLICATION&answer(MERGE_BEFORE)=YES&answer(MERGE_AFTER)=NO&answer(ASSERT_MAP_ENTRIES)=YES&answer(MODIFIED_FACT_MAP)=YES" id="Refer_Quote" title="<bean:message key='ToolTip.QuoteSummary.Refer'/>" class="button2" style="width:100px">Refer</a>
			</td>
		
			</dmshtml:isFeatureAvailableForProductRoleStatus>
			
	</dmshtml:dms_isPresent>						
	
		
		<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="LAPSE_AVAILABLE" 
			property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
		<td  align="left" width="10%">
			<a href="../LostQuote.do?TabPanelName=Quote_Panel&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(Object::Quote::QuoteStatus)=<%=paretQuoteStatus.toString()%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(GetadditionalInfo)=yes&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(Object::QuoteAdditional::RenewalPolicyNumber)=<%=RenewalPolicyNo.toString()%>&answer(Object::QuoteAdditional::RenewalPolicyCompany)=<%=RenewalPolicyCompany.toString()%>&answer(Object::QuoteAdditional::RenewalPolicySubmission)=<%=RenewalSubmissionNumber.toString()%>&answer(Object::Quote::PrevSubQuoteVerId)=<%=""+subQuoteVerId%>" id="Lapse_Quote" title="<bean:message key='ToolTip.QuoteSummary.Lapse'/>" class="button2" style="width:120px">Lapse this Quote</a>
		</td>
		</dmshtml:isFeatureAvailableForProductRoleStatus>
		
	<dmshtml:GetQuoteDetailByQuoteId nameInSession="GetQuoteDetailByQuoteId" quoteId='<%=""+QuoteId%>' ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
	<logic:present name="GetQuoteDetailByQuoteId" scope="request">
		<bean:define id="quoteName" name="GetQuoteDetailByQuoteId" property="quoteName" />
		<bean:define id="quoteDesc" name="GetQuoteDetailByQuoteId" property="quoteDesc" />
	</logic:present>
		
		
		
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EXPORT_XML"}%>' connector='or' negated="true">
			<dmshtml:dms_isPresent property='<%=new String[]{"Sold"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
				<td class="links" align="left" width="10%">
					<a href="../XMLGeneratorForCustomer.do?TabPanelName=Quote_Panel&customerId=<%=customerId.toString()%>&xmlFileName=<%=QuoteNumber.toString()%>&quoteId=<%=parentQuoteId%>" target="_new">Export XML</a>
				</td>
			</dmshtml:dms_isPresent>
		</dmshtml:dms_static_with_connector>
		
		<dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' 			
		connector='or' negated="true">
						<td class="links"align="left" width="10%">
 			
	<a href="../SearchActivityManagerAction5.do?TabPanelName=Quote_Panel&policyNumber=<%=""+policyNumber %>&answer(Object::Quote::ProductVerId)=<%=""+ProductVerId%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>&answer(Object::Activity::ObjectId)=<%=""+parentQuoteId%>&answer(Object::Activity::ObjectType)=<%="Quote"%>&answer(Object::Quote::QuoteStatus)=<%=""+paretQuoteStatus%>&answer(Object::Activity::OwnerId)=<%=ownerId.toString()%>&answer(Object::Activity::PageNum)=0&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>"  title="<bean:message key='ToolTip.QuoteSummary.ActivityLog'/>">Activity Log </a>

			</td>			
	</dmshtml:dms_static_with_connector>  
			

	</logic:present>
		</tr>

		</table>
		</td>
	</tr>
</logic:present>

	<%
		boolean isSold = false;
		if(paretQuoteStatus.toString().equalsIgnoreCase("Sold")) {
			isSold = true;
		}
	%>
	<tr>
	<td align="left">
		<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td>
		<table width="100%" ALIGN="left" BORDER="0" CELLSPACING="2" CELLPADDING="0">
	
		<dmshtml:dms_static_with_connector 	ruleName='privilage' property='<%=new String[]{"UPDATE_QUOTE_HEADER"}%>' connector='or' negated="true"> 
			<%	 editableQuoteHeader = true;%>
		<tr>
						
		</td>
		</tr>
		

	 </dmshtml:dms_static_with_connector>
	 <html:hidden name="QuoteDetail" property="answer(Object::Quote::QuoteStartDate)" styleId="referenceEffectiveDate" />
	<dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"UPDATE_QUOTE_HEADER"}%>' 			
		connector='or' negated="false">
		<tr>
			</tr>
	</dmshtml:dms_static_with_connector>
	 <dmshtml:dms_static_with_connector ruleName='privilage'  property='<%=new String[]{"MODIFY_QUOTE_TYPE"}%>' connector='or' negated="true">
		 
	 <dmshtml:dms_isPresent property='<%=new String[]{""}%>' value="<%=paretQuoteStatus.toString()%>" negated="false">
		 <%
			modifyQuoteType = true;
		 %>
			<tr>
				<td class="FormLabels"><B></B></td>
				<td class="links"> 					
					<%
						if(isSold) { %>
							<html:hidden name="QuoteDetail" property="answer(Object::Quote::QuoteType)"/>
						<%}
					%>
				</td>
			</tr>		
		</dmshtml:dms_isPresent>
	</dmshtml:dms_static_with_connector>  
	
			<tr>
				<td class="FormLabels"><B><!-- Name your Quote: --></B></td>
				<td>
					<!-- <html:text property="answer(Object::Quote::QuoteName)" name="QuoteDetail" styleClass="txtbox" styleId="NamedQuote" maxlength="30" size="32"/> -->
					<html:hidden property="answer(Object::Quote::QuoteName)" name="QuoteDetail" styleId="NamedQuote"/>
					<html:hidden property="answer(Object::Quote::QuoteDesc)" name="QuoteDetail" styleId="QuoteDiscription" />
				</td>
			</tr>	
	</table>
	</td>
	</tr>				

	</table>
	</td>
	</tr>

<tr>
<td colspan="9">
<table WIDTH="100%" ALIGN="left" cellspacing=0 cellpadding="0"
border="0">
<tr>
<!-- <td align="center" class="sectionhead">QUOTE PRODUCTS</td> -->
</tr>

<tr>
<td>
<table WIDTH="100%" ALIGN="left" cellspacing="2"
	cellpadding="0" border="0">
	
	<%
		double totalParentQuotePremium=Double.parseDouble(TotalParentQuotePremium.toString());
		double lgparentQuoteFee1 = Double.parseDouble(parentQuoteFee1.toString());
		double lgparentQuoteFee2 = Double.parseDouble(parentQuoteFee2.toString());
		
	%>	
	<logic:present name="subQuotes" scope="request">
	
		<logic:iterate id="aSubQuote" name="subQuotes" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail">
		<bean:define id="subQuoteId" name="aSubQuote" 	property="quoteId" />
		<bean:define id="subQuoteVerId" name="aSubQuote" 	property="quoteVerId" />
		<bean:define id="subQuoteProductId" name="aSubQuote" 	property="productId" />
		<bean:define id="subQuoteProductVerId" name="aSubQuote" 	property="productVerId" />
		<bean:define id="planNum" name="aSubQuote" 	property="quoteNumber" />
		<bean:define id="planDetails" name="aSubQuote" 	property="healthInsPlanDetail" type="com.dms.ejb.insurance.quote.common.plan.PlanDetail" />
		<bean:define id="subQuoteStatus" name="aSubQuote" 	property="quoteStatus" />
		<%strSubQuoteId1 = ""+subQuoteId;
		strSubQuoteVerId1 = ""+subQuoteVerId;
		long riskId =planDetails.getPLResRiskPropertyId() ;
		String riskName =planDetails.getPLResRiskPropertyName() ;
		String riskNumber =planDetails.getPLResRiskPropertyRiskNumber() ;
		long riskTerritory =planDetails.getTerritory() ;
		String planState = planDetails.getStateCode();
		String riskZone = planDetails.getZone();		
		%>
	
		
		<tr>		
		<% if(paretQuoteStatus.equals("Bound") || paretQuoteStatus.equals("BOUND") || paretQuoteStatus.equals("Issued") || paretQuoteStatus.equals("ISSUED")){ %>	
		
		<dmshtml:GetPolicyNumber  nameInSession="PolicyNumber" ownerId='<%=""+ownerId %>' parentQuoteId='<%=Long.parseLong(""+parentQuoteId) %>' subQuoteId ='<%=Long.parseLong(""+subQuoteId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		<logic:present name="PolicyNumber" scope="request">
			
					<% com.dms.ejb.data.QuestionHashMap policyNum = (com.dms.ejb.data.QuestionHashMap)request.getAttribute("PolicyNumber"); 
					     String policyNo = policyNum.getString("policyNumber");
					     String PolicyStatus = policyNum.getString("PolicyStatus");
					%>
			        <%if(!policyNum.equals("")) {%>
						
							<td class="links" align="left" width="100px">
							<!-- 	<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyNumber)=<%=""+policyNumber%>&answer(APP_TAB_TYPE)=<%="YUI" %>&answer(Object::Application::ApplicationType)=<%="POLICY_APPLICATION"%>&answer(Object::Quote::PaymentPlan)&answer()=<%=""+paymentPlan %>"> <%=policyNo%></a>			 -->
							</td>
						<!-- 	<td class="SearchResult" ALIGN="center" style='color: BLUE'><%= PolicyStatus%></td> -->
						
							
					<%} %>	
		
        </logic:present>
		<% } %>


		<%String IsApplicationDisabled="Y";%>
			<%String IsOptionDisabled="Y";%>
		<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
					<%IsOptionDisabled="N";%>
					<%IsApplicationDisabled="N";%>
		</dmshtml:dms_isPresent>
		<dmshtml:dms_isPresent property="<%=new String[]{"Referred","Submitted"}%>" value="<%=paretQuoteStatus.toString()%>"  negated="true">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SAVE_AFTER_SUBMIT_QUOTE"}%>' connector='or' negated="true">
					<%IsOptionDisabled="N";%>
					<%IsApplicationDisabled="N";%>
				</dmshtml:dms_static_with_connector>
		</dmshtml:dms_isPresent>
		<html:hidden styleId="IsOptionDisabled" property="answer(IsOptionDisabled)" value="<%=""+IsOptionDisabled %>"/>
		<html:hidden property="Object::Application::ISApplicationDisabled" value='<%=""+IsApplicationDisabled %>' styleId="IsApplicationDisabled"/>
		<bean:define id="totalPremium" name="aSubQuote" 	property="totalPremium" />
		<bean:define id="fee1" name="aSubQuote" 	property="fee1" />
		<bean:define id="fee2" name="aSubQuote" 	property="fee2" />
		<%
		double lgtotalPremium=0.0;
		double lgfee1=0.0;
		double lgfee2=0.0;
		
		try  {lgtotalPremium=  Double.parseDouble(totalPremium.toString()) ;} catch (Exception ex) {}
		try  {lgfee1=  Double.parseDouble(fee1.toString()) ;} catch (Exception ex) {}
		try  {lgfee2=  Double.parseDouble(fee2.toString()) ;} catch (Exception ex) {}
		%>

</tr>
</logic:iterate>
</logic:present>
<dmshtml:dms_HasFeature_Available_InProduct productId="<%=Long.parseLong(""+prodId)%>" 
			featureName="Administrative_Fee" negated="true" 
			dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' 
			ownerId="<%=""+ownerId%>"  state="<%=""+State%>"  >	
	<tr>
		<td class="SearchResult" colspan="3"></td>
		<td class="SearchResult" colspan="3" align="left">Administrative Fee</td>
		<td class="SearchResult" align="right">
		<dmshtml:CurrencyFormatTag format="<%=""+(lgparentQuoteFee1)%>" /> 
		</td>
	</tr>
</dmshtml:dms_HasFeature_Available_InProduct>	

</table>
</td>
</tr>		
		
	</table>
	</td>
</tr>
								
		<tr>
			<td>
				<dmshtml:dms_isPresent property="<%=new String[]{"Referred","Submitted"}%>" value="<%=paretQuoteStatus.toString()%>"  negated="true">
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SAVE_AFTER_SUBMIT_QUOTE"}%>' connector='or' negated="true">
						<!--   <html:submit value="Save" styleClass="sbttn" styleId="QuoteSummarySubmit"/> -->
					</dmshtml:dms_static_with_connector>
				</dmshtml:dms_isPresent>
				
				<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
				<!--  	<html:submit value="Save" styleClass="sbttn" styleId="QuoteSummarySubmit" />-->
				</dmshtml:dms_isPresent>
			</td>
		</tr>
	</table>
	
	

<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">

<dmshtml:getPDFRelativePath nameInSession="pdfDestinationPath" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
	<logic:present name="pdfDestinationPath" scope="request">
		<bean:define id="PDFDestinationFilePath" name="pdfDestinationPath" scope="request" />
	
		<% String strQuoteSubNumber=QuoteSubNumber.toString(); %>
			 
			<%
				java.util.ArrayList empBasedPdfList = new java.util.ArrayList();		
				String xmlPath = "";		
				String strQuoteNum = QuoteNumber.toString();
				if(strQuoteSubNumber.length()>0) {
					strQuoteNum=strQuoteNum+"-"+strQuoteSubNumber;
				}
				{			
					pdfList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+strQuoteNum);
					if (EmpGrpNum!=null && EmpGrpNum.length() !=0)
					{
						empBasedPdfList = com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+EmpGrpNum.toString()+"/"+strQuoteNum);
						
					}
				}
				
				
				java.util.ArrayList xmlList = new java.util.ArrayList();
				xmlList=com.dms.util.Constants.listFilesInsideADirectory("QuotePDF_Path",PDFDestinationFilePath+strQuoteNum+"/SoldQuotes");
				
				
			%>
			<tr>
				<td class="Error" COLSPAN="2">
				<% if((pdfList !=null && pdfList.size()>0) || (empBasedPdfList !=null && empBasedPdfList.size()>0)){ %>

					<% if((pdfList !=null && pdfList.size()>0)){ 
						for (int i=0; i<pdfList.size(); i++)  {
							String fileName=(String) pdfList.get(i);
							if(fileName.equalsIgnoreCase("SoldQuotes")){
								continue;
							}
					 %>
				
						<%} //end of for loop
						} //end of if((pdfList !=null && pdfList.size()>0))
					if((empBasedPdfList !=null && empBasedPdfList.size()>0)){ 
						for (int j=0; j<empBasedPdfList.size(); j++)  {
							String fileName2=(String) empBasedPdfList.get(j);
							if(fileName2.equalsIgnoreCase("SoldQuotes")){
								continue;
							}				
					%>
				
						<%} //end of for loop
					} //end of if((empBasedPdfList !=null && empBasedPdfList.size()>0))
					%>

				<%}%>				
				</td>
			</tr>
		
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EXPORT_XML"}%>' connector='or' negated="true">
	
	</dmshtml:dms_static_with_connector>
	</logic:present>
<%} %>
</table>
<table width="97.5%">
    <tr>
	<td class="NewSectionHead" colspan="5" align="center">QUOTE SUMMARY</td>
	</tr>
</table>
<jsp:include page="/common/QuoteHeaderCoverMin.jsp">

<jsp:param name="answer(Object::Quote::ObjectId)" value="<%=""+parentQuoteId%>" />

</jsp:include>


	</td>
	</tr>

</table>

<table width="900px">
<tr>
							<td class="Error">
												
								<logic:present name="MESSAGE_LIST" scope="request">			
													
								<ol>
									<logic:iterate id="message" name="MESSAGE_LIST">
									<li><bean:write name="message"/></li>
									</logic:iterate>
								</ol>			
								</logic:present>											
							</td>
						</tr>
			<logic:present name="MESSAGE_LISTS" scope="request">			
			
			</logic:present>	
						<tr>
							<td class="Error">
								<logic:present name="MESSAGE_LISTS" scope="request">
								<tr>
									<td class="Error">				
									<ol>
							        	<logic:iterate id="InnerMessageList" name="MESSAGE_LISTS">
								        	<%int flag=0; %>
									        	<logic:iterate id="message" name="InnerMessageList">
									                <%
									                	if(flag==0){%>
			         										<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write  name="message"/></li>
			        											<%flag=1;}else{ %>
			         												<li style="{COLOR: #ff0000;FONT-WEIGHT: bold}"><bean:write name="message"/></li>
			        								<%} %>
			        							</logic:iterate>
			      						</logic:iterate>
			     					</ol>   
									</td>
								
								</tr>
			    	 				
			     				</logic:present>
							</td>
						</tr>
</table>

	<%if(isProposalDocumentCreatedStr.equalsIgnoreCase("false") && ("" + paretQuoteStatus).equalsIgnoreCase("Offered")) { %>
		<table border="0" cellpadding="0" cellspacing="0" width="97%"  align="center">
	    	<tr>
				<td class="Error" colspan="5" align="left">BINDER CANNOT BE ISSUED UNTIL QUOTE PROPOSAL HAS BEEN ISSUED AND PRE BIND SUBJECTIVITIES HAVE BEEN ADDRESSED.</td>
			</tr>
		</table>
	<%} %>
	<%if(MandatoryDBACondition.toString().equalsIgnoreCase("Failure")) { %>
		<table border="0" cellpadding="0" cellspacing="0" width="97%"  align="center">
	    	<tr>
				<td class="Error" colspan="5" align="left">Mandatory: Enter DBA details in the Insured Master Record</td>
			</tr>
		</table>
	<%} %>

<div align="center" id="Doc" style="display:block">
<table border="0" cellpadding="0" cellspacing="0" width="97%"  align="center">
   <tr>
     <td width="100%" colspan="2">&nbsp;</td>
   </tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="112px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="DocumentationTab" onclick="javascript:loadDocumentTab(this.id,'../attachment/QuoteAttachmentResult.jsp','../notes/NotesResult.jsp','../email/SentEMailListUI3.jsp');" >
				<tr>
					<td align="center"  Style="Cursor:hand">Documentation</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="112px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  id="CoveragesLimitsTab" onclick="loadCoverageAndLimitsTab(this.id);" >
				<tr>
					<td align="center"  Style="Cursor:hand">Coverages and Limits</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="112px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="GeneralQuestionTab" onclick="javascript:loadGeneralQuestionsTab(this.id);">
				<tr>
					<td align="center" Style="Cursor:hand">General Questions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="112px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="LocationTankTab" onclick="javascript:loadQuoteLocationList(this.id);" >
				<tr>
					<td align="center"  Style="Cursor:hand" >Locations and Tanks</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="112px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="SubjectivityTab" onclick="javascript:loadSubjectivityTab(this.id);refreshSubjectivity();refereshMultiAttachmentList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');refereshMultiNotesList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');">
				<tr>
					<td align="center"  Style="Cursor:hand">Subjectivities</td>
				</tr>
			</table>
         </td>
         <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_RATING_DETAIL"}%>' connector='or' negated="true">
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="112px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="RatingDetailTab" onclick="javascript:loadRatingDetailTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Rating Detail</td>
				</tr>
			</table>
         </td>
         </dmshtml:dms_static_with_connector>
         <dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SCHEDULE_OF_FORMS" 
				property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted","Declined","Lapsed"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">				
          <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
          <td align="center" valign=bottom>
    		 <table border="0" width="112px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="ScheduleofFormsTab" onclick="javascript:loadScheduleofFormsTabV2(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Schedule of Forms</td>
				</tr>
			</table>
         </td>
         </dmshtml:isFeatureAvailableForProductRoleStatus>
         <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"QUOTE_WORKSHEET_EDIT"}%>' connector='or' negated="true">				
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="112px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="UWWorkSheetTab" onclick="javascript:loadUWWorkSheetTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand"> Worksheet</td>
				</tr>
			</table>
         </td>
         </dmshtml:dms_static_with_connector>
       </tr>
     </table>
     </td>
     <td width="50%" valign="top" height="25">&nbsp;</td>
   </tr>      
 	 <tr>
     <td width="950px" colspan="2">
  		 <table border="0" width="950px" cellspacing="0" cellpadding="0" class="todotab_yellowbox"  >
  		 <tr>
				<td align="left" valign="top"><br>
					<div id='tempDiv'></div>
					<div id="QuoteDiv" style="display:none">

					</div>
				</td>
		</tr>
		<tr>
	     <td width="760px" colspan="2">
	  		 <table border="0" width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td align="left" valign="top"><br>
					<div id="SubjectivityDiv" style="display:none">
							<div id='LoaderIndicator' style="display:none">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
							Loading....
							</div>
							<html:hidden property="answer(Object::Quote::ProductId)" styleId="productId1" value="<%=""+prodId%>" />
							<html:hidden property="answer(Object::Quote::ProductVerId)" styleId="productVerId1" value="<%=""+ProductVerId%>" />
							<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" styleId="parentQuoteId1" />
							<html:hidden styleId="parentQuoteVerId" property="answer(parentQuoteVerId)" value="<%=""+parentQuoteVerId %>"/>
							<html:hidden property="answer(Object::Quote::SubQuoteId)" value="<%=""+strSubQuoteId1%>" styleId="subQuoteId1" />
							<html:hidden styleId="subQuoteVerId" property="answer(subQuoteVerId)" value="<%=strSubQuoteVerId1 %>"/>
							<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId1" value="<%=""+customerId%>" />
							<html:hidden styleId="ownerId" property="answer(ownerId)" value="<%=""+ownerId %>"/>
							<html:hidden property="answer(Object::Quote::QuoteStatus)" styleId="paretQuoteStatus1" value="<%=""+paretQuoteStatus%>" />
										<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																		
										<tr><td align="left">
											<div>&nbsp;</div>
											<div style="margin-left:10px">Pre-Bind Subjectivities</div>
											<div>&nbsp;</div>
										</td></tr>																	
										<tr>
											<td>
											<form id="prebindSubjectivityMap">
												<html:hidden property="subjectivityObjectType" value="Subjectivity" styleId="subjectivityObjectType"/>
												<html:hidden property="subjectivityAlertObjectType" value="Quote" styleId="subjectivityAlertObjectType"/>
												<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
													<tr class="locformhead1">
										                 <td class="dataSubjcolhead" width="100%" >
															<table border="0" id="table5" cellspacing="0" cellpadding="0">
																<tr>
																<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
																property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
																<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
																	<td >																		
																		<select onchange="if(this.value != '') {updateSubjectivityStatus(this.form,this,'PreBindSubjctivtyId')}" name="answer(Object::Subjectivity::Status)">
																		<option value='' selected>Change Status</option>
																		<option value="Open">Open</option>
																		<option value="Satisfied">Satisfied </option>
																		<option value="Overridden">Move to Post-Bind</option>
																		<option value="Not Required">Not Required </option>																		
																		<option value="Rejected">Rejected</option>																		
																		</select>
																	</td>
																	</dmshtml:dms_static_with_connector>
																	</dmshtml:isFeatureAvailableForProductRoleStatus>
																	<td>
																		<table border="0" align=right>
																			<tr>
																				<td><a href="javascript:void(0)" onclick="document.getElementById('subjectivityAlertObjectType').value='Quote';document.getElementById('subjectivityObjectType').value='QuotePreBindSubjectivity';showAttach('<%=""+parentQuoteId %>','0','Subjectivity');document.getElementById('subjectivityObjectType').value='Subjectivity';" class="button2" style="width:100px">Attach Document</a></td>
																				<td><a href="javascript:void(0)" class="button2" onclick="showSubjectivityNotes('<%=""+parentQuoteId %>','0','Subjectivity');" class="button2" style="width:100px">Enter Diary Note</a></td>
																				<td>&nbsp;&nbsp;&nbsp;</td>
																			</tr>
																		</table>							
																	</td>
																	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
																	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
																property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
																	<td >
																		<table border="0" align=right>
																			<tr>
																				<td><a href="javascript:void(0);" class="button2" onclick="showManuscriptSubjectivity('<%=""+prodId%>','<%=""+ProductVerId%>','<%=strSubQuoteVerId1 %>','<%=""+strSubQuoteId1%>','<%=parentQuoteVerId %>','<%=""+customerId%>','<%=""+paretQuoteStatus%>','<%=""+parentQuoteId%>');" style="width:125px">Create Manuscript</a></td>
																			</tr>
																		</table>							
																	</td>
																	</dmshtml:isFeatureAvailableForProductRoleStatus>
																	</dmshtml:dms_static_with_connector>
																</tr>
															</table>
															</td>														
										                 <td class="dataSubjcolhead" width="7%">&nbsp;</td>
										                 <td class="dataSubjcolhead" width="10%">&nbsp;</td>
										               </tr>
													<tr>
														<td><div id="PRE_BIND_LIST_TABLE" style="word-wrap:break-word;"></div></td>
													</tr>																													
												</table>																																					
											</form>
											</td>
										</tr>
										<tr><td>&nbsp;</td></tr>																			
										</table>																	
										<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																		
										<tr><td align="left">											
											<div style="margin-left:10px">Post-Bind Subjectivities</div>
											<div>&nbsp;</div>
										</td></tr>																	
										<tr>
											<td>
											<form id="postbindSubjectivityMap">												
												<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
													<tr class="locformhead1">
										                 <td class="dataSubjcolhead" width="100%" >
															<table border="0" id="table5" cellspacing="0" cellpadding="0">
																<tr>
																<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
																property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
																<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
																	<td >
																		
																		<select onchange="if(this.value != '') {updatePostSubjectivityStatus(this.form,this,'PostBindSubjctivtyId')}" name="answer(Object::Subjectivity::Status)">
																		<option value='' selected>Change Status</option>
																		<option value="Open ">Open</option>
																		<option value="Satisfied">Satisfied </option>
																		<option value="Overridden">Move to Pre-Bind</option>
																		<option value="Not Required ">Not Required </option>																		
																		<option value="Rejected">Rejected</option>
																		<option value="Post Issuance">Post Issuance</option>																		
																		</select>																	
																	</td>
																	</dmshtml:dms_static_with_connector>
																	</dmshtml:isFeatureAvailableForProductRoleStatus>
																	<td>
																		<table border="0" align=right>
																			<tr>
																				<td><a href="javascript:void(0)" onclick="document.getElementById('subjectivityAlertObjectType').value='Quote';document.getElementById('subjectivityObjectType').value='QuotePostBindSubjectivity';showAttach('<%=""+parentQuoteId %>','0','Subjectivity');document.getElementById('subjectivityObjectType').value='Subjectivity';" class="button2" style="width:100px">Attach Document</a></td>
																				<td><a href="javascript:void(0)" class="button2" onclick="showSubjectivityNotes('<%=""+parentQuoteId %>','0','Subjectivity');" style="width:100px">Enter Diary Note</a></td>
																				<td>&nbsp;&nbsp;&nbsp;</td>
																			</tr>
																		</table>							
																	</td>
																	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
																	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="SUBJECTIVITY_AVILABLE" 
																property='<%=new String[]{"In Progress","Offered","Bind Request","Referred","Submitted"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
																	<td >
																		<table border="0" align=right>
																			<tr>
																				<td><a href="javascript:void(0)" class="button2" onclick="showManuscriptSubjectivity('<%=""+prodId%>','<%=""+ProductVerId%>','<%=strSubQuoteVerId1 %>','<%=""+strSubQuoteId1%>','<%=parentQuoteVerId %>','<%=""+customerId%>','<%=""+paretQuoteStatus%>','<%=""+parentQuoteId%>');" style="width:125px">Create Manuscript</a></td>
																			</tr>
																		</table>							
																	</td>
																	</dmshtml:isFeatureAvailableForProductRoleStatus>
																	</dmshtml:dms_static_with_connector>
																</tr>
															</table>
															</td>														
										                 <td class="dataSubjcolhead" width="7%">&nbsp;</td>
										                 <td class="dataSubjcolhead" width="10%">&nbsp;</td>
										               </tr>
													<tr>
														<td><div id="POST_BIND_LIST_TABLE" style="word-wrap:break-word;"></div></td>																			
													</tr>																													
												</table>
												</form>																																					
											</td>
										</tr>
										<tr><td>&nbsp;<div id='frame' style="display:none"><iframe onload="hideAttachPopup()" src="../common/MessageFromRule.jsp" id='upload_target_iFrame' name='upload_target_iFrame'   style='width:300px;height:30px;border:1px solid #ccc;'></iframe></div></td></tr>																			
										</table> 
										<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																		
											<tr><td align="left">												
												<div style="margin-left:10px">Attached Files</div>
												<div>&nbsp;</div>
											</td></tr>
											<tr><td>
											<form name="AttachmentListMainFrm" id="AttachmentListMainFrmId">
											<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
											<tr class="locformhead1">
											 <td class="datadispcolhead" width="100%" >										
												<table border="0" id="table5" cellspacing="0" cellpadding="0">
			               						 	<tr>
			               						 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
				               						 	<td>		               						 
															<select name="answer(Object::Attachment::ApprovalStatus)" onchange="if(this.value != '') {attachmentStatusChangeMain('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity',this)}">
																<option value="" Selected>Change Status</option>
																<option value="Accepted">Accept</option>
																<option value="Rejected">Reject</option>
															</select>
														</td>	
														</dmshtml:dms_static_with_connector>
														<td>&nbsp;&nbsp;</td>
														<td><a href="javascript:void(0)" onclick="document.getElementById('subjectivityAlertObjectType').value='Quote';document.getElementById('subjectivityObjectType').value='QuoteSubjectivity';showAttach('<%=""+parentQuoteId %>','0','Subjectivity');document.getElementById('subjectivityObjectType').value='Subjectivity';" class="button2" style="width:100px">Attach Document</a></td>													
														<td>&nbsp;&nbsp;</td>
														<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
														<td>
															<a href="javascript:void(0)" onclick="deleteMainAttachment('<%=""+parentQuoteId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a>
														</td>
														</dmshtml:dms_static_with_connector>
													</tr>
												</table>
											</td></tr>
											<tr><td><div id="ATTACHMENT_LIST_MAIN" style="word-wrap:break-word;"></div></td></tr>
											</table>
											</form>
											</td></tr>	
										</table>	
										<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">																		
											<tr><td align="left">												
												<div style="margin-left:10px">Diary Notes</div>
												<div>&nbsp;</div>
											</td></tr>
											<tr><td>
											<form name="NotesListMainFrm" id="NotesListMainFrm">
											<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
											<tr class="locformhead1">
											 <td class="datadispcolhead" width="100%" >										
												<table border="0" id="table5" cellspacing="0" cellpadding="0">
				               						 	<tr>
				               						 	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EDIT_SUBJECTIVITY"}%>' connector='or' negated="true">
					               						 	<td>		               						 
																<select onchange="if(this.value != '') {notesStatusChangeMain('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity',this)}" name="answer(Object::Notes::ApprovalStatus)">
																	<option value="" Selected>Change Status</option>
																	<option value="Accepted">Accept</option>
																	<option value="Rejected">Reject</option>																
																</select>
															</td>	
															</dmshtml:dms_static_with_connector>
															<td>&nbsp;&nbsp;</td>			
															<td><a href="javascript:void(0)" class="button2" onclick="showSubjectivityNotes('<%=""+parentQuoteId %>','0','Subjectivity');" style="width:100px">Enter Diary Note</a></td>											
															<td>&nbsp;&nbsp;</td>
															<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DELETE_ATTACHMENT_NOTES"}%>' connector='or' negated="true">
															<td align="left">
																<a href="javascript:void(0)" onclick="deleteMainNotes('<%=""+parentQuoteId %>','0','Subjectivity','<%=""+ownerId %>');" class="button2" style="width:100px">Delete</a>
															</td>
															</dmshtml:dms_static_with_connector>
														</tr>
													</table>
											</td></tr>
											<tr><td><div id="NOTES_LIST_MAIN" style="word-wrap:break-word;"></div></td></tr>
											</table>
											</form>
											</td></tr>	
										</table>																																														
					</div>
				</td>
			</tr>
			</table>
			</td>
			</tr>
			<tr>
				<td align="left" valign="top">
	<div id="DocumentDiv" style="display:none" >
			<div align="left" >&nbsp; Core Documents</div>
				<div class="frlabel3 left">
					&nbsp;
				</div>
				<div class="frinfo3 left" style="width:450px">
					
		<%
			String quoteStatus = ""+paretQuoteStatus.toString();
		if((quoteStatus.equalsIgnoreCase("Bound") || quoteStatus.equalsIgnoreCase("Issued"))){%>
		<dmshtml:GetDocumentName nameInSession="PolDocLoc1"
						quoteId="<%=""+parentQuoteId%>" documentType="BINDER"
						ownerId='<%=""+ownerId %>'
						dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
					<logic:present name="PolDocLoc1">
					
					<%
				 	java.util.ArrayList arrPolDoc= (java.util.ArrayList)request.getAttribute("PolDocLoc1");
					%>
					<table>
					
					<%if((arrPolDoc !=null) && (arrPolDoc.size()>0)){ 
					for(int docIndex=0;docIndex<arrPolDoc.size();docIndex++){		
						com.dms.ejb.notification.email.EmailAttachmentDetail polDocDetail=(com.dms.ejb.notification.email.EmailAttachmentDetail)arrPolDoc.get(docIndex);
						String proposalPDFDisplayed = "N";
						String fileName=""+polDocDetail.getAttachementName();
		 
					%>
								
						<tr>
		<%if( proposalPDFDisplayed.equals("N")&& fileName.indexOf("PROPOSAL") !=-1){%>
					 		<td>
							
							Quote : 
							
							</td>
							
					 		<%}else if(proposalPDFDisplayed.equals("N")&& fileName.indexOf("Proposal") !=-1){%>
					 			
					 			<td>
							
									Quote : 
							
								</td>
					 		<%}if( proposalPDFDisplayed.equals("Y")&& fileName.indexOf("PROPOSAL") !=-1){ %>
					 		
					 		<tr>
					 		<td>
					 		&nbsp;
					 		</td>
					 		<%} if(fileName.indexOf("PROPOSAL") !=-1) { %>
							<td>
								
									<%proposalPDFDisplayed = "Y";%>
									
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getEmailAttachementURL()%>')">
									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
		 							<%=""+polDocDetail.getAttachementName()%>
									</a>
	
							</td>
							<%} else if(fileName.indexOf("Proposal") !=-1) { %>
							<td>
								
									<%proposalPDFDisplayed = "Y";%>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getEmailAttachementURL()%>')">
									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
		 							<%=""+polDocDetail.getAttachementName()%>
									</a>
							</td>
							<%} %>
							<%if(proposalPDFDisplayed.equals("Y")){ %>
					 		</tr>
					 		<%} %>
						
						</tr>
						<tr>
							
							<%if(fileName.indexOf("BINDER") !=-1) {%>
					 		<td>
							
							Binder : 
							
							</td>
							<%}else if(fileName.indexOf("Binder") !=-1) {%>
					 		<td>
							
							Binder : 
							
							</td>
							<%} %>
							
								<%if(fileName.indexOf("BINDER") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getEmailAttachementURL()%>')">
									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
		 							<%=""+polDocDetail.getAttachementName()%>
									</a>
								</td>
								<%}else  if(fileName.indexOf("Binder") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getEmailAttachementURL()%>')">
									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
		 							<%=""+polDocDetail.getAttachementName()%>
									</a>
								</td>
								<%}%>
							
							
						
						</tr>
						
						<tr>
							
						
							
						<%if(fileName.indexOf("ISSUANCE") !=-1) {%>
					 		<td>
								Issuance :
							</td>
							<%}else if(fileName.indexOf("Issuance") !=-1) {%>
					 		<td>
							Issuance :
						</td>
						<%}
					 		
							if(fileName.indexOf("ISSUANCE") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getEmailAttachementURL()%>')">
									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
		 							<%=""+polDocDetail.getAttachementName()%>
									</a>
								</td>
								<%} else if(fileName.indexOf("Issuance") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getEmailAttachementURL()%>')">
									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
		 							<%=""+polDocDetail.getAttachementName()%>
									</a>
							</td>
							<%} %>						
						
						</tr>
						
						<tr>
							
						
							
						<%if(fileName.indexOf("CERTIFICATE") !=-1) {%>
					 		
					 		<td>
								Certificate :
							</td>
							<%} else if(fileName.indexOf("Certificate") !=-1) {%>
					 		
					 		<td>
								Certificate :
							</td>
							<%} %>
							
							<%if(fileName.indexOf("CERTIFICATE") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getEmailAttachementURL()%>')">
									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
		 							<%=""+polDocDetail.getAttachementName()%>
									</a>
								</td>
								<%} else if(fileName.indexOf("Certificate") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+polDocDetail.getEmailAttachementURL()%>')">
									<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
		 							<%=""+polDocDetail.getAttachementName()%>
									</a>
							</td>
							<%}%>
								
							
						
						
						</tr>
				
			<%}
		}%>
						<tr>
							<td>
								Application :
							</td>
						
							<td>
							
							<a href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= parentQuoteId.toString()%>&answer(subQuoteId)=<%=strSubQuoteId1.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteStatus)=<%=paretQuoteStatus.toString()%>' target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application PDF</a>
							
							</td>
						
						
	</tr>
	
	
	</table>
						
</logic:present>
		
<%} else {%>
		<dmshtml:GetQuoteDocumentName nameInSession="QuoteDocLoc"
			quoteId="<%=""+parentQuoteId%>" documentType="PROPOSAL"
			ownerId='<%=""+ownerId %>'
			dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		<logic:present name="QuoteDocLoc">
		
		<%
	 	java.util.ArrayList arrQuoteDoc= (java.util.ArrayList)request.getAttribute("QuoteDocLoc");
		%>
		<table>
		
				
		<%if((arrQuoteDoc !=null && arrQuoteDoc.size()>0)){ 
		for(int docIndex=0;docIndex<arrQuoteDoc.size();docIndex++){		
			com.dms.ejb.documentlocation.QuoteDocumentLocationDetail quoteDocDetail=(com.dms.ejb.documentlocation.QuoteDocumentLocationDetail)arrQuoteDoc.get(docIndex);
			String proposalPDFDisplayed = "N";
			String fileName=""+quoteDocDetail.getQuoteDocumentName();
		%>
		
		<tr>
		<%if( proposalPDFDisplayed.equals("N")&& fileName.indexOf("PROPOSAL") !=-1){%>
					 		<td>
							
							Quote : 
							
							</td>
							
					 		<%}else if(proposalPDFDisplayed.equals("N")&& fileName.indexOf("Proposal") !=-1){%>
					 			
					 			<td>
							
									Quote : 
							
								</td>
					 		<%}if( proposalPDFDisplayed.equals("Y")&& fileName.indexOf("PROPOSAL") !=-1){ %>
					 		
					 		<tr>
					 		<td>
					 		&nbsp;
					 		</td>
					 		<%} if(fileName.indexOf("PROPOSAL") !=-1) { %>
							<td>
								
									<%proposalPDFDisplayed = "Y";%>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+quoteDocDetail.getDocumentUrl()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
											<%=""+quoteDocDetail.getQuoteDocumentName()%>
									</a>
	
							</td>
							<%} else if(fileName.indexOf("Proposal") !=-1) { %>
							<td>
								
									<%proposalPDFDisplayed = "Y";%>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+quoteDocDetail.getDocumentUrl()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
											<%=""+quoteDocDetail.getQuoteDocumentName()%>
									</a>
	
							</td>
							<%} %>
							<%if(proposalPDFDisplayed.equals("Y")){ %>
					 		</tr>
					 		<%} %>
						
						</tr>
						<tr>
							
							<%if(fileName.indexOf("BINDER") !=-1) {%>
					 		<td>
							
							Binder : 
							
							</td>
							<%}else if(fileName.indexOf("Binder") !=-1) {%>
					 		<td>
							
							Binder : 
							
							</td>
							<%} %>
							
								<%if(fileName.indexOf("BINDER") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+quoteDocDetail.getDocumentUrl()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
											<%=""+quoteDocDetail.getQuoteDocumentName()%>
									</a>
								</td>
								<%}else  if(fileName.indexOf("Binder") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+quoteDocDetail.getDocumentUrl()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
											<%=""+quoteDocDetail.getQuoteDocumentName()%>
									</a>
								</td>
								<%}%>
							
							
						
						</tr>
						
						<tr>
							
						
							
						<%if(fileName.indexOf("ISSUANCE") !=-1) {%>
					 		<td>
								Issuance :
							</td>
							<%}else if(fileName.indexOf("Issuance") !=-1) {%>
					 		<td>
							Issuance :
						</td>
						<%}
					 		
							if(fileName.indexOf("ISSUANCE") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+quoteDocDetail.getDocumentUrl()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
											<%=""+quoteDocDetail.getQuoteDocumentName()%>
									</a>
								</td>
								<%} else if(fileName.indexOf("Issuance") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+quoteDocDetail.getDocumentUrl()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
											<%=""+quoteDocDetail.getQuoteDocumentName()%>
									</a>
							</td>
							<%} %>						
						
						</tr>
						
						<tr>
							
						
							
						<%if(fileName.indexOf("CERTIFICATE") !=-1) {%>
					 		
					 		<td>
								Certificate :
							</td>
							<%} else if(fileName.indexOf("Certificate") !=-1) {%>
					 		
					 		<td>
								Certificate :
							</td>
							<%} %>
							
							<%if(fileName.indexOf("CERTIFICATE") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+quoteDocDetail.getDocumentUrl()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
											<%=""+quoteDocDetail.getQuoteDocumentName()%>
									</a>
								</td>
								<%} else if(fileName.indexOf("Certificate") !=-1) {%>
								<td>
									<a href="javascript:void(0);" onClick="javascript:window.open('<%="../"+quoteDocDetail.getDocumentUrl()%>')">
										<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
											<%=""+quoteDocDetail.getQuoteDocumentName()%>
									</a>
							</td>
							<%}%>
								
							
						
						
						</tr>
				
			<%}
		}%>
						<tr>
							<td>
								Application :
							</td>
						
							<td>
							
							<a href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= parentQuoteId.toString()%>&answer(subQuoteId)=<%=strSubQuoteId1.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(QuoteStatus)=<%=paretQuoteStatus.toString()%>' target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">Application PDF</a>
							
							</td>
						
						
	</tr>
	
	
	</table>
	
	
	
</logic:present>
<% //} 
}%>
	</div>
	
<table><tr><td>
				
	Attached Files
		<div id="QUOTE_ATTACHMENT_LIST" style="word-wrap:break-word;"></div>
		

<a href="javascript:void(0)" onclick="showAttach('<%=""+parentQuoteId %>','0','QUOTE');" class="button2" style="width:100px">Add File</a>

<table>
<tr><td></td></tr>
<tr><td><div id="AttachFiles"></div></td></tr>
<tr><td><div id="AddNotespopup" style="display:none"></div></td></tr>
</table>
<br>
Diary Notes
<br>
		<div id="QUOTE_NOTES_LIST" style="word-wrap:break-word;"></div>
<a href="javascript:void(0)" onclick="showNotes('<%=""+parentQuoteId %>','0','Quote');" class="button2" style="width:100px">Add Notes</a>

 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>' connector='or' negated="true">

			<br>
			Email
			<br>
		<div id="QUOTE_EMAIL_LIST" style="word-wrap:break-word;"></div>
		<a href="javascript:void(0)" onclick="sendEmailDetails();" class="button2" style="width:100px">Compose Email</a>
</dmshtml:dms_static_with_connector>


<script type="text/javascript">

var iframe = document.getElementById("upload_target_iFrame");
if (iframe.addEventListener) {
  iframe.addEventListener("load", hideAttachPopup, false);  // firefox
} else if (iframe.attachEvent) {
  iframe.attachEvent("onload", hideAttachPopup);  // IE
}
</script>
				
	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EXPORT_XML"}%>' connector='or' negated="true">
	
	</dmshtml:dms_static_with_connector>

	</td></tr></table>		
				</div>				
				</td>
			  </tr>
		</table>
     </td>
   </tr>
 </table>
</div>
    
	<html:hidden property="answer(Object::UserDetail::email)" value='<%=""+email%>' styleId="email"/>
	<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleName"/>
	<html:hidden property="answer(Object::Notification::Email::ObjectType)" value="QUOTE" styleId="EmailType"/>
	<html:hidden property="answer(Object::Quote::QuoteSubNumber)" value='<%=""+QuoteSubNumber%>' styleId="QuoteSubNumber"/>
	<html:hidden property="page1" value='<%"7" %>' />
	<html:hidden property="answer(Quote::Page)" value="QUOTE SUMMURY" />
	<html:hidden property="answer(QuoteId)" value='<%=""+parentQuoteId%>' />
	<html:hidden property="answer(parentQuoteId)" value='<%=""+parentQuoteId%>' />	
	<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+customerId%>' />
	<html:hidden property="answer(Object::Agency::AgencyId)" styleId="AgencyId_hidden" value='<%=""+agencyId%>' />
	<html:hidden property="answer(ownerId)" value="<%=""+ownerId%>" />
	<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="answer(Object::Quote::dbName)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
	<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" styleId="userId1"/>
	<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::PlanFactor::UpdatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::PlanFactor::CreatedBy)" value="<%=userId.toString()%>" />
	<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=paretQuoteStatus.toString()%>" styleId="quoteStatustemp" />
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value="<%=""+paretQuoteStatus%>" />
	<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
	<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%= ""+ProductVerId%>" />
	<html:hidden property="answer(isUpdated)" value="Y" />
	<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
	<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Quote"%>" styleId="Quote"/>
	<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Quote Management"%>" styleId="QuoteManagement"/>
	<html:hidden property="answer(pagename)" value="Quote summary" />
	<html:hidden property="answer(Object::Quote::PaymentPlan)" value='<%=""+paymentPlan%>' />
	<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+customerId %>" />
	<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" >
	<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DrugUWFactor)" value="<%=""+DrugUWFactor%>" />
	</dmshtml:dms_isPresent>
	<%if(!editableQuoteHeader) {%>
		<html:hidden property="answer(Object::Quote::QuoteStartDate)" value="<%=""+quoteStartDate%>" styleId="effDate"/>
		<html:hidden property="answer(Object::Quote::HelthHra)" value="<%=""+HelthHra%>" />
		<html:hidden property="answer(Object::Quote::CompositeRate)" value="<%=""+CompositeRate%>" />
		<html:hidden property="answer(Object::Quote::AreaNetWorkKey)" value="<%=""+AreaNetWorkKey%>" />
		<html:hidden property="answer(Object::PlanFactor::MedicalUWFactor)" value="<%=""+MedicalUWFactor%>" />
	<html:hidden property="answer(Object::PlanFactor::DrugUWFactor)" value="<%=""+DrugUWFactor%>" />
	<%}%>
	<%if(!modifyQuoteType) {%>		
		<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+QuoteType%>" />
	<%}%>
	<html:hidden property="answer(Object::Quote::QuoteType)" value="<%=""+QuoteType%>" />
	
	<html:hidden property="answer(subjectivityAlertObjectType)" value="Subjectivity" styleId="subjectivityAlertObjectType"/>
	<html:hidden property="answer(Object::Quote::PolicyNumber)" value="<%=""+policyNumber%>" styleId="policyNumber"/>
	<html:hidden property="answer(SubjectivityParentObjectType)" value="QUOTE" styleId="SubjectivityParentObjectType" />
	<html:hidden property="answer(AgentId)" value="<%=""+policyNumber%>" />
	<html:hidden property="answer(Object::Quote::CustomerId1)" value='<%=""+customerId%>' styleId="customerId" />
	<html:hidden property="answer(Object::Quote::agencyId1)" value='<%=""+agencyId%>' styleId="agencyId" />
	<html:hidden property="answer(Object::Quote::prodId1)" value='<%=""+prodId%>' styleId="prodId" />
	<html:hidden property="answer(Object::Quote::ProductVerId1)" value='<%=""+ProductVerId%>' styleId="ProductVerId" />
	<html:hidden property="answer(Object::Quote::GroupId1)" value='<%=""+GroupId%>' styleId="GroupId" />
	<html:hidden property="answer(Object::Quote::ownerId1)" value='<%=""+ownerId%>' styleId="ownerId" />
	<html:hidden property="answer(Object::Quote::GroupVerId1)" value='<%=""+GroupVerId%>' styleId="GroupVerId" />
	<html:hidden property="answer(Object::Quote::parentQuoteId1)" value='<%=""+parentQuoteId%>' styleId="parentQuoteId" />
	<html:hidden property="answer(Object::Quote::productStatus1)" value='<%=""+productStatus%>' styleId="productStatus" />
	<html:hidden property="answer(Object::Quote::CustomerState1)" value='<%=""+CustomerState%>' styleId="CustomerState" />
	<html:hidden property="answer(Object::Quote::ProductFamilyId1)" value='<%=""+ProductFamilyId%>' styleId="ProductFamilyId" />
	<html:hidden property="answer(Object::Quote::parentQuoteVerId1)" value='<%=""+parentQuoteVerId%>' styleId="parentQuoteVerId" />
	<html:hidden property="answer(Object::Quote::UserId1)" value='<%=""+userId%>' styleId="userId" />
	<html:hidden property="answer(Object::Quote::subQuoteProductId1)" value='<%=""+subQuoteProductId1%>' styleId="subQuoteProductId1" />
	<html:hidden property="answer(Object::Quote::QuoteType)" value='<%=""+QuoteType%>' styleId="QuoteType1" />
	<html:hidden property="answer(Object::Quote::QuoteNumber)" value='<%=""+QuoteNumber%>' styleId="QuoteNumber1" />
	<html:hidden property="answer(Object::Quote::State)" value='<%=""+State%>' styleId="State1" />
	<html:hidden property="answer(Object::Quote::QuoteStatus)" value='<%=""+paretQuoteStatus%>' styleId="paretQuoteStatus" />
	<html:hidden property="answer(Object::Quote::isEndorsementQuote)" value="false" styleId="isEndorsementQuote" />
	<%if(request.getAttribute("Object::Clearance::NoRecords") != null){
		String clearnceStatus = ""+request.getAttribute("Object::Clearance::NoRecords");%>
		<html:hidden property="answer(Object::Clearance::NoRecords)" value='<%=""+clearnceStatus%>' styleId="clearnceStatus1" />
	<%} %>
<dmshtml:get_all_risk_types nameInSession="riskTypeList" ownerId='<%=ownerId+""%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
							
		<bean:define id="riskTypeList" name="riskTypeList" type="java.util.ArrayList"/>
	
<!-- Div for add tank pop-up -->

<div id="AddTankDialog" style="display:none;">
	<div class="hd">Please enter Tank Information

	</div>
	<div class="bd">

	<table>
	
		<tr>
	
			<td class="FormLabels" align="left">Tank Type</td>
			
			<td>
				<select class="txtbox" name="answer(Object::Risk::RiskType__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_TYPE)" id="RiskSelection" >	
					<option value =''>Select</option>	
					<%
					if(riskTypeList!=null){
						for(int i=0;i<riskTypeList.size();i++) {
							com.dms.ejb.data.QuestionHashMap riskTypeMap=(com.dms.ejb.data.QuestionHashMap)riskTypeList.get(i);	
					%>
									
						<%String riskType=riskTypeMap.getString("Object::Risk::RiskTypeName");%>
						<%String riskTypeDesc=riskTypeMap.getString("Object::Risk::RiskTypeDesc");%>
						<option value ='<%=riskType%>'><%=riskTypeDesc %></option>											
						<%}
					}%>	 																												
				</select>
	
			</td>
			<td>
			
	  </td>
	
			
		</tr>
		
		<tr>
			<td class="FormLabels" align="left"> 
			  Tank Name
			</td>
			<td>
			  <input type="textbox" name="answer(Object::Risk::RiskName__DMS_SUBMISSION_RISK_STORAGE_TANK~RISK_NAME)" size="60" id="tankname" />
			</td>
			
			
		</tr>
		
		<td class="FormLabels" align="left"> 
			  Tank Description
			</td>
			<td>
			 <textarea rows="4" cols="50" 
			 id="LocationDescription" height="4" width="30" maxlength="100" 
			 name="answer(Object::Location::LocationDescription__DMS_SUBMISSION_LOCATION~LOCATION_DESCRIPTION)" >
			 </textarea>
			</td>
		<tr>
		<td class="Links">
		&nbsp;&nbsp;<html:button  property="answer()" styleId="SubmitRisk" onclick="AddRisk1();" value="Add Tank"/>
		</td>
		<td class="Links">
		&nbsp;<html:button  property="answer()" styleId="CancelRisk" value="Cancel"/>
		</td>
	
		</tr>
	</table>
</div>
<a class="container-close" href="javascript:void(0);" id="closeIcon1"></a>

</div>
	
   <!-- Div for edit location and tank pop-up -->
	
<%if(request.getAttribute("locationListArraySize") !=null){ %>
<html:hidden property="answer(locationListArraySize)" value='<%=""+request.getAttribute("locationListArraySize")%>' styleId="locationListArraySize1" />
<%} %>


<%String IsApplicationEnabled1="N";
String htmlpage1 = "";
%>
			
		<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=paretQuoteStatus.toString()%>" negated="true">
					
					<%IsApplicationEnabled1="Y";%>
		</dmshtml:dms_isPresent>

<%
String activeTabName = "";
String subjectivityIdFromAlert = "";
if(request.getParameter("answer(activeTabName)") != null){
 	activeTabName = ""+request.getParameter("answer(activeTabName)");
}
if(request.getParameter("answer(QuoteSubjectivityIdFromAlert)") != null){
	subjectivityIdFromAlert = ""+request.getParameter("answer(QuoteSubjectivityIdFromAlert)");
}
if(activeTabName.equals("General_Questions_Tab")){
	com.dms.ejb.data.QuestionHashMap qMap1 = new com.dms.ejb.data.QuestionHashMap();
	qMap1.put("riskTerritory","0");
	qMap1.put("teritory","0");
	qMap1.put("Object::Quote::PrevSubQuoteVerId",""+docSubQuoteVerId);
	qMap1.put("QuoteId",""+parentQuoteId);
	qMap1.put("ParentQuoteId",""+parentQuoteId);
	qMap1.put("Object::Agency::AgencyId",""+agencyId);
	qMap1.put("CustomerId",""+customerId);
	qMap1.put("subQuoteId",""+docSubQuoteId);
	qMap1.put("customerId",""+customerId);
	qMap1.put("SubQuoteId",""+docSubQuoteId);
	qMap1.put("ParentQuoteId",""+parentQuoteId);
	qMap1.put("ParentQuoteVerId",""+parentQuoteVerId);
	request.setAttribute("ApplicationMap",qMap1);
	%>


	<dmshtml:DisplayApplication nameInSession="Application"   ownerId='<%=ownerId.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
	objectVerId="0" objectName='<%="GENERAL QUESTION"%>' applicationType="QUOTE" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveGeneralQuestionApp3.0.go?" isApplicationEnabled='<%=""+IsApplicationEnabled1 %>'  showOneTabAtTime="N"/>
	<logic:present name="Application" scope="request">

	<bean:define id="htmlPage" name="Application"
			type="java.lang.StringBuffer" />
			<% htmlpage1 = htmlPage.toString();
					%>
			<html:hidden property="answer(htmlpage)" value='<%=""+htmlpage1 %>' styleId="apphtmlpage"/>
			
	</logic:present>
	<%} %>


<logic:present name="OPTIONS_HTML" scope="request">
	<!-- To Load Coverage and Limits Tab Content when the "OPTIONS_HTML" Request Present -->	 
	<div id="coveragesAndLimitsTabDivId" style="display:none">
	 <jsp:include page="../quote/PlanOptionCriteriaEIL.jsp" />
	</div>
	<script type="text/javascript">
	    document.getElementById("QuoteDiv").style.display = "block";
	    activateQuoteTabs("CoveragesLimitsTab");
	    enableTabs();
		document.getElementById("QuoteDiv").innerHTML = document.getElementById("coveragesAndLimitsTabDivId").innerHTML;
	</script>
</logic:present>
<logic:notPresent name="OPTIONS_HTML" scope="request">
	<script type="text/javascript">
		<%if(activeTabName.equals("Coverage_Limits_Tab")){%>
			loadCoverageAndLimitsTab("CoveragesLimitsTab");
		<%}%>
	</script>
</logic:notPresent>

</div>

<Script type="text/javascript">
tooltipYOffsetfromPage = '25';
tooltipXOffsetfromPage = '100';
initDocumentDialog();//to init Documenty pop-up
</script>
<script type="text/javascript">
		
</script>



<script type="text/javascript">
<%if(activeTabName.equals("General_Questions_Tab")){ %>
	
		loadGeneralQuestionsTab("GeneralQuestionTab");
	
<%}if(activeTabName.equals("Location_Tank_Tab")){ %>
	
	loadQuoteLocationList("LocationTankTab");

<%}if(activeTabName.equals("Rating_Detail_Tab")){%>

	loadRatingDetailTab("RatingDetailTab");
	
<%}%>

<%if(activeTabName.equals("UW_WORKSHEET_Tab")){

 	String activeTabNameProposal=""+request.getParameter("answer(activeTabNameProposal)");
 	
 	if(activeTabNameProposal.equals("DocumentationTab")){%>
 		loadDocumentTab("DocumentationTab","../attachment/QuoteAttachmentResult.jsp","../notes/NotesResult.jsp","../email/SentEMailListUI3.jsp");
 	<%}else{%>
		loadUWWorkSheetTab("UWWorkSheetTab");
	<%}%>
<%}%>
<%if(activeTabName.equals("Schedule_of_Forms_Tab")){%>

	loadScheduleofFormsTabV2("ScheduleofFormsTab");

<%}%>
<%if(activeTabName.equals("SubjectivityTab")){%>
	document.getElementById("QuoteDiv").style.display = "block";
	loadSubjectivityTab("SubjectivityTab");refereshPreBindList();refereshPostBindList();refereshMultiAttachmentList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');refereshMultiNotesList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');enableTabs();	
	<%if(subjectivityIdFromAlert.length()>0){%>
	 initSubjectivityDetailDialog();
		getSubjectivityDetailpopup('<%=""+subjectivityIdFromAlert%>');
	<%}%>
<%}%>
<%if(activeTabName.equals("")){ %>
	
loadDocumentTab("DocumentationTab","../attachment/QuoteAttachmentResult.jsp","../notes/NotesResult.jsp","../email/SentEMailListUI3.jsp");
	
<%}%>

<%if(activeTabName.equals("DocumentationTab")){ %>
	
loadDocumentTab("DocumentationTab","../attachment/QuoteAttachmentResult.jsp","../notes/NotesResult.jsp","../email/SentEMailListUI3.jsp");
	
<%}%>

function AJAXRateAndSave() {
	if(validateCoverages(document.getElementById('SaveTop').form)) {
		

		autologout();
		new Ajax.Updater('QuoteSummaryPage','/AJAXRateEILV2.do',{synchronous:true, parameters:$(document.getElementById('SaveTop').form).serialize(this),
			onLoading:function(){
				if(document.getElementById('fc').value == 'Save') {
					document.getElementById("savingcontent1").style.display ="block";document.getElementById("savingcontent2").style.display ="block";
				}
				if(document.getElementById('fc').value == 'Rate') {
					document.getElementById("loadercontent1").style.display ="block";document.getElementById("loadercontent2").style.display ="block";
				}
				if(document.getElementById('RateTop') != null && document.getElementById('RateTop') != undefined) {
					document.getElementById('RateTop').disabled = true;
				}
				if(document.getElementById('RateBottom') != null && document.getElementById('RateBottom') != undefined) {
					document.getElementById('RateBottom').disabled = true;
				}
				if(document.getElementById('SaveBottom') != null && document.getElementById('SaveBottom') != undefined) {
					document.getElementById('SaveBottom').disabled = true;
				}
				if(document.getElementById('SaveTop') != null && document.getElementById('SaveTop') != undefined) {
					document.getElementById('SaveTop').disabled = true;
				}
			}, 
			onComplete:function(){
				forwardToLoginPageIfInvalidSession(document.getElementById("QuoteSummaryPage").innerHTML);				
				//loadCoverageAndLimitsTab("CoveragesLimitsTab");
				if(document.getElementById("coveragesAndLimitsTabDivId") != null && document.getElementById("coveragesAndLimitsTabDivId") != undefined) {
					document.getElementById("QuoteDiv").style.display = "block";
				    activateQuoteTabs("CoveragesLimitsTab");
				    enableTabs();
					document.getElementById("QuoteDiv").innerHTML = document.getElementById("coveragesAndLimitsTabDivId").innerHTML;
				} else {
					loadCoverageAndLimitsTab("CoveragesLimitsTab");
				}
				YAHOO.example.container.subjDetail = null;
				loadJsCssFile("../Scripts/JScripts/CauseListTable.js" ,"js");
				loadJsCssFile("../Scripts/JScripts/AttachmentTable.js" ,"js");
				loadJsCssFile("../Scripts/JScripts/LocationTank/QuoteLocationTank.js" ,"js");
		},onException:function(){}});
	}
}

</script>
<script type="text/javascript" src="../Scripts/JScripts/AddTank.js"></script>





