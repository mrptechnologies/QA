<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<script type="text/javascript" SRC="../Scripts/Rico/rico.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/Rico/prototype.js"></SCRIPT>

<html:form action="/getAgentAgenciesRico">
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>		


	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0" border="1">	
		<tr><td height="0"><html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/></td></tr>
		<tr><td height="0"><html:hidden property="formName" value="form::SEARCHAGENT" /></td></tr>
		
		<tr><td height="5"></td></tr>
		<tr><td class="NewSectionHead" colspan="4" align="center">AGENTS FOUND IN SEARCH</td></tr>
		<!-- br -->
		<tr><td><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="left" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" 	onclick="getAgentAgency()">	</td></tr>
		<tr><td></td><td></tr>
		<tr><td><input type="submit" class="sbttn" onclick="findSubmitButton()" property="select" value="SELECT" align="right"/></td></tr>
		
		<tr><td class="FormLabels" colspan="4"></td></tr>
		<tr><td>
		<table id="data_grid_header" class="fixedTable" cellspacing="0" cellpadding="0" style="width:860px">
		<tr>
			<th class="first tableCellHeader" style="width:1px"><a href="">#</a></th>
			<th id="firstName" class="tableCellHeader" style="width:120px">Agent First Name</th>
			<th id="lastName" class="tableCellHeader" style="width:120px">Agent Last Name</th>
			<th id="agencyCode" class="tableCellHeader" style="width:40px">Agency Code</th>
			<th id="agencyName" class="tableCellHeader" style="width:60px">Agency Name</th>
			<th id="agencyState" class="tableCellHeader" style="width:20px">State</th>
			<th id="agencyStatus" class="tableCellHeader" style="width:20px">Status</th>
		</tr>	
		<tr>
			<td><input id="no" type="text" value=""  align="left" size="1" styleClass="txtbox"/></td>
			<td><input id="agentFName" type="text" value=""  onblur="getAgentAgency()"  align="left" size="22" styleClass="txtbox" /></td>
			<td><input id="agentLName" type="text" value=""  onblur="getAgentAgency()"  align="left" size="23"/></td>
			<td><input id="agencyCode" type="text" value="" onblur="getAgentAgency()"  align="left" size="1"/></td>
			<td><input id="agencyName" type="text" value="" onblur="getAgentAgency()"  align="left" size="40"/></td>
			<td><input id="agencyState" type="text" value="" onblur="getAgentAgency()"  align="left" size="3"/></td>
			<td><input id="agencyStatus" type="text" value="" onblur="getAgentAgency()"  align="left" size="3"/></td>	
	</tr>		
	
  </table>
  	<table>
  		<tr>
  		<td>
  			<div id="viewPort" align="justify" style="width: 960px; height: 600px;overflow:scroll;"  onscroll="getAgentAgency1()"></div>
		</td>
		</tr>
		<tr>
		<td>
	  		<div id="reportError" style="float:left"><tr><td  height="0"></td></tr></div>
		</td>
		</tr>
		
		
		<html:hidden property="answer(newLimit)" value="<%=""+session.getAttribute("newLimit")%>"/>
		<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
	</table>

</html:form>
<script type="text/javascript">
		function getAgentAgency(){	
		
		var formElement=document.forms[0];
		var top=document.getElementById("viewPort").scrollTop;
		var left=document.getElementById("viewPort").scrollLeft;					
		var width=document.getElementById("viewPort").scrollWidth;					
		var height=document.getElementById("viewPort").scrollHeight;	
		var length=document.getElementById("viewPort").scrolllength;	

//		var height =document.getElementById("viewPort").getHeight();
//		var elements =document.getElements("viewPort").getHeight();	
		var pars="answer(Object::Entity::FirstName)="+formElement.agentFName.value+"&answer(Object::Entity::LastName)="+formElement.agentLName.value+"&answer(Agency::Like::AgencyId)="+formElement.agencyCode.value+"&answer(Agency::Like::BusinessName)="+formElement.agencyName.value+"&answer(Address::Equals::State)="+formElement.agencyState.value+"&answer(Agency::Like::Status)="+formElement.agencyStatus.value+"&answer(Agency::Limit)="+20+"&answer(Agency::Search::TopLimit)="+top+"&answer(Agency::Search::LeftLimit)="+left+"&answer(Agency::Search::Width)="+width+"&answer(Agency::Search::Height)="+height+"&answer(Agency::Search::Scroll)="+"NO";		
//		var pars="answer(Object::Entity::FirstName)="+""+"&answer(Object::Entity::LastName)="+""+"&answer(Agency::Like::AgencyId)="+""+"&answer(Agency::Like::BusinessName)="+""+"&answer(Address::Equals::State)="+""+"&answer(Agency::Like::Status)="+""+"&answer(Agency::Limit)="+20+"&answer(Agency::Search::TopLimit)="+top+"&answer(Agency::Search::LeftLimit)="+left+"&answer(Agency::Search::Width)="+width+"&answer(Agency::Search::Height)="+height;		
		var ajax = new Ajax.Updater({success:'viewPort'},'/getAgentAgenciesRico.do',{method: 'get', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("viewPort").innerHTML);}, onFailure: reportError});						
//		document.getElementById("viewPort").scrollHeight=document.getElementById("viewPort").scrollHeight+document.getElementById("viewPort").scrollTop;
//		viewPort.offsetHeight=viewPort.offsetHeight+viewPort.scrollTop;
//		alert(viewPort.scrollHeight);
//		alert(document.getElementById("rowNum").value);
		}
			
		function findSubmitButton(){
		var formElement=document.forms[0];
		formElement.action='/LinkAgencttoCustomerAction.do';
	    formElement.submit();
    	}
    	function getAgentAgency1(){	
		var formElement=document.forms[0];
		var top=document.getElementById("viewPort").scrollTop;
		var left=document.getElementById("viewPort").scrollLeft;					
		var width=document.getElementById("viewPort").scrollWidth;					
		var height=document.getElementById("viewPort").scrollHeight;		
		var pars="answer(Object::Entity::FirstName)="+formElement.agentFName.value+"&answer(Object::Entity::LastName)="+formElement.agentLName.value+"&answer(Agency::Like::AgencyId)="+formElement.agencyCode.value+"&answer(Agency::Like::BusinessName)="+formElement.agencyName.value+"&answer(Address::Equals::State)="+formElement.agencyState.value+"&answer(Agency::Like::Status)="+formElement.agencyStatus.value+"&answer(Agency::Limit)="+20+"&answer(Agency::Search::TopLimit)="+top+"&answer(Agency::Search::LeftLimit)="+left+"&answer(Agency::Search::Width)="+width+"&answer(Agency::Search::Height)="+height+"&answer(Agency::Search::Scroll)="+"YES";		
		var ajax = new Ajax.Updater({success:'viewPort'},'/getAgentAgenciesRico.do',{method: 'get', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("viewPort").innerHTML);}, onFailure: reportError});								
		}
</script>
