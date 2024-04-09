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

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/LinkProductToObject.js"></SCRIPT>

<html:form action="/LinkTerritoryProductVerToOptionVer">

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<%if(request.getParameter("answer(Object::Product::ProductId)")!= null) {%>
	<html:hidden property="answer(Object::Product::ProductId)" value="<%=request.getParameter("answer(Object::Product::ProductId)").toString()%>" />

<%
}
%>
<%if(request.getParameter("answer(Object::Product::ProductVerId)")!= null) {%>
	<html:hidden property="answer(Object::Product::CurrentVerId)" value="<%=request.getParameter("answer(Object::Product::ProductVerId)").toString()%>" />
	<html:hidden property="answer(Object::Product::ProductVerId)" value="<%=request.getParameter("answer(Object::Product::ProductVerId)").toString()%>" />

<%
}
%>

<%if(request.getParameter("answer(Object::Product::State)")!= null) {%>
	<html:hidden property="answer(Object::Product::State)" value="<%=request.getParameter("answer(Object::Product::State)").toString()%>" />

<%
}
%>
<%if(request.getParameter("answer(territory)")!= null) {%>
	<html:hidden property="answer(territory)"
		value="<%=request.getParameter("answer(territory)").toString()%>" />

	<%
}
%>


<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="MH">
LINK TERRITORY AND PRODUCT VERSION OPTION/APPLICATION VERSIONS
</td></tr>
<tr><td class="TextMatter">
Use this page to link territory to product versions option/application versions 
<br>
</td></tr>
<tr><td><hr size="1" noshade ></td></tr>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<tr><td>&nbsp;</td></tr>
<tr>

<td class="FormLabels" align="left">Select option version(s) to be linked to the territory </td></tr>
<tr><td>
<table WIDTH="550px" ALIGN="center" cellspacing=0 cellpadding="2" border="0">

	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
			<td class="FormLabels" align="left">Option Versions</td>
			<td class="FormLabels" align="left">&nbsp;</td>			
			<td class="FormLabels" align="left">Selected Option Versions</td>
			
</tr>

<tr>
		<td width="15%"><dmshtml:get_available_prodVer_territory_Options nameInSession="arrOptions" ownerId="<%=Long.parseLong(""+ownerId)%>"
		state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
productVerId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductVerId)").toString())%>"
territory="<%=Long.parseLong(request.getParameter("answer(territory)").toString())%>"
dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
		<dmshtml:dms_select  property="answer(Object::Product::Option)" styleId="possible" multiple="true" size="7" >
			<logic:present name="arrOptions" scope="request">
           <logic:iterate id="options" name="arrOptions" scope="request" >
		    <bean:define id='optionVerName' name="options"  property="optionVerName" />
		    <bean:define id='optionVerNum' name="options"  property="optionVerNum" />
		    <bean:define id='optionVerId' name="options"  property="optionVerId" />
		     <dmshtml:dms_option value ='<%=optionVerId.toString()%>' >
			 <%=optionVerName.toString()+" "+optionVerNum.toString() %>
		    </dmshtml:dms_option>
		</logic:iterate>
		</logic:present>
	</dmshtml:dms_select>	
		</td>

					<TD width="10%"><A
						HREF="javascript:copyToList('possible','chosen')"><IMG
						SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="Add --&gt;"></A> <br>
					<br>
					<A HREF="javascript:copyToList('chosen','possible')"><IMG
						SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="&lt;-- Remove"></A>
					</TD>
<td width="30%"><dmshtml:get_prodVer_territory_options nameInSession="arrProdOptions" ownerId="<%=Long.parseLong(""+ownerId)%>" productVerId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductVerId)").toString())%>"
state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
territory="<%=Long.parseLong(request.getParameter("answer(territory)").toString())%>"
dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
		<dmshtml:dms_select  property="answer(Object::ProductVerTer::ProdOptionVerId)" styleId="chosen" multiple="true" size="7" >
			<logic:present name="arrProdOptions" scope="request">
           <logic:iterate id="prodOptions" name="arrProdOptions" scope="request" >
		    <bean:define id='optionVerName' name="prodOptions"  property="optionVerName" />
		    <bean:define id='optionVerNum' name="prodOptions"  property="optionVerNum" />
		    <bean:define id='optionVerId' name="prodOptions"  property="optionVerId" />
				<bean:define id='optionId' name="prodOptions"  property="optionId" />
		     <dmshtml:dms_option value ='<%=optionVerId.toString()%>' >
				 <%=optionVerName.toString()+" "+optionVerNum.toString() %>
		    </dmshtml:dms_option>
		</logic:iterate>
		</logic:present>
	</dmshtml:dms_select>	
		</td>

</TR>
</table>
</td></tr>
	<tr>
	<td><hr size="1" noshade width="95%"></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>

<td class="FormLabels" align="left">Select application version(s) to be linked to the territory </td></tr>
<tr><td>
<table WIDTH="550px" ALIGN="center" cellspacing=0 cellpadding="2" border="0">

	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
			<td class="FormLabels" align="left">Application Versions</td>
			<td class="FormLabels" align="left">&nbsp;</td>			
			<td class="FormLabels" align="left">Selected Application Versions</td>
			
</tr>

<tr>
		<td width="15%"><dmshtml:get_available_prodVer_territory_Apps nameInSession="arrOptions" ownerId="<%=Long.parseLong(""+ownerId)%>"
		state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
productVerId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductVerId)").toString())%>"
territory="<%=Long.parseLong(request.getParameter("answer(territory)").toString())%>"
dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
		<dmshtml:dms_select  property="answer(Object::Product::Option)" styleId="possibleList" multiple="true" size="7" >
			<logic:present name="arrOptions" scope="request">
           <logic:iterate id="options" name="arrOptions" scope="request" >
		    <bean:define id='applicationName' name="options"  property="applicationName" />
		    <bean:define id='applicationVerNum' name="options"  property="applicationVerNum" />
		    <bean:define id='applicationVerId' name="options"  property="applicationVerId" />
		     <dmshtml:dms_option value ='<%=applicationVerId.toString()%>' >
			 <%=applicationName.toString()+" "+applicationVerNum.toString() %>
		    </dmshtml:dms_option>
		</logic:iterate>
		</logic:present>
	</dmshtml:dms_select>	
		</td>

					<TD width="10%"><A
						HREF="javascript:copyToList('possibleList','chosenList')"><IMG
						SRC="../Images/AddData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="Add --&gt;"></A> <br>
					<br>
					<A HREF="javascript:copyToList('chosenList','possibleList')"><IMG
						SRC="../Images/RemoveData.gif" WIDTH="77" HEIGHT="19" BORDER="0"
						ALT="&lt;-- Remove"></A>
					</TD>
<td width="30%">
<dmshtml:get_prodVer_territory_apps nameInSession="arrProdOptions" ownerId="<%=Long.parseLong(""+ownerId)%>" productVerId="<%=Long.parseLong(request.getParameter("answer(Object::Product::ProductVerId)").toString())%>"
state="<%=request.getParameter("answer(Object::Product::State)").toString()%>"
territory="<%=Long.parseLong(request.getParameter("answer(territory)").toString())%>"
dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
		<dmshtml:dms_select  property="answer(Object::ProductVerTer::ProdAppVerId)" styleId="chosenList" multiple="true" size="7" >
			<logic:present name="arrProdOptions" scope="request">
			 <logic:iterate id="prodOptions" name="arrProdOptions" scope="request" >
		   <bean:define id='applicationName' name="prodOptions"  property="applicationName" />
		    <bean:define id='applicationVerNum' name="prodOptions"  property="applicationVerNum" />
		    <bean:define id='applicationVerId' name="prodOptions"  property="applicationVerId" />
		     <dmshtml:dms_option value ='<%=applicationVerId.toString()%>' >
			 <%=applicationName.toString()+" "+applicationVerNum.toString() %>
		    </dmshtml:dms_option>
		</logic:iterate>
		</logic:present>
	</dmshtml:dms_select>	
		</td>

</TR>
</table>
</td></tr>
	<tr>
	<td><hr size="1" noshade width="95%"></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr><td align="center">
		<html:submit value="Save" styleClass="sbttn" onclick="return selectBothLists()"/>
			</td></tr>
</table>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />

<html:hidden property="answer(objectType)" value="territoryOptionVer" />

<html:hidden property="answer(ProductId)" value="<%=request.getParameter("answer(Object::Product::ProductId)")%>" />
<html:hidden property="answer(ProductVerId)" value="<%=request.getParameter("answer(Object::Product::ProductVerId)")%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
