<% /*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.web.data.DataForm"%>
<%
session.removeAttribute("arrObjectDetail");
session.setAttribute("AddCustomer", new DataForm());
session.removeAttribute("currentObjectInfo");
%>
<SCRIPT SRC="../Scripts/JScripts/CreateSubmission.js" type="text/javascript"> </SCRIPT>
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/paginator-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/connection/connection-min.js"></script>


<style type="text/css">
#demo {
    width: 525px;
}
#pag {
    display: inline;
    float: left;
    width: 250px;
    margin-top: 0;
}
#pag a {
    color: #0000de;
}
#pag label {
    display: block;
    margin: 1ex 0;
}
#pag p {
    margin: .25ex 0;
}
.yui-skin-sam #pag .yui-pg-pages {
    display: block;
}
.yui-skin-sam #pag .yui-pg-page {
    display: block;
    background: transparent;
    border: none;
    padding: .5ex 0;
    white-space: normal;
}
.yui-skin-sam #pag .yui-pg-current-page {
    padding: .5ex 0;
    background-color: #ffe;
    font-style: italic;
}
.yui-skin-sam #pag .yui-pg-current {
    margin: 0;
    white-space: normal;
    font-weight: bold;
    font-size: 113%;
}
.yui-skin-sam #demo .yui-dt caption {
    margin: 0.2em 0 0;
    color: #e76300;
    font-weight: bold;
}
</style>
<html:form name="FindForm" type="com.dms.web.data.DataForm" action="/CVLinkAgenttoInsuredEILAction.do">

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>


			<h3>Select Agency and Agent</h3>
	<div class="formpage01">
		<div class="formhead"><h2 class="left">Agency Information</h2></div>
		

		<div class="field">Agency / Broker Code:<html:text styleClass="widthText"  property="answer(Agency::Like::AgencyCode)" styleId="AgencyCode"/></div>
		<div class="field">Agency Name:<html:text styleClass="widthText" property="answer(Agency::Like::BusinessName)" styleId="BusinessName"/></div>
		<div class="field" style="width:461px ;">State:
		<dmshtml:get_type nameInSession="arStates" dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
			<html:select styleClass="widthText" property="answer(Address::Equals::State)" styleId="State">
				<html:option value ="">Select</html:option>
	        		<logic:present name="arStates" scope="request">
	          		<logic:iterate id="details" name="arStates" scope="request" >
			 	    <bean:define id='test' name="details"  property="typeDesc" />
			  		<html:option value ='<%=test.toString()%>'>
			       	<bean:write name="details" property="dmsType" />
			   		</html:option>
					</logic:iterate>
					</logic:present>
			</html:select>
		</div>		
		
		<div class="formcontent">
		<input type="button" value="Find >" class="covbutton" onclick="listAgency()">	
		</div>
		<div class="formcontentRightAlign" style="display:none" id="divSelectButton">
		<input type="button" class="covbutton" value="Select" onclick="selectAgent();" >
		</div>
		<div id="AgencyCount"></div>
		<table>
		<tr>
		<td>&nbsp;</td>
		<td align="left">
		<div id="AGENCY_LIST" class="yui-skin-sam">
		</div>
		</td>
		</tr>
		</table>
		
</div>


<html:hidden property="answer(Agency::NotEquals::ParentAgencyId)" value="-1" styleId="ParentAgencyId"/>
<html:hidden property="LimitSearch" value="yes" styleId="LimitSearch"/>
<html:hidden styleId="inpPageNum" property="answer(Object::Agency::PageNum)" value="0"/>
<html:hidden styleId="orderby" property="answer(Agency::orderBy)" value="DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID "/>
<html:hidden property="answer(Agency::Equals::OwnerId)" value="<%=""+ownerId %>" styleId="OwnerId"/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" styleId="TabPanelName"/>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' styleId="dbname"/>	


<html:hidden property="formName" value="form::SEARCHAGENT" />
<html:hidden property="answer(1*Entity::Equals::SearchObjectType)" value="AGENCY" />   
<html:hidden property="entityType" value="AGENT" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=""+ownerId %>' />	
<html:hidden property="LimitSearch" value="yes" />
<html:hidden property="answer(Entity::orderBy)" value="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID " />
<html:hidden property="answer(Object::Entity::PageNum)" value="0"/> 
<html:hidden property="answer(forwardKey)" value="<%="SubmissionAgencySuccess"%>" />
<html:hidden property="answer(PageType)" value="<%="SubmissionAgency"%>" />
<html:hidden property="answer(Agency::AgencyId)" value="<%=""%>"  styleId="agencId"/>
<html:hidden property="answer(AgentId)" value="<%="-1"%>"  styleId="agentId"/>
<script>
 function updateCount(){
 	var dbname=document.getElementById("dbname").value;	
		var ParentAgencyId=document.getElementById("ParentAgencyId").value;
		var LimitSearch=document.getElementById("LimitSearch").value;
		var inpPageNum=document.getElementById("inpPageNum").value;
		var orderby=document.getElementById("orderby").value;
		var OwnerId=document.getElementById("OwnerId").value;
		var AgencyCode=document.getElementById("AgencyCode").value;
		var BusinessName=document.getElementById("BusinessName").value;
		var State=document.getElementById("State").value;
		
		document.getElementById('divSelectButton').style.display='block';

        var url = "../ListOfAgenciesCount.do?answer(TabPanelName)=Submission_Panel&answer(dbname)="+dbname+"&answer(Agency::NotEquals::ParentAgencyId)="+ParentAgencyId+"&LimitSearch="+LimitSearch+"&answer(Object::Agency::PageNum)="+inpPageNum+"&answer(orderby)="+orderby+"&answer(Agency::Equals::OwnerId)="+OwnerId+"&answer(Agency::Like::AgencyCode)="+AgencyCode+"&answer(Agency::Like::BusinessName)="+BusinessName+"&answer(Address::Equals::State)="+State;
 	
 		new Ajax.Request(url, {method: 'post',onComplete:function(transport){},onSuccess: function(transport){

 		document.getElementById("AgencyCount").innerHTML = "Number of Agencies Found: "+transport.responseText;
 		}}); 
 }
 </script>
</html:form>

