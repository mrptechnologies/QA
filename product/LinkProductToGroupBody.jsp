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

<html:form action="/LinkProductToGroup">

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<%if(request.getParameter("answer(Object::ProductGroup::ProductGroupId)")!= null) {%>
	<html:hidden property="answer(Object::ProductGroup::ProductGroupId)" value="<%=request.getParameter("answer(Object::ProductGroup::ProductGroupId)").toString()%>" />
<%
}
%>
<%if(request.getParameter("answer(Object::ProductGroup::GroupVerId)")!= null) {%>
	<html:hidden property="answer(Object::ProductGroup::GroupVerId)" value="<%=request.getParameter("answer(Object::ProductGroup::GroupVerId)").toString()%>" />

<%
}
%>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="MH">
LINK PRODUCT TO GROUP
</td></tr>
<tr><td class="TextMatter">
Use this page to link products to group
<br>
</td></tr>
<tr><td><hr size="1" noshade ></td></tr>

<tr><td>&nbsp;</td></tr>

<tr>

<td class="FormLabels" align="left">Select product(s) to be linked to the group</td></tr>
<tr><td>
<table WIDTH="550px" ALIGN="center" cellspacing=0 cellpadding="2" border="0">

	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
			<td class="FormLabels" align="left">Product</td>
			<td class="FormLabels" align="left">&nbsp;</td>		
			<td class="FormLabels" align="left">Selected Products</td>
			
</tr>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<tr>
		<td width="15%"><dmshtml:get_available_products nameInSession="arrProducts" ownerId="<%=Long.parseLong(""+ownerId)%>"
		 groupId="<%=Long.parseLong(request.getParameter("answer(Object::ProductGroup::ProductGroupId)").toString())%>" 
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
		<dmshtml:dms_select  property="answer(Object::Product::Product)" styleId="possible" multiple="true" size="7" >
			<logic:present name="arrProducts" scope="request">
           <logic:iterate id="products" name="arrProducts" scope="request" >
		    <bean:define id='productId' name="products"  property="productId" />
		     <dmshtml:dms_option value ='<%=productId.toString()%>' >
		       <bean:write name="products" property="MProductName"  />
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
<td width="30%"><dmshtml:get_product_group nameInSession="arrProducts" ownerId="<%=Long.parseLong(""+ownerId)%>"
groupId="<%=Long.parseLong(request.getParameter("answer(Object::ProductGroup::ProductGroupId)").toString())%>" 
dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
		<dmshtml:dms_select  property="answer(Object::Product::ProductId)" styleId="chosen" multiple="true" size="7" >
			<logic:present name="arrProducts" scope="request">
           <logic:iterate id="products" name="arrProducts" scope="request" >
		    <bean:define id='productId' name="products"  property="productId" />
		     <dmshtml:dms_option value ='<%=productId.toString()%>' >
		       <bean:write name="products" property="MProductName"  />
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
		<html:submit value="Save" styleClass="sbttn" onclick="return allSelect()"/>
			</td></tr>
</table>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(GroupId)" value="<%=request.getParameter("answer(Object::ProductGroup::ProductGroupId)").toString()%>" />

<html:hidden property="answer(objectType)" value="productGroup" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
</html:form>
