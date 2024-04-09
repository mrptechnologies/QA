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


<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:form action="/ConfirmQuoteProductSync">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<html:hidden property="answer(Object::ProductGroup::ProductName)" value='<%=request.getParameter("answer(Object::SyncProduct::ProductName)")%>'/>

<bean:define id="GroupId" name='SyncProduct' property='answer(Object::ProductGroup::ProductGroupId)'/>
<html:hidden property="answer(Object::ProductGroup::ProductGroupId)" value="<%=GroupId.toString()%>" />
<bean:define id="GroupVerId" name='SyncProduct' property='answer(Object::ProductGroup::GroupVerId)'/>

<html:hidden property="answer(Object::ProductGroup::GroupVerId)" value="<%=GroupVerId.toString()%>" />
<bean:define id="ProductVerId" name='SyncProduct' property='answer(Object::Product::ProductVerId)'/>

<html:hidden property="answer(Object::ProductGroup::ProductVerId)" value="<%=ProductVerId.toString()%>" />
<%long totalCount=0; %>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>
<tr><td class="MH">
PRODUCT QUOTE SYNCHRONIZATION
</td></tr>
<tr><td class="TextMatter">
Use this page to Synchronize product To Quotes.
<br>
</td></tr>
<tr><td><hr size="1" noshade ></td></tr>

<tr><td>&nbsp;</td></tr>

<tr>

<td class="FormLabels" align="left"></td></tr>
<tr><td align="left">
<tr><td>
<table WIDTH="550px" ALIGN="center" cellspacing=0 cellpadding="2" border="0">

	<tr><td colspan="2">&nbsp;</td></tr>
	<tr>

			<td class="FormLabels" align="left"><%="Group Name:"+request.getParameter("answer(Object::SyncProduct::ProductName)")%></td>
			<td class="FormLabels" align="left"><%="Group Id:"+GroupId.toString()%>&nbsp;</td>		
			<td class="FormLabels" align="left"><%="GroupVerId:"+GroupVerId.toString()%></td>
			<td class="FormLabels" align="left"><%="ProductVerId:"+ProductVerId.toString()%></td>
			
</tr>
<tr><td colspan="2">&nbsp;</td></tr>
<logic:present name ='QuoteList'>
		<tr><td  class="sectionhead">Quote Status</td><td  class="sectionhead">Number Of Quotes</td></tr>
		<tr><td colspan="2">&nbsp;</td></tr>
	<logic:iterate id="statusList"  name='QuoteList' type="com.dms.ejb.data.QuestionHashMap">
						<tr>
						<%
						if(statusList.containsKey("In Progress")){
						%>
						<td class="FormLabels" >In Progress</td><td><%=":"+Long.parseLong(""+statusList.getString("In Progress"))%></td>
						<%}%>
						</tr>
						<tr>
						<%  
						if(statusList.containsKey("Submitted")){%>
						<td class="FormLabels" >Submitted</td><td><%=":"+Long.parseLong(""+statusList.getString("Submitted"))%></td>
						<%}%>
						</tr>
						<tr>
						<%  
						if(statusList.containsKey("Offered")){%>
						<td class="FormLabels" >Offered</td><td><%=":"+Long.parseLong(""+statusList.getString("Offered"))%></td>
						<%}%>
						</tr>
						<tr>
						<%  
						if(statusList.containsKey("Accepted")){%>
						<td class="FormLabels" >Accepted</td><td><%=":"+Long.parseLong(""+statusList.getString("Accepted"))%></td>
						<%}%>
						</tr>
						<tr>
						<%  
						if(statusList.containsKey("Sold")){%>
						<td class="FormLabels" >Sold</td><td><%=":"+Long.parseLong(""+statusList.getString("Sold"))%></td>
						<%}%>
						</tr>
						<tr>
						<%  
						if(statusList.containsKey("Lost")){%>
						<td class="FormLabels" >Lost</td><td><%=":"+Long.parseLong(""+statusList.getString("Lost"))%></td>
						<%}%>
						</tr>
						<tr>
						<%  
						if(statusList.containsKey("Rejected")){%>
						<td class="FormLabels" >Rejected</td><td><%=":"+Long.parseLong(""+statusList.getString("Rejected"))%></td>
						<%}%>
						</tr>
						<tr>
						<%  
						if(statusList.containsKey("Bound")){%>
						<td class="FormLabels" >Bound</td><td><%=":"+Long.parseLong(""+statusList.getString("Bound"))%></td>
						<%}%>
						</tr>
						<%  
						if(statusList.containsKey("Issued")){%>
						<td class="FormLabels" >Issued</td><td><%=":"+Long.parseLong(""+statusList.getString("Issued"))%></td>
						<%}%>
						</tr>
						
						<%totalCount=Long.parseLong(""+statusList.getString("TotalCount")); %>

	</logic:iterate>
</logic:present>
<logic:notPresent name ='QuoteList'>	
					<tr> 
						<td class="Error" colspan="3">
							No Quotes To Synchronize.
 						</td> 						
	 				</tr>	
</logic:notPresent>


</table>
</td></tr>
<tr><td>&nbsp;</td> </tr>
			<tr>
				<td class="sectionhead" nowrap>Select Check boxes below to Enable Quote Product Synchronization on quotes in various status:</td>
			</tr>
			<tr>
				<td class="TextMatter" nowrap>
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="In Progress" name="SyncProduct" styleId="InProgress"/>&nbsp;&nbsp;In Progress&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Offered" name="SyncProduct" styleId="Offered" />&nbsp;&nbsp;Offered&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Submitted" name="SyncProduct" styleId="Submitted"/>&nbsp;&nbsp;Submitted&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Accepted" name="SyncProduct" styleId="Accepted"/>&nbsp;&nbsp;Accepted&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Sold" 
					name="SyncProduct" styleId="Sold" />&nbsp;&nbsp;Sold&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Lost" 
					name="SyncProduct" styleId="Lost" />&nbsp;&nbsp;Lost&nbsp;&nbsp;
					<dmshtml:dms_checkbox property = "answer(Object::Quote::QuoteStatus)" value="Rejected" name="SyncProduct" styleId="Rejected" />&nbsp;&nbsp;Rejected
				</td>
			</tr>
			<tr><td >&nbsp;</td></tr>
			<tr><td >&nbsp;</td></tr>
			<tr><td >&nbsp;</td></tr>
			<tr>
				<td  class="sectionhead">Quote Product Synchronization on quotes with Quote Effective date greater than or equal this Date</td>
			</tr>
			<tr>
				<td class="TextMatter">&nbsp;
					<html:text  property ="answer(Month)"  size="2" value="" maxlength="2" styleClass="txtbox" styleId="month" onkeyup="if(this.value.length==2) {day.focus()}" />&nbsp;
					<html:text  property ="answer(Date)"  size="2" value="" maxlength="2" styleId="day" styleClass="txtbox"  onkeyup="if(this.value.length==2) {document.forms[0].elements[6].focus()}" />&nbsp;
					<html:text  property ="answer(Year)"  size="4" value="" maxlength="4" styleClass="txtbox" styleId="year"  />&nbsp;(MM/DD/YYYY)</td>
			
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
	<tr><td align="center">
		<html:submit value="Synchronize" styleClass="sbttn" onclick="return syncSubmit()"/>
			</td></tr>
</table>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(objectType)" value="productVerGroup" />
<html:hidden property="answer(Object::Quote::quoteDate)" value="" styleId="quoteDate"/>
<html:hidden property="answer(Object::SyncProduct::ProductName)" value="<%=""+request.getParameter("answer(Object::SyncProduct::ProductName)")%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<SCRIPT LANGUAGE="JavaScript">
<!--
function syncSubmit(){
if(window.confirm("Do you want to Synchronize?")){

var formElement=document.forms[0];
var QuoteMM=formElement.month.value;
var QuoteDD=formElement.day.value;
var QuoteYY=formElement.year.value;
if((QuoteMM!="")&&(QuoteDD!="")&&(QuoteYY!="")) {
formElement.quoteDate.value=QuoteYY+"-"+QuoteMM+"-"+QuoteDD;
if(!isDate(formElement.quoteDate.value)){
alert("Invalid Effective Date");
return fasle;
}
}
return true;
}
return false;
}
	var formElement=document.forms[0];
	
	var now = new Date();
	var day=now.getDate();
	var month=now.getMonth() + 1;
	var year=now.getFullYear();
	var strMonth=month.toString();
	var strDay=day.toString();

	if (strMonth.length < 2)
		{
			month="0"+month;
		}
	

	if (strDay.length < 2)
		{
			day="0"+day;
		}

formElement.month.value=month;
formElement.day.value=day;
formElement.year.value=year;

//-->

</SCRIPT>
</html:form>


