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
<SCRIPT type="text/JavaScript">
<!--

function checkUncheckAll(theElement) {
	 theElement = document.forms[0].selAll;
	      var theForm = theElement.form, z = 0;
				if(theElement.checked)
		{
	 for(z=0; z<theForm.length;z++){
      if(theForm[z].type == 'checkbox' && theForm[z].id != 'selAll'){
	  theForm[z].disabled=false;
		document.forms[0].month.disabled=false;
		document.forms[0].day.disabled=false;
		document.forms[0].year.disabled=false;
	  }
     }
		}
		else
		{
				for(z=0; z<theForm.length;z++){
      if(theForm[z].type == 'checkbox' && theForm[z].id != 'selAll'){
	  theForm[z].disabled=true;
		document.forms[0].month.disabled=true;
		document.forms[0].day.disabled=true;
		document.forms[0].year.disabled=true;
	  }
     }
		}
    }
    function synchronizeQuote(){
	allSelect();
	document.forms[0].action='/SyncronizeQuoteProduct.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>'
	document.forms[0].submit();
}
//-->

</SCRIPT>		
<html:form action="/LinkProductVerToGroupVer">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<%if(request.getParameter("answer(Object::ProductGroup::ProductGroupId)")!= null) {%>	
	<html:hidden property="answer(Object::ProductGroup::ProductGroupId)" value="<%=request.getParameter("answer(Object::ProductGroup::ProductGroupId)").toString()%>" />
	<html:hidden property="answer(GroupId)" value="<%=request.getParameter("answer(Object::ProductGroup::ProductGroupId)").toString()%>" />
<%
}
%>
<%if(request.getParameter("answer(Object::ProductGroup::GroupVerId)")!= null) {%>
	<html:hidden property="answer(Object::ProductGroup::GroupVerId)" value="<%=request.getParameter("answer(Object::ProductGroup::GroupVerId)").toString()%>" />
	<html:hidden property="answer(GroupVerId)" value="<%=request.getParameter("answer(Object::ProductGroup::GroupVerId)").toString()%>" />
	
<%
}
%>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="MH">
LINK PRODUCT VERSIONS TO GROUP
</td></tr>
<tr><td class="TextMatter">
Use this page to link product versions to group
<br>
</td></tr>
<tr><td><hr size="1" noshade ></td></tr>

<tr><td>&nbsp;</td></tr>

<tr>

<td class="FormLabels" align="left">Select product version(s) to be linked to the group</td></tr>

<tr align="right" >
 
</tr>
 
<tr>

<td>
<table WIDTH="550px" ALIGN="center" cellspacing=0 cellpadding="2" border="0">

	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>
			<td class="FormLabels" align="left">Product Versions</td>
			<td class="FormLabels" align="left">&nbsp;</td>		
			<td class="FormLabels" align="left">Selected Product Versions</td>
			
</tr>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<tr>
		<td width="15%"><dmshtml:get_available_group_ver_products nameInSession="arrProducts" ownerId="<%=Long.parseLong(""+ownerId)%>"
		groupId="<%=Long.parseLong(request.getParameter("answer(Object::ProductGroup::ProductGroupId)").toString())%>" 
		 groupVerId="<%=Long.parseLong(request.getParameter("answer(Object::ProductGroup::GroupVerId)").toString())%>" 
		dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
		<dmshtml:dms_select  property="answer(Object::Product::ProdVerId)" styleId="possible" multiple="true" size="7" >
			<logic:present name="arrProducts" scope="request">
           <logic:iterate id="products" name="arrProducts" scope="request" >
		    <bean:define id='productId' name="products"  property="productId" />
   		    <bean:define id='productVerId' name="products"  property="productVerId" />
   		   <bean:define id='productName' name="products"  property="MProductName" />
  		   <bean:define id='ProductVerNumber' name="products"  property="MProductVerNumber" />
   		    		    
		     <dmshtml:dms_option value ='<%=productVerId.toString()%>' >
		       <%=productName.toString()+ ProductVerNumber.toString()%>
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

<td width="30%"><dmshtml:get_group_ver_products nameInSession="arrProducts" ownerId="<%=Long.parseLong(""+ownerId)%>" 
groupVerId="<%=Long.parseLong(request.getParameter("answer(Object::ProductGroup::GroupVerId)").toString())%>" 
dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
		<dmshtml:dms_select  property="answer(Object::Product::ProductVerId)" styleId="chosen" multiple="true" size="7" >
			<logic:present name="arrProducts" scope="request">
           <logic:iterate id="products" name="arrProducts" scope="request" >
		    <bean:define id='productId' name="products"  property="productId" />
		    <bean:define id='productVerId' name="products"  property="productVerId" />
   		   <bean:define id='productName' name="products"  property="MProductName" />
  		   <bean:define id='ProductVerNumber' name="products"  property="MProductVerNumber" />
		    <dmshtml:dms_option value ='<%=productVerId.toString()%>' >
		       <%=productName.toString()+ ProductVerNumber.toString()%>
		    </dmshtml:dms_option>
	</logic:iterate>
		</logic:present>
	</dmshtml:dms_select>	
		</td>
</TR>
</table>
</td></tr>
<tr><td>&nbsp;</td> </tr>
<tr>
	<td align="left">
		<table border="0" width="10%" cellspacing="2" cellpadding="2" style="{border-width:1px; border-style:solid; border-color: #999999;}">
			<tr>
				<td colspan="2" height="2px"></td>
			</tr>
			<tr>
				<td class="sectionhead" nowrap>Pick this Version when opening Existing Quote</td>
				<td class="TextMatter">
					<input type="checkbox" name="answer(Object::Quote::syncQuote)" value="Yes" id="selAll" onclick="checkUncheckAll(this);"/>
				</td>
			</tr>
			<tr><td >&nbsp;</td></tr>
			
			<tr>
				<td class="sectionhead" nowrap>Select Check boxes below to Enable Product Browse on quotes in various status:</td>
			</tr>
			<tr>
				<td class="TextMatter" nowrap>
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="In Progress" name="AddProductGroup" disabled="true"/>&nbsp;&nbsp;In Progress&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Offered" name="AddProductGroup" disabled="true"/>&nbsp;&nbsp;Offered&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Submitted" name="AddProductGroup" disabled="true"/>&nbsp;&nbsp;Submitted&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Accepted" name="AddProductGroup" disabled="true"/>&nbsp;&nbsp;Accepted&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Sold" 
					name="AddProductGroup" disabled="true"/>&nbsp;&nbsp;Sold&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Lost" 
					name="AddProductGroup" disabled="true"/>&nbsp;&nbsp;Lost&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Rejected" name="AddProductGroup" disabled="true"/>&nbsp;&nbsp;Rejected
				</td>
			</tr>
			<tr><td >&nbsp;</td></tr>
			<tr>
				<td  class="sectionhead">Enable Product Browse on quotes with Quote Effective date greater than or equal this Date</td>
			</tr>
			<tr>
				<td class="TextMatter">&nbsp;
					<html:text  property ="answer(Month)"  size="2" maxlength="2" styleClass="txtbox" styleId="month" onkeyup="if(this.value.length==2) {day.focus()}" />&nbsp;
					<html:text  property ="answer(Date)"  size="2" maxlength="2" styleId="day" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].elements[6].focus()}" />&nbsp;
					<html:text  property ="answer(Year)"  size="4" maxlength="4" styleClass="txtbox" styleId="year"  />&nbsp;(MM/DD/YYYY)</td>
			
		</tr>
		<tr>
			<td >&nbsp;</td>
		</tr>
	</table>
</td>
</tr>


	<tr>
	<td><hr size="1" noshade width="95%"></td>
	</tr>
	<tr><td >&nbsp;</td></tr>
	<tr>
	<td align="center">
		<html:submit value="Save" styleClass="sbttn" onclick="return allSelect()"/>
		<html:submit value="Synchronize" tabindex="Click This Button To Synchronize the Quotes to this Group Version" styleClass="sbttn" styleId="Sync" onclick="synchronizeQuote()"/>
		</td>
	</tr>
</table>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(objectType)" value="productVerGroup" />
<html:hidden property="answer(Object::Quote::quoteDate)" value="" styleId="quoteDate"/>
<html:hidden property="productGroupVerName" value="<%=""+request.getParameter("answer(Object::ProductGroup::GroupVerName)")%>"/>
<html:hidden property="answer(Object::SyncProductGroup::ProductGroupName)" value="<%=""+request.getParameter("answer(Object::ProductGroup::GroupVerName)")%>" />
<html:hidden property="answer(Object::SyncProductGroup::ProductGroupVerNum)" value="<%=""+request.getParameter("answer(Object::ProductGroup::GroupVerNum)")%>" />
<html:hidden property="answer(Object::SyncProduct::ProductName)" value="<%=""+request.getParameter("answer(Object::ProductGroup::GroupVerName)")%>" />
<html:hidden property="answer(Object::SyncProductGroup::ProductId)" value="<%=""+request.getParameter("answer(ProductId)")%>" />
<html:hidden property="answer(Object::SyncProductGroup::ProductVerId)" value="<%=""+request.getParameter("answer(ProductVerId)")%>" />

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<SCRIPT LANGUAGE="JavaScript">
<!--
setDate();

//-->

</SCRIPT>
</html:form>


