<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.text.DecimalFormat" %>
<script type="text/javascript">
 var url1 = "/saveQuoteEILRiskApplicationAction3.0.go?";
 var isSpecificValidationNeeded = true;
 var openTabClassesId = "";
 function doSpecificValidation(frm){
 	return true;
 }
</script>
<script type="text/javascript" src="../Scripts/JScripts/PolicyClassBenefits.js"></script>
<link rel="stylesheet" type="text/css" href="../styles/ui3.0/style.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/datatable1/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css">


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
<script type="text/javascript" src="../Scripts/JScripts/PolicySummaryBTA.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>
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
.x-panel-body {border-bottom: 1px solid;border-left: 1px solid;border-right: 1px solid;border-bottom-color: #4e4e50;background:url(../styles/ui3.0/i/TabContentBg.gif);border-right-color: #4e4e50;border-left-color: #4e4e50}
.x-panel-body-noheader{border-top: 0px;} 
.x-panel-body-noborder{border-left: 1px solid;border-top: 1px solid;border-right: 1px solid;border-bottom: 1px solid;border-top-style:#4e4e50; }
.x-panel-noborder{border-left: 0px;border-top: 0px;border-right: 0px;border-bottom: 0px;}
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

<bean:define id="custId" name="PolicySummary" property="answer(customerId)" />
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
<html:hidden name="PolicySummary" property="answer(Object::Agency::AgencyId)" styleId="agencyId" />
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


<bean:define id="agencyId" name="PolicySummary" property="answer(Object::Agency::AgencyId)"  />

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
	<tr height="10">
		<td>
		</td>
	</tr>
	<tr>
		<td width="100%" bgcolor="#C6DEEA">
			<jsp:include page="../common/CustomerAgencyLinkspage.jsp">
				<jsp:param name="answer(Object::Customer::CustomerId)" value="<%=""+custId%>" />
			</jsp:include>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
</table>
</logic:notEqual>
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
						
						<%java.util.ArrayList planDetailArr  = (java.util.ArrayList)plPolicyDetail.getPLPolicyPlanList();
						com.dms.ejb.insurance.policy.pl.PLPolicyPlanDetail policyPlanDetail = (com.dms.ejb.insurance.policy.pl.PLPolicyPlanDetail)planDetailArr.get(0); 
						String planState= policyPlanDetail.getStateCode(); 
						riskState = planState;
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
	  		Policy&nbsp;<%=""+policyNumber%><% if(policySubNum!=null && policySubNum!="") { %>
	  			<%if(Long.parseLong(policySubNum)>=1){ %>
					<%="- "+policySubNum%>
				<%}%>
			<% } %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Policy Effective Year <%="- "+effectiveYear%>
	  		
	  	</div>
	  </td>
    </tr>
    <tr><td colspan="4">&nbsp;</td></tr>
	  <tr>
	  	<td>
	  <table width="80%">
	  <tr>
		<td  width="25%" class="links" >
		
			
				
			<!--########################## SUBMISSION SUMMARY #########################################-->
     			<dmshtml:GetSubmissionDetailByQuoteId nameInSession="submissionDetailByQuoteId" quoteId="<%=Long.parseLong(parentQuoteId.toString())%>" ownerId='<%=Long.parseLong(ownerId.toString())%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
			<logic:present name="submissionDetailByQuoteId" scope="request">
			<bean:define id="subDetailMap" name="submissionDetailByQuoteId" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
			<bean:define id="subIdByQuoteId" name="subDetailMap" property="Object::Submission::SubmissionId" />
			<bean:define id="subVerIdByQuoteId" name="subDetailMap" property="Object::Submission::SubmissionVerId" />
			<bean:define id="custIdByQuoteId" name="subDetailMap" property="Object::Submission::CustomerId" />
				<logic:greaterThan name="subIdByQuoteId" value="0">
				<logic:greaterThan name="subVerIdByQuoteId" value="0">
					<logic:greaterThan name="custIdByQuoteId" value="0">										
								<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=Long.parseLong(subVerIdByQuoteId.toString())%>&answer(Object::Submission::SubmissionId)=<%=Long.parseLong(subIdByQuoteId.toString())%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=Long.parseLong(custIdByQuoteId.toString())%>&customerId=<%=Long.parseLong(""+custIdByQuoteId)%>&answer(Object::Customer::CustomerId)=<%=Long.parseLong(""+custIdByQuoteId)%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=Long.parseLong(""+custIdByQuoteId)%>" class="button2" title="Click to go to Submission Summary" style="width:200px" > Go to Submission Summary </a>																	
					</logic:greaterThan>
				</logic:greaterThan>
			</logic:greaterThan>
			</logic:present>			
			<!--########################## SUBMISSION SUMMARY #########################################-->
			</td>
			<td width="25%" class="links"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+custId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>" title="Click to go to Master Insured Record" class="button2" style="width:200px" />Go to Insured Master Record</a> </td>
			<td width="20%" class="links"><a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(Object::Quote::QuoteVerId)=<%=""+parentQuoteVerId%>&answer(QuoteId)=<%=parentQuoteId.toString()%>&answer(parentQuoteId)=<%=parentQuoteId.toString()%>" class="button2" title="Click to go to Original Quote" style="width:150px">Go to Original Quote</a> </td>
			<dmshtml:dms_static_with_connector 
				ruleName='privilage' 
				property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' 			
				connector='or' negated="true">
			<td width="20%" class="links">					        					
			<a href="../SearchActivityManagerAction7.do?TabPanelName=Policy_Panel&answer(policyId)=<%=""+policyId %>&answer(policyVerId)=<%=""+policyVerId %>&answer(policyNumber)=<%=""+policyNumber %>&answer(Object::Activity::ObjectId)=<%=""+policyId%>&answer(Object::Activity::PageNum)=0&answer(Object::Customer::CustomerId)=<%=custId.toString()%>&answer(Object::Activity::ObjectType)=<%="Policy "%>&answer(parentQuoteId)=<%=""+parentQuoteId %>&answer(parentQuoteVerId)=<%=""+parentQuoteVerId%>" class="button2" title="Click to go to Activity Log" style="width:150px">Activity Log </a>		
	</td>
	</dmshtml:dms_static_with_connector>
	<td class="links" width="20%">	
		<%if(!policyStatus.equalsIgnoreCase("Issued") && !policyStatus.equalsIgnoreCase("Canceled") && isActivePolicy.equalsIgnoreCase("Y")){%>
		    <html:button value="Issue Policy" title="Click to Issue Policy" property="answer(IssuePolicy)" onclick="document.getElementById('IssuePolicySubmit').disabled=true;document.IssuePolicyFrm.submit();"  styleId="IssuePolicySubmit" styleClass="covsmallbutton" />
		<%} %>	
	</td>
			<td width="20%" class="links">
			
		      <%isActivePolicy =(String) request.getAttribute("isActivePolicy");  %>
	
	
	     <%if(isActivePolicy.equals("N")){ %>
	    	 <% String currentPolicyVerId = (String)request.getAttribute("currentVerId"); %>
	    
			<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+currentPolicyVerId%>&answer(policyId)=<%=""+policyId%>&answer("conditionFlag") = "N"" class="button2" style="width:100px;" title="Click to go to Active Policy">Active Policy</a>
		<%} %>
			
		</td>
		
				 	
    </tr>
    </table>
    </td></tr>
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
	<logic:present name="SUBJECTIVITY_RULE_FAILED">
		<table border="0" cellpadding="0" cellspacing="0" width="97%"  align="center">
		<tr>
			<td class="Error">
				A policy cannot be issued until the following post-bound subjectivity requirement is satisfied or the requirement is waived by an underwriter.
				<html:hidden property="answer(error_subjecticity)" styleId="subjectivityError" value="YES"/>
			</td>			
		</tr></table>	
		</logic:present>		
		
		<logic:present name="MESSAGE_LIST">
		<table border="0" cellpadding="0" cellspacing="0" width="97%"  align="center">
		<tr>
		<td colspan="2" class="links">
			<table width="900px">
				<tr>
					<td class="Error">
						
							<logic:iterate id="message" name="MESSAGE_LIST">
								<li><bean:write name="message"/></li>
							</logic:iterate>
								
					</td>
				</tr>
			</table>
		</td>
	</tr>
	</table>	
		</logic:present>
	<tr>
		<td>
			       <form name="IssuePolicyFrm" action="/IssanceSubjectivityVerficationBTA.do" method="post">
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
			 		<html:hidden property="answer(Object::Agency::AgencyId)"  value="<%= ""+agencyId%>" />	
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
					
					</form>
		</td>
	</tr>
	<tr>
		<td align="left" width="100%">
			<div>						
				
				 <div id="PolicySummary" class="innercontent">  
					<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">	
																		
					<!-- Policy summary tab contents STArt -->	
						<dmshtml:GetDynamicPolicySummary nameInSession="policysummarycontent" policyId="<%=Long.parseLong(""+policyId)%>" policyVerId="<%=Long.parseLong(""+policyVerId)%>" parentQuoteId="<%=Long.parseLong(""+parentQuoteId)%>" productId="<%=Long.parseLong(""+productId)%>" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="POLICY_SUMMARY_TAB_ALGORITHM"  DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 						
					</table>
			 	</div> 
				
				<dmshtml:GetPolicyInsured nameInSession="policyinsured" parentPolicyId="<%=Long.parseLong(""+policyId)%>" parentPolicyVerId="<%=Long.parseLong(""+policyVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" DBName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>					
			 	
				<dmshtml:GetPolicyApplicationSummary nameInSession="PolicyApplication" policyId="<%=Long.parseLong(""+policyId) %>" policyVerId="<%=Long.parseLong(""+policyVerId) %>" applicationType="<%=""+applicationType %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />			 				
	 			
	 			
	 			 
	 			<%double totalInstallmentFee = 0; %>
	 			<%double totalInstallmentPayment = 0; %> 		
				</div>	
					
										
					
				
			 		
			 		

				<dmshtml:GetPolicyDocumentSummary documentType='<%=DocumentType%>' nameInSession="PolicyDocument" ownerId='<%=""+ownerId %>'  policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>								 							 		
				</logic:present>					 				
		</td>
	</tr>
	<tr>
     <td width="100%" colspan="2">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0">
			<tr>
				<td align="left" valign="top" >
				<div id="DocumentPopUp" style="display:none;" class="todotab_yellowbox2">
					<div class="hd" id="Documentheading"></div>
					<div class="formhead" align="right"><h2 class="right"></h2>
				
					</div>      
						<div class="Applicationpage2">
					<div class="bd" id="DocumentPopUpBody">
					</div>
					</div>
					<a class="container-close" href="javascript:void(0);" id="closeIcon3"></a>
				</div>
		
				</td>
			</tr>
		</table>

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
     <td width="50%" valign="bottom" height="25">
     <table border="0" cellpadding="0" cellspacing="0">	 
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_active" height=35 id="DocumentationTab" onclick="javascript:loadDocumentationTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Documentation</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="images/spacer.gif" width="6" height="4" ></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  id="CoveragesLimitsTab"  onclick="javascript:loadPolicySummaryTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Coverages and Limits</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="PolicyInformationTab" onclick="javascript:loadPolicyInformationTab(this.id);">
				<tr>
					<td align="center" Style="Cursor:hand">Policy Information</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="PolicyExclusionTab" onclick="javascript:loadPolicyExclusionTab(this.id);" >
				<tr>
					<td align="center"  Style="Cursor:hand">Policy Exclusion</td>
				</tr>
			</table>
         </td>
         
		<dmshtml:Get_Policy_Class_List_Details nameInSession="classDetail" policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId='<%=ownerId.toString()%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
		<% String classListSize = "0";%>
		<logic:present name="classDetail">
			<%classListSize = ""+request.getAttribute("classDetail");%>
		</logic:present>
		<html:hidden property="answer(ClassListSizeId)" styleId="ClassListSizeId" value='<%=classListSize%>' />
         <td valign="top" class="todotab_space"><img border="0" src="images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="ClassHazardsTab" onclick="javascript:LoadClassList(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Class(<%=classListSize %>)</td>
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
		<td class="todotab_yellowbox2" id="PolicyInformationDiv" style="display:none;">
					<div id="InformationDiv1"  style="border-collapse: collapse;border:0px solid #000;background-color:<%=bgcolor%>;">
					<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td align="center" valign=bottom>
							<table border="0" width="125" cellspacing="0" cellpadding="0"
								height=35>
								<tr>
									<td align="center" id="Pol_Definition_Row" class="todotab_active" 
										onClick="LoadPolicyDefinitionTab('Pol_Definition_Row');"
										Style="Cursor:hand">Policy Definition</td>
								</tr>
							</table>
							</td>

							<td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
							<td align="center" valign=bottom>
							<table border="0" width="125" cellspacing="0" cellpadding="0"
								 height=35>
								<tr>
									<td align="center" id="Pol_Hazards_Row" class="todotab_inactive"
										onClick="LoadPolicyHazardsTab(this.id);"
										Style="Cursor:hand">Policy Hazards</td>
								</tr>
							</table>
							</td>
							<td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>
							<td align="center" valign=bottom>
							<table border="0" width="125" cellspacing="0" cellpadding="0"
								 height=35>
								<tr>
									<td align="center" id="Pol_Benefits_Row" class="todotab_inactive"
										onClick="LoadPolicyBenefitsTab(this.id);"
										Style="Cursor:hand">Policy Benefits</td>
								</tr>
							</table>
							</td>

						</tr>
					</table>
					
					</div>
					<div id="PolicyInformationDivContent" style="display:none;width:940px;background-color:<%=bgcolor%>;border:#f0aa3a 1px solid;">  
					<!--  Policy Information tabs  -->
					</div>
		
		</td>
	</tr>
  <tr>
    <td width="950px" colspan="2">
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" style="padding:0px 0px 20px 20px;" class="todotab_yellowbox2"  id="policyDivTable">
  		 <tr>
				<td align="left" valign="top">
				<div id="PolicyDiv" style="background-color:<%=bgcolor%>;">
	
			<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
			 			<tr><td>&nbsp;</td></tr>
			 			<tr height="30">
			 				<td class="FormLabels2" colspan="3">
			 					Generated Documents<% %>
			 				</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels2" width="5%">
			 					S.No
			 				</td>
			 				<td class="FormLabels2" width="40%">
			 					Documents
			 				</td>
			 				<td class="FormLabels2" width="20%">
			 					Generated By 
			 				</td>
			 				<td class="FormLabels2" width="35%">
			 					Generated Date 
			 				</td>
			 			</tr>			 		
			 			<%int indx1=0; %>
			 			<%if(!policyStatus.equalsIgnoreCase("ISSUED") && !policyStatus.equalsIgnoreCase("CANCELED")){%>
			 			<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance","CERTIFICATE OF INSURANCE","CORRESPONDENCE"}%>' nameInSession="PolDocLoc1" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			 			<logic:present name="PolDocLoc1">			 				
			 				<%
			 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc1");
								for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
									com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
								%>			 				
	 			
					 			<%indx1++; %>
					 			<tr>
					 				<td class="TextMatter1" width="5%">
					 				<%=indx1 %>
					 				</td>
					 				<td class="TextMatter1" width="40%">		
	
					 				<a href="javascript:void(0);" onClick="javascript:window.open('../<%=""+polDocDetail.getDocumentUrl()%>')">
		   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
					 					<%=""+polDocDetail.getPolicyDocName() %>
					 					</a>
					 				</td>
					 				<td class="TextMatter1" width="20%" >
					 					<%=""+polDocDetail.getCreatedBy() %>
					 				</td>			 				
					 				<td class="TextMatter1" width="35%">
					 					<%=""+polDocDetail.getCreatedDate() %>
					 				</td>
					 			</tr>
					 			
					 			<%						
								}					 			
					 			%>
			 			</logic:present>
			 			
			 			
			 			
			 			<%}else{%>
			 				<dmshtml:GetDocumentLocation documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance","CERTIFICATE OF INSURANCE","CORRESPONDENCE"}%>' nameInSession="PolDocLoc" ownerId='<%=""+ownerId %>' policyId='<%=Long.parseLong(""+policyId) %>' policyVerId='<%=Long.parseLong(""+policyVerId) %>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
							 			<%int indx2=0; %>
							 			<logic:present name="PolDocLoc">			 				
							 				<%
							 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc");
												for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
													com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
												%>			 				
					 						 			
									 			<%indx2++; %>
									 			<tr>
									 				<td class="TextMatter1" width="5%">
									 				<%=indx2 %>
									 				
									 				</td>
									 				<td class="TextMatter1" width="40%">					 				
									 				<a href="javascript:void(0);" onClick="javascript:window.open('../<%="../"+polDocDetail.getDocumentUrl()%>')">
						   							<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""> 
									 					<%=""+polDocDetail.getPolicyDocName() %>
									 					</a>
									 				</td>
									 				<td class="TextMatter1" width="20%" >
									 					<%=""+polDocDetail.getCreatedBy() %>
									 				</td>			 				
									 				<td class="TextMatter1" width="35%" colspan="2">
									 					<%=""+polDocDetail.getCreatedDate() %>
									 				</td>
									 			</tr>
									 			
									 			<%						
												}					 			
									 			%>
							 				
							 			</logic:present>				
				 									 						
				 						
			 			<%} %>
			 			<tr height="30">
			 			<td>&nbsp;</td>
			 			</tr>
			 			</table>
			 			
			 			<table WIDTH="100%" ALIGN="center"  BORDER="0" CELLSPACING="0" CELLPADDING="0">
			 					 			
			 			<%if(!policyStatus.equalsIgnoreCase("Issued")&& !policyStatus.equalsIgnoreCase("CANCELED")) {%>

			 			<dmshtml:dms_isPresent property="<%=new String[]{"BOUND"}%>" value="<%=QuoteStatus.toString()%>" negated="true" >
			 			<tr height="30">
			 				<td class="FormLabels2" colspan="3">Selected Policy Forms</td>
			 			</tr>
			 			<tr height="30">
			 				<td class="FormLabels2" width="15%">S.No
			 				</td>
			 				<td class="FormLabels2" width="25%">Document Identifier
			 				</td>
			 				<td class="FormLabels2" width="60%" >Document Title
			 				</td>
			 			</tr>
			 			<%int index=0; %>
			 			<%int count=0; %>
			 		
			 			<logic:present name="PolicyDocument">
			 			<% java.util.ArrayList PolicyDocumentDet= (java.util.ArrayList)request.getAttribute("PolicyDocument"); %>
			 			<%if(PolicyDocumentDet.size()>0){%>
			 			<logic:iterate id="PolDocument" name="PolicyDocument">	
			 				 
			 			<bean:define property="polPolicyDocId" name = "PolDocument" id="polPolicyDocId"/>
			 			<bean:define property="dmsDocsId" name = "PolDocument" id="dmsDocsId"/>
			 			<bean:define property="dmsDocVerId" name = "PolDocument" id="dmsDocVerId"/>
			 			<bean:define property="applicationVerId" name = "PolDocument" id="applicationVerId"/>
			 			<bean:define property="applicationId" name ="PolDocument" id="applicationId"/>
			 			<%long appId = 0;
			 			long appVerId = 0;
			 			String strAppId = ""+applicationId;
			 			String strAppVerId = ""+applicationVerId;
			 			 if(!strAppId.equals("")){
			 				 
			 				appId = Long.parseLong(strAppId);
			 				
			 			 }
			 			 if(!strAppVerId.equals("")){
			 				 
			 				appVerId = Long.parseLong(strAppVerId);
			 			 }
			 			%>
			 			<%com.dms.ejb.insurance.policy.PolicyDocumentDetail policyDocDetail = (com.dms.ejb.insurance.policy.PolicyDocumentDetail)PolicyDocumentDet.get(index); %>			 			
			 			<%index++; %>
			 			<%if(policyDocDetail.getGenerateDocument()== null) {%>		
			 				<tr height="20">
					 				<td class="TextMatter1" width="5%">		
					 				<%count++; %>			 				
					 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="15%">
					 				<bean:write name="PolDocument" property="documentNum"/>
					 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" width="80%">
					 				<bean:write name="PolDocument" property="policyDocName"/>
					 				<%if(appId >0){%>
										<a href="javascript:void(0);" onclick="showFillInFormPopUp('<%=""+appId%>','<%=""+appVerId %>','<%=""+polPolicyDocId %>','<%=""+dmsDocsId %>','<%=""+dmsDocVerId %>','<bean:write name="PolDocument" property="policyDocName"/>','<bean:write name="PolDocument" property="documentNum"/>-<bean:write name="PolDocument" property="documentSubNum"/>' )"> Additional Wording </a>
						 			<%} %>	
					 				</td>			 					
					 		</tr>	 	
					 		
			 			<%} else if(policyDocDetail.getGenerateDocument().equals("Y") || policyDocDetail.getGenerateDocument().equals("")) {%>
				 			<tr height="20">
					 				<td class="TextMatter1" width="5%">
						 				<%count++; %>
						 				<%=count%>
					 				</td>			 				
					 				<td class="TextMatter1" width="15%">
						 				<bean:write name="PolDocument" property="documentNum"/>
						 				<bean:write name="PolDocument" property="documentSubNum"/>
					 				</td>
					 				<td class="TextMatter1" width="80%">
					 				
						 				<bean:write name="PolDocument" property="policyDocName"/>
						 				<%if(appId >0){%>
						 				
						 					<a href="javascript:void(0);" onclick="showFillInFormPopUp('<%=""+appId%>','<%=""+appVerId %>','<%=""+polPolicyDocId %>','<%=""+dmsDocsId %>','<%=""+dmsDocVerId %>','<bean:write name="PolDocument" property="policyDocName"/>','<bean:write name="PolDocument" property="documentNum"/>-<bean:write name="PolDocument" property="documentSubNum"/>' )"> Additional Wording </a>
						 				<%} %>	
					 				</td>			 					
					 				
					 		</tr>
					 	<%} %>
			 			</logic:iterate>
			 			<%}%>
			 			</logic:present>
			 		</dmshtml:dms_isPresent> 
			 			
		 			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREIVEW_ISSUANCE_DOCUMENT"}%>' connector='or' negated="true">
		 			
		 			<tr height="20">
		 			<td class="links" colspan="3">
		 				<a href="/PreviewIssuancePdf.go?TabPanelName=Policy_Panel&answer(DocumentListSource)=Policy&answer(policyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId%>&answer(DocumentType)=ISSUANCE&answer(QuoteId)=<%=""+parentQuoteId%>&answer(ownerId)=<%=""+ownerId%>&answer(ProductVerId)=<%=""+productVerId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(customerId)=<%=""+custId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(isPreview)=<%=true%>"  target="_new">Preview Issuance Document</a>		 					
		 			</td>
		 			</tr>
		 			</dmshtml:dms_static_with_connector>
		 			<%} %>
			 		</table>

Attached Files
<div id="QUOTE_ATTACHMENT_LIST" style="word-wrap:break-word;"></div>	
<a href="javascript:void(0)" onclick="showAttach('<%=""+parentQuoteId %>','0','QUOTE');" class="button2" style="width:100px">Add File</a>


<div id="AttachFiles"></div>
<div id="AddNotespopup" style="display:none"></div>

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
									
									<dmshtml:get_Installment_Types	nameInSession="arrInstallmentTypes"	 parentQuoteVerId="<%=""+parentQuoteVerId %>" productVerId="<%=""+productVerId %>" dbname="<%= com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
									<logic:present name="arrInstallmentTypes">
									<%com.dms.ejb.data.QuestionHashMap qMap = null; %>
									<tr>
										<td width="35%" class="FormLabels" align="left">Select Installment Type : 
										
										<select name="answer(Object::PolicyBilling::InstallmentDetail)" id="InstallmentType" class="txtbox"  onchange="return calculate('submit');" >
										<%
										java.util.ArrayList InstallmentType = (java.util.ArrayList)request.getAttribute("arrInstallmentTypes");
										for(int InstallmentTypeIndex = 0 ; InstallmentTypeIndex < InstallmentType.size() ; InstallmentTypeIndex++) {
										qMap = (com.dms.ejb.data.QuestionHashMap) InstallmentType.get(InstallmentTypeIndex);
										%>
										<option value="<%=qMap.getString("Object::QuoteBilling::NumberOfInstallments")+"::"+qMap.getString("Object::QuoteBilling::InitialPaymentPercentage")+"::"+qMap.getString("Object::QuoteBilling::InstallmentFee")+"::"+qMap.getString("Object::QuoteBilling::InstallmentTypeDesc")%>">
												<%=""+qMap.getString("Object::QuoteBilling::InstallmentTypeDesc")%>
										</option>
										<% } %>
										</select>
										</td>
									</tr>
									</logic:present>
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
					 	<form action="/UpdateBillingPaymentTransactionAction.go" onsubmit="return paymentEditTransactionSubmit(this);"  >
					 	</form>
					 	<form name="UpdatePaymentForm" action="/UpdateBillingPaymentTransactionAction.go" onsubmit="return paymentEditTransactionSubmit(this);" method="post">
					 	</form>
					 	</div>
					 	<div id="PaymentPlanTrans" class="todotab_yellowbox" bgcolor="<%=bgcolor%>" align="left">
						 	<form name="paymentTransactionFrm1" action="/BillingPaymentTransactionAction.go" onsubmit="return paymentTransactionSubmit(this)" method="post">
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
										
										<html:hidden property="answer(policyNumber)" value=""/>
										
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
										<td align="left" width="40%" ><html:text  property="answer(Object::PolicyBilling::CreditAmount)" value=""  styleId="CreditAmount" size="10" maxlength="10" styleClass="txtboxrightalign" /></td>
										
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


					<div id="Document11" style="display:none" class="todotab_yellowbox2">
					<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
						CELLPADDING="0">
						<tr><td>&nbsp;</td></tr>
						<tr height="30">
							<td class="FormLabels2" colspan="3">Generated Documents<% %></td>
						</tr>
						<tr height="30">
							<td class="FormLabels2" width="5%">S.No</td>
							<td class="FormLabels2" width="40%">Documents</td>
							<td class="FormLabels2" width="20%">Generated By</td>
							<td class="FormLabels2" width="35%">Generated Date</td>
						</tr>
						<!-- <tr>
							<td class="TextMatter1" width="15%"></td>

							  <td class="TextMatter1" width="25%"><a
								href='../CreateEILApplicationPdf.go?TabPanelName=Quote_Panel&answer(DocumentType)=APPLICATION&answer(QuoteId)=<%= parentQuoteId.toString()%>&answer(subQuoteId)=<%=SubQuoteId.toString()%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(QuoteStatus)=<%=QuoteStatus.toString()%>'
								target="_new"><IMG SRC="../Images/pdficon.gif" WIDTH="15"
								HEIGHT="15" BORDER="0" ALT="">Application PDF</a></td> 
							<td class="TextMatter1" width="20%"></td>
							<td class="TextMatter1" width="40%"></td>
						</tr> -->
						<%int indx3=0; %>
						<%if(!policyStatus.equalsIgnoreCase("ISSUED") && !policyStatus.equalsIgnoreCase("CANCELED")){%>
						<dmshtml:GetDocumentLocation
							documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance","CERTIFICATE OF INSURANCE","CORRESPONDENCE"}%>'
							nameInSession="PolDocLoc1" ownerId='<%=""+ownerId %>'
							policyId='<%=Long.parseLong(""+policyId) %>'
							policyVerId='<%=Long.parseLong(""+policyVerId) %>'
							dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
						<logic:present name="PolDocLoc1">
							<%
			 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc1");
								for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
									com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
								%>

							<%indx3++; %>
							<tr>
								<td class="TextMatter1" width="5%"><%=indx3 %></td>
								<td class="TextMatter1" width="40%"><a
									href="javascript:void(0);"
									onClick="javascript:window.open('../<%=""+polDocDetail.getDocumentUrl()%>')">
								<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15"
									BORDER="0" ALT=""> <%=""+polDocDetail.getPolicyDocName() %> </a>
								</td>
								<td class="TextMatter1" width="20%"><%=""+polDocDetail.getCreatedBy() %>
								</td>
								<td class="TextMatter1" width="35%"><%=""+polDocDetail.getCreatedDate() %>
								</td>
							</tr>

							<%						
								}					 			
					 			%>
						</logic:present>



						<%}else{%>
						<dmshtml:GetDocumentLocation
							documentType='<%=new String[]{"PROPOSAL","BINDER","Issuance","CERTIFICATE OF INSURANCE","CORRESPONDENCE"}%>'
							nameInSession="PolDocLoc" ownerId='<%=""+ownerId %>'
							policyId='<%=Long.parseLong(""+policyId) %>'
							policyVerId='<%=Long.parseLong(""+policyVerId) %>'
							dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
						<%int indx2=0; %>
						<logic:present name="PolDocLoc">
							<%
							 					java.util.ArrayList arrPolDocDetail= (java.util.ArrayList)request.getAttribute("PolDocLoc");
												for(int docIndex=0;docIndex<arrPolDocDetail.size();docIndex++){		
													com.dms.ejb.insurance.policy.PolicyDocumentDetail polDocDetail=(com.dms.ejb.insurance.policy.PolicyDocumentDetail)arrPolDocDetail.get(docIndex);							
												%>

							<%indx2++; %>
							<tr>
								<td class="TextMatter1" width="5%"><%=indx2 %></td>
								<td class="TextMatter1" width="40%"><a
									href="javascript:void(0);"
									onClick="javascript:window.open('../<%=""+polDocDetail.getDocumentUrl()%>')">
								<IMG SRC="../Images/pdficon.gif" WIDTH="15" HEIGHT="15"
									BORDER="0" ALT=""> <%=""+polDocDetail.getPolicyDocName() %> </a>
								</td>
								<td class="TextMatter1" width="20%"><%=""+polDocDetail.getCreatedBy() %>
								</td>
								<td class="TextMatter1" width="35%" colspan="2"><%=""+polDocDetail.getCreatedDate() %>
								</td>
							</tr>

							<%						
												}					 			
									 			%>

						</logic:present>


						<%} %>
						<tr height="30">
							<td>&nbsp;</td>
						</tr>
					</table>

					<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
						CELLPADDING="0">

						<%if(!policyStatus.equalsIgnoreCase("Issued")&& !policyStatus.equalsIgnoreCase("CANCELED")) {%>

						<dmshtml:dms_isPresent property="<%=new String[]{"BOUND"}%>"
							value="<%=QuoteStatus.toString()%>" negated="true">
							<tr height="30">
								<td class="FormLabels2" colspan="3">Selected Policy Forms</td>
							</tr>
							<tr height="30">
								<td class="FormLabels2" width="15%">S.No</td>
								<td class="FormLabels2" width="25%">Document Identifier</td>
								<td class="FormLabels2" width="60%">Document Title</td>
							</tr>
							<%int index=0; %>
							<%int count=0; %>

							<logic:present name="PolicyDocument">
								<% java.util.ArrayList PolicyDocumentDet= (java.util.ArrayList)request.getAttribute("PolicyDocument"); %>
								<%if(PolicyDocumentDet.size()>0){%>
								<logic:iterate id="PolDocument" name="PolicyDocument">

									<bean:define property="polPolicyDocId" name="PolDocument"
										id="polPolicyDocId" />
									<bean:define property="dmsDocsId" name="PolDocument"
										id="dmsDocsId" />
									<bean:define property="dmsDocVerId" name="PolDocument"
										id="dmsDocVerId" />
									<bean:define property="applicationVerId" name="PolDocument"
										id="applicationVerId" />
									<bean:define property="applicationId" name="PolDocument"
										id="applicationId" />
									<%long appId = 0;
			 			long appVerId = 0;
			 			String strAppId = ""+applicationId;
			 			String strAppVerId = ""+applicationVerId;
			 			 if(!strAppId.equals("")){
			 				 
			 				appId = Long.parseLong(strAppId);
			 				
			 			 }
			 			 if(!strAppVerId.equals("")){
			 				 
			 				appVerId = Long.parseLong(strAppVerId);
			 			 }
			 			%>
									<%com.dms.ejb.insurance.policy.PolicyDocumentDetail policyDocDetail = (com.dms.ejb.insurance.policy.PolicyDocumentDetail)PolicyDocumentDet.get(index); %>
									<%index++; %>
									<%if(policyDocDetail.getGenerateDocument()== null) {%>
									<tr height="20">
										<td class="TextMatter1" width="5%"><%count++; %> <%=count%></td>
										<td class="TextMatter1" width="15%"><bean:write
											name="PolDocument" property="documentNum" /> <bean:write
											name="PolDocument" property="documentSubNum" /></td>
										<td class="TextMatter1" width="80%"><bean:write
											name="PolDocument" property="policyDocName" />
											<%if(appId >0){%>
										<a href="javascript:void(0);"
											onclick="showFillInFormPopUp('<%=""+appId%>','<%=""+appVerId %>','<%=""+polPolicyDocId %>','<%=""+dmsDocsId %>','<%=""+dmsDocVerId %>','<bean:write name="PolDocument" property="policyDocName"/>','<bean:write name="PolDocument" property="documentNum"/>-<bean:write name="PolDocument" property="documentSubNum"/>' )">
										Additional Wording </a> <%} %>
										</td>
									</tr>
									<%} else if(policyDocDetail.getGenerateDocument().equals("Y") || policyDocDetail.getGenerateDocument().equals("")) {%>
									<tr height="20">
										<td class="TextMatter1" width="5%"><%count++; %> <%=count%></td>
										<td class="TextMatter1" width="15%"><bean:write
											name="PolDocument" property="documentNum" /> <bean:write
											name="PolDocument" property="documentSubNum" /></td>
										<td class="TextMatter1" width="80%"><bean:write
											name="PolDocument" property="policyDocName" /> <%if(appId >0){%>

										<a href="javascript:void(0);"
											onclick="showFillInFormPopUp('<%=""+appId%>','<%=""+appVerId %>','<%=""+polPolicyDocId %>','<%=""+dmsDocsId %>','<%=""+dmsDocVerId %>','<bean:write name="PolDocument" property="policyDocName"/>','<bean:write name="PolDocument" property="documentNum"/>-<bean:write name="PolDocument" property="documentSubNum"/>' )">
										Additional Wording </a> <%} %></td>

									</tr>
									<%} %>
								</logic:iterate>
								<%}%>
							</logic:present>
						</dmshtml:dms_isPresent>

						<dmshtml:dms_static_with_connector ruleName='privilage'
							property='<%=new String[]{"PREIVEW_ISSUANCE_DOCUMENT"}%>'
							connector='or' negated="true">

							<tr height="20">
								<td class="links" colspan="3"><a
									href="/PreviewIssuancePdf.go?TabPanelName=Policy_Panel&answer(DocumentListSource)=Policy&answer(policyId)=<%=""+policyId%>&answer(policyVerId)=<%=""+policyVerId%>&answer(DocumentType)=ISSUANCE&answer(QuoteId)=<%=""+parentQuoteId%>&answer(ownerId)=<%=""+ownerId%>&answer(ProductVerId)=<%=""+productVerId%>&answer(Object::Customer::CustomerId)=<%=""+custId%>&answer(customerId)=<%=""+custId%>&answer(policyNumber)=<%=""+policyNumber%>&answer(isPreview)=<%=true%>"
									target="_new">Preview Issuance Document</a></td>
							</tr>
						</dmshtml:dms_static_with_connector>
						<%} %>
					</table>

					Attached Files
					<div id="QUOTE_ATTACHMENT_LIST" style="word-wrap:break-word;"></div>
					<a href="javascript:void(0)"
						onclick="showAttach('<%=""+parentQuoteId %>','0','QUOTE');"
						class="button2" style="width:100px">Add File</a>


					<div id="AttachFiles"></div>
					<div id="AddNotespopup" style="display:none"></div>

					<br>
					Diary Notes <br>
					<div id="QUOTE_NOTES_LIST" style="word-wrap:break-word;"></div>
					<a href="javascript:void(0)"
						onclick="showNotes('<%=""+parentQuoteId %>','0','Quote');"
						class="button2" style="width:100px">Add Notes</a> <dmshtml:dms_static_with_connector
						ruleName='privilage' property='<%=new String[]{"EMAIL_VIEW"}%>'
						connector='or' negated="true">
						<br>
Email
<br>
						<div id="QUOTE_EMAIL_LIST" style="word-wrap:break-word;"></div>

						<a href="javascript:void(0)" onclick="sendEmailDetails();"
							class="button2" style="width:100px">Compose Email</a>
					</dmshtml:dms_static_with_connector> <script>
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




</script></div>




<script type="text/javascript">
//to intitally load the documentation tab
	var quoteId=document.getElementById("parentQuoteId").value;
    var ownerId = document.getElementById("ownerId").value; 
	var quoteVerId="<%=parentQuoteVerId+""%>";
 refereshQuoteAttachmentList(quoteId,quoteVerId,ownerId,"QUOTE");
 refereshQuoteNotesList(quoteId,ownerId,"QUOTE");
  refereshQuoteEmailList(quoteId,ownerId,"QUOTE");
 
</script>
					</td>
			  </tr>	</table>
     </td>   </tr>






 </table>
</div>
</div>

</div>
 <div style="display:none" id="SubjectivityDiv">
<div id='LoaderIndicator' style="display:none">
<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
<IMG SRC="../Images/loader1.gif"  BORDER="0" align="top" id="loader">
Loading....
</div>
<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">	
	<tr><td align="left">
		<div>&nbsp;</div>
		<div style="margin-left:10px">Post-Bind Subjectivities</div>
		<div>&nbsp;</div>
	</td></tr>																	
	<tr>
		<td>
		<form id="postbindSubjectivityMap">
			<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
				
				<tr>
					<td><div id="POST_BIND_LIST_TABLE" style="word-wrap:break-word;"></div></td>
				</tr>																													
			</table>																																					
		</form>
		</td>
	</tr>																		
	<tr><td align="left">
		<div style="margin-left:10px">Pre-Bind Subjectivities</div>
		<div>&nbsp;</div>
	</td></tr>																	
	<tr>
		<td>
		<form id="prebindSubjectivityMap">
			<table WIDTH=100%" ALIGN="center" class="dataSubjBorder"  border="0" CELLSPACING="0" CELLPADDING="0">
				
				<tr>
					<td><div id="PRE_BIND_LIST_TABLE" style="word-wrap:break-word;"></div></td>
				</tr>																													
			</table>																																					
		</form>
		</td>
	</tr>		
	<tr><td>&nbsp;<div id='frame' style="display:none"><iframe onload="hideAttachPopup()" id='upload_target_iFrame' src="../common/MessageFromRule.jsp" name='upload_target_iFrame'   style='width:300px;height:30px;border:1px solid #ccc;'></iframe></div></td></tr>																	
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
						<select name="answer(Object::Attachment::ApprovalStatus)" onchange="attachmentStatusChangeMain('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity',this)">
							<option value="" Selected>Change Status</option>
							<option value="Accepted">Accept</option>
							<option value="Rejected">Reject</option>
						</select>
					</td>	
					</dmshtml:dms_static_with_connector>
					<td>&nbsp;&nbsp;</td>
					<td><a href="javascript:void(0)" onclick="showAttach('<%=""+parentQuoteId %>','0','Subjectivity');" class="button2" style="width:100px">Attach Document</a></td>													
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
							<select onchange="notesStatusChangeMain('<%=""+parentQuoteId %>','<%=""+ownerId %>','Subjectivity',this)" name="answer(Object::Notes::ApprovalStatus)">
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
		var productVerId  = document.getElementById("productVerId").value;
		var productId  = document.getElementById("productId").value;		
		var pars = 'answer(policyId)='+policyId+'&answer(policyVerId)='+policyVerId+'&answer(ownerId)='+ownerId;
		var pars2='&answer(conditionFlag)='+conditionFlag+'&answer(policyNumber)='+policyNumber+'&answer(policyStatus)='+policyStatus+
			'&answer(custId)='+custId+'&answer(agencyId)='+agencyId+'&answer(isActivePolicy)='+isActivePolicy+
			'&answer(paymentPlan)='+paymentPlan+'&answer(productVerId)='+productVerId+'&answer(productId)='+productId;

		pars=pars+pars2
		

		var url = '../policy/EndorsementTabResult.jsp?';
					
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
		 	document.getElementById("PolicyInformationDiv").style.display="none";
		 	document.getElementById("PolicyInformationDivContent").style.display="none";
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

   function enableTabs(){
   
   	 if(document.getElementById("DocumentationTab") != undefined){
    	document.getElementById("DocumentationTab").disabled = false;
    }
 	if(document.getElementById("CoveragesLimitsTab") != undefined){
 		document.getElementById("CoveragesLimitsTab").disabled = false;
 	}
 	if(document.getElementById("GeneralQuestionTab") != undefined){
 		document.getElementById("GeneralQuestionTab").disabled = false;
 	}
 	if(document.getElementById("LocationTankTab") != undefined){
 		document.getElementById("LocationTankTab").disabled = false;
 	}
 	if(document.getElementById("SubjectivityTab") != undefined){
 		document.getElementById("SubjectivityTab").disabled = false;
 	}
 	if(document.getElementById("ClassBenefits_Row") != undefined){
 		document.getElementById("ClassBenefits_Row").disabled = false;
 	}
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
   function loadDocumentationTab(documentTabId){	
		document.getElementById("policyDivTable").style.display="block";
		var quoteId=document.getElementById("parentQuoteId").value;
	    var ownerId = document.getElementById("ownerId").value; 
		var quoteVerId="<%=parentQuoteVerId+""%>";//document.getElementById("parentQuoteVerId").value;

		 activateQuoteTabs(documentTabId);	
		document.getElementById("Payment").style.display = "none";
		document.getElementById("PolicyInformationDiv").style.display = "none";	
		document.getElementById("PolicyInformationDivContent").style.display = "none";	
		document.getElementById("PolicyDiv").style.display = "inline";	
		document.getElementById("PolicyDiv").innerHTML = document.getElementById("Document11").innerHTML;
		if(document.getElementById("paymentSuccess") != null && document.getElementById("paymentSuccess") !=undefined){
	 		document.getElementById("paymentSuccess").innerHTML="";
		}
		if(document.getElementById("paymentFailure") != null && document.getElementById("paymentFailure") !=undefined){
	 		document.getElementById("paymentFailure").innerHTML="";
		}
		// document.getElementById("Document11").innerHTML="";
			 refereshQuoteAttachmentList(quoteId,quoteVerId,ownerId,"QUOTE");

		 refereshQuoteNotesList(quoteId,ownerId,"QUOTE");
		 refereshQuoteEmailList(quoteId,ownerId,"QUOTE");
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
		 		initEditPaymentCal();
		 		setPaymentFields1();
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
		</script>
	<%}%>
	
	
<script type="text/javascript">
   		
   			Ext.onReady(function(){
   	   			//To override the ext style for td.
   				document.getElementById("ext-gen6").className="";
   				
   				if(document.getElementById("ext-gen21")!=null && document.getElementById("ext-gen21")!=undefined){
   					document.getElementById("ext-gen21").className="";
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
   						alert("Please enter Remmitance date in 'MM/DD/YYYY' format");
   						document.getElementById("RemittanceDateHidden").value = "";
   						
   						return false;
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
   						alert("Please enter Payment date in 'MM/DD/YYYY' format");
   						document.getElementById("PaymentDateHidden").value = "";   						
   						return false;
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
  						alert("Please enter Credit date in 'MM/DD/YYYY' format");
  						document.getElementById("CreditDateHidden").value = "";   						
  						return false;
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
   						alert("Please enter Remmitance date in 'MM/DD/YYYY' format");
   						document.getElementById("RemittanceDateEditHidden").value = "";
   						
   						return false;
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
   						alert("Please enter Payment date in 'MM/DD/YYYY' format");
   						document.getElementById("PaymentDateEditHidden").value = "";   						
   						return false;
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
  						alert("Please enter Credit date in 'MM/DD/YYYY' format");
  						document.getElementById("CreditDateEditHidden").value = "";   						
  						return false;
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
function initEditPaymentCal(){
	var myDatePanel = new Ext.Panel({
    applyTo:'RemittanceDate2',
    hideLabels:true,
    width:120,
    autoHeight:true,
	bodyBorder : false,
    border : false,
    frame:false,
    items:[{
      xtype:'datefield',
      name:'dob',
      id:'RemittanceDateEdit',
      width:100,
      allowBlank:false
    }]
  });


	var myDatePanel2 = new Ext.Panel({
	    applyTo:'PaymentDate2',
	    hideLabels:true,
	    width:120,
	    autoHeight:true,
		bodyBorder : false,
	    border : false,
	    frame:false,
	    items:[{
	      xtype:'datefield',
	      name:'dob1',
	      id:'PaymentDateEdit',
	      width:100,
	      allowBlank:false
	    }]
	  });

	var myDatePanel3 = new Ext.Panel({
	    applyTo:'CreditDate2',
	    hideLabels:true,
	    width:120,
	    autoHeight:true,
		bodyBorder : false,
	    border : false,
	    frame:false,
	    items:[{
	      xtype:'datefield',
	      name:'dob1',
	      id:'CreditDateEdit',
	      width:100,
	      allowBlank:false
	    }]
	  });	  	  

//Date Range Setting 
var minValue = "";

var maxValue = "";



//hitting on datefield text input, pops up the calendar dropdown
var clickHandler = function() {
	Ext.getCmp('RemittanceDateEdit').onTriggerClick();
};

Ext.EventManager.on('RemittanceDateEdit', 'click', clickHandler);

if(document.getElementById("RemittanceDateEditHidden").value !=""){
	var remittanceDateHidden = document.getElementById("RemittanceDateEditHidden").value;
	Ext.getCmp('RemittanceDateEdit').setValue(remittanceDateHidden);
}

if(document.getElementById("PaymentDateEditHidden").value != ""){
	var paymentDateHidden = document.getElementById("PaymentDateEditHidden").value;
	Ext.getCmp('PaymentDateEdit').setValue(paymentDateHidden);
}

if(document.getElementById("CreditDateEditHidden").value !=""){
var creditDateEditHidden = document.getElementById("CreditDateEditHidden").value;

Ext.getCmp('CreditDateEdit').setValue(creditDateEditHidden);
}
editPaymentDateHandler();

}



function editPaymentDateHandler(){   				
		var blurHandlerRemittanceDateEdit = function() {        				
			 var effDate1 = Ext.getCmp('RemittanceDateEdit').getValue(); 
			 
			var vardate = document.getElementById("RemittanceDateEdit").value;

			
			var ddate = new Date(vardate);	
			
			
			if(!isDate(vardate)){
				alert("Invalid Remmitance Date")
				document.getElementById("RemittanceDateEditHidden").value = vardate;
				
				return false;
			}
			var dmonth = parseInt(vardate.substring(0, 2), 10);
			var dday = parseInt(vardate.substring(3, 5), 10);
			var dyear = parseInt(vardate.substring(6, 10), 10);

			if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear) || vardate.substring(2, 3)!="/" || vardate.substring(5, 6)!="/")
			{
				alert("Please enter Remmitance date in 'MM/DD/YYYY' format");
				document.getElementById("RemittanceDateEditHidden").value = vardate;
				
				return false;
			}

			var reqDate = new Date("01/01/2010");

			if (ddate < reqDate)
			{
			
				alert("Remmitance Date cannot be prior to Jan 1, 2010");
				document.getElementById("RemittanceDateEditHidden").value =vardate;
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
				alert("Please enter Payment date in 'MM/DD/YYYY' format");
				document.getElementById("PaymentDateEditHidden").value = "";   						
				return false;
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
				alert("Please enter Credit date in 'MM/DD/YYYY' format");
				document.getElementById("CreditDateEditHidden").value = "";   						
				return false;
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
		
	}
	
	function validateTextAreaElement(frm){	
	
	if(frm.Description !=undefined){
	if((frm.Description.value=="") && (frm.Description.type=="textarea") && (frm.Description !=undefined)) {
		var ele =frm.Description;
		ele.style.background='#FFCC33';
		ele.focus();		
		alert("Please enter Description ")
		return false;	
	}
}
return true;
}

</script>