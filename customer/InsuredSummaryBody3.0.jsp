<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%response.setHeader("Cache-control","no-store"); %>
<%@page  import="java.util.HashMap" %>
<%@page  import="java.util.ArrayList" %>
<style>
  .tableHeader{	border:1px solid #4E4E50;}
  .tableData{line-height:17px;text-align:left;margin:0;padding:0;font-weight:bold;}
  .yui-dt th {border-color:-moz-use-text-color #CBCBCB -moz-use-text-color -moz-use-text-color;border-style:none solid none none;border-width:medium 1px medium medium;margin:0;	padding:0;color:#000000;font-weight:normal;text-decoration:none;vertical-align:bottom;background:#D8D8DA;border-collapse:separate;border-spacing:0;font-family:arial;font-size:inherit;}
  .yui-dt-table {border:1px solid #7F7F7F;border-collapse:separate;border-spacing:0;font-family:arial;font-size:inherit;margin:0;padding:0;}
</style>
<SCRIPT SRC="../Scripts/JScripts/AddInsured.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/ZipCodeCommon.js"  type="text/javascript"> </SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<SCRIPT SRC="../Scripts/JScripts/InsuredClassRisk.js" type="text/javascript"> </SCRIPT>
<script type="text/javascript">
var url1="/saveEILRiskApplicationAction.go?";
</script>
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />  
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/editor/assets/skins/sam/simpleeditor.css" />
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/utilities/utilities.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script> 
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/CauseListTable.js"></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/Subjectivity.js" ></script>
<script type="text/JavaScript" SRC="../Scripts/JScripts/AttachmentTable.js" ></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/editor/simpleeditor-min.js"></script>

<bean:define name="AddCustomer" id="mailingAddressSameAsBusinessAddress" property="answer(Object::Customer::MailingAddressSameAsBusinessAddress)" />
<Script type="text/javascript">

function deleteInsured(){
	     	var frm = document.getElementById("DeleteInsuredForm");
			var count = 0;
			for(var i=0; frm.elements[i]!=null; i++) {
			
				if(frm.elements[i].name == "answer(Object::AdditionalInsured::SelectedAdditionalInsured)" && frm.elements[i].checked == true) {
					count++;
					break;
				}
			}
			if(count>0) {
				var ans = window.confirm('Are you sure that you want to delete the selected records?');
				if (ans)
					return true;
				else
					return false;
			} else {
				alert("Please Select any Additional Insured to Delete.");
				return false;
			}			
 }

</Script>

<%String customerId="";%>
<%String cusState="";
long agencyId=0;%>

<%String agencyIdTemp="";%> 
<%String agencyIdtoLink="";%>
<%String strAgentFName="";%>
<%String strAgentLName="";%>
<%long lngAgentId1=0;%>
<%long lngAgencyTemp=0;%>
<%long agencyId2=0;%>
<%String agencyName2="";%>
<%long generalagencyid2=0;%>
<%String generalagencyname2="";
String agencyAgentId="";%>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
 <dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="CUSTOMER_NAME_LENGTH" />
			<%
			  String nameFieldLength =(String) request.getAttribute("paramValue");
			if (nameFieldLength.length() <= 0 && nameFieldLength == null){
				 nameFieldLength = "60";								   
			  }
			
			%>
 		<div id="RiskPopUp" style="display:none;">
			<div class="hd" id="containerheading">UST Specific Questions</div>
			<div class="formhead" align="right"><h2 class="right"></h2>
		
			</div>      
				<div class="Applicationpage2">
			<div class="bd" id="RiskPopUpBody">
			</div>
			</div>
			<a class="container-close" href="javascript:void(0);" id="closeIcon3"></a>
		</div>


<%if (request.getParameter("agencyIdtoLink")!= null) {
agencyIdtoLink=request.getParameter("agencyIdtoLink");
agencyId2=Long.parseLong(agencyIdtoLink.toString());
}%>


 <logic:present name ='arrObjectDetail' scope ='session'>
	<logic:iterate id="arrObjectDetail" name="arrObjectDetail" scope="session" >
		<bean:define id="custid" name="arrObjectDetail" property="id"/> 
		<bean:define id="custState" property="answer(Object::Customer::State)" name="AddCustomer"/> 
		 <%customerId=""+custid;%>
		 <%cusState=""+custState;%>
    </logic:iterate> 
   
 </logic:present>
 
 <% System.out.println("cId1:"+customerId);	%>
 <bean:define id="cId" name="AddCustomer" property="answer(Object::Customer::CustomerId)"scope="session"/>
 <% System.out.println("cId2:"+cId);	%>
 <bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<!-- ********************agency, agent, general ageny details by link *********************-->
 <bean:define id="agencyIdTemp1" name="AddCustomer" property="answer(Agency::AgencyId)"/>
	<%if(!agencyIdTemp1.toString().equals("")) {
		if((agencyIdTemp1.toString().indexOf("::"))>0){														
		String ids[]=(""+agencyIdTemp1).split("::");
     			agencyIdTemp1=ids[0];
     			agencyAgentId=ids[1];
		}
		
	agencyIdTemp=agencyIdTemp1.toString();	
	lngAgencyTemp=Long.parseLong(agencyIdTemp);
	if(lngAgencyTemp>0){%>
		<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
		
		<logic:present name="agencyDetail2" scope="request">
			<bean:define id="agdetail2" name="agencyDetail2" scope="request"
									type="com.dms.ejb.data.QuestionHashMap" />
			<%agencyId2=Long.parseLong(agdetail2.getString("agencyid"));%>
			<%agencyName2=agdetail2.getString("agencyname");%>
			<%generalagencyid2=Long.parseLong(agdetail2.getString("generalagencyid"));%>
			<%generalagencyname2=agdetail2.getString("generalagencyname");%>
		</logic:present>
	<%}%>

	<bean:define id="AgentId1" name="AddCustomer" property="answer(AgentId)"/>
	<%long lgAgentId1=0;
			try {
			System.out.println("AgntAgncy ID was:="+agencyAgentId);
			if(!agencyAgentId.equals("")){
				AgentId1=agencyAgentId;
			}
			lgAgentId1=Long.parseLong(AgentId1.toString());															
		} catch(Exception ex){} %>
		
	<%if(lgAgentId1>0){%>
		<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId='<%=""+lgAgentId1%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
		<logic:present name="agentDetail" scope="request">
			<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
			<%lngAgentId1=lgAgentId1;%>
			<%strAgentFName=agentDetail1.getString("agentfname");%>
			<%strAgentLName=agentDetail1.getString("agentlname");%>
		</logic:present>
	<%}%>

<!-- *********************************************************************************************-->
	<%}else{
	%>
<!-- ********************agency, agent, general ageny details by customer id *********************-->
	<%
	if(!cId.toString().equals("")){
	%>
		
		<%long lngGeneralAgencyId=0;%>
		<%long lngAgentId=0;%>
		<%String agencyName="";%>
		<%String generalAgencyName="";%>
		<%String agentFName="";%>
		<%String agentLName="";%>
		<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
		<logic:present name="customerDetail1" scope="request">
			<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
												type="com.dms.ejb.data.QuestionHashMap" />
			<%try{%>
			<%agencyId=Long.parseLong(customerDetailMap.getString("agencyid"));%>
			<%}catch(Exception nfe) {agencyId=0;    }%>
			<%try{%>
			<%lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));%>
			<%}catch(Exception nfe) {lngAgentId=0;    }%>
			<%agencyName=customerDetailMap.getString("agencyname");%>
			<%agentFName=customerDetailMap.getString("agentfirstname");%>
			<%agentLName=customerDetailMap.getString("agentlastname");%>
			<%try{%>
			<%lngGeneralAgencyId=Long.parseLong(customerDetailMap.getString("generalagencyid"));%>
			<%}catch(Exception nfe) {lngGeneralAgencyId=0;    }%>
			<%generalAgencyName=customerDetailMap.getString("generalagencyname");%>
			<%agencyIdTemp=""+agencyId;
			lngAgencyTemp=Long.parseLong(agencyIdTemp);
			agencyId2=Long.parseLong(agencyIdTemp);
			agencyName2=agencyName;
			generalagencyid2=lngGeneralAgencyId;
			generalagencyname2=generalAgencyName;
			lngAgentId1=lngAgentId;
			strAgentFName=""+agentFName;
			strAgentLName=""+agentLName;
			%>
		</logic:present>

		<%} else {
		%>
	<!-- ************Agency agent, general agenct detail by user id ******************************-->												
		 <bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
		 <%
		 	try{
		 		lngAgencyTemp=Long.parseLong(""+AgencyID);
		 	}catch(Exception ex){}
		 	if(lngAgencyTemp < 0){
		 %>	
		 <dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
	    <logic:present name="agencyIdent" scope="session">
		<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
		<%
		agencyIdTemp=agencyIdid.toString();
		try {
			lngAgencyTemp=Long.parseLong(agencyIdTemp);
		} catch(Exception ex){} %>
		</logic:present>
		<%}if(lngAgencyTemp>0){
		%>
			<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
			<logic:present name="agencyDetail2" scope="request">
				<bean:define id="agdetail2" name="agencyDetail2" scope="request"
										type="com.dms.ejb.data.QuestionHashMap" />
				<% agencyId2=Long.parseLong(agdetail2.getString("agencyid"));%>
				<% agencyName2=agdetail2.getString("agencyname");%>
				<% generalagencyid2=Long.parseLong(agdetail2.getString("generalagencyid"));%>
				<% generalagencyname2=agdetail2.getString("generalagencyname");%>
			</logic:present>
		<%}%>
		<bean:define id="AgentId2" name="AddCustomer" property="answer(AgentId)"/>
		
		<%long lgAgentId2=0;
			try {
			lgAgentId2=Long.parseLong(AgentId2.toString());
			
		} catch(Exception ex){} %>
		<%if(lgAgentId2>0){
		%>
			<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId="<%=""+lgAgentId2%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
			<logic:present name="agentDetail" scope="request">
				<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
				<%lngAgentId1=lgAgentId2;%>
				<%strAgentFName=agentDetail1.getString("agentfname");%>
				<%strAgentLName=agentDetail1.getString("agentlname");%>
			</logic:present>
		<%}else {
		%>
		   <bean:define id="AgentID" name="userDetailObject" property="agentId" scope="session" />
		   <% long lgObjAgentId = 0;
		      try{
		        lgObjAgentId = Long.parseLong(AgentID.toString());
		      }catch(Exception ex){} 
		      if(lgObjAgentId < 0){
		   %>
		  	<%String objType="";%>
		  	<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
			<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />
			<%if(!(objDescType.toString().equals("AGENCY"))){ %>
			<%lgObjAgentId=0;
			try {
				lgObjAgentId=Long.parseLong(objDescId.toString());
			} catch(Exception ex){} 
			%>
			<%} %>
			<% }if(lgObjAgentId>0){
			%>
				<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId="<%=""+lgObjAgentId%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
				<logic:present name="agentDetail" scope="request">
					<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
					<%lngAgentId1=lgObjAgentId;%>
					<%strAgentFName=agentDetail1.getString("agentfname");%>
					<%strAgentLName=agentDetail1.getString("agentlname");%>
				</logic:present>
			<%} %>	
			<!--  /logic:present -->										
	<%	}%>
	<!--/logic:present-->
<!-- ****************************************************************************************** -->
	<%}%>
<%}%>
 	
 	
 	
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%if(!Customerid.toString().equals("")) {%>
<html:hidden property="answer(Object::Customer::CustomerId)" styleId="customerId" value="<%=Customerid.toString()%>" />
<%}%>


<html:hidden property="answer(duplicateAllowed)" value="no"  />
<html:hidden styleId="pageName" property="answer(Object::Page::Name)" value="InsuredSummary"  />
<html:hidden property="answer(Object::Entity::SiteId)" value="1"  />
<!-- <html:hidden property="answer(Object::Entity::ObjectType)" value="ENTITY" />
<html:hidden property="answer(Object::Entity::EntityType)" value="CUSTOMER" /> -->
<!-- <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> -->
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" styleId="ownerId" />

<html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />

<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
  <html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />

   <html:hidden property="answer(Object::Customer::User)" value="<%=userName.toString()%>" />

   
   <html:hidden property="answer(Object::Customer::CreatedBy)" value="<%=userName.toString()%>" />
   
   <html:hidden property="answer(Object::Customer::UpdatedBy)" value="<%=userName.toString()%>" />



<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />


<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />


<html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />


   <html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
 

<html:hidden name="DataForm" property="answer(versionid)" value="3"/>
<html:hidden name="DataForm" property="answer(RootTemplate)" value="yes"/>
<html:hidden property="answer(AgentId)" value="<%=""+lngAgentId1%>" />
<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />

<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>


<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

	<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />
 
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%	if(!Customerid.equals("")){%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}	
%>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Insured"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Insured Management"%>"/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />
<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
<html:hidden property="formName" value="form::LINKCUSTOMER" />

<table WIDTH="100%" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
<tr>

<td width="100%">
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0"
			CELLPADDING="0">
			<tr>
				<td class="FormLabels" align="center" colspan="4">&nbsp;</td>
			</tr>
			<tr>
				<td class="NewSectionHead" colspan="5" align="center">INSURED MASTER SUMMARY</td>
			</tr>
			<tr>
				<td class="FormLabels" align="left" colspan="4">&nbsp;</td>
			</tr>
		</table>
		</td>
</tr>
</table>
<table>
<tr>
<td>
 <div  style ="font-style:bolditalic;font-size:14pt;width: 500px;"><bean:write name='AddCustomer' property='answer(Object::Customer::CustomerName)'/></div>
</td>

<dmshtml:dms_static_with_connector 
		ruleName='privilage' 
		property='<%=new String[]{"PRIVILEGE_SEARCH_ACTIVITY_LOG"}%>' 			
		connector='or' negated="true">
<td width="600px">&nbsp;</td>
<td class="links" align="right" width="100px"><a href="../SearchActivityManagerAction1.do?TabPanelName=Insured_Panel&answer(Object::Activity::OwnerId)=<%=ownerId.toString()%>&answer(Object::Activity::PageNum)=0&answer(Object::Activity::ObjectId)=<%=Customerid.toString()%>&answer(Object::Activity::ActivityType)=<%= "Insured Management" %>">Activity Log </a></td>
</dmshtml:dms_static_with_connector> 
</tr>

<tr>
  <td>&nbsp;</td>
</tr>

</table>

<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=customerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
	<logic:present name="customerDetail1" scope="request">
	<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
<%try{
			agencyId=Long.parseLong(customerDetailMap.getString("agencyid"));
			}catch(Exception nfe) {agencyId=0;    }
%>	
	</logic:present>




<div  id="Doc" style="display:block">

<table border="0" cellpadding="0" cellspacing="0" width="100%"  align="center" >	 
   <tr>
     <td  valign="bottom" height="25">
      <table border="0" cellpadding="0" cellspacing="0" >	
      <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LIU_SUBMISSION_SHOW"}%>' connector='or' negated="true" >	 
       <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_active" height=35 id="BasicInformationTab" onclick="javascript:loadBasicInformationTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Basic Information</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4" ></td>
         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  id="additionalInsuredTab"  onclick="javascript:loadAdditionalInsuredsTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Additional Insured</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  id="LocationsTab"  onclick="javascript:loadLocationsTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Locations</td>
				</tr>
			</table>
	     </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="SubmissionsTab" onclick="javascript:loadSubmissionsTab(this.id);">
				<tr>
					<td align="center" Style="Cursor:hand">Submissions</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="QuotesTab" onclick="javascript:loadQuotesTab(this.id);" >
				<tr>
					<td align="center"  Style="Cursor:hand" >Quotes</td>
				</tr>
			</table>
         </td>
         <td valign="top" class="todotab_space"><img border="0" src="../Images/spacer.gif" width="6" height="4"></td>         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="PoliciesTab" onclick="javascript:loadPoliciesTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Policies</td>
				</tr>
			</table>
         </td>
        </tr>
        </dmshtml:dms_static_with_connector>
        <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true" >	
        <tr>
         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_active" height=35 id="BasicInformationTab" onclick="javascript:loadBasicInformationTab(this.id);document.getElementById('classContent').style.display='none';
    		 document.getElementById('InsuredDiv').style.display = 'inline';
    		  document.getElementById('classes').style.display ='none';
    		 document.getElementById('classArea').style.display ='none';"
    		 >
				<tr>
					<td align="center"  Style="Cursor:hand">Basic Information</td>
				</tr>
			</table>
         </td>
         
 	   <!--   <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35  id="classesTab"  
    		 onclick="document.getElementById('InsuredDiv').style.display = 'none';
    		 document.getElementById('classes').style.display ='block';
    		 document.getElementById('classArea').style.display ='block';
    		activateInsuredTabs(this.id);
    		enableTabs();"
    		  >
				<tr>
					<td align="center"  Style="Cursor:hand">Classes</td>
				</tr>
			</table>
	     </td> -->  
        
         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="SubmissionsTab" onclick="document.getElementById('classContent').style.display='none';javascript:loadSubmissionsTab(this.id);
    		  document.getElementById('classes').style.display ='none';
    		 document.getElementById('classArea').style.display ='none';
    		 document.getElementById('InsuredDiv').style.display = 'inline';">
				<tr>
					<td align="center" Style="Cursor:hand">Submissions</td>
				</tr>
			</table>
         </td>
         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="QuotesTab" onclick="document.getElementById('classContent').style.display='none';javascript:loadQuotesTab(this.id);
			 document.getElementById('classes').style.display ='none';
    		 document.getElementById('classArea').style.display ='none';
    		 document.getElementById('InsuredDiv').style.display = 'inline';" >
				<tr>
					<td align="center"  Style="Cursor:hand" >Quotes</td>
				</tr>
			</table>
         </td>
         <td align="center" valign=bottom>
    		 <table border="0" width="135px" cellspacing="0" cellpadding="0" class="todotab_inactive" height=35 id="PoliciesTab" onclick="document.getElementById('classContent').style.display='none';
    		 document.getElementById('InsuredDiv').style.display = 'inline';
    		  document.getElementById('classes').style.display ='none';
    		 document.getElementById('classArea').style.display ='none';
    		 javascript:loadPoliciesTab(this.id);">
				<tr>
					<td align="center"  Style="Cursor:hand">Policies</td>
				</tr>
			</table>
         </td>
        </tr>
        </dmshtml:dms_static_with_connector>
   </table>
  </td>
</tr>
<tr>
<td>
	<div class="formpage01">
  	<table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox"  >
	 <tr>
	  <td align="left" valign="top">
	  
<div id="classContent">
</div>
	   	<div id="InsuredDiv">
	   	<html:form action="/SaveInsuredEILUI3" styleId="MasterInsuredForm"  onsubmit="return validateFields()">
	   		
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%if(!Customerid.toString().equals("")) {%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}%>


<html:hidden property="answer(duplicateAllowed)" value="no"  />
<html:hidden property="answer(Object::Entity::SiteId)" value="1"  />
<html:hidden property="answer(parentQuoteId)" value="0"  />
<!-- <html:hidden property="answer(Object::Entity::ObjectType)" value="ENTITY" />
<html:hidden property="answer(Object::Entity::EntityType)" value="CUSTOMER" /> -->
<!-- <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> -->
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" styleId="ownerId" />

<html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />

<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
  <html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />

   <html:hidden property="answer(Object::Customer::User)" value="<%=userName.toString()%>" />

   
   <html:hidden property="answer(Object::Customer::CreatedBy)" value="<%=userName.toString()%>" />
   
   <html:hidden property="answer(Object::Customer::UpdatedBy)" value="<%=userName.toString()%>" />



<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />


<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />


<html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />


   <html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
 

<html:hidden name="DataForm" property="answer(versionid)" value="3"/>
<html:hidden name="DataForm" property="answer(RootTemplate)" value="yes"/>
<html:hidden property="answer(AgentId)" value="<%=""+lngAgentId1%>" />
<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />

<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>


<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

	<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />
 
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%	if(!Customerid.equals("")){%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}	
%>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Insured"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Insured Management"%>"/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />
<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
<html:hidden property="formName" value="form::LINKCUSTOMER" />



	   	
    	  <table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
    	       <td colspan="2">&nbsp;</td>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_INSURED_VIEW"}%>' connector='or' negated="true">
	    	    <tr>
					<td width="19%" align="right" class="field"><font color="red">* One Source Key ID:</font></td>
					<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Policy::OneSourceKey)" size="65" maxlength="8" styleClass="txtbox" styleId="OneSourceKey"/></td>
				</tr>  
			</dmshtml:dms_static_with_connector>
			
	       <tr>
	        <td  colspan="2"><h3>Name</h3></td>
	       </tr>
	       <tr>
			<td  width="19%" align="right" class="field">Insured Name Type:</td>
			<td width="81%" align="left">
			 <html:select name="AddCustomer" property="answer(Object::Customer::NameType)" styleClass="txtbox" styleId="NameType" onchange="showCompanyInformation(this.form)">
					 <html:option value ="Person" styleClass="txtbox">Person</html:option>
				     <html:option value ="Company" styleClass="txtbox">Company</html:option>
			 </html:select>
			</td>
		   </tr> 
		   
           <tr>
			<td width="19%" align="right" class="field" id="insuredNameBlock"><span id="InsName1"><font color="red">* Legal Name 1:</font></span></td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field" id="insuredNameBlock"><span id="InsName2">Legal Name 2:</span></td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName2)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName2" /></td>
	       </tr>
	       <tr id="DBABlock">
			<td width="19%" align="right" class="field">Insured DBA:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::DBA)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="DBA" /></td>
	       </tr>
	       <tr >
			<td width="19%" align="right" class="field">Name Code:</td>
			<td width="81%" align="left">
			   <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"UNDERWRITER_PRIVILEGE"}%>' connector='or' negated="true">
				&nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="AddCustomer" property ="answer(Object::Customer::CustomerNumber)"/>
			   </dmshtml:dms_static_with_connector>
			   <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"UNDERWRITER_PRIVILEGE"}%>' connector='or' negated="false">
			    &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="AddCustomer" property ="answer(Object::Customer::CustomerNumber)"/>
			   </dmshtml:dms_static_with_connector>
			</td>
	       </tr>
	       
	<!---------------------- Select Industry Name --------------------------------------->

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_GENIUSADDRESS"}%>' connector='or' negated="true">
						<tr>
							<td width="19%" align="right" class="field">Industry: <dmshtml:get_industry_name
								nameInSession="arListIndustry"
								ownerId="<%=Long.parseLong(ownerId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /></td>
							<td width="81%" align="left">
							<html:select name="AddCustomer"
								property="answer(Object::Customer::IndustryName)"
								styleClass="txtbox" styleId="InsuredIndustryName">
								<html:option value="">Select</html:option>
								<logic:present name="arListIndustry" scope="request">
									<logic:iterate id="arListIndustry" name="arListIndustry">
										<bean:define id="industryName1" name="arListIndustry"
											property="Object::Product::IndustryName"></bean:define>
										<html:option value='<%=industryName1.toString()%>'>
											<bean:write name="arListIndustry"
												property="Object::Product::IndustryName" />
										</html:option>
									</logic:iterate>
								</logic:present>
							</html:select></td>
						</tr>
</dmshtml:dms_static_with_connector>
					
	       <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>	       
	       <tr>
	        <td  colspan="2"><h3>Primary Business Address</h3></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field"><font color="red">* Address Line 1:</font></td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::StreetName)" size="60" maxlength="50" styleClass="txtbox" styleId="Address1"/></td>
	      </tr>
	      <tr>
			<td width="19%" align="right" class="field">Address Line 2:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::Address2)" size="60" maxlength="50" styleClass="txtbox" styleId="Address2"/></td>
	      </tr>
	      <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_INSURED_VIEW"}%>' connector='or' negated="true">
	      <tr>
			<td width="19%" align="right" class="field">Address Line 3:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::Address3)" size="60" maxlength="50" styleClass="txtbox" styleId="Address3"/></td>
	      </tr>
	      </dmshtml:dms_static_with_connector>	      
	      <tr>
				<td width="19%" align="right" class="field"><font color="red">* City:</font></td>
				<td width="81%" align="left"><html:text name="AddCustomer" property="answer(Object::Customer::City)"  maxlength="40" styleClass="txtbox" styleId="City" /></td>
		  </tr>
		  <tr>
			<td width="19%" align="right" class="field"><font color="red">* State/Province:</font></td>
			<td width="81%" align="left">
			   <html:select name="AddCustomer" property="answer(Object::Customer::State)" styleClass="txtbox" styleId="State">
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
				<td width="19%" align="right" class="field"><font color="red">* Zip Code:</font></td>
				<td width="81%" align="left">
				 <html:text name="AddCustomer" property="answer(Object::Customer::Zip)" maxlength="10" style="width:150px;" styleClass="txtbox" styleId="Zip" />
            	  <a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&MultiplefrmWithSameName=YES&FormID=MasterInsuredForm&FormName=AddCustomer&clear=yes&PopupWindowName=Zip Code Search" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/FindZipCode.jpg" BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>		
            	</td>
		  </tr>
		  <tr>
			<td width="19%" align="right" class="field">Country:</td>
			<td width="81%" align="left">
			    <html:select name="AddCustomer" property="answer(Object::Customer::Address::Country)" styleClass="txtbox" styleId="Country">
                  <html:option value="USA" styleClass="txtbox">United States</html:option>
                </html:select>
			</td>
		  </tr>	
		  <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
		  <%boolean displayGeniusFields = false;%>
		  <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LIBERTY_GENIUSADDRESS"}%>' connector='or' negated="false">	
		  <%displayGeniusFields=true;%>
		  </dmshtml:dms_static_with_connector>
		  <%if(displayGeniusFields){%>
		  <tr>
		    <td  align="left" colspan="2"><h3>Genius Address </h3> </td>
		  </tr>
		  <tr><td colspan="2">&nbsp;</td></tr>
		  <tr>
				<td class="field" align="right" width="19%">
					Is Genius Address same as Business Address?
				</td>
				<td width="81%" align="left">
			      <html:radio name="AddCustomer" property="answer(Object::Customer::MailingAddressSameAsBusinessAddress)" value="Y" styleId="MailingAddressSameAsBusinessAddress_Y"  onclick="disableMailingAddressBlock()" />Yes
				  <html:radio name="AddCustomer" property="answer(Object::Customer::MailingAddressSameAsBusinessAddress)" value="N" styleId="MailingAddressSameAsBusinessAddress_N" onclick="enableMailingAddressBlock()" />No&nbsp;&nbsp;
				</td>
		  </tr>
		  <tr><td colspan="2">
		   <div id="MailingAddressBlock" >
             <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
               <tr>
                 <td class="field" align="right" width="19%">
					Genius Address 1
				 </td>
				 <td width="81%" align="left">
	     		   <html:text property="answer(Object::Customer::MailingAddress1)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress1"/>
	     		 </td>
			   </tr>
			   <tr>
					<td class="field" align="right" width="19%">
						Genius Address 2
					</td>
					<td width="81%" align="left">
				    	<html:text property="answer(Object::Customer::MailingAddress2)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress2" />
					</td>
				</tr>
				<tr>
					<td class="field" align="right" width="19%">
						Genius Address 3
					</td>
					<td width="81%" align="left">
				      <html:text property="answer(Object::Customer::MailingAddress3)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress3" />
					</td>
				</tr>
				<tr>
					<td class="field" align="right" width="19%">
						Genius Address 4
					</td>
					<td width="81%" align="left">
			    		<html:text property="answer(Object::Customer::MailingAddress4)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress4"/>
					</td>
				</tr><tr>
					<td class="field" align="right" width="19%">
						Genius Address 5
					</td>
					<td width="81%" align="left">
						<html:text  property="answer(Object::Customer::MailingAddress5)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress5" />
					</td>
				</tr>
			  </table>
			 </div>
			</td>
		  </tr>
		  <%}else{%>
		  <tr style="display:none;"><td colspan="2">&nbsp;</td></tr>
		  <tr style="display:none;">
				<td class="field" align="right" width="19%">
					Is Genius Address same as Business Address?
				</td>
				<td width="81%" align="left">
			      <html:radio name="AddCustomer" property="answer(Object::Customer::MailingAddressSameAsBusinessAddress)" value="Y" styleId="MailingAddressSameAsBusinessAddress_Y"  onclick="disableMailingAddressBlock()" />Yes
				  <html:radio name="AddCustomer" property="answer(Object::Customer::MailingAddressSameAsBusinessAddress)" value="N" styleId="MailingAddressSameAsBusinessAddress_N" onclick="enableMailingAddressBlock()" />No&nbsp;&nbsp;
				</td>
		  </tr>
		  <tr style="display:none;"><td colspan="2">
		   <div id="MailingAddressBlock" >
             <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
               <tr>
                 <td class="field" align="right" width="19%">
					Genius Address 1
				 </td>
				 <td width="81%" align="left">
	     		   <html:text property="answer(Object::Customer::MailingAddress1)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress1"/>
	     		 </td>
			   </tr>
			   <tr>
					<td class="field" align="right" width="19%">
						Genius Address 2
					</td>
					<td width="81%" align="left">
				    	<html:text property="answer(Object::Customer::MailingAddress2)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress2" />
					</td>
				</tr>
				<tr>
					<td class="field" align="right" width="19%">
						Genius Address 3
					</td>
					<td width="81%" align="left">
				      <html:text property="answer(Object::Customer::MailingAddress3)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress3" />
					</td>
				</tr>
				<tr>
					<td class="field" align="right" width="19%">
						Genius Address 4
					</td>
					<td width="81%" align="left">
			    		<html:text property="answer(Object::Customer::MailingAddress4)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress4"/>
					</td>
				</tr><tr>
					<td class="field" align="right" width="19%">
						Genius Address 5
					</td>
					<td width="81%" align="left">
						<html:text  property="answer(Object::Customer::MailingAddress5)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress5" />
					</td>
				</tr>
			  </table>
			 </div>
			</td>
		  </tr>
		  <%}%>
		  <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr>
	        <td  colspan="2"><h3>Contact Information</h3></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Email Address:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::EMailAddress)" onblur="checkEmailAddress(this.form)" size="40" styleClass="txtbox" styleId="emailID" /></td>
	       </tr>	    
	       <tr>
			<td width="19%" align="right" class="field">Phone Number:</td>
			<td width="81%" align="left">
			  <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneAreaCode)" style="width:45px;"
								maxlength="3" styleClass="txtbox" styleId="PhoneNumber1" 
								onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber2.focus()}" />&nbsp;
              <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneExchangeCode)" style="width:40px;"
								maxlength="3" styleClass="txtbox"
								styleId="PhoneNumber2" 
								onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber3.focus()}" />&nbsp;
              <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhone)"  style="width:60px;"
								maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" />
			</td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Fax Number:</td>
			<td width="81%" align="left">
			   <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxAreaCode)" style="width:45px;"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber1"
								onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber2.focus()}" />&nbsp;
               <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxExchangeCode)" style="width:40px;"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber2"
								onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber3.focus()}" />&nbsp;
               <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::Fax)" style="width:60px;  "
								maxlength="4" styleClass="txtbox" styleId="FaxNumber3" />
			</td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact First Name:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactFName)"  size="65" maxlength="<%=nameFieldLength%>"  styleClass="txtbox" styleId="ContactFirstName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact Last Name:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactLName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="ContactLastName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact Title:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactTitle)"  size="4" styleClass="txtbox" styleId="ContactTitle" /></td>
	       </tr>
	       <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr id="CompanyInfmnBlock">
	        <td  colspan="2"><h3>Company Information</h3></td>
	       </tr>
	       <tr id="CompanywebsiteBlock">
			<td width="19%" align="right" class="field">Website:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactURL)"  size="30" styleClass="txtbox" styleId="CompanyWebSite" /></td>
	       </tr>
           <tr id="FOBBlock">
			<td width="19%" align="right" class="field">Form of Business:</td>
			<td width="81%" align="left">
			  <html:select name="AddCustomer" property="answer(Object::Customer::Business)" styleClass="txtbox" styleId="FormOfBusiness" onchange="showOtherFOBInformation(this.value)">
				<html:option value="select">Select</html:option>	 
			    <html:option value="Corporation">Corporation</html:option>		    
			    <html:option value="Sole Proprietor">Sole Proprietor</html:option>		    
			    <html:option value="Partnership">Partnership</html:option>		    
			    <html:option value="Joint Venture">Joint Venture</html:option>
			    <html:option value="Other">Other</html:option>
			</html:select>
			</td>
	       </tr>
	       <tr id="otherFOBBlock">
				<td width="19%" align="right" class="field">If Other,please Specify&nbsp;&nbsp;</td>
				<td width="81%" align="left"><html:textarea name="AddCustomer" property ="answer(Object::Customer::OtherBusiness)" rows="4" cols="60" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" />
				</td>
		   </tr>
	       <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr>
			<td colspan="2">
			 <table width="35%">
			  <tr>
			    <td width="35%" align="right">
        			<html:submit value="Save" property="amswer(button)" styleClass="button"/>
        	    </td>
        	    
      		  </tr>
      		 </table>
      		</td>
	        </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	     </table>
	     </html:form>
	    </div>
	  </td>
	</tr>
   </table>
 </div>  
 </td>
</tr>    
</table>

</div>  

 	    <div id="BasicInformationDiv" style="display:none">
 	    <html:form action="/SaveInsuredEILUI3" styleId="MasterInsuredForm"  onsubmit="return validateFields()">
	     <table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
          <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>       
	       	
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%if(!Customerid.toString().equals("")) {%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}%>


<html:hidden property="answer(duplicateAllowed)" value="no"  />
<html:hidden property="answer(Object::Entity::SiteId)" value="1"  />
<!-- <html:hidden property="answer(Object::Entity::ObjectType)" value="ENTITY" />
<html:hidden property="answer(Object::Entity::EntityType)" value="CUSTOMER" /> -->
<!-- <bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> -->
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" styleId="ownerId" />

<html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />

<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
  <html:hidden property="answer(Object::Customer::Addresses::BUSINESS::Object::Address::User)" value="<%=userName.toString()%>" />
   <html:hidden property="answer(Object::Customer::Contacts::BUSINESS::Object::Contact::User)" value="<%=userName.toString()%>" />

   <html:hidden property="answer(Object::Customer::User)" value="<%=userName.toString()%>" />

   
   <html:hidden property="answer(Object::Customer::CreatedBy)" value="<%=userName.toString()%>" />
   
   <html:hidden property="answer(Object::Customer::UpdatedBy)" value="<%=userName.toString()%>" />



<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />


<html:hidden property="answer(Object::Customer::Addresses::HOME::Object::Address::User)" value="<%=userName.toString()%>" />


<html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />


   <html:hidden property="answer(Object::Customer::Contacts::HOME::Object::Contact::User)" value="<%=userName.toString()%>" />
 

<html:hidden name="DataForm" property="answer(versionid)" value="3"/>
<html:hidden name="DataForm" property="answer(RootTemplate)" value="yes"/>
<html:hidden property="answer(AgentId)" value="<%=""+lngAgentId1%>" />
<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />

<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>


<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

<%if(agencyId2>0){%>
	<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId2%>" />
<%}%>

	<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />
 
<bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 
<%	if(!Customerid.equals("")){%>
<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
<%}	
%>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />

<html:hidden property="answer(Object::Activity::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::CreatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::UpdatedBy)" value="<%=usernameId.toString()%>" /> 
<html:hidden property="answer(Object::Activity::ObjectType)" value="<%="Insured"%>"/>
<html:hidden property="answer(Object::Activity::ActivityType)" value="<%="Insured Management"%>"/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="versionNum" value="1.0" />
<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
<html:hidden property="formName" value="form::LINKCUSTOMER" />
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_INSURED_VIEW"}%>' connector='or' negated="true">
       		<tr>
			<td width="19%" align="right" class="field"><font color="red">* One Source Key ID:</font></td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Policy::OneSourceKey)" size="65" maxlength="8" styleClass="txtbox" styleId="OneSourceKey"/></td>
	      </tr>
	      </dmshtml:dms_static_with_connector>  
	       <tr>
	        <td  colspan="2"><h3>Name</h3></td>
	       </tr>
	       <tr>
			<td  width="19%" align="right" class="field">Insured Name Type:</td>
			<td width="81%" align="left">
			 <html:select name="AddCustomer" property="answer(Object::Customer::NameType)" styleClass="txtbox" styleId="NameType" onchange="showCompanyInformation()">
					 <html:option value ="Person" styleClass="txtbox">Person</html:option>
				     <html:option value ="Company" styleClass="txtbox">Company</html:option>
			 </html:select>
			</td>
		   </tr> 
		  
           <tr>
			<td width="19%" align="right" class="field" id="insuredNameBlock"><span id="InsName1"><font color="red">* Legal Name 1:</font></span></td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field" id="insuredNameBlock"><span id="InsName2">Legal Name 2:</span></td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::CustomerName2)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="InsuredName2" /></td>
	       </tr>
	       <tr id="DBABlock">
			<td width="19%" align="right" class="field">Insured DBA:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::DBA)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="DBA" /></td>
	       </tr>
	       <tr >
			<td width="19%" align="right" class="field">Name Code:</td>
			<td width="81%" align="left">
			   <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"UNDERWRITER_PRIVILEGE"}%>' connector='or' negated="true">
				&nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="AddCustomer" property ="answer(Object::Customer::CustomerNumber)"/>
			   </dmshtml:dms_static_with_connector>
			   <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"UNDERWRITER_PRIVILEGE"}%>' connector='or' negated="false">
			    &nbsp;&nbsp;&nbsp;&nbsp; <bean:write name="AddCustomer" property ="answer(Object::Customer::CustomerNumber)"/>
			   </dmshtml:dms_static_with_connector>
			</td>
	       </tr>
	       
	       <!-- Select Industry Name -->
	       
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_GENIUSADDRESS"}%>' connector='or' negated="true">
						<tr>
							<td width="19%" align="right" class="field"><font color="red">* Industry:</font> <dmshtml:get_industry_name
								nameInSession="arListIndustrys"
								ownerId="<%=Long.parseLong(ownerId.toString())%>"
								dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" /></td>
							<td width="81%" align="left">
							<html:select name="AddCustomer" property="answer(Object::Customer::IndustryName)" styleClass="txtbox" styleId="IndustryName1">
								<html:option value="">Select</html:option>
								<logic:present name="arListIndustrys" scope="request">
									<logic:iterate id="arListIndustrys" name="arListIndustrys">
										<bean:define id="industryName2" name="arListIndustrys" property="Object::Product::IndustryName"></bean:define>
										<html:option value='<%=industryName2.toString()%>'>
											<bean:write name="arListIndustrys" property="Object::Product::IndustryName" />
										</html:option>
									</logic:iterate>
								</logic:present>
							</html:select></td>
						</tr>
</dmshtml:dms_static_with_connector>						
			<tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>	       
	       <tr>
	        <td  colspan="2"><h3>Primary Business Address</h3></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field"><font color="red">* Address Line 1:</font></td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::StreetName)" size="60" maxlength="50" styleClass="txtbox" styleId="Address1"/></td>
	      </tr>
	      <tr>
			<td width="19%" align="right" class="field">Address Line 2:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::Address2)" size="60" maxlength="50" styleClass="txtbox" styleId="Address2"/></td>
	      </tr>
	      <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_INSURED_VIEW"}%>' connector='or' negated="true">
	      <tr>
			<td width="19%" align="right" class="field">Address Line 3:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property="answer(Object::Customer::Address3)" size="60" maxlength="50" styleClass="txtbox" styleId="Address3"/></td>
	      </tr>
	      </dmshtml:dms_static_with_connector>
	      <tr>
				<td width="19%" align="right" class="field"><font color="red">* City:</td>
				<td width="81%" align="left"><html:text name="AddCustomer" property="answer(Object::Customer::City)"  maxlength="40" styleClass="txtbox" styleId="City" /></td>
		  </tr>
		  <tr>
			<td width="19%" align="right" class="field"><font color="red">* State/Province:</font></td>
			<td width="81%" align="left">
			   <html:select name="AddCustomer" property="answer(Object::Customer::State)" styleClass="txtbox" styleId="State">
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
				<td width="19%" align="right" class="field"><font color="red">* Zip Code:</font></td>
				<td width="81%" align="left">
				 <html:text name="AddCustomer" property="answer(Object::Customer::Zip)" maxlength="10" style="width:150px;" styleClass="txtbox" styleId="Zip" />
            	  <a href="../SearchZipCodeCommon.do?answer(Object::ZipCode::PageNum)=0&MultiplefrmWithSameName=YES&FormID=MasterInsuredForm&FormName=AddCustomer&clear=yes&PopupWindowName=Zip Code Search" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');" /><IMG SRC="../Images/FindZipCode.jpg" BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>		
            	</td>
		  </tr>
		  <tr>
			<td width="19%" align="right" class="field">Country:</td>
			<td width="81%" align="left">
			    <html:select name="AddCustomer" property="answer(Object::Customer::Address::Country)" styleClass="txtbox" styleId="Country">
                  <html:option value="USA" styleClass="txtbox">United States</html:option>
                </html:select>
			</td>
		  </tr>	
		   
		  <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr>
		    <td  align="left" colspan="2"><h3>Genius Address </h3> </td>
		  </tr>
		  <tr><td colspan="2">&nbsp;</td></tr>
		  <tr>
				<td class="field" align="right" width="19%">
					Is Genius Address same as Business Address?
				</td>
				<td width="81%" align="left">
			      <html:radio name="AddCustomer" property="answer(Object::Customer::MailingAddressSameAsBusinessAddress)" value="Y" styleId="MailingAddressSameAsBusinessAddress_Y"  onclick="displayMailingAddressBlock()"/>Yes
				  <html:radio name="AddCustomer" property="answer(Object::Customer::MailingAddressSameAsBusinessAddress)" value="N" styleId="MailingAddressSameAsBusinessAddress_N" onclick="displayMailingAddressBlock()" />No&nbsp;&nbsp;
				</td>
		  </tr>
		  <tr><td colspan="2">
		   <div id="MailingAddressBlock">
             <table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
               <tr>
                 <td class="field" align="right" width="19%">
					Genius Address 1
				 </td>
				 <td width="81%" align="left">
	     		   <html:text name="AddCustomer" property="answer(Object::Customer::MailingAddress1)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress1"/>
	     		 </td>
			   </tr>
			   <tr>
					<td class="field" align="right" width="19%">
						Genius Address 2
					</td>
					<td width="81%" align="left">
				    	<html:text name="AddCustomer" property="answer(Object::Customer::MailingAddress2)"  size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress2" />
					</td>
				</tr>
				<tr>
					<td class="field" align="right" width="19%">
						Genius Address 3
					</td>
					<td width="81%" align="left">
				      <html:text name="AddCustomer" property="answer(Object::Customer::MailingAddress3)" size="60" maxlength="50" styleClass="txtbox" styleId="MailingAddress3" />
					</td>
				</tr>
				<tr>
					<td class="field" align="right" width="19%">
						Genius Address 4
					</td>
					<td width="81%" align="left">
			    		<html:text name="AddCustomer"  property="answer(Object::Customer::MailingAddress4)" size="60" maxlength="50" styleClass="txtbox" />
					</td>
				</tr>
				<tr>
					<td class="field" align="right" width="19%">
						Genius Address 5
					</td>
					<td width="81%" align="left">
						<html:text name="AddCustomer"  property="answer(Object::Customer::MailingAddress5)" size="60" maxlength="50" styleClass="txtbox" />
					</td>
				</tr>
			  </table>
			 </div>
			</td>
		  </tr>
		  <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr>
	        <td  colspan="2"><h3>Contact Information</h3></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Email Address:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::EMailAddress)" onblur="checkEmailAddress(this.form)" size="30"  styleClass="txtbox" styleId="emailID" /></td>
	       </tr>	    
	       <tr>
			<td width="19%" align="right" class="field">Phone Number:</td>
			<td width="81%" align="left">
			  <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneAreaCode)" style="width:45px;"
								maxlength="3" styleClass="txtbox" styleId="PhoneNumber1" 
								onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber2.focus()}" />&nbsp;
              <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhoneExchangeCode)" style="width:40px;"
								maxlength="3" styleClass="txtbox"
								styleId="PhoneNumber2" 
								onkeyup="if(this.value.length==3) {document.forms[0].PhoneNumber3.focus()}" />&nbsp;
              <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::WorkPhone)"  style="width:60px;"
								maxlength="4" styleClass="txtbox" styleId="PhoneNumber3" />
			</td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Fax Number:</td>
			<td width="81%" align="left">
			   <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxAreaCode)" style="width:45px;"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber1"
								onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber2.focus()}" />&nbsp;
               <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::FaxExchangeCode)" style="width:40px;"
								maxlength="3" styleClass="txtbox" styleId="FaxNumber2"
								onkeyup="if(this.value.length==3) {document.forms[0].FaxNumber3.focus()}" />&nbsp;
               <dmshtml:dms_text name="AddCustomer" property="answer(Object::Customer::Fax)" style="width:60px;  "
								maxlength="4" styleClass="txtbox" styleId="FaxNumber3" />
			</td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact First Name:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactFName)"  size="65" maxlength="<%=nameFieldLength%>"  styleClass="txtbox" styleId="ContactFirstName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact Last Name:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactLName)"  size="65" maxlength="<%=nameFieldLength%>" styleClass="txtbox" styleId="ContactLastName" /></td>
	       </tr>
	       <tr>
			<td width="19%" align="right" class="field">Contact Title:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactTitle)"  size="4" styleClass="txtbox" styleId="ContactTitle" /></td>
	       </tr>
	       <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr id="CompanyInfmnBlock">
	        <td  colspan="2"><h3>Company Information</h3></td>
	       </tr>
	       <tr id="CompanywebsiteBlock">
			<td width="19%" align="right" class="field">Website:</td>
			<td width="81%" align="left"><html:text  name="AddCustomer" property ="answer(Object::Customer::ContactURL)"  size="30" styleClass="txtbox" styleId="CompanyWebSite" /></td>
	       </tr>
           <tr id="FOBBlock">
			<td width="19%" align="right" class="field">Form of Business:</td>
			<td width="81%" align="left">
			  <html:select name="AddCustomer" property="answer(Object::Customer::Business)" styleClass="txtbox" styleId="FormOfBusiness" onchange="showOtherFOBInformation(this.value)">
				<html:option value="Select">Select</html:option>	 
			    <html:option value="Corporation">Corporation</html:option>		    
			    <html:option value="Sole Proprietor">Sole Proprietor</html:option>		    
			    <html:option value="Partnership">Partnership</html:option>		    
			    <html:option value="Joint Venture">Joint Venture</html:option>
			    <html:option value="Other">Other</html:option>
			</html:select>
			</td>
	       </tr>
	       <tr id="otherFOBBlock" style="display:none;">
				<td width="19%" align="right" class="field">If Other,please Specify&nbsp;&nbsp;</td>
				<td width="81%" align="left">&nbsp;&nbsp;&nbsp;<html:textarea name="AddCustomer" property ="answer(Object::Customer::OtherBusiness)" rows="4" cols="60" onkeyup="maxLengthTextArea()" styleId="OtherBusiness" />
				</td>
		   </tr>
	       <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	       <tr>
			<td colspan="2">
			 <table width="35%">
			  <tr>
			    <td width="35%" align="right">
        			<html:submit value="Save" property="amswer(button)" styleClass="button"/>
        	    </td>
        	    
      		  </tr>
      		 </table>
      		</td>
	        </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	        <tr>
	         <td colspan="2">&nbsp;</td>
	       </tr>
	     </table>
	     </html:form>
	    </div>

<SCRIPT type="text/javascript">
showCompanyInformation();
var AddLocationAvailable = false;
var showLocationsTanksDiv = true;
var index = 0;
var nameType = document.getElementById("NameType").value;
var formOfBusiness =document.getElementById("FormOfBusiness").value;

 if(formOfBusiness == 'Other'){
		document.getElementById('otherFOBBlock').style.display='table-row';
}else{
		document.getElementById('otherFOBBlock').style.display='none';
}	
function showOtherFOBInformation(FormOfBusiness){
		
		if(FormOfBusiness == 'Other'){
		     	document.getElementById('otherFOBBlock').style.display='table-row';
		}else{
				document.getElementById('otherFOBBlock').style.display='none';
		}	
	}					

function showCompanyInformation(){
var nameType = document.getElementById("NameType").value;

	    if(nameType == 'Person'){
		    document.getElementById('CompanywebsiteBlock').style.display='none'
			document.getElementById('FOBBlock').style.display='none'
			document.getElementById('otherFOBBlock').style.display='none'
			document.getElementById('CompanyInfmnBlock').style.display='none'
			document.getElementById('DBABlock').style.display='none'
			document.getElementById('InsName1').innerHTML ='<font color="red">* First Name:</font>';
			document.getElementById('InsName2').innerHTML ='<font color="red">* Last Name:</font>';
			
		}else{
			document.getElementById('InsName1').innerHTML ='<font color="red">* Legal Name 1:</font>';
			document.getElementById('InsName2').innerHTML ='Legal Name 2:';
			document.getElementById('CompanywebsiteBlock').style.display='table-row'
			document.getElementById('FOBBlock').style.display='table-row'
			document.getElementById('DBABlock').style.display='table-row'
			document.getElementById('CompanyInfmnBlock').style.display='table-row'
			
			if(formOfBusiness == 'Other'){
				document.getElementById('otherFOBBlock').style.display='table-row';
			}else{
				document.getElementById('otherFOBBlock').style.display='none'
			}
		}	
	}	
	

	

	function maxLengthTextArea() {
	var field = document.getElementById('OtherBusiness').value;
	if ( field.value.length > 240 )
  	{
  	
    	field.value = field.value.substring( 0, 240 );
    	alert( "Only 240 characters is allowed." );
    	return false;
  	}   	
}	




 function activateInsuredTabs(activateId){
    //document.body.style.cursor = "wait";
    if(document.getElementById("BasicInformationTab") != undefined){
    	document.getElementById("BasicInformationTab").disabled = true;
    }
    if(document.getElementById("additionalInsuredTab") != undefined){
	    if(document.getElementById("additionalInsuredTab")!=null){
    		document.getElementById("additionalInsuredTab").disabled = true;
    	}
    }
  	if(document.getElementById("LocationsTab") != undefined){
 		document.getElementById("LocationsTab").disabled = true;
 	}
 	if(document.getElementById("SubmissionsTab") != undefined){
 		document.getElementById("SubmissionsTab").disabled = true;
 	}
 	if(document.getElementById("QuotesTab") != undefined){
 		document.getElementById("QuotesTab").disabled = true;
 	}
 	if(document.getElementById("PoliciesTab") != undefined){
 		document.getElementById("PoliciesTab").disabled = true;
 	}
 	if(document.getElementById("classesTab") != undefined){
 		document.getElementById("classesTab").disabled = true;
 	}
 	
 	
 	document.getElementById("BasicInformationTab").className = "todotab_inactive";
 	if(document.getElementById("additionalInsuredTab") != undefined){
	    if(document.getElementById("additionalInsuredTab")!=null){
 			document.getElementById("additionalInsuredTab").className = "todotab_inactive";
 		}
 	}
 	if(document.getElementById("classesTab") !=null && document.getElementById("classesTab") != undefined){
 	document.getElementById("classesTab").className = "todotab_inactive";
 	}
 	if(document.getElementById("LocationsTab")!= undefined){
	 	document.getElementById("LocationsTab").className = "todotab_inactive";
 	}
 	document.getElementById("SubmissionsTab").className = "todotab_inactive";
 	document.getElementById("QuotesTab").className = "todotab_inactive";
 	document.getElementById("PoliciesTab").className = "todotab_inactive";
 	 	
 	document.getElementById(activateId).className = "todotab_active";		
 }	
	
 
function loadBasicInformationTab(basicInformationTabId){	
	 activateInsuredTabs(basicInformationTabId);	
	 document.getElementById("InsuredDiv").innerHTML = document.getElementById("BasicInformationDiv").innerHTML;
	 document.getElementById("InsuredDiv").style.display = "block";
	 showCompanyInformation();	
	 enableTabs();
	 //displayMailingAddressFields();
}
function loadAdditionalInsuredsTab(additionalInsuredTab){
 	activateInsuredTabs(additionalInsuredTab);
  	var pars='TabPanelName=Insured_Panel&answer(Object::AdditionalInsured::OwnerId)='+<%=ownerId.toString()%>+'&answer(Object::AdditionalInsured::CustomerID)='+<%=customerId.toString()%>+'&answer(Object::AdditionalInsured::AdditionalyNamedInsured)=N';

	var url = "../GetAdditionalInsuredActionForInsured.do?";

 	autologout();			
 	new Ajax.Request(url, 
	 	{method: 'post',
			asynchronous:true,parameters:pars,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 	},onSuccess: function(transport){	
		 		 document.getElementById("InsuredDiv").innerHTML = transport.responseText;
		 	     document.body.style.cursor = "default";
		 	}
		}
	);	
 }
function loadLocationsTab(locationsTabId){
 activateInsuredTabs(locationsTabId);	
 var customerId = <%=""+customerId%>;
 var cusState = '<%=""+cusState%>';
 var ownerId = <%=""+ownerId%>;
 var riskType = 'COMMERCIAL';
 var sarchObjectId = <%=""+customerId%>;
 var agencyId2 =<%=""+agencyId2%>;
 var objectId = 0;
 var comPropertyId = -1;
 var objectVerId = 0;
 var objectName = 'HOME_RISK';
 var applicationType = 'LOCATION';
 var selectedRiskType ='COMMERCIALAUTO';
 var pageNum = 0;
 var tabNo = 0;
 
 
var pars2='answer(APP_TAB_TYPE)=YUI&answer(customerId)='+
 customerId+'&answer(Object::UserDetail::ownerId)='+ownerId+
 '&answer(OwnerId)='+ownerId+'&answer(RiskType)='+riskType+'&answer(SearchObjectId)='+
 customerId+'&answer(Object::Customer::CustomerId)='+
 customerId+'&answer(Object::Risk::ComProperty::CustomerId)='+
 customerId+'&answer(Object::Agency::AgencyId)='+agencyId2+'&answer(objectId)='+objectId+
 '&answer(Object::Risk::ComProperty::ComPropertyId)='+comPropertyId+
 '&answer(objectVerId)='+objectVerId+'&answer(objectName)='+objectName+
  '&answer(applicationType)='+applicationType+
  '&answer(applicationSubType)=&answer(Navigation)=&answer(teritory)='
  '&answer(territoryName)=&answer(zone)='
  '&answer(state)=&answer(showOnetTab)=Y&answer(tabNo)='+tabNo+
 '&answer(Object::Employee::PageNum)='+pageNum+'&answer(Object::Customer::State)='+cusState+
 '&answer(Object::Risk::ComProperty::CustomerId)='+customerId+'&answer(Object::Risk::ComProperty::ComPropertyId)='+
 comPropertyId+'&answer(SelectedRiskType)='+selectedRiskType;
 
 	var url = '../InsuredLocationListUI3.0.do?';
		
		new Ajax.Request(url, 
	 	{method: 'post',parameters:pars2,
			asynchronous:true,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
			forwardToLoginPageIfInvalidSession(transport.responseText);
			loadLocationList();
			
		 		enableTabs();
		 	},onSuccess: function(transport){	
		 	document.getElementById("InsuredDiv").innerHTML= transport.responseText;
		 	}
		}
	);
}

function loadLocationList(){

 	    YAHOO.example.XHR_Text = function() {
    var formatUrl = function(elCell, oRecord, oColumn, sData) {        
	 			var locName = "'"+oRecord.getData("LocationName")+"'";
	 			var locString = new String(locName);
	 			locString = locString.replace(/ /g,"%20");
	 			locString = locString.replace(/&#39;/g,"___");
	 			var onclickscript = "getInsuredTanksWithLocation("+oRecord.getData("LocationId")+","+locString+")";
             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";             
             
        };

       
	   var moreColumnDefs = [
            {key:"Number", resizable:"true",width:40,sortable:true},
            {key:"Location Name", resizable:"true", formatter:formatUrl,width:150,sortable:true},
            {key:"Address Line 1",  resizable:"true",width:180},
            {key:"Address Line 2", resizable:"true",width:180},
            {key:"City", resizable:"true",width:100},
            {key:"State",  resizable:"true",width:100}
        ];
          
         var customerId = <%=""+customerId%>;
		 var cusState = '<%=""+cusState%>';
		 var ownerId = <%=""+ownerId%>;
		 var riskType = 'COMMERCIAL';
		 var sarchObjectId = <%=""+customerId%>;
		 var agencyId2 =<%=""+agencyId2%>;
		 var objectId = 0;
		 var comPropertyId = -1;
		 var objectVerId = 0;
		 var objectName = 'HOME_RISK';
		 var applicationType = 'LOCATION';
		 var selectedRiskType ='COMMERCIALAUTO';
		 var pageNum = 0;
		 var tabNo = 0;  
		 var parameters='answer(APP_TAB_TYPE)=YUI&answer(customerId)='+
			 customerId+'&answer(Object::UserDetail::ownerId)='+ownerId+
			 '&answer(OwnerId)='+ownerId+'&answer(RiskType)='+riskType+'&answer(SearchObjectId)='+
			 customerId+'&answer(Object::Customer::CustomerId)='+
			 customerId+'&answer(Object::Risk::ComProperty::CustomerId)='+
			 customerId+'&answer(Object::Agency::AgencyId)='+agencyId2+'&answer(objectId)='+objectId+
			 '&answer(Object::Risk::ComProperty::ComPropertyId)='+comPropertyId+
			 '&answer(objectVerId)='+objectVerId+'&answer(objectName)='+objectName+
			  '&answer(applicationType)='+applicationType+
			  '&answer(applicationSubType)=&answer(Navigation)=&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(state)=&answer(showOnetTab)=Y&answer(tabNo)='+tabNo+
			 '&answer(Object::Employee::PageNum)='+pageNum+'&answer(Object::Customer::State)='+cusState+
			 '&answer(Object::Risk::ComProperty::CustomerId)='+customerId+'&answer(Object::Risk::ComProperty::ComPropertyId)='+
			 comPropertyId+'&answer(SelectedRiskType)='+selectedRiskType;
      autologout();       
       var anotherDataSource = new YAHOO.util.DataSource('../InsuredLocationListResultUI3.0.do');
       anotherDataSource.connMethodPost = true;	      
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Number","Location Name","Address Line 1","Address Line 2","City","State","LocationId","LocationName"]
        };

        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });

        
        // Configuration for Pagination
        var myConfigs = {   
                initialRequest:parameters,
                generateRequest: parameters,
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  	
         
        var myDataTableY = new YAHOO.widget.DataTable("LocationList1", moreColumnDefs,anotherDataSource,myConfigs);  
	 
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();

 }		
 
  function enableTabs(){
   
    if(document.getElementById("BasicInformationTab") != undefined){
    	document.getElementById("BasicInformationTab").disabled = false;
    }
    if(document.getElementById("additionalInsuredTab") != undefined){
	     if(document.getElementById("additionalInsuredTab")!=null){
	    	document.getElementById("additionalInsuredTab").disabled = false;
	    }
    }
 	if(document.getElementById("LocationsTab") != undefined){
 		document.getElementById("LocationsTab").disabled = false;
 	}
 	if(document.getElementById("SubmissionsTab") != undefined){
 		document.getElementById("SubmissionsTab").disabled = false;
 	}
 	if(document.getElementById("QuotesTab") != undefined){
 		document.getElementById("QuotesTab").disabled = false;
 	}
 	if(document.getElementById("PoliciesTab") != undefined){
 		document.getElementById("PoliciesTab").disabled = false;
 	}
 	if(document.getElementById("classesTab") != undefined){
 		document.getElementById("classesTab").disabled = false;
 	}
 	document.body.style.cursor = "default";
   
   }
   
   
function loadSubmissionsTab(SubmissionsTab){
 	activateInsuredTabs(SubmissionsTab);
 	
 	var pars='TabPanelName=Submission_Panel&FormName=FindForm&answer(Object::Submission::Insured::Id)='+<%=customerId.toString()%>+'&answer(Object::Customer::PageNum)=0';

	var url = "../InsuredSubmissionSearchResultUI3.do?";

 	autologout();			
 	new Ajax.Request(url, 
	 	{method: 'post',
			asynchronous:true,parameters:pars,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 	},onSuccess: function(transport){	
		 	 document.getElementById("InsuredDiv").innerHTML = transport.responseText;
		 	     document.body.style.cursor = "default";
		 	}
		}
	);	
	
			
 }
 
 function loadQuotesTab(QuotesTab){
 	activateInsuredTabs(QuotesTab);
 	
 	var pars='TabPanelName=Quote_Panel&answer(Entity::Equals::OwnerId)='+<%=ownerId.toString()%>+'&FormName=FindForm&answer(Object::Customer::CustomerId)='+<%=customerId.toString()%>+'&answer(Object::Agency::AgencyId)='+<%=agencyId+""%>+'&answer(Object::Customer::State)='+'<%=cusState.toString()%>'+'&answer(Object::Customer::PageNum)=0';

	var url = "../GetAllQuotesUI3.do?";

 	autologout();			
 	new Ajax.Request(url, 
	 	{method: 'post',
			asynchronous:true,parameters:pars,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 	},onSuccess: function(transport){	
		 	 document.getElementById("InsuredDiv").innerHTML = transport.responseText;
		 	     document.body.style.cursor = "default";
		 	}
		}
	);	
	
			
 }
 
  function loadPoliciesTab(PoliciesTab){
 	activateInsuredTabs(PoliciesTab);
 	var agencyId2 =<%=""+agencyId2%>;
 	var pars='TabPanelName=Policy_Panel&answer(Entity::Equals::OwnerId)='+<%=ownerId.toString()%>+'&FormName=FindForm&answer(Object::Customer::CustomerId)='+<%=customerId.toString()%>+'&answer(Object::Policy::PolicyType)=POLICY&answer(Object::Agency::AgencyId)='+agencyId2;

	var url = "../GetPolicyListActionUI3.do?";

 	autologout();			
 	new Ajax.Request(url, 
	 	{method: 'post',
			asynchronous:true,parameters:pars,
			onFailure:function(){},
			onException:function(){},
			onComplete:function(transport){
				 forwardToLoginPageIfInvalidSession(transport.responseText);
		 		 enableTabs();
		 	},onSuccess: function(transport){	
		 	 document.getElementById("InsuredDiv").innerHTML = transport.responseText;
		 	     document.body.style.cursor = "default";
		 	}
		}
	);	
	
			
 }

	 function getInsuredTanksWithLocation(locId,newLocName){

	 	//document.getElementById("LocList").style.display = "none";
	 	document.getElementById("Loc3TableData").style.display = "none";
		document.getElementById("AddLocationDiv").style.display = "none";
	 	appendLocationToParent(locId,newLocName);
		enableTabs();
	 	ShowInsuredLocationTankListDiv(locId);
	 }
	 
var count1=0;
 function appendLocationToParent(locId,newLocName){
 		count1++;
		var tsrLocationName = new String(newLocName);
		//alert(tsrLocationName)
		tsrLocationName = tsrLocationName.replace(/%20/g," ");
		tsrLocationName = tsrLocationName.replace(/___/g,"'");
		var parent = document.getElementById("divide1");
	
		var td=document.createElement("td");
		td.onclick = function() {ShowInsuredLocationTankListDiv(locId,this.id);}		
		td.setAttribute("border","0");
		td.setAttribute("width","150px");
		td.setAttribute("cellpadding","0");
		td.setAttribute("cellspacing","0");
		td.className = "todotab_active";
		td.setAttribute("height","35");
		var id=locId+"AddLocation_"+count1;
		td.setAttribute("id",id);
		
		var span = document.createElement("span");
		span.className = "close right";
		span.onclick=function(){removeChild(id);}
		td.appendChild(span);
		
		td.appendChild(document.createTextNode(tsrLocationName));
		
		var tdSpace = document.createElement("td");
		tdSpace.setAttribute("valign","top");
		tdSpace.className = "todotab_space";
		var img = document.createElement("img");
		img.setAttribute("border","0");
		img.setAttribute("src","images/spacer.gif");
		img.setAttribute("width","1");
		img.setAttribute("height","1");
		tdSpace.appendChild(img);
		//parent.appendChild(tdSpace);
		//Bug Id 8436 Fixed.
		//Modified by Rajeshkumar P on 20-September-2010
		//"\u00a0" is the unicode for &nbsp; (Printing a space)
		var sp = document.createTextNode("\u00a0")
		parent.appendChild(sp);
		parent.appendChild(td);
		
		activateTabs(id);
 }
	 
	 
	function removeChild(elem){
	
	AddLocationAvailable = false;
	if(!addLocationDivActive){
		showLocationsTanksDiv = false;
	}
		var parent = document.getElementById("divide1");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		document.getElementById("LocList").innerHTML = '<table border="0" width="99%" id="table2" cellspacing="0" cellpadding="0"><tr><td class="todotab_yellowbox tab_yellowborder" ><div>&nbsp;</div><table border="0" cellpadding="5" cellspacing="0" width="98%" class="datadispborder" align=center id="Loc3TableData" ><tr><td><div id="LocationList1" class="locformbox1"></div></td></tr></table><p>&nbsp;</div></td></tr></table>';
		loadQuoteLocationList1();
		document.getElementById("Loc3TableData").style.display = "block";	
		
		document.getElementById("AddLocationDiv").style.display = "none";
		if(document.getElementById("AddLocationDiv1") != undefined){
			document.getElementById("AddLocationDiv1").innerHTML = "";
		}

		document.getElementById("LocationAndTanksList").style.display = "none";

		document.getElementById("LocationAndTanksList").innerHTML = "";
		activateTabs('LocationSchedule');
		//loadLocationListTable();
			loadLocationList();

	}	 
   
	 function ShowInsuredLocationTankListDiv(locId,id){
	
	if(showLocationsTanksDiv){ //Checked for tab close operation

 		//var customerId = document.getElementById("customerId").value;
	/*	var IsApplicationDisabled = document.getElementById("IsApplicationDisabled").value
		
		if(IsApplicationDisabled == 'N'){
			appEnabled = 'Y';
			 
		}else{
			appEnabled = "N";	
			 
		}*/
 		var url ="../getInsuredLocationTankListUI3.do";
 		var parameters="answer(Object::Customer::CustomerId)="+<%=customerId.toString()%>+"&answer(Object::Insured::Location::LocationId)="+locId+"&answer(appEnabled)=Y";
 		autologout();
 		new Ajax.Request(url, {method: 'post',asynchronous:true,parameters:parameters,
		onFailure:function(){},
		onException:function(){},
 		onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
 		if(document.getElementById("Loc3TableData") != undefined){
 			document.getElementById("Loc3TableData").style.display = "none";
 		}
 		if(document.getElementById("LocList") != undefined){
 			document.getElementById("LocList").innerHTML = "";
 		}
		document.getElementById("AddLocationDiv").style.display = "none";
		if(document.getElementById("AddLocationDiv1") != undefined){
			document.getElementById("AddLocationDiv1").innerHTML = " ";
		}
		//document.getElementById("LocList").innerHTML = " ";
		document.getElementById("LocationAndTanksList").innerHTML = transport.responseText;
		
 		document.getElementById("LocationAndTanksList").style.display = "block";	
 		initTankPopUp();
 		
 		},
 		onSuccess: function(transport){
 		//loadTankListTable();//to load data table of Tank List
 		}});
 		if(id!=undefined && id !=null){
 		activateInsuredTabs(id);	
 		}
 		addLocationDivActive = false;
 	}
 	showLocationsTanksDiv = true;
 }
   var addIndex;
   
   
function editSpecificQuestions(tankType){

	var heading = 'View/Edit Location Information';
	heading.replace(/ /g,"%20");
	
	var objectId = 0;
	var objectVerId =0;
	var objectName ="";
	var USTSpecQuestionAdded = "";
	var ASTSpecQuestionAdded ="";
	var getSpecQuestion = false;
	var heading = "";
	if(document.getElementById("USTSpecQuestionAdded") !=null && document.getElementById("USTSpecQuestionAdded") != undefined){
	 USTSpecQuestionAdded = document.getElementById("USTSpecQuestionAdded").value;
	}
	if(document.getElementById("ASTSpecQuestionAdded") != null && document.getElementById("ASTSpecQuestionAdded") != undefined){
	 ASTSpecQuestionAdded = document.getElementById("ASTSpecQuestionAdded").value;
	}

		if(tankType =='UST'){
			 objectName = "USTSpecificQuestion";
			 getSpecQuestion = true;
			 heading = 'View/Edit UST Specific Questions';
		}


		if(tankType =='AST'){
			 objectName = "ASTSpecificQuestion";
			 getSpecQuestion = true;
			 heading = 'View/Edit AST Specific Questions';
		}
 heading.replace(/ /g,"%20");
	var objectType = 'RISK';
	var applicationType = 'LOCATION';
	var applicationSubType = '';
	var IsSubApplicationCoveredByForm = 'Yes';
	var State = '';
	var riskTerritory = '';
	var zone='';
	var ComPropertyId = -1;
 var customerId = <%=""+customerId%>;
 var cusState = '<%=""+cusState%>';
 var ownerId = <%=""+ownerId%>;

	var actionName = '%2FsaveQuoteEILRiskApplicationAction.go%3F';

	var locationId=document.getElementById("locIdUpdated").value;
	var recalculateneed = 'recalculate'
	var objAppType = "";



	//var IsApplicationDisabled = 'Y'; //document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "N";
	/*if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
	}else{
		appEnabled = "N";	
	}*/
	
	if(appEnabled == "Y" && tankType == "AST"){
	
		heading = 'View/Edit AST Specific Questions';
	}else if(appEnabled == "N" && tankType == "AST"){
		heading = 'View AST Specific Questions';
	}
	
	if(appEnabled == "Y" && tankType == "UST"){
	
		heading = 'View/Edit UST Specific Questions';
	}else if(appEnabled == "N" && tankType == "UST"){
		heading = 'View UST Specific Questions';
	}

	
	var agencyId = <%=agencyId%>


	//var FamilyId = document.getElementById("ProductFamilyId").value;



	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+
	'&OwnerId='+ownerId+'&answer(objectName)='+objectName+'&answer(applicationType)='+applicationType+'&answer(applicationSubType)='+
	'&answer(IsSubApplicationCoveredByForm)='+IsSubApplicationCoveredByForm+'&answer(State)='+'&answer(riskTerritory)='+riskTerritory+
	'&answer(zone)='+zone+
	'&addedAppIndex='+addIndex+'&answer(Object::Risk::ComProperty::CustomerId)='+customerId+'&answer(Object::Application::ApplicationType)='+objAppType+
	'&answer(recalculateneeded)='+recalculateneed+'&answer(IsApplicationDisabled)=N&answer(IsApplicationEnabled)=N&answer(Object::Agency::AgencyId)='+agencyId+'&answer(CustomerId)='+customerId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+customerId+
	'&answer(Object::Location::LocationId)='+locationId+
	'&answer(Object::Customer::CustomerId)='+customerId+'&answer(actionName)='+actionName+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;
	//var heading = '';

	var url = '../GetSubmissionLocation.do';		
	autologout();
	new Ajax.Request(url, {method: 'post',asynchronous:true,parameters:pars1,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
		showRiskPopUp(transport.responseText,locationId,heading);
		},onSuccess: function(transport){}}); 
	
}  


	function showRiskPopUp(data,locationId,heading){

		
		loadRiskSavedPopUp(locationId,heading,data);
	
	}
	
	
	function loadRiskSavedPopUp(locId,heading,data) {

	
	
	document.getElementById("containerheading").innerHTML = heading;

	
	document.getElementById("RiskPopUp").style.display = "block";	
	// Instantiate the Dialog

	document.getElementById("RiskPopUpBody").innerHTML = data;
	YAHOO.example.container.dialog3.show();
	var locationId = locId;
	YAHOO.util.Event.on('submitButtonForPopUp', 'click', function(e) {	 
	 	ShowLocationTankListDiv(locId);
	 })
	 YAHOO.util.Event.on('closeIcon3', 'click', function(e) {
	 
	 	YAHOO.example.container.dialog3.cancel();
	 	document.getElementById("RiskPopUpBody").innerHTML = " ";
	 	document.getElementById("RiskPopUp").style.display = "none";	
	 	
	 })
	 
	  YAHOO.util.Event.on('CancelRisk1', 'click', function(e) {
	 
	 	YAHOO.example.container.dialog3.cancel();
	 	document.getElementById("RiskPopUpBody").innerHTML = " ";
	 	document.getElementById("RiskPopUp").style.display = "none";	
	 	
	 })
}	 
var AddLocationAvailable = false;
var showLocationsTanksDiv = true;
var index = 0;
function showLocationList(id){

document.getElementById("LocList").innerHTML = '<table border="0" width="99%" id="table2" cellspacing="0" cellpadding="0"><tr><td class="todotab_yellowbox tab_yellowborder" ><div>&nbsp;</div><table border="0" cellpadding="5" cellspacing="0" width="98%" class="datadispborder" align=center id="Loc3TableData" ><tr><td><div id="LocationList1" class="locformbox1"></div></td></tr></table><p>&nbsp;</div></td></tr></table>';
	
 	document.getElementById("AddLocationDiv").style.display = "none";	
	
	document.getElementById("LocationAndTanksList").style.display = "none";

	loadLocationList();
	document.getElementById("Loc3TableData").style.display = "block";

	addLocationDivActive = false;
	activateTabs(id);
	//loadLocationListTable();
}   
initTankPopUp();
function initTankPopUp(){
YAHOO.example.container.dialog3 = new YAHOO.widget.Dialog("RiskPopUp", 
							{ width : "78em",
							  fixedcenter : true,
							  visible : false,
							  close:true,
							  modal:true,
							  constraintoviewport : true,
							  buttons : []
							});
	// Render the Dialog
	YAHOO.example.container.dialog3.render();
}




 function loadQuoteLocationList1(){

 	    YAHOO.example.XHR_Text = function() {
    
	 var formatUrl = function(elCell, oRecord, oColumn, sData) {        
	 			var locName = "'"+oRecord.getData("LocationName")+"'";
	 			var locString = new String(locName);
	 			locString = locString.replace(/ /g,"%20");
	 			var onclickscript = "getQuoteTanksWithLocation("+oRecord.getData("LocationId")+","+locString+")";
             	elCell.innerHTML = "<a id='' onclick="+onclickscript+" rel='' target=''  href ='javascript:void(0);'>"+sData+"</a>";             
             
        };
        
	   var moreColumnDefs = [
            {key:"Number", resizable:"true",width:40,sortable:true},
            {key:"Location Name", resizable:"true", formatter:formatUrl,width:100,sortable:true},
            {key:"Address Line 1",  resizable:"true",width:80},
            {key:"Address Line 2", resizable:"true",width:80},
            {key:"City", resizable:"true",width:90},
            {key:"State",  resizable:"true",width:70},
            {key:"Zip",  resizable:"true",width:70},
            {key:"UST",  resizable:"true",width:40,sortable:true},
            {key:"AST",  resizable:"true",width:40,sortable:true}
        ];
        
       	var subQuoteId1 = 0;
       	var subQuoteVerId1 = 0;
      	var riskTerritory1 = '';
      	var customerId1 = <%=""+customerId%>;
      	var agencyId1 = 0;
      	var prodId1 = 0;
      	var productVerId1 = 0;
      	var GroupId1 =0;
      	var ownerId1 =12;
      	var GroupVerId1 = 0;
      	var parentQuoteId1 = 0;
      	var productStatus1 = 0;
      	var CustomerState1 = 'AL'
      	var ProductFamilyId1 = 0;
      	var parentQuoteVerId1 = 0;
var parameters="answer(IsApplicationDisabled)=Y&customerId="+customerId1+
    "&answer(Object::UserDetail::ownerId)="+ownerId1+
    "&answer(Object::Customer::CustomerId)="+customerId1+
    "&answer(Object::Agency::AgencyId)="+agencyId1+
    "&answer(objectId)="+prodId1+
    "&answer(objectVerId)="+productVerId1+
    "&answer(objectName)=PRODUCT&answer(prdGroupId)="+GroupId1+
    "&answer(prdGroupVerId)="+GroupVerId1+
    "&answer(productStatus)="+productStatus1+
    "&answer(teritory)=&answer(riskTerritory)="+riskTerritory1+
    "&answer(territoryName)=&answer(zone)=&answer(state)=&answer(showOnetTab)=Y&tabNo=0&answer(Object::Customer::State)="+CustomerState1+
    "&answer(Object::Risk::ComProperty::CustomerId)="+customerId1+
    "&answer(parentQuoteId)="+parentQuoteId1+
    "&parentQuoteId="+parentQuoteId1+
    "&answer(subQuoteId)="+subQuoteId1+
    "&answer(QuoteId)="+subQuoteId1+
    "&answer(Object::Customer::CustomerId)="+customerId1+"&answer(Object::Agency::AgencyId)="+agencyId1+
    "&answer(FamilyId)="+ProductFamilyId1+"&answer(parentQuoteVerId)="+parentQuoteVerId1+
    "&answer(Object::Quote::PrevSubQuoteVerId)="+subQuoteVerId1;
      autologout();       
       var anotherDataSource = new YAHOO.util.DataSource("../getQuoteLocationListUI3.do");
       anotherDataSource.connMethodPost=true;
        anotherDataSource.responseType = YAHOO.util.DataSource.TYPE_TEXT;
        anotherDataSource.responseSchema = {
            recordDelim: "\n",
            fieldDelim: "____~____*",
            fields: ["Number","Location Name","Address Line 1","Address Line 2","City","State","Zip","UST","AST","LocationId","LocationName"]
        };

        anotherDataSource.subscribe( 'responseEvent',  function(oArgs) {         
            // the remote response is in oArgs.response,
            // the raw text is oArgs.response.responseText   
            var rawResponse = oArgs.response.responseText;
            forwardToLoginPageIfInvalidSession(rawResponse);
            
        });

        
        // Configuration for Pagination
        var myConfigs = {   
                initialRequest:parameters,
                generateRequest:parameters,
     	paginator : new YAHOO.widget.Paginator({   
         rowsPerPage    : 10, // REQUIRED  
               
         // use a custom layout for pagination controls   
          template       : "{FirstPageLink} {PageLinks} {LastPageLink}  Show {RowsPerPageDropdown} per page",   
      
         // use these in the rows-per-page dropdown   
         rowsPerPageOptions : [10,15,20],   
   
         // use custom page link labels   
         pageLabelBuilder : function (page,paginator) {   
             var recs = paginator.getPageRecords(page);   
             return (recs[0] + 1) + ' - ' + (recs[1] + 1);   
         }   
     		})   
 		};  	
        
        var myDataTableY = new YAHOO.widget.DataTable("LocationList1", moreColumnDefs,anotherDataSource,myConfigs);  
	
	   return {
            oDS2: anotherDataSource,
          oDT2: myDataTableY
        };
    }();
 
 
 }
 
 
 function geteditRiskPopUp(tankId,riskType){

	var objectName = riskType;
	var objectId = 0;
	var objectVerId =0;
	var objectType = 'RISK';
	var applicationType = 'RISK';
	var applicationSubType = '';
	var IsSubApplicationCoveredByForm = 'Yes';
	var State = '';
	var riskTerritory = '';
	var zone='';
	var ComPropertyId = -1;
	var ownerId = <%=""+ownerId%>;
	var custId = <%=""+customerId%>;

	var actionName = '%2FsaveEILRiskApplicationAction.go%3FTabPanelName=Quote_Panel';

	var locationId=document.getElementById("locIdUpdated").value;

	var recalculateneed = 'recalculate'
	var objAppType = "";

	//var parentQuoteId    = document.getElementById("parentQuoteId").value;

	//var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	//var subQuoteId    = document.getElementById("subQuoteId11").value;

	//var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled ='N' ;
	// document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
		var heading = 'View/Edit Tank Information';
	}else{
		appEnabled = "N";	
		var heading = 'View Tank Information';
	}
	appEnabled = "N";

	var agencyId = <%=agencyId%>

	//var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	//var FamilyId = document.getElementById("ProductFamilyId").value;

	
	var pars1 = 'answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+
	'&OwnerId='+ownerId+'&answer(objectName)='+objectName+'&answer(applicationType)='+applicationType+'&answer(applicationSubType)='+applicationSubType+
	'&answer(IsSubApplicationCoveredByForm)='+IsSubApplicationCoveredByForm+'&answer(State)='+State+'&answer(riskTerritory)='+riskTerritory+
	'&answer(zone)='+zone+'&answer(Object::Risk::RiskId)='+tankId+'&answer(IsApplicationDisabled)='+appEnabled+
	'&addedAppIndex='+addIndex+'&answer(Object::Risk::ComProperty::CustomerId)='+custId+'&answer(Object::Application::ApplicationType)='+objAppType+
	'&answer(recalculateneeded)='+recalculateneed+'&answer(IsApplicationEnabled)='+appEnabled+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(CustomerId)='+custId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+
	'&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Location::Risk::StorageTankId)='+tankId+'&answer(Object::Risk::RiskId)='+tankId+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(actionName)='+actionName+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;
	
	
	var url = '../GetSubmissionLocation.do?';		
	autologout();		
	new Ajax.Request(url, {method: 'post',asynchronous:true,parameters:pars1,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
		showRiskPopUp(transport.responseText,locationId,heading);
		},onSuccess: function(transport){}});

}
 var addLocationDivActive = false;
var activeTabId = "";
YAHOO.namespace("example.container");
function loadTankPopUp() {
	document.getElementById("AddTankDialog").style.display = "block";	
	// Instantiate the Dialog
	YAHOO.example.container.AddTankDialog = new YAHOO.widget.Dialog("AddTankDialog", 
							{ width : "60em",
							  fixedcenter : true,
							  visible : false,
							  constraintoviewport : true
							});
	// Render the Dialog
	YAHOO.example.container.AddTankDialog.render();
	//YAHOO.example.container.AddTankDialog.show();

	 //Event for Cancel risk
	 YAHOO.util.Event.on('CancelRisk', 'click', function(e) {
	 
	 	YAHOO.example.container.AddTankDialog.cancel();
	 	document.getElementById("AddTankDialog").style.display = "none";	
	 })
	YAHOO.util.Event.on('closeIcon1', 'click', function(e) {
	 
	 	YAHOO.example.container.AddTankDialog.cancel();
	 	document.getElementById("AddTankDialog").style.display = "none";	
	 })
}
YAHOO.util.Event.onDOMReady(loadTankPopUp);		

function activateTabs(id){	
	var parent = document.getElementById("divide1");
	arrChildren = parent.childNodes;

// loop thru all child nodes
for(i = 0; i < arrChildren.length; i++)
{
 
	objChild = arrChildren[i];
	if(objChild.id != undefined){
		objChild.className = "loctab_inactive left";
	}
}

if(id != null && id!=undefined){
 document.getElementById(id).className = 'loctab_active left';
 }
	//To check that active tab Name
	activeTabId = id;
}


 function getEditLocationPopUp(){
	var heading = 'View/Edit Location Information';
	heading.replace(/ /g,"%20");
	
	var objectName = "LOCATION";
	var objectId = 0;
	var objectVerId =0;
	var objectType = 'RISK';
	var applicationType = 'LOCATION';
	var applicationSubType = '';
	var IsSubApplicationCoveredByForm = 'Yes';
	var State = '';
	var riskTerritory = '';
	var zone='';
	var ComPropertyId = -1;
	var ownerId = <%=""+ownerId%>;
	var custId = <%=""+customerId%>;

	var actionName = '%2FsaveEILRiskApplicationAction.go%3FTabPanelName=Submission_Panel';

	var locationId=document.getElementById("locIdUpdated").value;
	var recalculateneed = 'recalculate'
	var objAppType = "";

	///var parentQuoteId    = document.getElementById("parentQuoteId").value;

	//var parentQuoteVerId = document.getElementById("parentQuoteVerId").value;

	//var subQuoteId    = document.getElementById("subQuoteId11").value;

	//var productVerId  = document.getElementById("ProductVerId").value;

	var IsApplicationDisabled ='Y' ;
	// document.getElementById("IsApplicationDisabled").value;
	var appEnabled = "";
	if(IsApplicationDisabled == 'N'){
		appEnabled = 'Y';
		 heading = 'View/Edit Location Information';
	}else{
		appEnabled = "N";	
		 heading = 'View Location Information';
	}
	var agencyId = <%=agencyId%>;

	//var prevSubQuoteVerId = document.getElementById("subQuoteVerId").value;
	//var FamilyId = document.getElementById("ProductFamilyId").value;

	
		var pars1 = 'answer(actionName)='+actionName+'&answer(objectId)='+objectId+'&answer(objectVerId)='+objectVerId+
	'&OwnerId='+ownerId+'&answer(objectName)='+objectName+'&answer(applicationType)='+applicationType+'&answer(applicationSubType)='+applicationSubType+
	'&answer(IsSubApplicationCoveredByForm)='+IsSubApplicationCoveredByForm+'&answer(State)='+State+'&answer(riskTerritory)='+riskTerritory+
	'&answer(zone)='+zone+'&answer(Object::Risk::RiskId)='+'&answer(IsApplicationDisabled)='+appEnabled+
	'&addedAppIndex='+addIndex+'&answer(Object::Risk::ComProperty::CustomerId)='+custId+'&answer(Object::Application::ApplicationType)='+objAppType+
	'&answer(recalculateneeded)='+recalculateneed+'&answer(IsApplicationEnabled)='+appEnabled+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(CustomerId)='+custId+'&answer(Object::Agency::AgencyId)='+agencyId+'&answer(customerId)='+custId+
	'&answer(Object::Location::LocationId)='+locationId+'&answer(Object::Location::Risk::StorageTankId)='+'&answer(Object::Risk::RiskId)='+
	'&answer(Object::Customer::CustomerId)='+custId+'&answer(riskType)='+objectName+'&answer(objectType)='+objectType;

	//var heading = '';

	var url = '../GetSubmissionLocation.do?';		
	autologout();
	new Ajax.Request(url, {method: 'post',asynchronous:true,parameters:pars1,
		onFailure:function(){},
		onException:function(){},
		onComplete:function(transport){
		forwardToLoginPageIfInvalidSession(transport.responseText);
		showRiskPopUp(transport.responseText,locationId,heading);
		},onSuccess: function(transport){}});

}

var check='<%=""+mailingAddressSameAsBusinessAddress%>';
if (check=='Y'){
	 document.getElementById("MailingAddressSameAsBusinessAddress_Y").checked="checked";
	 document.forms[0].MailingAddress1.readOnly = true;
	 document.forms[0].MailingAddress2.readOnly = true;
	 document.forms[0].MailingAddress3.readOnly = true;
	 document.forms[0].MailingAddress4.readOnly = true;
	 document.forms[0].MailingAddress5.readOnly = true;
}

if(check=='N') {
	 document.getElementById("MailingAddressSameAsBusinessAddress_N").checked="checked";
	 document.forms[0].MailingAddress1.readOnly = false;
	 document.forms[0].MailingAddress2.readOnly = false;
	 document.forms[0].MailingAddress3.readOnly = false;
	 document.forms[0].MailingAddress4.readOnly = false;
	 document.forms[0].MailingAddress5.readOnly = false;
}
function disableMailingAddressBlock() {
     document.forms[0].MailingAddress1.readOnly = true;
     document.forms[0].MailingAddress2.readOnly = true;
     document.forms[0].MailingAddress3.readOnly = true;
     document.forms[0].MailingAddress4.readOnly = true;
     document.forms[0].MailingAddress5.readOnly = true;
}

function enableMailingAddressBlock() {
     document.forms[0].MailingAddress1.readOnly = false;
     document.forms[0].MailingAddress2.readOnly = false;
     document.forms[0].MailingAddress3.readOnly = false;
     document.forms[0].MailingAddress4.readOnly = false;
     document.forms[0].MailingAddress5.readOnly = false;
}

<%if(request.getParameter("InsuredSummaryActiveTab") !=null){ 

	if(request.getParameter("InsuredSummaryActiveTab").equals("additionalInsuredTab")){ %>
		
		loadAdditionalInsuredsTab("additionalInsuredTab");
		
	<%}}%>

var showClassDiv = true;
function removeClass(classId,elem){
		showClassDiv = false;
		var parent = document.getElementById("classListId");
		var childId = document.getElementById(elem);
		childId.style.display = "none";
		document.getElementById('classAreaList').style.display='block';document.getElementById('classArea1').style.display='none';
		document.getElementById('tdClassListId').className = 'loctab_active left';
		var classIdExist = openTabClassesId.match(classId);
		if (classIdExist!=null){
			var class1Id = "," + classId;
			openTabClassesId=openTabClassesId.replace(class1Id," ");
		}
		opentabCount = 0;
	}	 
	
	
function showClassDetail(classId,id){
	opentabCount = 0;
	if(showClassDiv){
		if(document.getElementById(id)!=null && document.getElementById(id)!=undefined) {
			activateClassTabs(id);
		}
		var url ="../getClassByRiskId.do";
		var pars="answer(Object::Customer::CustomerId)="+<%=customerId.toString()%>+"&answer(Object::Insured::Location::LocationId)="+classId;
 		new Ajax.Request(url, {method: 'post',asynchronous:true,parameters:pars,
		onFailure:function(){},
		onException:function(){},
 		onComplete:function(transport){
 			forwardToLoginPageIfInvalidSession(transport.responseText);
 			document.getElementById('classAreaList').style.display = "none";
 			document.getElementById('classArea1').style.display = "block";
 			document.getElementById('classArea1').innerHTML = transport.responseText;
 		}
 		});
 	}
 	showClassDiv = true;
}

function activateClassTabs(id){	
	var parent = document.getElementById("classListId");
	arrChildren = parent.childNodes;

// loop thru all child nodes
for(i = 0; i < arrChildren.length; i++)
{
 
	objChild = arrChildren[i];
	if(objChild.id != undefined){
		objChild.className = "loctab_inactive left";
	}
}

if(id != null && id!=undefined){
 document.getElementById(id).className = 'loctab_active left';
 }
}

var counter=0;
var openTabClassesId = "";
var opentabCount = "0";
var getClassHazardsTab = "false";

function getInsuredClassList(classId,className){
	var classIdExist = openTabClassesId.match(classId);
 	showClass = true;
		if (classIdExist==null){
	 		appendClassDetailToParent(classId,className);
	 		showClassDetail(classId);
	 	}else{
	 		showClassDetail(classId);
	 	}
}

 function appendClassDetailToParent(classId,className){
 	if(opentabCount == 0){
		opentabCount = 1;
 		getClassHazardsTab = "true";
		openTabClassesId = openTabClassesId +"," + classId;
		counter++;
		var tsrClassName = className;
		var parent = document.getElementById("classListId");
	 	var anc = document.createElement("anc"); 
	    anc.className = "loctab_active left";
	    var id = "addClass"+counter+classId;
	    anc.setAttribute("id",id);
	    var span = document.createElement("span");
	    span.className = "close right";
	    span.onclick=function(){removeClass(classId,id);}
	    anc.appendChild(span);
	    anc.onclick = function() {showClassDetail(classId,id);}  
	    parent.appendChild(anc);  
	    anc.appendChild(document.createTextNode(tsrClassName));
	    activateClassTabs(id);
	 }
	 else{
			getClassHazardsTab ="false";
	}
 }
 
 function closeAddLocation() {

	//NULL Implementation to fix a Javascript error.
}
</SCRIPT>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true" >
	<div align="left" id="classes" style="display:none">
	<table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox2"  >
	<tr><td>
		<div id="classListId">
      	   <a href="javascript:void(0);" id="tdClassListId" onclick="document.getElementById('classAreaList').style.display='block';document.getElementById('classArea1').style.display='none'; activateClassTabs('tdClassListId');" class="loctab_active left">
			 <div id="tdClassListId" >Classes List</div></a>	
		 </div>
	</td></tr>
	</table>
	</div>
	
     <% long cusId = Long.parseLong(customerId.toString()); 
    	 long owner = Long.parseLong(ownerId.toString()); %>
    
     <div id="classArea" style="display:none">
     <div id="classAreaList" >
     <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox"  >
		<tr><td>
  		 <table border="0" width="100%" cellspacing="0" cellpadding="0" height=100>
			<tr>
				<td width="100%" align="center">
					<table  class="yui-dt-table" cellspacing="0" cellpadding="0" width="100%">
					    <dmshtml:GetInsuredClassList nameInSession="ClassListArray" customerId='<%=cusId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId='<%=owner%>'/>	 
					<logic:notPresent name="ClassListArray">
							<tr>
								<td valign="top">
									<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td height="20px" colspan="9" class="MH" style="{color:red;}">
												
													No Classes Found
												
											</td>
										</tr>
									</table>
								</td>
							</tr>
					</logic:notPresent>
					<% int commonCount = 0; %>
					
					<logic:present name="ClassListArray">
					<tr class="yui-dt">
					<th  VALIGN='top' width="4%"><div class="yui-dt-liner"><p class="tableData">S.No</p></div></th>
					<th  VALIGN='top' width="30%"><div class="yui-dt-liner"><p class="tableData">Class Name</p></div></th>
					<th  VALIGN='top' width="66%"><div class="yui-dt-liner"><p class="tableData">Class Description</p></div></th>    		
				        	</tr>
						<% int i=0; %>
		  				<%int count=0;
		  				%>   
				
						<logic:iterate id="ClassListArray" name="ClassListArray" >
							<%++count;%>
							<%++commonCount;%>
								<% 		
									String styleClass="";
									if(count%2==0){
										styleClass = "yui-dt-even";
									}
									else{
										styleClass = "yui-dt-odd";	
									}
								%>
							<tr class=<%=styleClass%>>
							<td align="left"><div class="yui-dt-liner"><p class="tableData" style="font-weight:normal"><%=++i%></p></div></td>
							<bean:define property="Object::Risk::RiskId" name="ClassListArray" id="riskId"/> 
							<bean:define property="Object::Risk::RiskName" name="ClassListArray" id="riskName"/> 
							
							<td align="left"><div class="yui-dt-liner"><p class="tableData" style="font-weight:normal">&nbsp;&nbsp;<a href="javascript:void(0);" onclick="getInsuredClassList('<%=""+riskId%>','<%=""+riskName%>');"><%=""+riskName%></a></p></div></td>
							<td align="left"><div class="yui-dt-liner"><p class="tableData" style="font-weight:normal">&nbsp;&nbsp;<bean:write name="ClassListArray" property="Object::Risk::ClassDescription" /></p></div></td>
							</tr>
						</logic:iterate>
					</logic:present>				
				</table>
				</td>
			</tr>
		</table>
		</td></tr></table>
		</div>
		<div id="classArea1">  </div>
		</div>
</dmshtml:dms_static_with_connector>

