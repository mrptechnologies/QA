<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.text.DecimalFormat" %>
<%@page import="com.dms.ejb.common.DMSDetail"%>
<script type="text/javascript">
 var url1 = "/saveQuoteEILRiskApplicationAction3.0.go?";
 var isSpecificValidationNeeded = false;
 var openTabClassesId = "";
</script>

<jsp:include page="../common/autoCompleteScript.jsp">
<jsp:param name="autoCompleteSqlLookupName" value="AUTOCOMPLETEZIPCODEADDEDITEMPLOYER" />
</jsp:include>

<style type="text/css">

#Zip {
    width:8em; /* set width here or else widget will expand to fit its container */
    z-index: 140;
}

#zipAutoCompleteResContainer {
    width:26em; /* set width here or else widget will expand to fit its container */
    padding-bottom:1em;
    z-index: 140;
}
</style>

<!-- Zip Code Autocomplete starts-->

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"> </SCRIPT>
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/build/datatable/assets/skins/sam/datatable.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/build/autocomplete/assets/skins/sam/autocomplete.css" />
<script type="text/javascript" src="../Scripts/YUI/build/yahoo-dom-event/yahoo-dom-event.js"></script>

<script type="text/javascript" src="../Scripts/YUI/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/element/element-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/datasource/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/event-delegate/event-delegate-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/animation/animation-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/build/autocomplete/autocomplete-min.js"></script>

<!-- Zip code autocomplete ends -->

<script type="text/javascript" src="../Scripts/JScripts/PolicyClassBenefits.js"></script>
<link rel="stylesheet" type="text/css" href="../styles/ui3.0/style.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/datatable1/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">

<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css" />
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>


<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/paginator-min.js"></script>      
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/editor/simpleeditor-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/PolicyClassHazards.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/PolicySummaryNonBTA.js"></script>

<script type="text/javascript" src="/Scripts/JScripts/Application.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Common.js">
</script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/AttachmentTable.js" ></script>

<script type="text/javascript" src="../Scripts/JScripts/Application_Ver_2.js">
</script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<style>
TD.FormLabels{margin:3px 0 3px 10px;padding:0 0 0 50px;font-family: Arial;text-align:Left; font-size: 9pt; color: #595a5f; font-weight:bold;border-right:  0px solid;border-top:  0px solid;border-left: px solid;border-bottom:0px solid;width:800px;}
</style>
<style>
TD.FormLabels2{FONT-WEIGHT: bold;FONT-SIZE: 11px;COLOR: #000000;FONT-FAMILY: Verdana,Arial, Helvetica;}
.locformpages2{border:1px #f0aa39 solid;width:865px;margin:0 auto;padding:9px;background:url(../styles/ui3.0/i/bodybg1.gif)repeat-x;}
  .tableData{line-height:17px;text-align:left;margin:0;padding:0;font-weight:bold;}
  .yui-skin-sam .yui-dt-mask{position:absolute;z-index:9500;}.yui-dt-tmp{position:absolute;left:-9000px;}.yui-dt-scrollable .yui-dt-bd{overflow:auto;}.yui-dt-scrollable .yui-dt-hd{overflow:hidden;position:relative;}.yui-dt-scrollable .yui-dt-bd thead tr,.yui-dt-scrollable .yui-dt-bd thead th{position:absolute;left:-1500px;}.yui-dt-scrollable tbody{-moz-outline:none;}.yui-dt-draggable{cursor:move;}.yui-dt-coltarget{position:absolute;z-index:999;}.yui-dt-hd{zoom:1;}th.yui-dt-resizeable .yui-dt-resizerliner{position:relative;}.yui-dt-resizer{position:absolute;right:0;bottom:0;height:100%;cursor:e-resize;cursor:col-resize;background-color:#CCC;opacity:0;filter:alpha(opacity=0);}.yui-dt-resizerproxy{visibility:hidden;position:absolute;z-index:9000;}th.yui-dt-hidden .yui-dt-liner,td.yui-dt-hidden .yui-dt-liner,th.yui-dt-hidden .yui-dt-resizer{display:none;}.yui-dt-editor{position:absolute;z-index:9000;}.yui-skin-sam .yui-dt table{margin:0;padding:0;font-family:arial;font-size:inherit;border-collapse:separate;*border-collapse:collapse;border-spacing:0;border:1px solid #7F7F7F;}.yui-skin-sam .yui-dt thead{border-spacing:0;}.yui-skin-sam .yui-dt caption{color:#000000;font-size:85%;font-weight:normal;font-style:italic;line-height:1;padding:1em 0pt;text-align:center;}.yui-skin-sam .yui-dt th{background:#D8D8DA url(sprite.png) repeat-x 0 0;}.yui-skin-sam .yui-dt th,.yui-skin-sam .yui-dt th a{font-weight:normal;text-decoration:none;color:#000;vertical-align:bottom;}.yui-skin-sam .yui-dt th{margin:0;padding:0;border:none;border-right:1px solid #CBCBCB;}.yui-skin-sam .yui-dt tr.yui-dt-first td{border-top:1px solid #7F7F7F;}.yui-skin-sam .yui-dt th .yui-dt-liner{white-space:nowrap;}.yui-skin-sam .yui-dt-liner{margin:0;padding:0;padding:4px 10px 4px 10px;}.yui-skin-sam .yui-dt-coltarget{width:5px;background-color:red;}.yui-skin-sam .yui-dt td{margin:0;padding:0;border:none;border-right:1px solid #CBCBCB;text-align:left;}.yui-skin-sam .yui-dt-list td{border-right:none;}.yui-skin-sam .yui-dt-resizer{width:6px;}.yui-skin-sam .yui-dt-mask{background-color:#000;opacity:.25;*filter:alpha(opacity=25);}.yui-skin-sam .yui-dt-message{background-color:#FFF;}.yui-skin-sam .yui-dt-scrollable table{border:none;}.yui-skin-sam .yui-dt-scrollable .yui-dt-hd{border-left:1px solid #7F7F7F;border-top:1px solid #7F7F7F;border-right:1px solid #7F7F7F;}.yui-skin-sam .yui-dt-scrollable .yui-dt-bd{border-left:1px solid #7F7F7F;border-bottom:1px solid #7F7F7F;border-right:1px solid #7F7F7F;background-color:#FFF;}.yui-skin-sam .yui-dt-scrollable .yui-dt-data tr.yui-dt-last td{border-bottom:1px solid #7F7F7F;}.yui-skin-sam thead .yui-dt-sortable{cursor:pointer;}.yui-skin-sam th.yui-dt-asc,.yui-skin-sam th.yui-dt-desc{background:url(sprite.png) repeat-x 0 -100px;}.yui-skin-sam th.yui-dt-sortable .yui-dt-label{margin-right:10px;}.yui-skin-sam th.yui-dt-asc .yui-dt-liner{background:url(dt-arrow-up.png) no-repeat right;}.yui-skin-sam th.yui-dt-desc .yui-dt-liner{background:url(dt-arrow-dn.png) no-repeat right;}tbody .yui-dt-editable{cursor:pointer;}.yui-dt-editor{text-align:left;background-color:#F2F2F2;border:1px solid #808080;padding:6px;}.yui-dt-editor label{padding-left:4px;padding-right:6px;}.yui-dt-editor .yui-dt-button{padding-top:6px;text-align:right;}.yui-dt-editor .yui-dt-button button{background:url(sprite.png) repeat-x 0 0;border:1px solid #999;width:4em;height:1.8em;margin-left:6px;}.yui-dt-editor .yui-dt-button button.yui-dt-default{background:url(sprite.png) repeat-x 0 -1400px;background-color:#5584E0;border:1px solid #304369;color:#FFF}.yui-dt-editor .yui-dt-button button:hover{background:url(sprite.png) repeat-x 0 -1300px;color:#000;}.yui-dt-editor .yui-dt-button button:active{background:url(sprite.png) repeat-x 0 -1700px;color:#000;}.yui-skin-sam tr.yui-dt-even{background-color:#FFF;}.yui-skin-sam tr.yui-dt-odd{background-color:#EDF5FF;}.yui-skin-sam tr.yui-dt-even td.yui-dt-asc,.yui-skin-sam tr.yui-dt-even td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam tr.yui-dt-odd td.yui-dt-asc,.yui-skin-sam tr.yui-dt-odd td.yui-dt-desc{background-color:#DBEAFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even{background-color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-odd{background-color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam th.yui-dt-highlighted,.yui-skin-sam th.yui-dt-highlighted a{background-color:#B2D2FF;}.yui-skin-sam tr.yui-dt-highlighted,.yui-skin-sam tr.yui-dt-highlighted td.yui-dt-asc,.yui-skin-sam tr.yui-dt-highlighted td.yui-dt-desc,.yui-skin-sam tr.yui-dt-even td.yui-dt-highlighted,.yui-skin-sam tr.yui-dt-odd td.yui-dt-highlighted{cursor:pointer;background-color:#B2D2FF;}.yui-skin-sam .yui-dt-list th.yui-dt-highlighted,.yui-skin-sam .yui-dt-list th.yui-dt-highlighted a{background-color:#B2D2FF;}.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted,.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted td.yui-dt-desc,.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-highlighted,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-highlighted{cursor:pointer;background-color:#B2D2FF;}.yui-skin-sam th.yui-dt-selected,.yui-skin-sam th.yui-dt-selected a{background-color:#446CD7;}.yui-skin-sam tr.yui-dt-selected td,.yui-skin-sam tr.yui-dt-selected td.yui-dt-asc,.yui-skin-sam tr.yui-dt-selected td.yui-dt-desc{background-color:#426FD9;color:#FFF;}.yui-skin-sam tr.yui-dt-even td.yui-dt-selected,.yui-skin-sam tr.yui-dt-odd td.yui-dt-selected{background-color:#446CD7;color:#FFF;}.yui-skin-sam .yui-dt-list th.yui-dt-selected,.yui-skin-sam .yui-dt-list th.yui-dt-selected a{background-color:#446CD7;}.yui-skin-sam .yui-dt-list tr.yui-dt-selected td,.yui-skin-sam .yui-dt-list tr.yui-dt-selected td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-selected td.yui-dt-desc{background-color:#426FD9;color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-selected,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-selected{background-color:#446CD7;color:#FFF;}.yui-skin-sam .yui-dt-paginator{display:block;margin:6px 0;white-space:nowrap;}.yui-skin-sam .yui-dt-paginator .yui-dt-first,.yui-skin-sam .yui-dt-paginator .yui-dt-last,.yui-skin-sam .yui-dt-paginator .yui-dt-selected{padding:2px 6px;}.yui-skin-sam .yui-dt-paginator a.yui-dt-first,.yui-skin-sam .yui-dt-paginator a.yui-dt-last{text-decoration:none;}.yui-skin-sam .yui-dt-paginator .yui-dt-previous,.yui-skin-sam .yui-dt-paginator .yui-dt-next{display:none;}.yui-skin-sam a.yui-dt-page{border:1px solid #CBCBCB;padding:2px 6px;text-decoration:none;background-color:#fff}.yui-skin-sam .yui-dt-selected{border:1px solid #fff;background-color:#fff;}
</style>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/SendEmail.js"></SCRIPT>
<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<bean:define id="policyNumber" name="PolicySummary" property="answer(policyNumber)" />
<bean:define id="effectiveYear" name="PolicySummary" property="answer(effectiveYear)" />
<bean:define id="polEffDate1" property="answer(policyEffDate)" name="PolicySummary"/>
<bean:define id="polExpDate1" property="answer(policyExpDate)" name="PolicySummary"/>
<bean:define id="custId" name="AddCustomer" property="answer(Object::Customer::CustomerId)" scope="session"/>
<bean:define property="answer(Object::Policy::TransactionDate)" name="PolicySummary" id="TransactionDateId" />
<bean:define property="answer(Object::Policy::PremiumDueDate)" name="PolicySummary" id="PremiumDueDateId" />
<%long lngAgencyId=0;
long lngAgentId=0;
DMSDetail dmsDetail = new DMSDetail();
%>
<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=custId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
	<logic:present name="customerDetail1" scope="request">

		<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		
		<%try{
		lngAgencyId=Long.parseLong(customerDetailMap.getString("agencyid"));
		}catch(Exception nfe) {lngAgencyId=0;    }
		try{
		lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
		}catch(Exception nfe) {lngAgentId=0;    }%>
	</logic:present>

<bean:define id="parentQuoteId" name="PolicySummary" property="answer(parentQuoteId)" />
<bean:define id="productVerId" name="PolicySummary" property="answer(productVerId)" />
<bean:define id="productId" name="PolicySummary" property="answer(productId)" />

<bean:define id="QuoteStatus" name="PolicySummary" property="answer(quoteStatus)" />
<bean:define id="SubQuoteVerId" name="PolicySummary" property="answer(subQuoteVerId)" />
<bean:define id="QuoteType" name="PolicySummary" property="answer(Object::Quote::QuoteType)" />
<bean:define id="SubQuoteId" name="PolicySummary" property="answer(subQuoteId)" />
<bean:define id="parentQuoteVerId" name="PolicySummary" property="answer(parentQuoteVerId)" />

<bean:define id="policyId" name="PolicySummary" property="answer(policyId)" />
<bean:define id="policyVerId" name="PolicySummary" property="answer(policyVerId)"  />
<bean:define id="parentPolicyId" name="PolicySummary" property="answer(parentPolicyId)" />

<bean:define id="prdid" name="PolicySummary" property="answer(Object::Quote::ProductId1)"  />
<bean:define id="paymentPlan" name="PolicySummary" property="answer(Object::Quote::PaymentPlan)"  />

<logic:empty name="PolicySummary" property="answer(policyId)">
	<% policyId = "" + request.getParameter("answer(policyId)"); %>
</logic:empty>

<logic:empty name="PolicySummary" property="answer(policyVerId)">
	<% policyVerId = "" + request.getParameter("answer(policyVerId)"); %>
</logic:empty>

<html:hidden property="answer(policyId)" name="PolicySummary" styleId="policyId" value="<%=""+policyId %>" />
<html:hidden property="answer(parentQuoteVerId)" name="PolicySummary" styleId="parentQuoteVerId" value="<%=""+parentQuoteVerId %>" />
<html:hidden property="answer(SubjectivityParentObjectType)" value="POLICY" styleId="SubjectivityParentObjectType" />
<html:hidden property="answer(policyVerId)" name="PolicySummary" value="<%=""+policyVerId %>" styleId="policyVerId" />
<html:hidden name="PolicySummary" property="answer(customerId)" styleId="custId"/>
<html:hidden name="PolicySummary" property="answer(productVerId)" styleId="productVerId"/>
<html:hidden property="answer(Object::UserDetail::ownerId)" name="LoginPage"  styleId="ownerId"/>
<html:hidden name="PolicySummary" property="answer(Object::Agency::AgencyId)" styleId="agencyId" value="<%=""+lngAgencyId%>"/>
<html:hidden name="PolicySummary" property="answer(policyNumber)" styleId="policyNumber" />
<html:hidden name="PolicySummary" property="answer(subQuoteId)" styleId="subQuoteId11" />
<html:hidden name="PolicySummary" property="answer(parentQuoteId)" styleId="parentQuoteId" />
<html:hidden name="PolicySummary" property="answer(productId)" styleId="productId" />
			 					 			 				 		
<%
String defaultTab="";
if(request.getAttribute("DEFAULT_POLICY_TAB")!=null){
	defaultTab = ""+request.getAttribute("DEFAULT_POLICY_TAB");
}else if(request.getAttribute("answer(DEFAULT_POLICY_TAB)")!=null){
	defaultTab = ""+request.getAttribute("answer(DEFAULT_POLICY_TAB)");
}else if(request.getParameter("answer(DEFAULT_POLICY_TAB)")!=null){
	defaultTab = ""+request.getParameter("answer(DEFAULT_POLICY_TAB)");
}
%>
<html:hidden property="answer(DEFAULT_POLICY_TAB)" styleId="dfaultPolicyTab" value="<%=""+defaultTab %>"/>


<%String conditionFlag = "N"; %>
<%String EndoProductName=""; %>
<%if(request.getAttribute("conditionFlag") != null){
	conditionFlag = "Y";
}
	
%>

<bean:define id="agencyId" name="PolicySummary" property="answer(Object::Agency::AgencyId)"  />
<html:hidden name="PolicySummary" property="answer(Object::Agency::AgencyId)" value='<%=""+agencyId%>' styleId="agencyId"/>

<bean:define id="applicationType" name="PolicySummary" property="answer(applicationType)" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<%
	long submissionId = 0;
	long submissionVerId = 0;
	if(request.getParameter("answer(Object::Quote::SubmissionId)")!=null){
		submissionId = Long.parseLong(""+request.getParameter("answer(Object::Quote::SubmissionId)"));
	} if(request.getParameter("answer(Object::Quote::SubmissionVerId)")!=null){
		submissionVerId = Long.parseLong(""+request.getParameter("answer(Object::Quote::SubmissionVerId)"));
} %>
<!-- <table width="100%"> -->
<% String DocumentType = "ISSUANCE"; %>
<% String policyStatus = ""; %>
<% String ratingTerritory = "0"; %>
<% String ratingTerritoryName = ""; %>

<logic:notEqual name="Tab_UI_View" value="UI_3.0" scope="session" >
<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 	<tr>
		<td>

			<jsp:include page="../common/DynamicPolicyHeader.jsp">
				<jsp:param name="policyId" value="<%=policyId.toString()%>" />
				<jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
				<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
				<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
			</jsp:include>
		 </td>
  	</tr>
</table> 
</logic:notEqual>
<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">	
<tr><td><div id="manuScript"><div id='Manuscript_CONT'></div></div></td></tr>
<tr><td><div id="subjDetail"><div id="SUB_CONT"></div><a class="container-close" href="javascript:void(0);" onclick="document.getElementById('SUB_CONT').innerHTML='';YAHOO.example.container.subjDetail.hide();"></a></div></td></tr>
<tr><td><div id="AttachFiles"></div></td></tr>
<tr><td><div id="AddNotespopup" style="display:none"></div></td></tr>
</table>

<dmshtml:isActivePolicy policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
<%String isActivePolicy =(String) request.getAttribute("isActivePolicy");  
  String bgcolor ="#C6DEEA";
  String headerName ="dolphinnav";
  String bodyDiv = "dolphincontainer1";
  String applicationHeaderName ="dolphinsubnav";
  String policyDetailHeader = "NewSectionHead";
   if (!(isActivePolicy.equals("Y"))){
	   bgcolor ="#CCCCCC";
	   headerName ="priorpolicydolphinnav";
	   bodyDiv = "dolphincontainerActive1";
	   applicationHeaderName ="oldPolicydolphinsubnav";
	   policyDetailHeader ="NewSectionHead1";
   }

%>
<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId %>" policyNumber="<%=""+policyNumber%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" documentType='<%=DocumentType%>' />
										
					<% String riskState="";%>
					<% String dmsRiskId = "";%>
					<% String polRiskId = "";%>
					<% String totalPremium ="";%>
					<% String policyEffdate ="";%>
					<% String policyExpdate ="";%>
					<logic:present name="policyHeaderInfo">
						<%com.dms.ejb.insurance.policy.pl.PLPolicyDetail plPolicyDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyDetail)request.getAttribute("policyHeaderInfo"); %>
						<%totalPremium =""+plPolicyDetail.getMTotalPremium();%>
						<%policyEffdate =""+plPolicyDetail.getPolicyEffDate();%>
						<%policyExpdate =""+plPolicyDetail.getPolicyExpDate();%>
						<%policyStatus =plPolicyDetail.getPolicyStatus();%>
						<%String quoteNum =""+plPolicyDetail.getQuoteNumber();%>
						<%String quoteSubNum =""+plPolicyDetail.getQuoteSubNumber();%>		
						<%String policySubNum =""+plPolicyDetail.getPolicySubNumber();%>	
						
						<%String planState= ""; 
						%>					
						
<html:hidden property="answer(quoteNum)" name="PolicySummary" styleId="quoteNum" value="<%=""+quoteNum %>" />
<html:hidden property="answer(quoteSubNum)" name="PolicySummary" styleId="quoteSubNum" value="<%=""+quoteSubNum %>" />						
<html:hidden property="answer(Object::Quote::PlanState)" value='<%=""+planState%>' styleId="planState"/>										
						<%//if(plPolicyDetail.getPLResPropertyList().size()!=0){ 
									java.util.ArrayList arrPLResPropertyDetail = plPolicyDetail.getPLResPropertyList();
							%>		 
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr><td colspan="4">&nbsp;</td></tr>
	<tr>
	  <td width="25%">
	  	<div  style ="font-style:bolditalic;font-size:14pt;">
	  		Policy&nbsp;&nbsp;<%=policyNumber.toString().substring(0,3)%>&nbsp;<%=policyNumber.toString().substring(3,(policyNumber.toString().length()))%><% if(policySubNum!=null && policySubNum!="") { %>
	  			<%if(Long.parseLong(policySubNum)>=1){ %>
					<%="- "+policySubNum%>
				<%}%>
			<% } %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Policy Effective Year <%="- "+effectiveYear%>
	  		
	  	</div>
	  </td>
    </tr>
    <tr><td colspan="3">&nbsp;</td></tr>
	  <tr>
	  	<td>
	  
    </td></tr>
    <tr>
					<td>&nbsp;</td>
					
				</tr>
				<tr>
					<td width="25%" class="links"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+custId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>" title="Click to go to Master Insured Record" class="button2" style="width:200px" />Go to Insured Master Record</a> </td>
				</tr>	
				 <tr>
					<td>&nbsp;</td>					
				</tr>
    			<tr>
    			<td>
    			<table width="950px">
    			 <tr>
					<td class="NewSectionHead" colspan="3" align="center">POLICY SUMMARY</td>
				 </tr>
				 </table>
				 </td>	
				</tr>	
		<logic:present name="FailureMessage" scope="request">
			<tr>
				<td class="Error" id="paymentFailure">
					Payment Failure Due to Payment Amount Exceeds
				</td>
			</tr>
		</logic:present>				
		<logic:present name="SuccessMessage" scope="request">
		<tr>
		<td class="Error" id="paymentSuccess">
		Payment Successful 
		</td>
		</tr>
		</logic:present>
	<tr>
		<td colspan="4">&nbsp;
		</td>
	</tr>
	</table>
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 	<tr>
		<td>

			<jsp:include page="../common/PolicyHeaderCoverMin.jsp">
				<jsp:param name="policyId" value="<%=policyId.toString()%>" />
				<jsp:param name="policyNumber" value="<%=""+policyNumber%>" />
			    <jsp:param name="policyVerId" value="<%=policyVerId.toString()%>" />
				<jsp:param name="parentQuoteId" value="<%=""+parentQuoteId%>" />
                <jsp:param name="parentQuoteVerId" value="<%=""+parentQuoteVerId%>" />
				<jsp:param name="title" value="<%="POLICY SUMMARY"%>" />
			</jsp:include>
		 </td>
  	</tr>
  	<tr><td>&nbsp;</td></tr>
</table> 


 <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0">
				
				
			</table>
		</td>
	</tr>
	
	<tr>
	
		<td>
			      
			        <dmshtml:GetQuoteDetailsByPolicyId nameInSession="QuoteList" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 		 <% String renewalQuote =""+request.getAttribute("Object::Renewal::Quote::QuoteId");
			 		 	String renewalSubQuote  = ""+request.getAttribute("Object::Renewal::Quote::SubQuoteId");
			 		 	String isRenewal = ""+request.getAttribute("isRenewal");
			 		 %>
			 		  
			 		<!--  Values for Issue Policy -->
			 		<html:hidden property="answer(DocumentListSource)" value="Policy" />
			 		<html:hidden property="answer(policyId)"  value="<%= ""+policyId%>" />	
			 		
			 		<html:hidden property="answer(policyVerId)"  value="<%= ""+policyVerId%>" />				 		
			 		<html:hidden property="answer(DocumentType)" value="ISSUANCE" />
			 		
			 		<%if(isRenewal.equals("Y")){ %>
						<html:hidden property="answer(QuoteId)" value="<%=""+renewalQuote%>" /> 	
					<%}else{ %>	 	
						<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 
					<%} %>	
					
			 		<html:hidden property="answer(ownerId)" value='<%=""+ownerId%>' styleId="ownerIdfrmjsp" />
			 		<html:hidden property="answer(ProductVerId)" value="<%= ""+productVerId%>" />
			 		<html:hidden property="answer(Object::Customer::CustomerId)"  value="<%= ""+custId%>" />
			 		<html:hidden property="answer(customerId)" value="<%= ""+custId%>" />	
			 		<html:hidden property="answer(isPreview)" value="false" />
			 		<html:hidden property="answer(Object::Agency::AgencyId)"  value="<%=""+agencyId%>" />	
			 		<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>"/>
			 		<html:hidden property="answer(Object::Policy::ResProperty::Statecode)" value="<%=""+riskState%>"/>
			 		<html:hidden property="answer(DEFAULT_POLICY_TAB)" value ="DOCUMENTS" />
			 		
			 					 		
			 		<!-- Policy Summary -->
			 		
			 		<html:hidden property="answer(polParentQuoteId)" value='<%=""+parentQuoteId %>'/>
			 		<html:hidden property="answer(polProductVerId)" value='<%=""+productVerId%>' />
			 		<html:hidden property="answer(polProductId)" value='<%=""+productId%>' />
			 		<html:hidden property="answer(Object::Quote::QuoteStatus)" value='<%=""+QuoteStatus%>' styleId="paretQuoteStatus"/>
			 		<html:hidden property="answer(polSubVerQuoteId)" value='<%=""+SubQuoteVerId %>' styleId="subQuoteVerId"/>
					<html:hidden property="answer(Object::Quote::QuoteType)" value='<%=""+QuoteType %>'/>
					<html:hidden property="answer(polSubQuoteId)" value='<%=""+SubQuoteId %>'/>
					<html:hidden property="answer(applicationType)" value='<%=""+applicationType %>'/>					
			 		<html:hidden property="answer(Object::UserDetail::userName)" value='<%=""+usernameId%>'/>
			 		<html:hidden property="answer(isUpdated)" value="Y" />
					<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
					<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=userId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=userId.toString()%>" /> 
					<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Policy"%>"/>
					<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Policy Management"%>"/>
				
					<html:hidden property="answer(pagename)" value="Quote summary" />
	
			 		<html:hidden property="answer(Quote::Page)" value="StatusChange" />
			 		<html:hidden property="answer(Object::Quote::QuoteStatus)" value="Issued" />

			 		
					<html:hidden property="answer(Object::Policy::TotalPremium)" styleId="TotalPremium" value="<%=""+totalPremium%>" />				 					 		
					<html:hidden property="answer(parentQuoteId)" value="<%=""+parentQuoteId%>" />
					<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" styleId="CreatedByfrmjsp" />
					<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" styleId="UpdatedByfrmjsp"  />
					<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
					<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
					<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden  property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden property="answer(dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
					<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%=""+SubQuoteVerId%>" />
					<html:hidden property="answer(subquoteVerId)" value="<%=""+SubQuoteVerId%>"/>
					
					<%if(isRenewal.equals("Y")){ %>
								<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+renewalQuote %>" />	
								<html:hidden property="answer(subQuoteId)" value="<%=""+renewalSubQuote %>" /> 			
								<html:hidden property="answer(QuoteId)" value="<%=""+renewalQuote %>" /> 
								<html:hidden property ="answer(isRenewalQuoteToIssue)" value ="Y" /> 	
						<%}else{ %>	 	
								<html:hidden property="answer(Object::Quote::ParentQuoteId)" value="<%=""+parentQuoteId%>" />	
								<html:hidden property="answer(subQuoteId)" value="<%=""+SubQuoteId%>" /> 			
								<html:hidden property="answer(QuoteId)" value='<%= ""+parentQuoteId%>' /> 	
						<%} %>																								
					<html:hidden property="answer(userId)" value="<%=userId.toString()%>" />
					<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
					<html:hidden property="answer(productId)" value="<%=""+productId%>" />
					<html:hidden property="answer(productVerId)" value="<%=""+productVerId%>" />
					<html:hidden property="answer(parentQuoteType)" value="<%=""+QuoteType%>" />
					<html:hidden property="answer(UnderWriterWorkSheet)" value="No" />
					<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
					<html:hidden property="answer(OwnerId)" value='<%= ""+ownerId%>' />
					<html:hidden property="answer(ownerId)" value='<%= ""+ownerId%>' />
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
					<html:hidden property="answer(email)" value="<%=""+email %>" styleId="email"/>
					<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
				<html:hidden property="answer(Object::UserDetail::roleName)" value='<%=""+roleName%>' styleId="roleName"/>
					<html:hidden property="answer(Object::Quote::isEndorsementQuote)" value="false" styleId="isEndorsementQuote" />
					
					
		</td>
	</tr>
	<tr>
		<td align="left" width="100%">
			<div>						
				
				 <div id="PolicySummary" class="innercontent">  
					<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">	
																		
					<!-- Policy summary tab contents STArt -->	
				 						
					</table>
			 	</div> 
	 			<%double totalInstallmentFee = 0; %>
	 			<%double totalInstallmentPayment = 0; %> 		
				</div>	
				</logic:present>					 				
		</td>
	</tr>
	
</table>
<%			 	
if (!(isActivePolicy.equals("Y"))){
	   bgcolor ="#CCCCCC";
}else{
	bgcolor="";
}	 %>		 	
		
<div align="left" id="Doc" style="display:block">
<div class="formpagenew1">
<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center">	 
   <tr>
	<td class="Error">
	 <%String edit = "";%>
		<logic:present name="MESSAGE_LIST"> 
			<ul>
				<logic:iterate id="message" name="MESSAGE_LIST">
					<li><bean:write name="message"/></li>
					 <%edit = "1";%>
				</logic:iterate>
		 	</ul>		 		 
		</logic:present>
	</td>
</tr>
<tr>
	<td>&nbsp;</td>
</tr>
   <tr>
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">	 
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_active" height=35 id="PoliciesTab" onclick="javascript:loadPoliciesTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Policy Details</td>
				</tr>
			</table>
         </td>
		
         <td valign="top" class="todotab_space" ><img border="0" src="images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom >
    		 <table border="0" width="105px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="EndorsementTab" onclick="javascript:loadEndorsementTab(this.id);" >
				<tr>
					<td align="center"  Style="Cursor:hand">Endorsements</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space" ><img border="0" src="images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom >
    		 <table border="0" width="105px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="PaymentTab" onclick="javascript:loadPolicyPaymentTab(this.id);"  >
				<tr>
					<td align="center"  Style="Cursor:hand">Payment</td>
				</tr>
			</table>
         </td>
       </tr>
     </table>
     </td>
   </tr>
	<tr>
		
  <tr>
    <td width="950px" colspan="2">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" style="padding:0px 0px 20px 20px;" class="todotab_yellowbox2"  id="policyDivTable">
  		 <tr>
				<td align="left" valign="top">
				<div id="PolicyDiv" style="background-color:<%=bgcolor%>;">
	
						 	
</div>
	<dmshtml:GetPolicyBillingPaymentInfo nameInSession="PolicyBillingAndPayment" ownerId="<%=Long.parseLong(""+ownerId)%>" policyId="<%=Long.parseLong(""+policyId) %>" policyVerId="<%=Long.parseLong(""+policyVerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /> 
	 			<%double totalInstallmentFee = 0; %>
	 			<%double totalInstallmentPayment = 0; %>			
		<div id="Payment" style="display:none;">			 	
					<div id="dolphin">						
																			
						<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
										<tr>
									     <td width="50%" valign="bottom" height="25">
									     <table border="0" cellpadding="0" cellspacing="0" align="left">	 
									     <tr>
									     		<td>
									     			&nbsp;
									     		</td>
									     
									     </tr>
									       <tr>
									       
									         <td align="center" valign=bottom >
									    		 <table border="0" width="105px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="AddPaymentTab" onclick="javascript:activatePaymentSubTabs(this.id);document.getElementById('PolicyDiv').style.display='none';document.getElementById('PaymentPlanTrans').style.display='block';document.getElementById('paymenttrans').style.display='block';document.getElementById('paymentloginfo').style.display='none';document.getElementById('EditPaymentDiv').style.display='none';" >
													<tr>
														<td align="center"  Style="Cursor:hand">Add/Edit Payment Transaction</td>
													</tr>
												</table>
									         </td>
									         <td align="center" valign=bottom >
									    		 <table border="0" width="105px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="PaymentLogTab" onclick="javascript:activatePaymentSubTabs(this.id);document.getElementById('PolicyDiv').style.display='none';document.getElementById('paymentloginfo').style.display='block';document.getElementById('paymenttrans').style.display='none';document.getElementById('EditPaymentDiv').style.display='none';document.getElementById('PaymentPlanTrans').style.display='block';" >
													<tr>
														<td align="center"  Style="Cursor:hand">Payment Log Information</td>
													</tr>
												</table>
									         </td>
									       </tr>
									     </table>
									     </td>
									   </tr>
									   </table>
									   
						<div id="PaymentPlan" style="display:none">
							<html:form action="/UpdatePolicyBillingAction.do" onsubmit="return validateSubmit()"  >
						 	<logic:present name="PolicyBillingAndPayment">
						 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
										
						 			<tr height="40">
						 				<td class='FormLabels' width='50%'>Quote Bill Number	&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;
										    <bean:define  id="quoteBillNumber" name="PolicyBillingAndPayment" property="BILL_NUMBER" />
											<%=""+quoteBillNumber%>
										</td>
									</tr>	
									
								
									</table>
									
										<!-- ###############################################    Installment Type  #################################################### -->
																												
										<dmshtml:get_Installment_Premiums 	nameInSession="ArrInstallmentPremiumDetail"	 quoteBillNumber='<%=""+quoteBillNumber%>' policyId='<%=""+policyId%>' policyVerId='<%=""+policyVerId%>' dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
										<div id="InstallmentListPanel">							
										<%int count = 0; 
 										String InstallmentDescKey = "answer(Object::PolicyBilling::InstallmentDesc_" ;
  										String DueDateKey = "answer(Object::PolicyBilling::DueDate_";
  										String InstallmentPremiumKey = "answer(Object::PolicyBilling::InstallmentPremium_";
  										String PaymentStatusKey = "answer(Object::PolicyBilling::PaymentStatus_";
  										String InstallmentFeeKey = "answer(Object::PolicyBilling::InstallmentFee_";
  										String TotalInstallmentPremiumKey = "answer(Object::PolicyBilling::TotalInstallmentPremium_" ;%>
											
										<logic:present name="ArrInstallmentPremiumDetail" scope="request">
												
										<table bgcolor="<%=bgcolor%>">
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td class="FormLabels" align="center" width="3%">SL No</td>
							   			 	<td class="FormLabels" align="center" width="15%">Installment Description</td>
											<td class="FormLabels" align="center" width="15%">Due Date (MM/DD/YYYY)</td>
											<td class="FormLabels" align="center" width="15%">Payment Status </td>
											<td class="FormLabels" align="center" width="15%">Installment
											Premium Amount</td>
											<td class="FormLabels" align="center" width="15%">Installment
											Fee</td>
											<td class="FormLabels" align="center" width="15%">Total
											Installment Amount</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
										</tr>
																				
										<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PAYMENT_PLAN_LINK"}%>' connector='or' negated="true">							
										
										<logic:iterate id="arrInstallmentPremiumDetail"	name="ArrInstallmentPremiumDetail">
										<% count++; 
										String InstallmentDesc = InstallmentDescKey+count+")";
										String DueDate = DueDateKey+count+")";
										String InstallmentPremium = InstallmentPremiumKey+count+")";
  										String PaymentStatus = PaymentStatusKey+count+")";
										String InstallmentFee = InstallmentFeeKey+count+")";
										String TotalInstallmentPremium = TotalInstallmentPremiumKey+count+")";%>
										<% 		
										String styleClass="TextMatter1";
										
										%>
                              
										<tr>
											<td width="3%" align="center" class=<%= styleClass %>><%=""+count%></td>
											
											<bean:define id="paymentStatus" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::PaymentStatus" />
											<% boolean readonly=false;
											   String paymentStatus1=""+paymentStatus;
												if(paymentStatus1.equalsIgnoreCase("Paid")){
													readonly =true;
												}else{
													readonly =false;
												}
											%>
											
											
											<td width="15%" align="center"  class=<%= styleClass %>>
											<bean:define id="installmentDesc" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentDesc" />
											<html:text readonly="<%=readonly%>"  property='<%= ""+InstallmentDesc%>' value='<%= ""+installmentDesc%>' styleId="InstallmentDesc" size="15" maxlength="40" styleClass="txtbox" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:define id="dueDate" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::DueDate" />
											<html:text readonly="<%=readonly%>" onblur="return validateFields();"  property='<%=""+DueDate%>'  value='<%=""+dueDate%>' styleId="DueDate" size="15" maxlength="15" styleClass="txtbox" />
											</td>
											
											<td width="15%" align="center" class=<%= styleClass %>>
											<html:text  readonly="true" property='<%=""+PaymentStatus%>'  value='<%=""+paymentStatus%>' styleId="PaymentStatus" size="15" maxlength="15" styleClass="txtbox" />
											</td>
											
											<td width="15%" align="center"  class=<%= styleClass %>>
											<bean:define id="installmentPremium" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentPremium" />
											$<html:text readonly="<%=readonly%>" style="text-align: right" property='<%=""+InstallmentPremium %>' value='<%=""+installmentPremium %>' styleId="InstallmentPremium" size="15" maxlength="15" styleClass="txtbox" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:define id="installmentFee" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentFee" />
											$<html:text readonly="<%=readonly%>" onblur="return validate();"  style="text-align: right"	property='<%=""+InstallmentFee%>' value='<%=""+installmentFee%>'  styleId="InstallmentFee" size="15" maxlength="15" styleClass="txtbox" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:define id="totalInstallmentPremium" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentPremium" />
											$<html:text disabled="true" style="text-align: right" property='<%=""+TotalInstallmentPremium %>' value='<%=""+totalInstallmentPremium %>' styleId="TotalInstallmentPremium" size="15" maxlength="15" styleClass="txtbox" />
											</td>
										</tr>
						   				</logic:iterate>
						   				
						   				</dmshtml:dms_static_with_connector>
						    
						  				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PAYMENT_PLAN_LINK"}%>' connector='or' negated="false">							
											
										<logic:iterate id="arrInstallmentPremiumDetail"	name="ArrInstallmentPremiumDetail">
										<% count++; 
										String InstallmentDesc = InstallmentDescKey+count+")";
										String DueDate = DueDateKey+count+")";
										String InstallmentPremium = InstallmentPremiumKey+count+")";
										String InstallmentFee = InstallmentFeeKey+count+")";
										String TotalInstallmentPremium = TotalInstallmentPremiumKey+count+")";%>
										<% 		
										String styleClass="TextMatter1";
										
										%>
                              
										<tr>
											<td width="3%" align="center" class=<%= styleClass %>><%=""+count%></td>
									
											<td width="15%" align="center"  class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentDesc" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::DueDate" />
											</td>
											
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::PaymentStatus" />
											</td>
											
											<td width="15%" align="center"  class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentPremium" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::InstallmentFee" />
											</td>
									
											<td width="15%" align="center" class=<%= styleClass %>>
											<bean:write  name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentPremium" />
											</td>
										</tr>
						   			 </logic:iterate>
						    		</dmshtml:dms_static_with_connector>
		
						  
						    		<tr>
										<td>&nbsp;</td>
									</tr>
						   
						    		<tr>
						    
						   				<td width="3%" align="center" ></td>
						    			<td width="15%" align="center" class="FormLabels"></td>
						    			<td width="15%" align="center" class="FormLabels"></td>
						   				<td width="15%" align="center" class="FormLabels">Total</td>
						   			<logic:present name="arrInstallmentPremiumDetail" scope="request">
						   				<td width="15%" align="center" class="TextMatter" >
						   				
										<bean:define id="TotalInstallmentPayment" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentPayment" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										$<html:text disabled="true" style="text-align: right" property="Object::PolicyBilling::TotalInstallmentPayment" value='<%=""+TotalInstallmentPayment %>' styleId="TotalInstallmentPayment" size="15" maxlength="15" styleClass="txtbox" />
										<%totalInstallmentPayment=Double.parseDouble(""+TotalInstallmentPayment);%>
										<!-- <dmshtml:CurrencyFormatTag  format="<%=""+TotalInstallmentPayment%>"/> -->
										</td>
										
										<html:hidden property="answer(Object::Policy::TotalPremium)" styleId="TotalPremium1" value="<%=""+TotalInstallmentPayment%>" />					
										
                            			<td width="15%" align="center" class="TextMatter" >
                            			<bean:define  id="TotalInstallmentFee" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentFee" />
   										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            			$<html:text disabled="true" style="text-align: right" property="Object::PolicyBilling::TotalInstallmentFee" value='<%=""+TotalInstallmentFee %>' styleId="TotalInstallmentFee" size="15" maxlength="15" styleClass="txtbox" />
                            			<%totalInstallmentFee=Double.parseDouble(""+TotalInstallmentFee);%>
                            			<!-- <dmshtml:CurrencyFormatTag  format="<%=""+TotalInstallmentFee%>"/> -->
										</td>
							
										
										<td width="15%" align="center" class="TextMatter" >
										<bean:define  id="TotalInstallmentAmount" name="arrInstallmentPremiumDetail" property="Object::PolicyBilling::TotalInstallmentAmount" />
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										$<html:text disabled="true" style="text-align: right" property="Object::PolicyBilling::TotalInstallmentAmount" value='<%=""+TotalInstallmentAmount %>' styleId="TotalInstallmentAmount" size="15" maxlength="15" styleClass="txtbox" />
										<!-- <dmshtml:CurrencyFormatTag   format="<%=""+TotalInstallmentAmount%>"/> -->
										</td>
							</logic:present>
									</tr>
							 									
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PAYMENT_PLAN_LINK"}%>' connector='or' negated="true">													  
									
									<tr>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td align="center" ><html:submit value="Save" styleClass="sbttn"
								    		onmouseover="this.style.color='#FF0D25';"
											onmouseout="this.style.color='#0042B0';" 
											styleId="BillingSubmit" />
										</td>
										<td align="left">	
								   		    <html:reset value="Reset" styleClass="sbttn"
											onmouseover="this.style.color='#FF0D25';"
											onmouseout="this.style.color='#0042B0';" />
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
									</tr>
							 		
							 		</dmshtml:dms_static_with_connector>
							 		</table>
							 		<html:hidden property="answer(Object::Quote::InstallmentCount)" styleId="Count" value="<%=""+count%>" />
									</logic:present>
									</div >
									<!-- ###############################################    Installment Type  #################################################### -->
						 	</logic:present>
						 	
						 	<html:hidden property="answer(policyId)" value="<%=""+policyId%>" />
						 	<html:hidden property="answer(policyVerId)" value="<%=""+policyVerId%>" />
						 	<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" />
						 	<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
							<html:hidden property="answer(productId)" value="<%=""+productId%>" />
							<html:hidden property="answer(productVerId)" value="<%=""+productVerId%>" />
							<html:hidden property="answer(parentQuoteType)" value="<%=""+QuoteType%>" />
							<html:hidden property="answer(UnderWriterWorkSheet)" value="No" />
							<html:hidden property="answer(Object::Customer::CustomerId)" value='<%= ""+custId%>' />
							<html:hidden property="answer(OwnerId)" value='<%= ""+ownerId%>' />
							<html:hidden property="answer(ownerId)" value='<%= ""+ownerId%>' />
						 	<html:hidden property="answer(Object::Policy::Poleffdate)" styleId="QuoteEffDate" value='<%=""+policyEffdate%>' />
							<html:hidden property="answer(Object::Policy::Polexpdate)" styleId="QuoteExpDate" value='<%=""+policyExpdate%>' />
							<html:hidden property="answer(Object::Policy::TotalPremiumAmount)" styleId="TotalPremium" value="<%=""+totalPremium%>" />					
							<html:hidden property="answer(Object::Policy::Policyverid)" styleId="PolicyVerId" value="<%=""+policyVerId%>" />
							<html:hidden property="answer(Object::PolicyBilling::CreatedBy)" styleId="CreatedBy" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::UpdatedBy)" styleId="UpdatedBy" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::Createdby)" styleId="Createdby" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyGroup::Updatedby)" styleId="Updatedby" value="<%=""+usernameId%>" />
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
						</html:form> 	
					 	</div>	
					 	
					 	<div id="BillingPDF" class="innersubcontent">
						 	<logic:present name="PolicyBillingAndPayment">
						 		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="<%=bgcolor%>">
						 		
						 			<tr height="40">
						 				<td class='FormLabels' width='50%'> Invoice
										</td>
										<td class='TextMatter1'>
											Invoice PDF
										</td>
						 			</tr>	
						 		</table>				 				
						 	</logic:present>					 		
					 	</div>	
					 	<div id="EditPaymentDiv" class="todotab_yellowbox" style="width:900px;display:none;" align="left">
					 	<form action="/UpdateBillingPaymentTransactionActionNonBTA.go" onsubmit="return paymentEditTransactionSubmit(this);"  >
					 	</form>
					 	<form name="UpdatePaymentForm" action="/UpdateBillingPaymentTransactionActionNonBTA.go" onsubmit="return paymentEditTransactionSubmit(this);" method="post">
					 	</form>
					 	</div>
					 	<div id="PaymentPlanTrans" class="todotab_yellowbox" bgcolor="<%=bgcolor%>" align="left">
						 	<form name="paymentTransactionFrm1" action="/BillingPaymentTransactionActionNonBTA.go" onsubmit="return paymentTransactionSubmit(this)" method="post">
						 	<logic:present name="PolicyBillingAndPayment">
						 		<table align="left">						 			
									<%double totalAmountPaid=0; %>
									<%double balanceAmount=0; %>
									<%String amount=""; %>
									<%String paymentDet=""; %>
									<dmshtml:get_Payment_Transaction_History nameInSession="arrPaymentHistory" policyVerId="<%=""+policyVerId %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
											<logic:present name="arrPaymentHistory">
											<%  
												java.util.ArrayList PaymentType = (java.util.ArrayList)request.getAttribute("arrPaymentHistory");
												for(int paymentTypeIndex = 0 ; paymentTypeIndex < PaymentType.size() ; paymentTypeIndex++) {
												com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) PaymentType.get(paymentTypeIndex);
												amount=qMap.getString("Object::PolicyBilling::PaymentAmount");
												paymentDet=qMap.getString("Object::PolicyBilling::PaymentMethod");%>
												
												<%if(paymentDet.equalsIgnoreCase("Payment")){
													totalAmountPaid=totalAmountPaid+Double.parseDouble(amount);
												}else{
													totalAmountPaid=totalAmountPaid-Double.parseDouble(amount);
												}																			
											}%>
											</logic:present>								
										<%double totalAmount=totalInstallmentPayment;
										balanceAmount=Double.parseDouble(totalPremium)-totalAmountPaid; 
										
									%>		
									
						 			
									
									</table>
									<div style="display:none;" id="paymentloginfo" bgcolor="<%=bgcolor%>">
									<table bgcolor="<%=bgcolor%>" width="100%">
									<tr>
										<td width="10%" class="FormLabels2">PAYMENT LOG</td>
									</tr>
									</table>
							<table bgcolor="<%=bgcolor%>" width="100%">
								<tr>
									<td width="10%" class="FormLabels2">&nbsp;</td>
								</tr>
							</table>
							<table bgcolor="<%=bgcolor%>">
								<tr>
									<td class="FormLabels2">Policyholder Name</td>
									<dmshtml:Get_Customer_Agency_Agent_Details
										nameInSession="customerDetail1"
										customerId="<%=custId.toString()%>"
										dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
									<logic:present name="customerDetail1" scope="request">
										<bean:define id="customerDetailMap" name="customerDetail1"
											scope="request" type="com.dms.ejb.data.QuestionHashMap" />
										<td class="FormLabels2" style="color:blue;"><%=customerDetailMap.getString("custname")%></td>
									</logic:present>
								</tr>
								<tr>
									<td class="FormLabels2">Policy Number</td>
									<td class="FormLabels2" style="color:blue;"><%=policyNumber%></td>
								</tr>
								<tr>
									<td width="50%" class="FormLabels2">Total Payments/Credits Logged</td>
									<%DecimalFormat formatter = new DecimalFormat("$##,###.00"); %>
									<%DecimalFormat creditFormat = new DecimalFormat("##,###.00"); %>
									<td width="20%" class="FormLabels2" align="right" style="color:blue;">									
									<%if(totalAmountPaid < 0){ %>									
										$(<%=creditFormat.format(-(totalAmountPaid))%>)
									<%}else{%>
										<%if(totalAmountPaid == 0){ %>
											$<%=totalAmountPaid%>
										<%}else{%>
											<%=formatter.format(totalAmountPaid)%>
										<%}%>
									<%}%>
									</td>
									<td width="30%" class="FormLabels2">&nbsp;</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
								<td></td>
									<td>
										<input type="button" class="covsmallbutton" style="font-size:10.5px; width:200px;" value="ADD PAYMENT/CREDIT" id="ADDPAYMENT" onclick="javascript:activatePaymentSubTabs('AddPaymentTab');document.getElementById('PolicyDiv').style.display='none';document.getElementById('PaymentPlanTrans').style.display='block';document.getElementById('paymenttrans').style.display='block';document.getElementById('paymentloginfo').style.display='none';document.getElementById('EditPaymentDiv').style.display='none';"/>
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
							</table>
							<table bgcolor="<%=bgcolor%>" width="100%">
								<tr>
									<td width="10%" class="FormLabels2">&nbsp;</td>
								</tr>
							</table>
								<table id="paymentLogTable" border="1px" align="center" bordercolor="#f0aa39" width="100%"  style="border-collapse:collapse;border:1px #f0aa39 solid;table-layout:fixed;" bgcolor="<%=bgcolor%>">																								
								<dmshtml:get_Active_Void_Payment_Transaction_History nameInSession="arrActiveVoidPaymentHistory" policyVerId="<%=""+policyVerId %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
								<logic:present name="arrActiveVoidPaymentHistory">
								<%java.util.ArrayList PaymentType = (java.util.ArrayList)request.getAttribute("arrActiveVoidPaymentHistory");
								if(PaymentType.size() > 0){%>
								
									<tr>
										<td class="FormLabels2" align="left" width="3%">No.</td>
										<td class="FormLabels2" align="left" width="4%">Edit</td>
										<td class="FormLabels2" align="left" width="10%">Payment/<br/>Credit Date</td>
										<td class="FormLabels2" align="left" width="10%">Remittance Date</td>
										<td class="FormLabels2" align="left" width="10%">Payment/<br/>Credit Amount</td>
							   		 	<td class="FormLabels2" align="left" width="7%">Partial or Full Payment</td>
										<td class="FormLabels2" align="left" width="14%">Check/ACH/Wire Number</td>
										<td class="FormLabels2" align="left" width="15%">Payment/Credit is associated to the following Invoice No.'s</td>
										<td class="FormLabels2" align="left" width="12%">Payment/Credit Period</td>
										<td class="FormLabels2" align="left" width="10%">Ref. No</td>
										<td class="FormLabels2" align="left" width="5%">Notes</td>
									</tr>
									
									<!-- ###############################################    Payment History  #################################################### -->

																							
												
												<%
												
												int paymentTypeIndex1 =0;
												for(int paymentTypeIndex = 0 ; paymentTypeIndex < PaymentType.size() ; paymentTypeIndex++) {
												com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) PaymentType.get(paymentTypeIndex);
												%>
												<%double pay = Double.parseDouble(qMap.getString("Object::PolicyBilling::PaymentAmount"));
												String isVoid = qMap.getString("Object::PolicyBilling::IsVoid"); 
												String styleClass="FormLabels2";
												if(isVoid.equals("Y")){
													styleClass="Error";
												}
												if(pay!=0){%>
												<tr>
												<td class="<%=styleClass%>" align="center" width="3%" valign="top"><%=(paymentTypeIndex+1)%></td>
												<td class="<%=styleClass%>" align="left" width="4%" valign="top">
														<%if(!isVoid.equals("Y")){%>
															<a href="javascript:void(0);" onclick='getEditPaymentInfo(<%=qMap.getString("Object::PolicyBilling::PaymentId")%>);' >edit</a>
														<%}%>
														</td>
														<td class="<%=styleClass%>" align="right" width="10%" valign="top">
															<%=qMap.getString("Object::PolicyBilling::PaymentDate")%>
														</td>
														<td class="<%=styleClass%>" align="right" width="10%" valign="top">
															<%=qMap.getString("Object::PolicyBilling::RemittanceDate")%>
														</td>
														<td class="<%=styleClass%>" align="right" width="10%" valign="top">
															<%if(qMap.getString("Object::PolicyBilling::PaymentMethod").equals("Payment")){%>
																<%=formatter.format(Double.parseDouble(qMap.getString("Object::PolicyBilling::PaymentAmount")))%>
															<%}else{%>																
																$(<%=creditFormat.format(Double.parseDouble(qMap.getString("Object::PolicyBilling::PaymentAmount")))%>)
															<%}%>
														</td>
														<td class="<%=styleClass%>" align="left" width="7%" valign="top">	
															<%if(!qMap.getString("Object::PolicyBilling::Partial_Full").equals("null")){%>														
																<%=qMap.getString("Object::PolicyBilling::Partial_Full")%>
															<%}%>
														</td>
														<td class="<%=styleClass%>" align="right" width="14%" valign="top">
															<div style="word-wrap:break-word;">
																<%=qMap.getString("Object::PolicyBilling::CheckNumber")%>
															</div>
														</td>	
														<td class="<%=styleClass%>" align="left" width="15%" valign="top">
															<div style="word-wrap:break-word;">
																<%=qMap.getString("Object::PolicyBilling::AssociatedInvoiceNumber")%>												
															</div>
														</td>
														
														<td class="<%=styleClass%>" align="left" width="12%" valign="top">
															<div style="word-wrap:break-word;">
																<%=qMap.getString("Object::PolicyBilling::AccountingPeriod")%>	
															</div>
														</td>
														<td class="<%=styleClass%>" align="left" width="10%" valign="top">
															<div style="word-wrap:break-word;">
																<%=qMap.getString("Object::PolicyBilling::RefferenceNumber")%>		
															</div>
														</td>
														<td class="FormLabels2" align="left" width="5%" valign="middle">
															<%String PaymentPopupid=""+qMap.getString("Object::PolicyBilling::PaymentId");%>
															<a href="javascript:void(0);" onclick="javascript:getPaymentNotesPopUp('<%=""+PaymentPopupid%>');"><img src="../Images/Edit.gif"/></a>														
															<input type="hidden" name="popupnotes" id='<%="popupnotes"+PaymentPopupid%>' value='<%=qMap.getString("Object::PolicyBilling::Notes")%>'/>
														</td>												
												</tr>
												
												<% } %>
												<% } %>
												<% }else{  %>														
													<tr>
													<td class="Error" align="center">
														No payments found for this policy	
													</td>
													</tr>																																																																																													
													<script>
														document.getElementById('paymentLogTable').style.border="0px";
														document.getElementById('paymentLogTable').border="0px";
													</script>
												<% }  %>
											</logic:present>
											
											</table>
									<!-- ###############################################    Payment History  #################################################### -->
						 			
									
								
								</div>
						 			
						 		<div style="display:none;border:0px;" id="paymenttrans">	
						 		<table bgcolor="<%=bgcolor%>" width="60%">	
						 			
									<tr>
										<td class="FormLabels" style="color: blue;font-style: italic;font-weight: bold; " align="center">Payment Transaction</td>
									</tr>
									
						 						
						 			<tr>
										
										
									</tr>
									
									
									<tr>
										<td  align="left" width="50%" class="FormLabelsApplication">Transaction Type</td>
											
										<td align="left" width="40%" >
										<dmshtml:get_Payment_Types nameInSession="arrPaymentTypes" productVerId="<%=""+productVerId %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
									
										<logic:present name="arrPaymentTypes">
												<%
														java.util.ArrayList PaymentType = (java.util.ArrayList)request.getAttribute("arrPaymentTypes");
														for(int paymentTypeIndex = 0 ; paymentTypeIndex < PaymentType.size() ; paymentTypeIndex++) {
															com.dms.ejb.data.QuestionHashMap qMap = (com.dms.ejb.data.QuestionHashMap) PaymentType.get(paymentTypeIndex);
												if(qMap.getString("Object::QuoteBilling::PaymentTypeDesc").equalsIgnoreCase("Payment")){%>
												<input type="radio" name="answer(Object::PolicyBilling::PaymentTypeDetail)" checked="checked" value='<%=qMap.getString("Object::QuoteBilling::PrdPaymentTypeId")+"::"+qMap.getString("Object::QuoteBilling::PaymentTypeDesc")%>' id='<%=qMap.getString("Object::QuoteBilling::PaymentTypeDesc")%>' onclick="javascript:setPaymentFields(this.value);"  /><%=qMap.getString("Object::QuoteBilling::PaymentTypeDesc") %>
												
												<% }else{ %>
													<input type="radio" name="answer(Object::PolicyBilling::PaymentTypeDetail)" value='<%=qMap.getString("Object::QuoteBilling::PrdPaymentTypeId")+"::"+qMap.getString("Object::QuoteBilling::PaymentTypeDesc")%>' id='<%=qMap.getString("Object::QuoteBilling::PaymentTypeDesc")%>' onclick="javascript:setPaymentFields(this.value);"  /><%=qMap.getString("Object::QuoteBilling::PaymentTypeDesc") %>
												
												<%}} %>
												
										</logic:present>
				  						</td>
									</tr>
									<tr id="RemittanceDateTr">
										<td  align="left" width="50%" class="FormLabelsApplication"><font style="padding-left:10pt;">Remittance Date (MM/DD/YYYY)</font> </td>
										
										<td align="left" width="40%" >
										<div id="RemittanceDate1"></div>
											<jsp:include page="../common/ExtDateField.jsp">
												<jsp:param name="inputDateField" value="RemittanceDate" />
												<jsp:param name="panelDiv" value="RemittanceDate1" />
												<jsp:param name="minimumDate" value="" />
												<jsp:param name="maximumDate" value="" />
												<jsp:param name="allowBlank" value="false" />
												<jsp:param name="setDefaultToday" value="false" />
												<jsp:param name="TodayDate" value="" />
											</jsp:include>
										<html:hidden  style="text-align: left" property="answer(Object::PolicyBilling::RemittanceDate)" value=""  styleId="RemittanceDateHidden" styleClass="txtbox" />
										</td>
									</tr>
									<tr id="PaymentDateTr">
										<td  align="left" width="50%" class="FormLabelsApplication"><font color="red" style="padding-left:10pt;">Payment Date (MM/DD/YYYY)</font></td>
										<td align="left" width="40%" class="sectionhead1">
										
										<div id="PaymentDate1"></div>
											<jsp:include page="../common/ExtDateField.jsp">
												<jsp:param name="inputDateField" value="PaymentDate" />
												<jsp:param name="panelDiv" value="PaymentDate1" />
												<jsp:param name="minimumDate" value="" />
												<jsp:param name="maximumDate" value="" />
												<jsp:param name="allowBlank" value="false" />
												<jsp:param name="setDefaultToday" value="false" />
												<jsp:param name="TodayDate" value="" />
											</jsp:include>											
										<html:hidden  style="text-align: left" property="answer(Object::PolicyBilling::PaymentDate)" value=""  styleId="PaymentDateHidden"  styleClass="txtbox" /></td>
									</tr>
									<tr id="RemittanceAmountTr">
										<td  align="left" width="50%" class="FormLabelsApplication"><font color="red" style="padding-left:10pt;">Payment Amount</font></td>
										<td align="left" width="40%" ><html:text property="answer(Object::PolicyBilling::PaymentAmount)" value=""  styleId="RemittanceAmount" size="10" maxlength="10" styleClass="txtboxrightalign" /></td>
									</tr>
									<tr id="PartialFullTr">
										<td  align="left" width="50%" class="FormLabelsApplication"><font style="padding-left:10pt;">Partial or Full Payment</font></td>
										<td align="left" width="40%" >
												<input type="radio" name="answer(Object::PolicyBilling::Partial)"  value="Partial" id="Partial_Y" checked="true" />Partial
												<input type="radio" name="answer(Object::PolicyBilling::Partial)"  value="Full" id="Partial_N"  />Full&nbsp;&nbsp;
				  								
										</td>
									</tr>
									<tr style="display: none" id="CreditDateTr">
										<td  align="left" width="50%" class="FormLabelsApplication"><font color="red" style="padding-left:10pt;">Credit Date (MM/DD/YYYY)</font></td>
										<td align="left" width="40%" >
										<div id="CreditDate1"></div>
											<jsp:include page="../common/ExtDateField.jsp">
												<jsp:param name="inputDateField" value="CreditDate" />
												<jsp:param name="panelDiv" value="CreditDate1" />
												<jsp:param name="minimumDate" value="" />
												<jsp:param name="maximumDate" value="" />
												<jsp:param name="allowBlank" value="false" />
												<jsp:param name="setDefaultToday" value="false" />
												<jsp:param name="TodayDate" value="" />
											</jsp:include>
										<html:hidden  style="text-align: left" property="answer(Object::PolicyBilling::Creditdate)" value=""  styleId="CreditDateHidden"  styleClass="txtbox" />										
										</td>
										
									</tr>
									<tr style="display: none" id="CreditAmountTr">
										<td  align="left" width="50%" class="FormLabelsApplication"><font color="red" style="padding-left:10pt;">Credit Amount</font></td>
										<td align="left" width="40%" ><html:text property="answer(Object::PolicyBilling::CreditAmount)" value=""  styleId="CreditAmount" size="10" maxlength="10" styleClass="txtboxrightalign" /></td>
										
									</tr>
									
									<tr>
										<td  align="left" width="50%" class="FormLabelsApplication">Check/ACH/Wire Number</td>
										<td align="left" width="40%" ><html:text  style="text-align: left" property="answer(Object::PolicyBilling::CheckNumber)" value=""  styleId="CheckNumber" size="28" maxlength="28" styleClass="txtbox" /></td>
										
									</tr>
									<tr>
										<td  align="left" width="50%" class="FormLabelsApplication">Associated to which Invoice Number(s)</td>
										<td align="left" width="40%" ><textarea  style="text-align: left" name="answer(Object::PolicyBilling::AssociatedInvoiceNumber)" value=""  styleId="CheckNumber" rows="5" cols="25" styleClass="txtbox"></textarea></td>
										
									</tr>
									
									
									<tr>
										<td  align="left" width="50%" class="FormLabelsApplication">Period (Accounting Months)</td>
										<td align="left" width="40%" ><textarea  style="text-align: left" name="answer(Object::PolicyBilling::AccountingPeriod)" value=""  styleId="AccountingPeriod" rows="5" cols="25" styleClass="txtbox"></textarea></td>
									</tr>
									<tr>
										<td  align="left" width="50%" class="FormLabelsApplication">Reference Number </td>
										<td align="left" width="40%" ><html:text  style="text-align: left" property="answer(Object::PolicyBilling::ReferenceNumber)" value=""  styleId="ReferenceNumber" size="28" maxlength="28" styleClass="txtbox" /></td>
										
									</tr>
									<tr>
										<td  align="left" width="50%" class="FormLabelsApplication">Notes</td>
										<td align="left" width="40%" > 
										<textarea rows="5" cols="25" name="answer(Object::PolicyBilling::PaymentNotes)" ></textarea>
										
										
									</tr>
									
								</table>
								<table>
								<tr>
										<td align="center" width="20%" >
										&nbsp;
										</td>
								</tr>	
							<%if (isActivePolicy.equals("Y")){ %>	
								<tr>
										<td align="center" width="20%" >
										<html:button styleClass="covsmallbutton" style="font-size:12.5px; width:100px;" property="answer(Object::PolicyBilling::TransactionType)" value="Delete" styleId="Delete" onclick="activatePaymentSubTabs('PaymentLogTab');document.getElementById('paymenttrans').style.display='none';document.getElementById('paymentloginfo').style.display='block';"/> 
										</td>
										<td align="center" width="20%" >
										<html:button styleClass="covsmallbutton" style="font-size:12.5px; width:100px;" property="answer(Object::PolicyBilling::TransactionType)" value="Void" styleId="Void" onclick="activatePaymentSubTabs('PaymentLogTab');document.getElementById('paymenttrans').style.display='none';document.getElementById('paymentloginfo').style.display='block';"/> 
										</td>
										<td align="center" width="20%" >
										<html:submit styleClass="covsmallbutton" style="font-size:12.5px; width:100px;" property="answer(Object::PolicyBilling::TransactionType)" value="Save" styleId="Save"/> 
										</td>
										<td align="center" width="20%" >
										<html:button styleClass="covsmallbutton" style="font-size:12.5px; width:200px;" property="answer(Object::PolicyBilling::TransactionType)" value="Return to payment Log" styleId="ReturntopaymentLog" onclick="confirmAddTransactionPayment();" /> 
										</td>
								</tr>
							<%}%>	
									</table>
								</div>
						 	</logic:present>
						 	<html:hidden property="answer(policyId)" value="<%=""+policyId%>" />
						 	<html:hidden property="answer(policyVerId)" value="<%=""+policyVerId%>" />
						 	<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" />						 	
						 	<html:hidden property="answer(Object::Policy::TotalPremium)" styleId="TotalPremium" value="<%=""+totalPremium%>" />	
							<html:hidden property="answer(Object::Policy::Policyverid)" styleId="PolicyVerId" value="<%=""+policyVerId%>" />
							<html:hidden property="answer(Object::Policy::PolicyId)" styleId="policyId" value="<%=""+policyId%>" />
							<html:hidden property="answer(Object::PolicyBilling::CreatedBy)" styleId="CreatedBy" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::UpdatedBy)" styleId="UpdatedBy" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::Createdby)" styleId="Createdby" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyGroup::Updatedby)" styleId="Updatedby" value="<%=""+usernameId%>" />
							<html:hidden property="answer(Object::PolicyBilling::OwnerId)" styleId="OwnerId" value="<%=""+ownerId%>" />
							<html:hidden property="answer(System::flag::requiredMultiSubmissionCheck)" styleId="requiredMultiSubmissionCheck" value="Yes" />
							<html:hidden property="org.apache.struts.taglib.html.TOKEN" styleId="requiredMultiSubmissionCheck" value='<%=""+session.getAttribute("org.apache.struts.action.TOKEN")%>' />
							
							<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
							<html:hidden property="answer(activateTabId)" value="Payment" />
						 	</form>
					 	</div>	
					 	</div>
					</div>	
<div id="RiskPopUp" style="display:none;">
		<div class="hd" id="containerheading"></div>
		<div class="Applicationpage2">
			<div class="todotab_yellowbox4" id="RiskPopUpBody"></div>
		</div>
		<a class="container-close" href="javascript:void(0);" id="closeIcon2"></a>
	</div>
<div id="PaymentPopup" style="display:none">
	<div class="hd" id="Paymentheading"></div>
	<div class="Applicationpage3">
		<div id ="PaymentNotesPopUp" class="childFeild">		
		</div>
		<div id ="PaymentLogPopUp" class="childFeild" style="display:none;">	
		Do you want to save your changes?
		<input type="button" value="Yes" onclick="savePayment();"/>
		<input type="button" value="No" onclick="returntoPaymentLog();"/>	
		</div>
	</div>
	<a class="container-close" href="javascript:void(0);" id="closePopupIcon" ></a>																
</div>	


					<script>
YAHOO.namespace("example.container");
//Wrap our initialization code in an anonymous function
//to keep out of the global namespace:
var myEditor;
var flag=0;

(function(){
var init = function() {
  //create the TreeView instance:
  var tree = new YAHOO.widget.TreeView("Emailtreediv");
  //get a reusable reference to the root node:
  var root = tree.getRoot();
  //First, create a parent node
  var SentEmails = new YAHOO.widget.HTMLNode('<html><head></head><body><table><tr><td>&nbsp;&nbsp;</td><td><a href="javascript:void(0);" onclick=showSentEmailSubNodes("sentEmailSuccess"); ><img src="/Images/emailIcon.jpg" border="0" height="18" width="18"> <font color="blue"> Emails Sent</font></a></td><td><div id="sentEmailCount"> </div></td></tr></table>', root, false);
  //EmailList.labelStyle = "icon-prv";
  var composeEmail = new YAHOO.widget.HTMLNode('<div id="composeEmail" style="display: none; return: false;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:void(0);" onclick="sendEmailDetails();" title="Email" > Compose Email</a></div>', root , false);
  var ViewSentEmail = new YAHOO.widget.HTMLNode('<div id="sentEmailSuccess" style="display: none; return: false;"> </div>', root , false);
  tree.draw();
  var ObjectId = document.getElementById("objId").value;
	 var OwnerId = document.getElementById("ownerId").value;
	 var pars1='ObjectId='+ObjectId+'&OwnerId='+OwnerId;
	 var ajax = new Ajax.Updater({success: 'sentEmailCount'},'../email/GetSentEmailCount.jsp',{method: 'post', parameters:pars1}); 
	   
  } 
 //Add an onDOMReady handler to build the tree when the document is ready
    YAHOO.util.Event.onDOMReady(init);

})();



</script>


<div id="SavePolicydetaildiv" style="display:none">
<html:form action="/updatePolicyValidationNonBTA.do" method="post" onsubmit="javascript:return validateNonBTAPolicyDetails(this);">
<html:hidden property="answer(productId)" value="<%=""+productId%>" />

<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="3" CELLPADDING="4" >
           <tr>
				<td>
				&nbsp;&nbsp;&nbsp;
				</td>
			</tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Insured Name:</font></td>
				<td width="30%" align="left" ><html:text property="answer(Object::Policy::Insured::Insuredname)" styleClass="txtbox" size="45" name="PolicySummary" maxlength="200" styleId="InsuredName" /></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Insured Address 1:</font></td>
				<td width="30%" align="left" ><html:text property="answer(Object::Policy::Insured::Address1)" size="45" name="PolicySummary" styleClass="txtbox" maxlength="200" styleId="InsuredAddress1" /></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field">Insured Address 2:</td>
				<td width="30%" align="left" ><html:text property="answer(Object::Policy::Insured::Address2)" size="45" name="PolicySummary" styleClass="txtbox" maxlength="200" styleId="InsuredAddress2" /></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field">Insured Address 3:</td>
				<td width="30%" align="left" ><html:text property="answer(Object::Policy::Insured::Address3)" size="45" name="PolicySummary" styleClass="txtbox" maxlength="200" styleId="InsuredAddress2" /></td>
	       </tr>
	      <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Insured Address City:</font></td>
				<td width="30%" align="left" ><html:text property="answer(Object::Policy::Insured::City)" size="45" name="PolicySummary" styleClass="txtbox" maxlength="200" styleId="City" /></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Insured Address State:</font></td>
				<td width="30%" align="left" >
				 <html:select property="answer(Object::Policy::Insured::State)" styleClass="txtbox" styleId="State" name="PolicySummary" style="width:290px">
				<html:option value="" styleClass="txtbox">Select A State</html:option>
					<html:option value="AL">Alabama</html:option>
					<html:option value="AK">Alaska</html:option>
					<html:option value="AS">American Samoa</html:option>
					<html:option value="AZ">Arizona</html:option>
					<html:option value="AR">Arkansas</html:option>
					<html:option value="CA">California</html:option> 
					<html:option value="CO">Colorado</html:option>
					<html:option value="CT">Connecticut</html:option>
					<html:option value="DE">Delaware</html:option>
					<html:option value="DC">District of Columbia</html:option>
					<html:option value="FM">Federated States of Micronesia</html:option>
					<html:option value="FL">Florida</html:option>
					<html:option value="GA">Georgia</html:option>
					<html:option value="GU">Guam</html:option>
					<html:option value="HI">Hawaii</html:option>
					<html:option value="ID">Idaho</html:option>
					<html:option value="IL">Illinois</html:option>
					<html:option value="IN">Indiana</html:option>
					<html:option value="IA">Iowa</html:option>
					<html:option value="KS">Kansas</html:option>
					<html:option value="KY">Kentucky</html:option>
					<html:option value="LA">Louisiana</html:option>
					<html:option value="ME">Maine</html:option>
					<html:option value="MH">Marshall Islands</html:option>
					<html:option value="MD">Maryland</html:option>
					<html:option value="MA">Massachusetts</html:option>
					<html:option value="MI">Michigan</html:option>
					<html:option value="MN">Minnesota</html:option>
					<html:option value="MS">Mississippi</html:option>
					<html:option value="MO">Missouri</html:option>
					<html:option value="MT">Montana</html:option>
					<html:option value="NE">Nebraska</html:option>
					<html:option value="NV">Nevada</html:option>
					<html:option value="NH">New Hampshire</html:option>
					<html:option value="NJ">New Jersey</html:option>
					<html:option value="NM">New Mexico</html:option>
					<html:option value="NY">New York</html:option>
					<html:option value="NC">North Carolina</html:option>
					<html:option value="ND">North Dakota</html:option>
					<html:option value="MP">Northern Mariana Islands</html:option>
					<html:option value="OH">Ohio</html:option>
					<html:option value="OK">Oklahoma</html:option>
					<html:option value="OR">Oregon</html:option>
					<html:option value="PW">Palau</html:option>
					<html:option value="PA">Pennsylvania</html:option>
					<html:option value="PR">Puerto Rico</html:option>
					<html:option value="RI">Rhode Island</html:option>
					<html:option value="SC">South Carolina</html:option>
					<html:option value="SD">South Dakota</html:option>
					<html:option value="TN">Tennessee</html:option>
					<html:option value="TX">Texas</html:option>
					<html:option value="UT">Utah</html:option>
					<html:option value="VT">Vermont</html:option>
					<html:option value="VI">Virgin Islands</html:option>
					<html:option value="VA">Virginia</html:option>
					<html:option value="WA">Washington</html:option>
					<html:option value="WV">West Virginia</html:option>
					<html:option value="WI">Wisconsin</html:option>
					<html:option value="WY">Wyoming</html:option>
				</html:select>
      </td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field">Insured Address County:</td>
				<td width="30%" align="left" ><html:text property="answer(Object::Policy::Insured::Countycode)" size="45" name="PolicySummary" styleClass="txtbox" maxlength="200" styleId="County" /></td>
		  </tr>
	      <tr width="20%">
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Insured Address Zip Code:</font></td>
				<td align="left"><html:text name="PolicySummary" property="answer(Object::Policy::Insured::Zip)" maxlength="10" style="width:120px;" size="45" styleClass="txtbox" styleId="Zip" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    <div  id="zipAutoCompleteResContainer" class="field" style="text-align:left; float:left;"></div><a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&FormName=PolicySummary[1]&clear=yes&PopupWindowName=Zip Code Search"
	            title="Search for zip code, state, county"
	            onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG
	            SRC="../Images/FindZipCode.jpg" BORDER="0" align="top"
	            ALT="Search for Zip code, City, State and County."/></a></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field">New Business, Renewal:</td>
				<td width="30%" align="left">
					<html:radio value="NonBTANewBusiness" name="PolicySummary" property="answer(Object::Policy::BusinessType)" styleId="NewBusiness"/>New Business
					<html:radio value="NonBTARenewal" name="PolicySummary" property="answer(Object::Policy::BusinessType)"/>Renewal
					
				</td>
	       </tr>
	       <!-- PolicyNUmber Prefix -->
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Policy Number Prefix:</font></td>
				<td width="30%" align="left">
				<html:select name="PolicySummary" property="answer(Object::Policy::PolicyNumberPrefix)" styleClass="txtbox" styleId="PolicyNumberPrefix" style="width:340px">
					<html:option value="">Select</html:option>
					<html:option value="BTA">BTA - Business Travel Accident</html:option>
					<html:option value="STA">STA - Student Travel Accident</html:option>
					<html:option value="SPR">SPR - Special Risk</html:option>
					<html:option value="PAI">PAI - Personal Accident (Vol)</html:option>
					<html:option value="PAB">PAB - Personal Accident  Basic/Carve Out (Mandatory)</html:option>
				 	<html:option value="ITA">ITA - International Travel Accident</html:option>
					<html:option value="ASN">ASN - Association</html:option>
					
				</html:select>	
			</td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Policy Number:</font></td>
				<td width="30%" align="left"><html:text property="answer(Object::Policy::PolicyNumber)" size="45" name="PolicySummary"
				styleClass="txtbox" maxlength="6" styleId="PolicyNumberText" value="<%=policyNumber.toString().substring(3,(policyNumber.toString().length()))%>"/></td>
	       </tr>
			<tr>
			<td width="70%" align="right" class="field"><font color="red">*&nbsp;Master Policy Type:</font></td>
			<td width="30%" align="left" ><html:select property="answer(Object::Policy::MasterPolicyType)" styleId="MasterPolicyType" name="PolicySummary" styleClass="txtbox" style="width:290px">
				<html:option value="">Select</html:option>
				<html:option value="Group">Group</html:option>
				<html:option value="Individual">Individual </html:option>
				<html:option value="Blanket">Blanket</html:option>				
			</html:select></td>
			</tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Salesforce Parent Submission Number:</font></td>
				<td width="30%" align="left"><html:text property="answer(Object::Policy::SalesforceSubmissionNumber)" name="PolicySummary" styleClass="txtbox" maxlength="40" styleId="SalesforceNumber" size="45"/></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Transaction Date (date policy was bound):</font></td>
				<td class="sectionhead1" align="left"><div id="TransactionDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="TransactionDate"/>
           						<jsp:param name="panelDiv" value="TransactionDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="false"/>
       	   						<jsp:param name="TodayDate" value=""/>
           					</jsp:include></td>
				<html:hidden property="answer(Object::Policy::TransactionDate)" name="PolicySummary" styleId="TransactionDateHidden" />
				
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Policy Effective Date:</font></td>
				<td  class="sectionhead1" align="left"><div id="policyEffectiveDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="policyEffectiveDate"/>
           						<jsp:param name="panelDiv" value="policyEffectiveDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="false"/>
       	   						<jsp:param name="TodayDate" value=""/>
           					</jsp:include></td>
           		<html:hidden property="answer(Object::Policy::Poleffdate)" name="PolicySummary" styleId="policyEffectiveDateHidden" />
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Policy Expiration Date:</font></td>
				<td  class="sectionhead1" align="left"><div id="policyExpirationDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="policyExpirationDate"/>
           						<jsp:param name="panelDiv" value="policyExpirationDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="false"/>
       	   						<jsp:param name="TodayDate" value=""/>
           					</jsp:include></td>
           		<html:hidden property="answer(Object::Policy::Polexpdate)" name="PolicySummary" styleId="policyExpirationDateHidden" />
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field">Carrier/Issuing Company:</td>
				<td width="30%" align="left"><html:select style="width:290px" styleClass="txtbox" name="PolicySummary" property="answer(Object::Policy::CarrierCompany)">
				<html:option value="Starr Indemnity">Starr Indemnity</html:option>
				<html:option value="Starr Surplus Lines">Starr Surplus Lines</html:option>
				<html:option value="CVS 1919">CVS 1919</html:option>
			</html:select></td>
	       </tr>
	      <tr>
				<td width="70%" align="right" class="field"><font color="red">* Written Premium (including any rider premium):</font></td>
				<bean:define id="WrittenPremium" property="answer(Object::Policy::WrittenPremium)" name="PolicySummary"/>
				
				<%String strWrittenPremium = dmsDetail.currencyFormat(Double.parseDouble(WrittenPremium.toString())); %>
				<td width="30%" align="left"><html:text property="answer(Object::Policy::WrittenPremium)" size="45" name="PolicySummary" styleClass="txtboxrightalign" maxlength="19" styleId="WrittenPremium" value="<%=strWrittenPremium+""%>"/></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Commission:</font></td>
				<bean:define id="Commission" property="answer(Object::Policy::Commission)" name="PolicySummary"/>
				<%String strCommission = dmsDetail.currencyFormat(Double.parseDouble(Commission.toString())); %>
				<td width="30%" align="left"><html:text property="answer(Object::Policy::Commission)" size="45"  value="<%=strCommission+""%>" name="PolicySummary" styleClass="txtboxrightalign" maxlength="19" styleId="Commission" /></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Attachment Point:</font></td>		
				<bean:define id="AttachmentPoint" property="answer(Object::Policy::AttachmentPoint)" name="PolicySummary"/>							
				<td width="30%" align="left"><html:text property="answer(Object::Policy::AttachmentPoint)" size="45" name="PolicySummary" styleClass="txtboxrightalign" maxlength="19" styleId="AttachmentPoint" value="<%=dmsDetail.currencyFormat(Double.parseDouble(AttachmentPoint.toString()))%>"/></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Policy Limit (Aggregate, if none use the highest principal sum):</font></td>
				<bean:define id="PolicyLimit" property="answer(Object::Policy::PolicyLimit)" name="PolicySummary"/>				
				<td width="30%" align="left"><html:text property="answer(Object::Policy::PolicyLimit)" name="PolicySummary" styleClass="txtboxrightalign" value="<%=""+dmsDetail.decimalFormat(Double.parseDouble(PolicyLimit.toString()),"$##,###")%>" maxlength="19" styleId="PolicyLimit" size="45" /></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Tax State:</font></td>
				<td width="30%" align="left"><html:select
				property="answer(Object::Policy::TaxState)" style="width:290px" name="PolicySummary" styleId="TaxState" styleClass="txtbox">
				<html:option value="">Select</html:option>
				<html:option value="AL">Alabama</html:option>
				<html:option value="AK">Alaska</html:option>
				<html:option value="AS">American Samoa</html:option>
				<html:option value="AZ">Arizona</html:option>
				<html:option value="AR">Arkansas</html:option>
				<html:option value="CA">California</html:option> 
				<html:option value="CO">Colorado</html:option>
				<html:option value="CT">Connecticut</html:option>
				<html:option value="DE">Delaware</html:option>
				<html:option value="DC">District of Columbia</html:option>
				<html:option value="FM">Federated States of Micronesia</html:option>
				<html:option value="FL">Florida</html:option>
				<html:option value="GA">Georgia</html:option>
				<html:option value="GU">Guam</html:option>
				<html:option value="HI">Hawaii</html:option>
				<html:option value="ID">Idaho</html:option>
				<html:option value="IL">Illinois</html:option>
				<html:option value="IN">Indiana</html:option>
				<html:option value="IA">Iowa</html:option>
				<html:option value="KS">Kansas</html:option>
				<html:option value="KY">Kentucky</html:option>
				<html:option value="LA">Louisiana</html:option>
				<html:option value="ME">Maine</html:option>
				<html:option value="MH">Marshall Islands</html:option>
				<html:option value="MD">Maryland</html:option>
				<html:option value="MA">Massachusetts</html:option>
				<html:option value="MI">Michigan</html:option>
				<html:option value="MN">Minnesota</html:option>
				<html:option value="MS">Mississippi</html:option>
				<html:option value="MO">Missouri</html:option>
				<html:option value="MT">Montana</html:option>
				<html:option value="NE">Nebraska</html:option>
				<html:option value="NV">Nevada</html:option>
				<html:option value="NH">New Hampshire</html:option>
				<html:option value="NJ">New Jersey</html:option>
				<html:option value="NM">New Mexico</html:option>
				<html:option value="NY">New York</html:option>
				<html:option value="NC">North Carolina</html:option>
				<html:option value="ND">North Dakota</html:option>
				<html:option value="MP">Northern Mariana Islands</html:option>
				<html:option value="OH">Ohio</html:option>
				<html:option value="OK">Oklahoma</html:option>
				<html:option value="OR">Oregon</html:option>
				<html:option value="PW">Palau</html:option>
				<html:option value="PA">Pennsylvania</html:option>
				<html:option value="PR">Puerto Rico</html:option>
				<html:option value="RI">Rhode Island</html:option>
				<html:option value="SC">South Carolina</html:option>
				<html:option value="SD">South Dakota</html:option>
				<html:option value="TN">Tennessee</html:option>
				<html:option value="TX">Texas</html:option>
				<html:option value="UT">Utah</html:option>
				<html:option value="VT">Vermont</html:option>
				<html:option value="VI">Virgin Islands</html:option>
				<html:option value="VA">Virginia</html:option>
				<html:option value="WA">Washington</html:option>
				<html:option value="WV">West Virginia</html:option>
				<html:option value="WI">Wisconsin</html:option>
				<html:option value="WY">Wyoming</html:option>
			</html:select></td>
	       </tr>
	        <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Line of Business:</font></td>
				<td width="30%" align="left"><html:select style="width:290px" styleClass="txtbox" property="answer(Object::Policy::LineOfBusiness)" name="PolicySummary" onchange="showOccupancies(this.value);" styleId="LineOfBusiness">
				<html:option value="">Select</html:option>
				<html:option value="Specialty">Specialty</html:option>
				<html:option value="Corporate">Corporate</html:option>
				<html:option value="Consumer">Consumer</html:option>
			</html:select></td>
	       </tr>
	       
	       <bean:define id="lineOfBuss" name="PolicySummary" property="answer(Object::Policy::LineOfBusiness)" />
			<%if(lineOfBuss.equals("Specialty")){%>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Occupancies:</font></td>
				<td width="30%" align="left"><html:select property="answer(Object::Policy::Occupancies)" style="width:290px" styleId="Occupancies" styleClass="txtbox" name="PolicySummary" >				
				<html:option value="">Select</html:option>
				<html:option value="College A&S">College A&S</html:option>
				<html:option value="Student International Inbound">Student International Inbound</html:option>
				<html:option value="Student International Outbound">Student International Outbound</html:option>
				<html:option value="Intercollegiate Sports">Intercollegiate Sports</html:option>
				<html:option value="K-12">K-12</html:option>
				<html:option value="Volunteer Fire">Volunteer Fire</html:option>
				<html:option value="Special Risk">Special Risk</html:option>
			</html:select></td>
	       </tr>
	       <%}%>
  			<%if(lineOfBuss.equals("Corporate")){%>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Occupancies:</font></td>
				<td width="30%" align="left"><html:select property="answer(Object::Policy::Occupancies)" style="width:290px" styleId="Occupancies" styleClass="txtbox" name="PolicySummary" >
				<html:option value="BTA">BTA</html:option>
				<html:option value="PAI">PAI</html:option>
				<html:option value="PAI(vol)">PAI(vol)</html:option>
				<html:option value="PAI Basic/Carve-out (mandatory)">PAI Basic/Carve-out (mandatory)</html:option>
				<html:option value="International Travel">International Travel</html:option>
			</html:select></td>
	       </tr>
	       <%}%>
	       <%if(lineOfBuss.equals("Consumer")){%>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Occupancies</font></td>
				<td width="30%" align="left"><html:select property="answer(Object::Policy::Occupancies)" style="width:290px" styleId="Occupancies" styleClass="txtbox" name="PolicySummary" >
				<html:option value="">Select</html:option>
				<html:option value="Broad Market Association">Broad Market Association</html:option>
				<html:option value="Affinity Association">Affinity Association</html:option>
				<html:option value="Financial Institutions">Financial Institutions</html:option>				
			</html:select></td>
	       </tr>
	       <%}%>
	       
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Product Coverage Type:</font></td>
				<td width="30%" align="left"><html:select
				property="answer(Object::Policy::ProductCoverageType)" style="width:290px"
				styleClass="txtbox" name="PolicySummary"  styleId="ProductCoverageType">
				<html:option value="">Select</html:option>
				<html:option value="AD">AD</html:option>
				<html:option value="AD&D">AD&D</html:option>
				<html:option value="STM">STM</html:option>				
			</html:select></td>
	       </tr>
	       <tr>
			<td class="field" style="width:70%"><div id="ridersDiv"><a href="javascript:showRider();" style="color:black;">+Riders</a> </div></td>
			</tr>
	       <tr id="riderTR" style="display:none">
			<td class="field" width="70%" align="right"></td>
			<td width="30%" align="left">	
			<table border="0" cellpadding="0" cellspacing="0" align="center" width="100%">
				<bean:define id="criticalRider" property="answer(Object::Policy::Rider::CriticalIllness)" name="PolicySummary" scope="request"/>
				<bean:define id="warRiskRider" property="answer(Object::Policy::Rider::WarRisk)" name="PolicySummary" scope="request"/>
				<bean:define id="AMEPrimaryRider" property="answer(Object::Policy::Rider::AMEPrimary)" name="PolicySummary" scope="request"/>
				<bean:define id="AMEExcessRider" property="answer(Object::Policy::Rider::AMEExcess)" name="PolicySummary" scope="request"/>
				<bean:define id="AMECOBRider" property="answer(Object::Policy::Rider::AMECOB)" name="PolicySummary" scope="request"/>
				<bean:define id="aviationRider" property="answer(Object::Policy::Rider::Aviation)" name="PolicySummary" scope="request"/>
				<tr height="20">
					<td valign="top" width="15%" colspan="2" align="center"><font style="color:black">Rider</font></td>
					<td style="padding-left:55px" valign="top" width="80%"><font style="color:black">Premium</font></td>
				</tr>
				
				<tr>
					<td style="padding-left:17px" valign="top" width="40%">Critical Illness</td>
					<%if(criticalRider.equals("Y")){%>
						<bean:define id="criticalPremium" property="answer(Object::Policy::Rider::CriticalIllnessPremium)" name="PolicySummary"/>
						<%String strCriticalPremium = dmsDetail.currencyFormat(Double.parseDouble(criticalPremium.toString())); %>						
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::CriticalIllness)" id="criticalIllness" onclick="showRiderPremium(this.id);" value="Y" checked/></td>
						<td width="55%"><span id="criticalIllnessTD"><html:text property="answer(Object::Policy::Rider::CriticalIllnessPremium)" size="27" styleId="criticalIllnessPremium" maxlength="25" value="<%=strCriticalPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::CriticalIllness)" id="criticalIllness" onclick="showRiderPremium(this.id);"/></td>																		 
						<td width="55%"><span id="criticalIllnessTD" style="display:none"><html:text property="answer(Object::Policy::Rider::CriticalIllnessPremium)" styleClass="txtboxrightalign" size="27" styleId="criticalIllnessPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>					
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="15%">War Risk</td>
					<%if(warRiskRider.equals("Y")){%>
						<bean:define id="warRiskPremium" property="answer(Object::Policy::Rider::WarRiskPremium)" name="PolicySummary"/>
						<%String strWarRiskPremium = dmsDetail.currencyFormat(Double.parseDouble(warRiskPremium.toString())); %>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::WarRisk)" id="warRisk" onclick="showRiderPremium(this.id);" value="Y" checked /></td>
						<td width="80%"><span id="warRiskTD"><html:text property="answer(Object::Policy::Rider::WarRiskPremium)" size="27" styleId="warRiskPremium" maxlength="25" value="<%=strWarRiskPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::WarRisk)" id="warRisk" onclick="showRiderPremium(this.id);" /></td>
						<td width="80%"><span id="warRiskTD" style="display:none"><html:text property="answer(Object::Policy::Rider::WarRiskPremium)" size="27" styleId="warRiskPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="15%">AME - Primary</td>
					<%if(AMEPrimaryRider.equals("Y")){%>
						<bean:define id="AMEPrimaryPremium" property="answer(Object::Policy::Rider::AMEPrimaryPremium)" name="PolicySummary"/>
						<%String strAMEPrimaryPremium = dmsDetail.currencyFormat(Double.parseDouble(AMEPrimaryPremium.toString())); %>					
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMEPrimary)" id="AMEPrimary" onclick="showRiderPremium(this.id);" value="Y" checked /></td>
						<td width="80%"><span id="AMEPrimaryTD"><html:text property="answer(Object::Policy::Rider::AMEPrimaryPremium)" size="27" styleId="AMEPrimaryPremium" maxlength="25" value="<%=strAMEPrimaryPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMEPrimary)" id="AMEPrimary" onclick="showRiderPremium(this.id);" /></td>
						<td width="80%"><span id="AMEPrimaryTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMEPrimaryPremium)" size="27" styleId="AMEPrimaryPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="15%">AME - Excess</td>
					<%if(AMEExcessRider.equals("Y")){%>
						<bean:define id="AMEExcessPremium" property="answer(Object::Policy::Rider::AMEExcessPremium)" name="PolicySummary"/>
						<%String strAMEExcessPremium = dmsDetail.currencyFormat(Double.parseDouble(AMEExcessPremium.toString())); %>										
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMEExcess)" id="AMEExcess" onclick="showRiderPremium(this.id);" value="Y" checked /></td>
						<td width="80%"><span id="AMEExcessTD"><html:text property="answer(Object::Policy::Rider::AMEExcessPremium)" size="27" styleId="AMEExcessPremium" maxlength="25" value="<%=strAMEExcessPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMEExcess)" id="AMEExcess" onclick="showRiderPremium(this.id);" /></td>
						<td width="80%"><span id="AMEExcessTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMEExcessPremium)" size="27" styleId="AMEExcessPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="15%">AME - COB</td>
					<%if(AMECOBRider.equals("Y")){%>
						<bean:define id="AMECOBPremium" property="answer(Object::Policy::Rider::AMECOBPremium)" name="PolicySummary"/>
						<%String strAMECOBPremium = dmsDetail.currencyFormat(Double.parseDouble(AMECOBPremium.toString())); %>										
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMECOB)" id="AMECOB" onclick="showRiderPremium(this.id);" value="Y" checked /></td>
						<td width="80%"><span id="AMECOBTD"><html:text property="answer(Object::Policy::Rider::AMECOBPremium)" size="27" styleId="AMECOBPremium" maxlength="25" value="<%=strAMECOBPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::AMECOB)" id="AMECOB" onclick="showRiderPremium(this.id);" /></td>
						<td width="80%"><span id="AMECOBTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AMECOBPremium)" size="27" styleId="AMECOBPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>
				</tr>
				<tr>
					<td style="padding-left:17px" valign="top" width="15%">Aviation</td>
					<%if(aviationRider.equals("Y")){%>
						<bean:define id="aviationPremium" property="answer(Object::Policy::Rider::AviationPremium)" name="PolicySummary"/>
						<%String strAviationPremium = dmsDetail.currencyFormat(Double.parseDouble(aviationPremium.toString())); %>			
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::Aviation)" id="aviation" onclick="showRiderPremium(this.id);" value="Y" checked /></td>
						<td width="80%"><span id="aviationTD"><html:text property="answer(Object::Policy::Rider::AviationPremium)" size="27" styleId="aviationPremium" maxlength="25" value="<%=strAviationPremium+""%>" styleClass="txtboxrightalign"/></span></td>
					<%}else{%>
						<td width="5%" valign="top"><input type="checkbox" name="answer(Object::Policy::Rider::Aviation)" id="aviation" onclick="showRiderPremium(this.id);" /></td>
						<td width="80%"><span id="aviationTD" style="display:none"><html:text property="answer(Object::Policy::Rider::AviationPremium)" size="27" styleId="aviationPremium" maxlength="25" value="" styleClass="txtboxrightalign"/></span></td>
					<%}%>
				</tr>
				</table>						
			</td>
		</tr>		
	       <tr>
				<td width="70%" align="right" class="field">Occurrence Indicator:</td>
				<td width="30%" align="left"><html:radio value="Yes" name="PolicySummary" property="answer(Object::Policy::OccurrenceIndicator)" />Yes
			    <html:radio value="No" name="PolicySummary" property="answer(Object::Policy::OccurrenceIndicator)" />No</td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field">Facultative Reinsurance Indicator:</td>
				<td width="30%" align="left"><html:radio value="Yes" name="PolicySummary" property="answer(Object::Policy::FacultativeReinsuranceIndicator)" />Yes
					<html:radio value="No" name="PolicySummary" property="answer(Object::Policy::FacultativeReinsuranceIndicator)" />No</td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Agent/Broker Commission Percent:</font></td>
				<bean:define id="AgentCommission" name="PolicySummary" property="answer(Object::Policy::AgentCommission)" scope="request"/>
				<td width="30%" align="left"><html:text property="answer(Object::Policy::AgentCommission)" value="<%=""+dmsDetail.decimalFormat(Double.parseDouble(AgentCommission.toString()),"##,###.00")+"%"%>" name="PolicySummary" size="45" styleClass="txtboxrightalign" maxlength="6" styleId="AgentCommission" /></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field">Number of Covered Lives:</td>
				<td width="30%" align="left"><html:text property="answer(Object::Policy::NumberOfCoveredLives)" name="PolicySummary" size="45" styleClass="txtbox" maxlength="6" styleId="CoveredLives" /></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Premium Due Date:</font></td>
				<td class="sectionhead1" align="left"><div id="PremiumDueDate1" ></div>
           					<jsp:include page="../common/ExtDateField.jsp">
          						<jsp:param name="inputDateField" value="PremiumDueDate"/>
           						<jsp:param name="panelDiv" value="PremiumDueDate1" />
           						<jsp:param name="minimumDate" value="" />
           						<jsp:param name="maximumDate" value="" />
           						<jsp:param name="allowBlank" value="false"/>           
       	  						<jsp:param name="setDefaultToday" value="false"/>
       	   						<jsp:param name="TodayDate" value=""/>
           					</jsp:include>
           					<html:hidden property="answer(Object::Policy::PremiumDueDate)" name="PolicySummary" styleId="PremiumDueDateHidden" />
           				
           					</td>
	       </tr>
	        <tr>
				<td width="70%" align="right" class="field">Billing Mode:</td>
				<td width="30%" align="left"><html:select style="width:290px" styleClass="txtbox" property="answer(Object::Policy::BillingMode)" styleId="BillingMode" name="PolicySummary">
				<html:option value="Annual">Annual</html:option>
				<html:option value="Semi-annual">Semi-annual</html:option>
				<html:option value="Quarterly">Quarterly</html:option>
				<html:option value="Monthly">Monthly</html:option>
				<html:option value="Daily">Daily</html:option>
		       </html:select></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Underwriter:</font></td>
				<td width="30%" align="left"><dmshtml:Get_users_byRoleId nameInSession="arListUsers" roleId="3" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId)%>" />
				<html:select property="answer(Object::Policy::Underwriter)" styleId="underwriterName" name="PolicySummary" style="width:290px" styleClass="txtbox">
					<html:option value="">Select</html:option>
					<logic:present name="arListUsers" scope="session">
						<logic:iterate id="details" name="arListUsers" scope="session" >
						<bean:define id='underwriterName' name="details" property="id" />
						<html:option value ='<%=underwriterName.toString()%>' >
							<bean:write name="details" property="id"  />
						</html:option>
						</logic:iterate>
					</logic:present>	
				</html:select></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field">Sale Ownership:</td>
				<td width="30%" align="left"><html:radio value="UW" name="PolicySummary" property="answer(Object::Policy::SaleOwnership)" />Underwriter
					<html:radio value="BDM" name="PolicySummary" property="answer(Object::Policy::SaleOwnership)" />BDM</td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field">Premium Collection:</td>
				<td width="30%" align="left"><html:select style="width:290px" styleClass="txtbox" styleId="PremiumCollection" property="answer(Object::Policy::PremiumCollection)" name="PolicySummary">
				<html:option value="TPA">TPA</html:option>
				<html:option value="Producer">Producer</html:option>
				<html:option value="Carrier">Carrier</html:option>
		       </html:select></td>
	       </tr>
	       <tr>
				<td width="70%" align="right" class="field"><font color="red">*&nbsp;Claims Payor:</font></td>
				<td width="30%" align="left"><html:select style="width:290px" styleClass="txtbox" styleId="ClaimsPayor" property="answer(Object::Policy::ClaimsPayor)" name="PolicySummary">
				<html:option value="">Select</html:option>
				<html:option value="Administrative Concepts (ACI)">Administrative Concepts (ACI)</html:option>
				<html:option value="Cook & Co.">Cook & Co.</html:option>
				<html:option value="Trawick/GBG">Trawick/GBG</html:option>
				<html:option value="Health Special Risk, Inc. (HSRI)">Health Special Risk, Inc. (HSRI)</html:option>
				<html:option value="MCA Administrators">MCA Administrators</html:option>
				<html:option value="Personal Insurance Administrators (PIA)">Personal Insurance Administrators (PIA)</html:option>
				<html:option value="Coordinated Benefit Plans (CBP)">Coordinated Benefit Plans (CBP)</html:option>
				<html:option value="Starr Companies">Starr Companies</html:option>
		        </html:select></td>
	       </tr>
		<td></td><td></td><td></td>
		<td align="right">
				<html:submit styleClass="covbutton" style="width:50px" value="Save" property="answer(submit)" />
        </td>
        </tr>
        <tr>
			<td>&nbsp;</td>
		</tr>				
		</table>
		
	<html:hidden property="answer(productId)" value="<%=""+productId%>" />
	<html:hidden property="answer(productVerId)" value="<%=""+productVerId%>" />
	<html:hidden property="answer(ownerId)" value='<%=""+ownerId%>' />
	<html:hidden property="answer(Object::Agency::AgencyId)" value='<%=""+lngAgencyId%>' />
	<html:hidden property="answer(Object::Agency::AgentId)" value='<%=""+lngAgentId%>' />
	<html:hidden property="answer(Object::Quote::ProductId)" value='<%=""+productId%>' />
	<html:hidden property="answer(Object::Quote::ProductVerId)" value='<%=""+productVerId%>' />	
	<html:hidden property="answer(Object::Quote::ProductStatus)" value='DEVELOPMENT' />	
	<html:hidden property="answer(policyId)" value='<%=""+policyId%>' />
	<html:hidden property="answer(policyVerId)" value='<%=""+policyVerId%>' />	
	<html:hidden property="answer(Object::Customer::CustomerId)" value='<%=""+custId%>' />	
	<html:hidden property="answer(Object::Policy::Poleffdate)" styleId="QuoteEffDate" value='<%=""+policyEffdate%>' />
	<html:hidden property="answer(policyNumber1)" value="<%=""+policyNumber%>" styleId="policyNumber" />
	<html:hidden property="answer(Issue_Binder_RuleName)" value='<%="POLICY_UPDATE_ELIGIBILITY_RULE"%>' />
	
		</html:form>
		</div>
	<div id="PolicyDetaildiv">
					<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="4" >
    	       <td colspan="2">&nbsp;</td>    	           	    
	       <tr>
			<td width="24%" align="right" class="FormLabels">Insured Name:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::Insured::Insuredname)" scope="request"/></td>
	       </tr>
	       <tr>
			<td width="24%" align="right" class="FormLabels">Insured Address 1:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::Insured::Address1)" scope="request"/></td>
	      </tr>
	      <tr>
			<td width="24%" align="right" class="FormLabels">Insured Address 2:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::Insured::Address2)" scope="request"/></td>
	      </tr>
	      <tr>
			<td width="24%" align="right" class="FormLabels">Insured Address 3:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::Insured::Address3)" scope="request"/></td>
	      </tr>
	      <tr>
				<td width="24%" align="right" class="FormLabels">Insured Address City:</td>
				<td>&nbsp;&nbsp;</td>
				<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::Insured::City)" scope="request"/></td>
		  </tr>
		   <tr>
			<td width="24%" align="right" class="FormLabels">Insured Address State:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::Insured::State)" scope="request"/></td>
	      </tr>
	       <tr>
				<td width="24%" align="right" class="FormLabels">Insured Address County:</td>
				<td>&nbsp;&nbsp;</td>
				<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::Insured::Countycode)" scope="request"/></td>
		  </tr>	
		  <tr>
			<td width="24%" align="right" class="FormLabels">Insured Address Zip Code:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::Insured::Zip)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">New Business, Renewal:</td>
			<td>&nbsp;&nbsp;</td>
			<bean:define id="BusinessType" name="PolicySummary" property="answer(Object::Policy::BusinessType)"></bean:define> 
			<td width="45%" align="left" class="TextMatter1">
				<%if(BusinessType.equals("NonBTANewBusiness")) {%>
					<%=BusinessType.toString().substring(6,9) %>&nbsp;<%=BusinessType.toString().substring(9,BusinessType.toString().length()) %>
				<%}else{%>
					<%=BusinessType.toString().substring(6,BusinessType.toString().length()) %>
				<%}%>
			</td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Policy Number Prefix:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::PolicyNumberPrefix)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Policy Number:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><%=policyNumber.toString().substring(3,(policyNumber.toString().length()))%></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Master Policy Type:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::MasterPolicyType)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Salesforce Parent Submission Number:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::SalesforceSubmissionNumber)" scope="request"/></td>			
		</tr>		
		<tr>
			<td width="24%" align="right" class="FormLabels">Transaction Date (date policy was bound):</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::TransactionDate)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Policy Effective Date:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(policyEffDate)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Policy Expiration Date:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(policyExpDate)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Carrier/Issuing Company:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::CarrierCompany)" scope="request"/></td>			
		</tr>		
		<tr>
			<td width="24%" align="right" class="FormLabels">Written Premium (including any rider premium):</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1">	
				<bean:define id="WrittenPremium" name="PolicySummary" property="answer(Object::Policy::WrittenPremium)" scope="request"/>		
				<%=""+dmsDetail.currencyFormat(Double.parseDouble(WrittenPremium.toString()))%>
			</td>	
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Commission:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1">
				<bean:define id="Commission" name="PolicySummary" property="answer(Object::Policy::Commission)" scope="request"/>
				<%=""+dmsDetail.currencyFormat(Double.parseDouble(Commission.toString())) %> 				
			</td>			
			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Attachment Point:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1">
				<bean:define id="AttachmentPoint" name="PolicySummary" property="answer(Object::Policy::AttachmentPoint)" scope="request"/>
				<%=""+dmsDetail.currencyFormat(Double.parseDouble(AttachmentPoint.toString()))  %> 
			</td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Policy Limit (Aggregate, if none use the highest principal sum):</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1">
				<bean:define id="PolicyLimit" name="PolicySummary" property="answer(Object::Policy::PolicyLimit)" scope="request"/>				
				<%=""+dmsDetail.decimalFormat(Double.parseDouble(PolicyLimit.toString()),"$##,###")%>
			</td>			
		</tr>
		
		<tr>
			<td width="24%" align="right" class="FormLabels">Tax State:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::TaxState)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Line of Business:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::LineOfBusiness)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Occupancies:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::Occupancies)" scope="request"/>
			</td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Product Coverage Type:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::ProductCoverageType)" scope="request"/></td>			
		</tr>
		<tr>
			<td class="field" style="width:70%;color:black;" colspan="2">Riders</td>
		</tr>
		<bean:define id="criticalRider" property="answer(Object::Policy::Rider::CriticalIllness)" name="PolicySummary" scope="request"/>
		<bean:define id="warRiskRider" property="answer(Object::Policy::Rider::WarRisk)" name="PolicySummary" scope="request"/>
		<bean:define id="AMEPrimaryRider" property="answer(Object::Policy::Rider::AMEPrimary)" name="PolicySummary" scope="request"/>
		<bean:define id="AMEExcessRider" property="answer(Object::Policy::Rider::AMEExcess)" name="PolicySummary" scope="request"/>
		<bean:define id="AMECOBRider" property="answer(Object::Policy::Rider::AMECOB)" name="PolicySummary" scope="request"/>
		<bean:define id="aviationRider" property="answer(Object::Policy::Rider::Aviation)" name="PolicySummary" scope="request"/>
		<%if(criticalRider.equals("Y")){%>
		<tr>
			<td width="24%" align="right" class="FormLabels" style="padding-left:60px">Critical Illness:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:define id="criticalRiderPrem" name="PolicySummary" property="answer(Object::Policy::Rider::CriticalIllnessPremium)" scope="request"/>
			<%=""+dmsDetail.currencyFormat(Double.parseDouble(criticalRiderPrem.toString()))%></td>			
		</tr>
		<%}%>
		<%if(warRiskRider.equals("Y")){%>
		<tr>
			<td width="24%" align="right" class="FormLabels" style="padding-left:60px">War Risk:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:define id="warRiskRiderPrem" name="PolicySummary" property="answer(Object::Policy::Rider::WarRiskPremium)" scope="request"/>
			<%=""+dmsDetail.currencyFormat(Double.parseDouble(warRiskRiderPrem.toString()))%></td>	
			</td>
		</tr>		
		<%}%>
		<%if(AMEPrimaryRider.equals("Y")){%>
		<tr>
			<td width="24%" align="right" class="FormLabels" style="padding-left:60px">AME - Primary:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:define id="AMEPrimaryRiderPrem" name="PolicySummary" property="answer(Object::Policy::Rider::AMEPrimaryPremium)" scope="request"/>
			<%=""+dmsDetail.currencyFormat(Double.parseDouble(AMEPrimaryRiderPrem.toString()))%></td>	
			</td>
		</tr>
		<%}%>
		<%if(AMEExcessRider.equals("Y")){%>
		<tr>
			<td width="24%" align="right" class="FormLabels" style="padding-left:60px">AME - Excess:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:define id="AMEExcessRiderPrem" name="PolicySummary" property="answer(Object::Policy::Rider::AMEExcessPremium)" scope="request"/>
			<%=""+dmsDetail.currencyFormat(Double.parseDouble(AMEExcessRiderPrem.toString()))%></td>	
			</td>			
		</tr>
		<%}%>
		<%if(AMECOBRider.equals("Y")){%>
		<tr>
			<td width="24%" align="right" class="FormLabels" style="padding-left:60px">AME - COB:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:define id="AMECOBRiderPrem" name="PolicySummary" property="answer(Object::Policy::Rider::AMECOBPremium)" scope="request"/>
			<%=""+dmsDetail.currencyFormat(Double.parseDouble(AMECOBRiderPrem.toString()))%></td>	
			</td>			
		</tr>
		<%}%>
		<%if(aviationRider.equals("Y")){%>
		<tr>
			<td width="24%" align="right" class="FormLabels" style="padding-left:60px">Aviation:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:define id="aviationRiderPrem" name="PolicySummary" property="answer(Object::Policy::Rider::AviationPremium)" scope="request"/>
			<%=""+dmsDetail.currencyFormat(Double.parseDouble(aviationRiderPrem.toString()))%></td>	
			</td>			
		</tr>	
		<%}%>	
		<tr>
			<td width="24%" align="right" class="FormLabels">Occurrence Indicator:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::OccurrenceIndicator)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Facultative Reinsurance Indicator:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::FacultativeReinsuranceIndicator)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Agent/Broker Commission Percent:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:define id="AgentCommission" name="PolicySummary" property="answer(Object::Policy::AgentCommission)" scope="request"/>
			<%=""+dmsDetail.decimalFormat(Double.parseDouble(AgentCommission.toString()),"##,###.00")%>%
			</td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Number of Covered Lives:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::NumberOfCoveredLives)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Premium Due Date:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::PremiumDueDate)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Billing Mode:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::BillingMode)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Underwriter:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::Underwriter)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Sale Ownership:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::SaleOwnership)" scope="request"/></td>			
		</tr>
		<tr>
			<td width="24%" align="right" class="FormLabels">Premium Collection:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::PremiumCollection)" scope="request"/></td>			
		</tr>				
		<tr>
			<td width="24%" align="right" class="FormLabels">Claims Payor:</td>
			<td>&nbsp;&nbsp;</td>
			<td width="45%" align="left" class="TextMatter1"><bean:write name="PolicySummary" property="answer(Object::Policy::ClaimsPayor)" scope="request"/></td>			
		</tr>
		<tr>
			<td colspan="3">
				<table border="0" cellpadding="4" cellspacing="0" align="center"
				width="97%">
				<tr>
					<td align="right"><input type="button" value="Edit" class="covbutton"
						style="width:50px" onclick="editInsuredDetail()"/></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				</table>
			</td>
		</tr>		
		</table>
					
		</div>

					</td>
			  </tr>	</table>
     </td>   </tr>






 </table>
</div>
</div>

</div>
		<%String IsApplicationDisabled="Y";%>
			<%String IsOptionDisabled="Y";%>
		<dmshtml:dms_isPresent property="<%=new String[]{"In Progress"}%>" value="<%=QuoteStatus.toString()%>" negated="true">
					<%IsOptionDisabled="N";%>
					<%IsApplicationDisabled="N";%>
		</dmshtml:dms_isPresent>
		<dmshtml:dms_isPresent property="<%=new String[]{"Referred","Submitted"}%>" value="<%=QuoteStatus.toString()%>"  negated="true">
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SAVE_AFTER_SUBMIT_QUOTE"}%>' connector='or' negated="true">
					<%IsOptionDisabled="N";%>
					<%IsApplicationDisabled="N";%>
				</dmshtml:dms_static_with_connector>
		</dmshtml:dms_isPresent>
		<html:hidden styleId="IsOptionDisabled" property="answer(IsOptionDisabled)" value="<%=""+IsOptionDisabled %>"/>
		<html:hidden property="Object::Application::ISApplicationDisabled" value='<%=""+IsApplicationDisabled %>' styleId="IsApplicationDisabled"/>
	<!-- Div for edit location and tank pop-up -->
<%
String subjectivityIdFromAlert = "";
if(request.getParameter("answer(QuoteSubjectivityIdFromAlert)") != null){
	subjectivityIdFromAlert = ""+request.getParameter("answer(QuoteSubjectivityIdFromAlert)");
}
%>
<script type="text/javascript">
	

	
		
	function loadEndorsementTab(EndorsementTab){
		document.getElementById("policyDivTable").style.display="block";
		document.getElementById("SavePolicydetaildiv").style.display = "none";
		document.getElementById("PolicyDetaildiv").style.display = "none";
		activateQuoteTabs(EndorsementTab);

		var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;
		
		//for prior policy versions
		<logic:empty name="PolicySummary" property="answer(policyId)">
		
			<% policyId = "" + request.getParameter("answer(policyId)"); %>
			policyId="<%=policyId+""%>"
		</logic:empty>
		
		<logic:empty name="PolicySummary" property="answer(policyId)">
			<% policyVerId = "" + request.getParameter("answer(policyVerId)"); %>
				policyVerId="<%=policyVerId+""%>"
		</logic:empty>
		
		
		var ownerId  = document.getElementById("ownerId").value;
		
		var conditionFlag="<%=conditionFlag+""%>";
 		var policyNumber = document.getElementById("policyNumber").value;
		var policyStatus="<%=policyStatus+""%>";
		var custId = document.getElementById("custId").value;
		var agencyId = document.getElementById("agencyId").value;
		var isActivePolicy="<%=isActivePolicy+""%>";
		var paymentPlan="<%=paymentPlan+""%>";
		var parentPolicyId = "<%=""+parentPolicyId%>";
		var productVerId  = document.getElementById("productVerId").value;
		var productId  = document.getElementById("productId").value;		
		var pars = 'answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+'&answer(ownerId)='+ownerId;
		var pars2='&answer(conditionFlag)='+conditionFlag+'&answer(policyNumber)='+policyNumber+'&answer(policyStatus)='+policyStatus+
			'&answer(custId)='+custId+'&answer(agencyId)='+agencyId+'&answer(isActivePolicy)='+isActivePolicy+
			'&answer(paymentPlan)='+paymentPlan+'&answer(productVerId)='+productVerId+'&answer(productId)='+productId+'&answer(parentPolicyId)='+parentPolicyId;

		pars=pars+pars2;
		

		var url = '../policy/EndorsementNonBTATabResult.jsp?';
					
		new Ajax.Request(url, 
	 	{method: 'post',parameters:pars,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		enableTabs();
		 	},onSuccess: function(transport){	
		 	document.getElementById("PolicyDiv").style.display="inline";
		 	document.getElementById("PolicyDiv").innerHTML= transport.responseText;
		 	
		 	document.getElementById("Payment").style.display = "none";
			if(document.getElementById("paymentSuccess") != null && document.getElementById("paymentSuccess") !=undefined){
		 		document.getElementById("paymentSuccess").innerHTML="";
			}
			if(document.getElementById("paymentFailure") != null && document.getElementById("paymentFailure") !=undefined){
		 		document.getElementById("paymentFailure").innerHTML="";
			}
		 	}
		}
	);
	}   
   
var activeTab=document.getElementById("dfaultPolicyTab").value;   
   if(activeTab=='EndorsmentTab'){
   loadEndorsementTab('EndorsementTab');
   }
   if(activeTab=='SubjectivityTab'){
   	loadSubjectivityTab('SubjectivityTab');refreshPolicyPreBind();refreshPolicyPostBind();refereshMultiAttachmentList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');refereshMultiNotesList('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity');
   	<%if(subjectivityIdFromAlert.length()>0){%>
	 initSubjectivityDetailDialog();
		getPolicySubjectivityDetailpopup('<%=""+subjectivityIdFromAlert%>');
	<%}%>
   }
  
  
  function loadPoliciesTab(PoliciesTab){	
		document.getElementById("policyDivTable").style.display="block";
		var quoteId=document.getElementById("parentQuoteId").value;
	    var ownerId = document.getElementById("ownerId").value; 
		var quoteVerId=document.getElementById("parentQuoteVerId").value;
		//document.getElementById("parentQuoteVerId").value;

		 activateQuoteTabs(PoliciesTab);	
		document.getElementById("SavePolicydetaildiv").style.display = "none";
	    document.getElementById("Payment").style.display = "none";
		document.getElementById("PolicyDiv").style.display = "inline";	
		document.getElementById("PolicyDiv").innerHTML = document.getElementById("PolicyDetaildiv").innerHTML;
		if(document.getElementById("paymentSuccess") != null && document.getElementById("paymentSuccess") !=undefined){
	 		document.getElementById("paymentSuccess").innerHTML="";
		}
		if(document.getElementById("paymentFailure") != null && document.getElementById("paymentFailure") !=undefined){
	 		document.getElementById("paymentFailure").innerHTML="";
		}
		// document.getElementById("PolicyDetaildiv").innerHTML="";			 
		 document.getElementById("PolicyDiv").style.display = "block";	
		 enableTabs();

		}

   function getEditPaymentInfo(paymentId){

		var policyId    = document.getElementById("policyId").value;
		var policyVerId = document.getElementById("policyVerId").value;	
		var policyNumber = document.getElementById("policyNumber").value;
		var totalPremium =  document.getElementById("TotalPremium").value;
		var productVerId =  document.getElementById("productVerId").value;
		var isActivePolicy="<%=isActivePolicy+""%>";
		var pars = 'answer(paymentId)='+paymentId+'&answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+'&answer(policyNumber)='+policyNumber+'&answer(Object::Policy::TotalPremium)='+totalPremium+
		           '&answer(Object::Policy::Policyverid)='+policyVerId+'&answer(Object::Policy::PolicyId)='+policyId+'&answer(productVerId)='+productVerId+'&answer(isActivePolicy)='+isActivePolicy;
		
		var url = '../getPaymentInformation.do?';
		
		new Ajax.Request(url, 
	 	{method: 'post',parameters:pars,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
		 		
		 	},onSuccess: function(transport){
			 		
		 		document.getElementById("paymenttrans").style.display="none";
		 		document.getElementById("paymentloginfo").style.display="none";
		 		document.getElementById("EditPaymentDiv").style.display="block";
		 		document.getElementById("PaymentPlanTrans").style.display="none";
		 		activatePaymentSubTabs('AddPaymentTab');
		 		document.getElementById("EditPaymentDiv").innerHTML=transport.responseText;
		 		document.getElementById("PolicyDetaildiv").style.display = "none";		 		
		 		initEditPaymentCal();
		 		setPaymentFields1();
		 		if(document.getElementById("ext-gen56")!=null && document.getElementById("ext-gen56")!=undefined){
   					document.getElementById("ext-gen56").className="";
   				}
   				if(document.getElementById("ext-gen63")!=null && document.getElementById("ext-gen63")!=undefined){
   					document.getElementById("ext-gen63").className="";
   				}
		 	}
		}
	);	
			
	}

</script>
   
	<%  String openTabs = "";%>	
	<%if(request.getParameter("answer(activateTabId)")!=null){
	 openTabs = ""+request.getParameter("answer(activateTabId)");
	}	
	if(openTabs.equals("Payment")){%>
		<script type="text/javascript">
			activatePaymentSubTabs('PaymentLogTab');
			activateQuoteTabs('PaymentTab');
			document.getElementById('PolicyDiv').style.display='none';
			document.getElementById('paymentloginfo').style.display='block';
			document.getElementById("PaymentPlanTrans").style.display="block";
			document.getElementById('paymenttrans').style.display='none';
			document.getElementById('EditPaymentDiv').style.display='none';
			document.getElementById('Payment').style.display='block';
			document.getElementById("PolicyDetaildiv").style.display = "none";
		</script>
	<%}else if(openTabs.equals("EndorsementTab")){%>
		<script type="text/javascript">
			loadEndorsementTab('EndorsementTab');
		</script>
	<%}%>
	
<script type="text/javascript">
   		
   			Ext.onReady(function(){
   	   			//To override the ext style for td.
   				//document.getElementById("ext-gen6").className="";   			
   				if(document.getElementById("ext-gen21")!=null && document.getElementById("ext-gen21")!=undefined){
   					document.getElementById("ext-gen21").className="";
   				}
   				if(document.getElementById("ext-gen6")!=null && document.getElementById("ext-gen6")!=undefined){
   					document.getElementById("ext-gen6").className="";
   				}
   				if(document.getElementById("ext-gen14")!=null && document.getElementById("ext-gen14")!=undefined){
   					document.getElementById("ext-gen14").className="";
   				}
   				
   				var blurHandlerRemittanceDate = function() {        				
   					 var effDate1 = Ext.getCmp('RemittanceDate').getValue();    					 
   					var vardate = document.getElementById("RemittanceDate").value;   					
   					var ddate = new Date(vardate);	   					
   					
   					if(!isDate(vardate)){
   						alert("Invalid Remmitance Date")
   						document.getElementById("RemittanceDateHidden").value = "";   						
   						return false;
   					}
   					
   					var dmonth = parseInt(vardate.substring(0, 2), 10);
   					var dday = parseInt(vardate.substring(3, 5), 10);
   					var dyear = parseInt(vardate.substring(6, 10), 10);
  					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
   					{
   						if(document.getElementById('RemittanceDate').value != ""){
					      alert("Please enter date in 'MM/DD/YYYY' format");				
						  return false;
						  }
   					}   					
   					var reqDate = new Date("01/01/2010");

   					if (ddate < reqDate)
   					{   					
   						alert("Remmitance Date cannot be prior to Jan 1, 2010");
   						document.getElementById("RemittanceDateHidden").value = "";
   						return false;
   					}	 
   					 var MM1 = effDate1.getMonth()+1;
					 var DD1 = effDate1.getDate();
					 var YY1 = effDate1.getFullYear();
					 if(MM1<10){ MM1 = "0"+(MM1);}
					 if(DD1<10){ DD1 = "0"+DD1;}
					 	
					 document.getElementById("RemittanceDateHidden").value = MM1+'/'+DD1+'/'+YY1;					 				 		 
   				};      				
   				
   				var blurHandlerPaymentDate = function() { 					 
   					
   					var expDate1 = Ext.getCmp('PaymentDate').getValue();  
   					var vardate = document.getElementById("PaymentDate").value;
   					var ddate = new Date(vardate);	   					
   					
   					if(!isDate(vardate)){
   						alert("Invalid Payment Date")
   						document.getElementById("PaymentDateHidden").value =  "";   						
   						return false;
   					}
   					if (vardate=="")
   					{
   						alert("Please enter the Valid Payment Date");
   						document.getElementById("PaymentDateHidden").value =  "";
   						//frm.txtDate.focus();
   						return false;
   					}
   					var dmonth = parseInt(vardate.substring(0, 2), 10);
   					var dday = parseInt(vardate.substring(3, 5), 10);
   					var dyear = parseInt(vardate.substring(6, 10), 10);
   					
   					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
   					{
   						if(document.getElementById('PaymentDate').value != ""){
					      alert("Please enter date in 'MM/DD/YYYY' format");				
						  return false;
						  }
   					}
   					var reqDate = new Date("01/01/2010");

   					if (ddate < reqDate)
   					{   					
   						alert("Payment Date cannot be prior to Jan 1, 2010");
   						document.getElementById("PaymentDateHidden").value =  "";
   						//frm.txtDate.focus();
   						return false;
   					}
                     var MM1 = expDate1.getMonth()+1;
					 var DD1 = expDate1.getDate();
					 var YY1 = expDate1.getFullYear();
				
					 if(MM1<10){ MM1 = "0"+(MM1);}
					 if(DD1<10){ DD1 = "0"+DD1;}
				
					 document.getElementById("PaymentDateHidden").value = MM1+'/'+DD1+'/'+YY1;					 					 
   				}; 
   				var blurHandlerCreditDate = function() { 					 
   					
  					 var expDate1 = Ext.getCmp('CreditDate').getValue();  
  					var vardate = document.getElementById("CreditDate").value;
  					var ddate = new Date(vardate);	
  					if(!isDate(vardate)){
  						alert("Invalid Credit Date")
  						document.getElementById("CreditDateHidden").value =  "";  						
  						return false;
  					}
  					if (vardate=="")
  					{
  						alert("Please enter the Valid Credit Date");
  						document.getElementById("CreditDateHidden").value =  "";
  						//frm.txtDate.focus();
  						return false;
  					}
  					var dmonth = parseInt(vardate.substring(0, 2), 10);
  					var dday = parseInt(vardate.substring(3, 5), 10);
  					var dyear = parseInt(vardate.substring(6, 10), 10);
  					
  					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
  					{
  						if(document.getElementById('CreditDate').value != ""){
					      alert("Please enter date in 'MM/DD/YYYY' format");				
						  return false;
						 }
  					}
  					var reqDate = new Date("01/01/2010");

  					if (ddate < reqDate)
  					{  					
  						alert("Payment Date cannot be prior to Jan 1, 2010");
  						document.getElementById("CreditDateHidden").value =  "";
  						//frm.txtDate.focus();
  						return false;
  					}
  					 var MM1 = expDate1.getMonth()+1;
					 var DD1 = expDate1.getDate();
					 var YY1 = expDate1.getFullYear();
				
					 if(MM1<10){ MM1 = "0"+(MM1);}
					 if(DD1<10){ DD1 = "0"+DD1;}
					 document.getElementById("CreditDateHidden").value = MM1+'/'+DD1+'/'+YY1;					 
  				}; 
   										   							
   				Ext.EventManager.on('RemittanceDate', 'blur', blurHandlerRemittanceDate);   				  				
  				Ext.EventManager.on('PaymentDate', 'blur', blurHandlerPaymentDate);
  				Ext.EventManager.on('CreditDate', 'blur', blurHandlerCreditDate);
  				
  			});
  	
</script>
<script type="text/javascript">
   		
   			Ext.onReady(function(){   
   			try{				
   				var blurHandlerRemittanceDateEdit = function() {        				
   					 var effDate1 = Ext.getCmp('RemittanceDateEdit').getValue();    					 
   					var vardate = document.getElementById("RemittanceDateEdit").value;   					
   					var ddate = new Date(vardate);	
   					   					
   					if(!isDate(vardate)){
   						alert("Invalid Remmitance Date")
   						document.getElementById("RemittanceDateEditHidden").value = "";   						
   						return false;
   					}
   					var dmonth = parseInt(vardate.substring(0, 2), 10);
   					var dday = parseInt(vardate.substring(3, 5), 10);
   					var dyear = parseInt(vardate.substring(6, 10), 10);
	
   					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
   					{
   						if(document.getElementById('RemittanceDateEdit').value != ""){
					      alert("Please enter date in 'MM/DD/YYYY' format");				
						  return false;
						  }
   					}

   					var reqDate = new Date("01/01/2010");
   					if (ddate < reqDate)
   					{   					
   						alert("Remmitance Date cannot be prior to Jan 1, 2010");
   						document.getElementById("RemittanceDateEditHidden").value = "";
   						return false;
   					}			 
   					 var MM1 = effDate1.getMonth()+1;
					 var DD1 = effDate1.getDate();
					 var YY1 = effDate1.getFullYear();
					 if(MM1<10){ MM1 = "0"+(MM1);}
					 if(DD1<10){ DD1 = "0"+DD1;}
					 	
					 document.getElementById("RemittanceDateEditHidden").value = MM1+'/'+DD1+'/'+YY1;					 				 		 
   				};      				
   				
   				var blurHandlerPaymentDateEdit = function() { 					 
   					
   					 var expDate1 = Ext.getCmp('PaymentDateEdit').getValue();  
   					var vardate = document.getElementById("PaymentDateEdit").value;
   					var ddate = new Date(vardate);	   					
   					
   					if(!isDate(vardate)){
   						alert("Invalid Payment Date")
   						document.getElementById("PaymentDateEditHidden").value =  "";   						
   						return false;
   					}   					
   					
   					if (vardate=="")
   					{
   						alert("Please enter the Valid Payment Date");
   						document.getElementById("PaymentDateEditHidden").value =  "";
   						//frm.txtDate.focus();
   						return false;
   					}   				
   					
   					var dmonth = parseInt(vardate.substring(0, 2), 10);
   					var dday = parseInt(vardate.substring(3, 5), 10);
   					var dyear = parseInt(vardate.substring(6, 10), 10);
   					
   					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
   					{
   						if(document.getElementById('PaymentDateEdit').value != ""){
					      alert("Please enter date in 'MM/DD/YYYY' format");				
						  return false;
						  }
   					}
   					   					
   					var reqDate = new Date("01/01/2010");
   					if (ddate < reqDate)
   					{
   						alert("Payment Date cannot be prior to Jan 1, 2010");
   						document.getElementById("PaymentDateEditHidden").value =  "";
   						//frm.txtDate.focus();
   						return false;
   					}

   					 var MM1 = expDate1.getMonth()+1;
					 var DD1 = expDate1.getDate();
					 var YY1 = expDate1.getFullYear();
				
					 if(MM1<10){ MM1 = "0"+(MM1);}
					 if(DD1<10){ DD1 = "0"+DD1;}
				
					 document.getElementById("PaymentDateEditHidden").value = MM1+'/'+DD1+'/'+YY1;									 
   				}; 

   				var blurHandlerCreditDateEdit = function() { 					 
   					
  					 var expDate1 = Ext.getCmp('CreditDateEdit').getValue();  
  					var vardate = document.getElementById("CreditDateEdit").value;
  					var ddate = new Date(vardate);	
  					  					
  					if(!isDate(vardate)){
  						alert("Invalid Credit Date")
  						document.getElementById("CreditDateEditHidden").value =  "";  						
  						return false;
  					}			
  					
  					if (vardate=="")
  					{
  						alert("Please enter the Valid Credit Date");
  						document.getElementById("CreditDateEditHidden").value =  "";
  						//frm.txtDate.focus();
  						return false;
  					}  					 				
  					
  					var dmonth = parseInt(vardate.substring(0, 2), 10);
  					var dday = parseInt(vardate.substring(3, 5), 10);
  					var dyear = parseInt(vardate.substring(6, 10), 10);
  					
  					if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
  					{
  						if(document.getElementById('CreditDateEdit').value != ""){
					      alert("Please enter date in 'MM/DD/YYYY' format");				
						  return false;
						  }
  					} 					
  					
  					var reqDate = new Date("01/01/2010");
  					if (ddate < reqDate)
  					{  					
  						alert("Payment Date cannot be prior to Jan 1, 2010");
  						document.getElementById("CreditDateEditHidden").value =  "";
  						//frm.txtDate.focus();
  						return false;
  					}

  					 var MM1 = expDate1.getMonth()+1;
					 var DD1 = expDate1.getDate();
					 var YY1 = expDate1.getFullYear();
				
					 if(MM1<10){ MM1 = "0"+(MM1);}
					 if(DD1<10){ DD1 = "0"+DD1;}
				
					 document.getElementById("CreditDateEditHidden").value = MM1+'/'+DD1+'/'+YY1;					 
  				}; 
   										   							
   				Ext.EventManager.on('RemittanceDateEdit', 'blur', blurHandlerRemittanceDateEdit);   				  				
  				Ext.EventManager.on('PaymentDateEdit', 'blur', blurHandlerPaymentDateEdit);
  				Ext.EventManager.on('CreditDateEdit', 'blur', blurHandlerCreditDateEdit);
  				}catch(error){}
  			});
  	
</script>

<script type="text/javascript">
YAHOO.example.BasicRemote = function() {
    // Use an XHRDataSource    
   var oDS = new YAHOO.util.XHRDataSource('../AutoCompleteZipCode.do');
    // Set the responseType
    oDS.responseType = YAHOO.util.XHRDataSource.TYPE_JSARRAY;
    oDS.responseSchema = {fields:["Zipcode", "City","County","State","Country"]};

    // Enable caching
    oDS.maxCacheEntries = 5;

    // Instantiate the AutoComplete
    var oAC = new YAHOO.widget.AutoComplete("Zip", "zipAutoCompleteResContainer", oDS);
    // The webservice needs custom parameters 
    oAC.generateRequest = function(sQuery) { 
    	
        return "?answer(Object::ZipCode::PageNum)=0&AutoCompleteZipLookupSqlname="+document.forms[1].zipLookupName.value+"&FormName=PolicySummary[1]&query=" + sQuery ; 
    };
         
    oAC.useShadow = true;
    oAC.resultTypeList = false;
	oAC.applyLocalFilter = false;
	oAC.queryMatchSubset = false;
	oAC.minQueryLength = 3;	
	oAC.queryDelay = 1;
	oAC.prehighlightClassName = "yui-ac-prehighlight";
	// Display up to 20 results in the container
	oAC.maxResultsDisplayed = 20

    // Custom formatter to highlight the matching letters
    oAC.formatResult = function(oResultData, sQuery, sResultMatch) {
        var query = sQuery.toLowerCase(),
            zipcode = oResultData.Zipcode,
            city = oResultData.City,
            county = oResultData.County || "", // Guard against null value
            query = sQuery.toLowerCase(),
            zipcodeMatchIndex = zipcode.toLowerCase().indexOf(query),
            cityMatchIndex = city.toLowerCase().indexOf(query),
            countyMatchIndex = county.toLowerCase().indexOf(query),
            displayZipcode, displayCity, displaynCounty;

        if(zipcodeMatchIndex > -1) {
            displayZipcode = highlightMatch1(zipcode, query, zipcodeMatchIndex);
        }
        else {
            displayZipcode = zipcode;
        }

        if(cityMatchIndex > -1) {
            displayCity = highlightMatch1(city, query, cityMatchIndex);
        }
        else {
            displayCity = city;
        }

        if(countyMatchIndex > -1) {
            displayCounty = highlightMatch1(county, query, countyMatchIndex);
        }
        else {
            displayCounty = county ? county : "";
        }
		
        return displayZipcode + "\t" + displayCity + "\t" + displayCounty + "\t" + oResultData.State + "\t" + oResultData.Country ;

    };

    // Helper function for the formatter
    var highlightMatch1 = function(full, snippet, matchindex) {
        return full.substring(0, matchindex) +
                "<span class='match'>" +
                full.substr(matchindex, snippet.length) +
                "</span>" +
                full.substring(matchindex + snippet.length);
    };

    // Define an event handler to populate a hidden form field
    // when an item gets selected and populate the input field
    var myHiddenField = YAHOO.util.Dom.get("myHidden");
    var myHandler = function(sType, aArgs) {

        var myAC = aArgs[0]; // reference back to the AC instance
        var elLI = aArgs[1]; // reference to the selected LI element
        var oData = aArgs[2]; // object literal of selected item's result data
       
        document.forms[0].City.value = oData.City;        
		document.forms[0].County.value = oData.County;
		document.forms[0].State.value = oData.State;
		
   
        // update hidden form field with the selected item's ID
        myHiddenField.value = elLI.Zipcode;
        myAC.getInputEl().value = oData.Zipcode + "\t" + oData.City+"\t" + (oData.County ? " (" + oData.State + ")" : "")+ "\t" + oData.State + "\t" + oData.Country ;
   		document.forms[0].City.value = oData.City;
		document.forms[0].County.value = oData.County;
		  
    };
    oAC.itemSelectEvent.subscribe(myHandler);
	
    return {
        oDS: oDS,
        oAC: oAC
    };

}();
</script>

  <script type="text/javascript">
   			Ext.onReady(function(){   
   			var TransactionDate = document.getElementById("TransactionDateHidden").value;
  			var dyear = parseInt(TransactionDate.substring(0, 4), 10);
			var dmonth = parseInt(TransactionDate.substring(5, 7), 10);
			var dday = parseInt(TransactionDate.substring(8, 10), 10);			
			Ext.getCmp('TransactionDate').setValue('<%=""+TransactionDateId%>');
			
   			var PremiumDueDate = document.getElementById("PremiumDueDateHidden").value;
  			var dyear1 = parseInt(PremiumDueDate.substring(0, 4), 10);
			var dmonth1 = parseInt(PremiumDueDate.substring(5, 7), 10);
			var dday1 = parseInt(PremiumDueDate.substring(8, 10), 10);			
			Ext.getCmp('PremiumDueDate').setValue('<%=""+PremiumDueDateId%>');
					 		
   			Ext.getCmp('policyEffectiveDate').setValue('<%=""+polEffDate1%>');
   			document.getElementById("policyEffectiveDateHidden").value = '<%=""+polEffDate1%>';
			
			Ext.getCmp('policyExpirationDate').setValue('<%=""+polExpDate1%>');
   			document.getElementById("policyExpirationDateHidden").value = '<%=""+polExpDate1%>'
   			
  			var blurHandlerEffectiveDate = function() {  
	  			var strDate = document.getElementById('policyEffectiveDate').value;  			
	  			var dmonth = parseInt(strDate.substring(0, 2), 10);
				var dday = parseInt(strDate.substring(3, 5), 10);
				var dyear = parseInt(strDate.substring(6, 10), 10);
	           	if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
				{
			    if(document.getElementById('policyEffectiveDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
				}else{
					var effDate1 = Ext.getCmp('policyEffectiveDate').getValue(); 
					var MM1 = effDate1.getMonth()+1;
					var DD1 = effDate1.getDate();
					var YY1 = effDate1.getFullYear();
					var YY2 = effDate1.getFullYear() + 1;
					if(MM1<10){ MM1 = "0"+(MM1);}
					if(DD1<10){ DD1 = "0"+DD1;}
					Ext.getCmp('policyEffectiveDate').setValue(MM1+'/'+DD1+'/'+YY1);
					document.getElementById("policyEffectiveDateHidden").value=MM1+'/'+DD1+'/'+YY1; 					   									
	   			}
   			}; 
   			var blurHandlerExpirationDate = function() {  
  			 
  			var strDate = document.getElementById('policyExpirationDate').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{
			    if(document.getElementById('policyExpirationDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
			}else{
				var expDate1 = Ext.getCmp('policyExpirationDate').getValue(); 
				var MM2 = expDate1.getMonth()+1;
				var DD2 = expDate1.getDate();
				var YY2 = expDate1.getFullYear();
				var effDate1 = document.getElementById('policyEffectiveDate').value;
  				var dmonth1 = parseInt(effDate1.substring(0, 2), 10);
				var dday1 = parseInt(effDate1.substring(3, 5), 10);
				var dyear1 = parseInt(effDate1.substring(6, 10), 10);
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
				Ext.getCmp('policyExpirationDate').setValue(MM2+'/'+DD2+'/'+YY2);
   				document.getElementById("policyExpirationDateHidden").value =MM2+'/'+DD2+'/'+YY2;
   				
				if(YY2 < dyear1){
					alert("Please enter the valid Expiration date");									
				}
				if((MM2 < dmonth1) && (YY2==dyear1)){
					alert("Please enter the valid Expiration date");					
				}
				if((MM2 == dmonth1) && (DD2<=dday1) && (YY2==dyear1)){
					alert("Please enter the valid Expiration date");					
				}
   			}
   			}; 
   			
   			var blurHandlerTransactionDate = function() {  
  			 
  			var strDate = document.getElementById('TransactionDate').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{
			    if(document.getElementById('TransactionDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
			}else{

				var expDate1 = Ext.getCmp('TransactionDate').getValue(); 
				var MM2 = expDate1.getMonth()+1;
				var DD2 = expDate1.getDate();
				var YY2 = expDate1.getFullYear();				
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
				Ext.getCmp('TransactionDate').setValue(MM2+'/'+DD2+'/'+YY2);
   				document.getElementById("TransactionDateHidden").value =MM2+'/'+DD2+'/'+YY2;   				
		
   			}
   			}; 
   			
   			var blurHandlerPremiumDueDate = function() {  
  			 
  			var strDate = document.getElementById('PremiumDueDate').value;
  			var dmonth = parseInt(strDate.substring(0, 2), 10);
			var dday = parseInt(strDate.substring(3, 5), 10);
			var dyear = parseInt(strDate.substring(6, 10), 10);
			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || strDate.substring(2, 3)!="/" || strDate.substring(5, 6)!="/")
			{
			    if(document.getElementById('PremiumDueDate').value != "")	{
			      alert("Please enter date in 'MM/DD/YYYY' format");				
				  return false;
				}
			}else{
				var expDate1 = Ext.getCmp('PremiumDueDate').getValue(); 
				var MM2 = expDate1.getMonth()+1;
				var DD2 = expDate1.getDate();
				var YY2 = expDate1.getFullYear();
				var effDate1 = document.getElementById('PremiumDueDate').value;
  				var dmonth1 = parseInt(effDate1.substring(0, 2), 10);
				var dday1 = parseInt(effDate1.substring(3, 5), 10);
				var dyear1 = parseInt(effDate1.substring(6, 10), 10);
				if(MM2<10){ MM2 = "0"+(MM2);}
				if(DD2<10){ DD2 = "0"+DD2;}
				Ext.getCmp('PremiumDueDate').setValue(MM2+'/'+DD2+'/'+YY2);
   				document.getElementById("PremiumDueDateHidden").value =MM2+'/'+DD2+'/'+YY2;
   			}
   			}; 
   			
   			Ext.EventManager.on('PremiumDueDate', 'blur', blurHandlerPremiumDueDate); 
   			Ext.EventManager.on('TransactionDate', 'blur', blurHandlerTransactionDate); 
			Ext.EventManager.on('policyEffectiveDate', 'blur', blurHandlerEffectiveDate); 
			Ext.EventManager.on('policyExpirationDate', 'blur', blurHandlerExpirationDate); 
 			});
 			
 			</script>
 			
 		 <%if(edit.equals("1")){%>		
          <script type="text/javascript">
             editInsuredDetail();
          </script>
          <%}%>