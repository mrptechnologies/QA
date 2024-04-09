<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<html:html>

<head>
<title><%=session.getAttribute("PageTitle")%> - Quote Request</title>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css">

<body leftmargin="0" rightmargin="0" topmargin="0">
<html:form action="/AddProduct" >

<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
	
	<tr><td class="MH">PRODUCT DETAILS</td></tr>

	
	<tr><td class="TextMatter"><bean:message key="ProductsSummary.Description"/>
		</td><td class="WhiteMsg">This text has heen added to get the alignment right justified</td>
		</tr>
		<tr>
		<td colspan="2"><hr size="1" noshade></td>
	</tr>
	<logic:present name="message" scope="request">
	<tr>
		<td class="Error">
		<%=request.getAttribute("message")%>
		</td>
	</tr>
	</logic:present>
	<logic:present name="msgInfo" scope="request">
	<tr>
		<td class="Error">
		<%=request.getAttribute("msgInfo")%>
		</td>
	</tr>
	</logic:present>
	<TR>
	<TD COLSPAN="2" class="Error">
	<html:errors/>
	</TD>
	</TR>
	<tr>
		<td>&nbsp;</td>
	</tr>

<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">

<tr><td class="links">
<logic:present name ='arrObjectDetail' scope ='session'>
<logic:iterate id="arrObjectDetail" name="arrObjectDetail" scope="session" >
<a href="./ListIndustryFactors.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&objectId=1&objectType=PRODUCT"  title="Click to go to the Industry Factors Page"" /><bean:message key="Products.SIC"/></a>
&nbsp;&nbsp;|
<a href="./ListBaseRates.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&objectId=1&objectType=PRODUCT"  title="Click to go to the Base Rates Page"" /><bean:message key="Products.BaseRate"/>
</a>&nbsp;&nbsp;|
<a href="./ListTrendFactors.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&objectId=1&objectType=PRODUCT"  title="Click to go to the Trend Factors Page"" /><bean:message key="Products.TrendFactor"/>
</a>&nbsp;&nbsp;|<a href="./ListAgeSexFactors.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&objectId=1&objectType=PRODUCT"  title="Click to go to the Age-Sex Factors Page"" />Age-Sex Factors
</a>&nbsp;&nbsp;|
</logic:iterate>
</logic:present>
	</td></tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	</table>
	
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="4">
<tr>
		<td colspan="4" align="center" class="sectionhead">PRODUCT DETAILS</td>
	
	</tr>

	<tr>
		<td>&nbsp;</td>
	</tr>
	
	<tr>
		<td width="20%" class="FormLabels" align="left"><bean:message key="Products.Productname"/>*</td>

		<td class="FormLabels" align="left">

		<html:text property="answer(Object::Product::ProductNum)" size="50" maxlength="100" name="AddProduct" styleClass="txtbox"/>
	
		</td>
	</tr>

	
	<tr>
		<td class="FormLabels" align="left"><bean:message key="Products.Productfamily" />*</td>
		<td class="FormLabels" align="left">
		<html:text property="answer(Object::ProductAdditional::ProductFamily)" size="50" maxlength="100" name="AddProduct" styleClass="txtbox"/>
		</td>
	</tr>
	
	<tr>
		<td class="FormLabels" align="left"><bean:message key="Products.Productstart" /></td>
		<td class="FormLabels" align="left">
		<html:text property="answer(Object::ProductAdditional::StartDate)" size="50" maxlength="100" name="AddProduct" styleClass="txtbox"/>
		</td>
	</tr>
	
	<tr>
		<td class="FormLabels" align="left"><bean:message key="Products.Productend" /></td>
		<td class="FormLabels" align="left">
		<html:text property="answer(Object::ProductAdditional::EndDate)" size="50" maxlength="100" name="AddProduct" styleClass="txtbox"/>
		</td>
	</tr>

	<tr>
		<td class="FormLabels" align="left"><bean:message key="Products.Productcoverage" /></td>
		<td class="FormLabels" align="left">
		<html:text property="answer(Object::ProductAdditional::ProductCoverage)" size="50" maxlength="100" name="AddProduct" styleClass="txtbox"/>
		</td>
	</tr>

	<tr><td >&nbsp;</td></tr>


	<tr><td colspan="2" ALIGN="center">
		<html:button value="Save" property="answer(submit)" styleClass="sbttn" />
		&nbsp;&nbsp;&nbsp;
		<html:reset value="Cancel" styleClass="sbttn"/>
		</td>
	</tr>
	<tr><td >&nbsp;</td></tr>
</table>
<html:hidden property="answer(Object::UserDetail::roleName)" value=""/>
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=""+ownerId %>" /> 
<html:hidden property="ownerId" value="<%=""+ownerId %>" /> 

<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::Product::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Product::User)" value="<%=userName.toString()%>" />
<html:hidden property="answer(Object::Product::ObjectType)" value="PRODUCT"   />
<html:hidden property="answer(Object::Product::ProductType)" value="PPO" />
<html:hidden property="answer(Object::Product::PrimaryGroupId)" value="1" />



<html:hidden name="DataForm" property="answer(form::ForwordControl)" value="success"/>
    <html:hidden property="formName" value="form::::AddProduct" />

    <html:hidden property="answer(form::ForwordControl)" value="success"/>
    <html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
 </html:form>
</body>
</html:html>

