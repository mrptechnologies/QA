
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="../FindAttribute.do?answer(ownerId)=<%=""+ownerId %>&answer(Object::Attribute::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
</SCRIPT>
<html:form action="/FindAttribute">

			<TABLE WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3">
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td class="NewSectionHead" colspan="4" align="center">SEARCH ATTRIBUTE RESULT</td>
							</tr>
							<tr><td  class="FormLabels" align="left" colspan="4"> &nbsp;</td></tr>
							<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
						</table>
					</td>
				</tr>
			</TABLE>

<logic:present name="searchresultnewDisplay" scope="request">
<logic:present name="attrSize" scope="request">
<bean:define id="attSize" name='attrSize' scope='request'/>
	<table>
	<tr><td><html:hidden property="answer(Object::Attribute::TotalRec)" value="<%=attSize.toString()%>"/></td></tr>	
	<tr><td class="FormLabels">Number of Attributes found : <%=""+attSize%></td></tr>
	<tr><td>&nbsp;</td></tr>
	</table>
</logic:present>



<table width="100%" align="center" border="0" >
	<bean:define id="pagenum" name='pagenum' scope='request'/>
	<bean:define id="totpagenum" name='totpagenum' scope='request'/>		
		
		<tr>
						<td align="Left" class="links" colspan="3">
							<logic:present name="prevAttr"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)-1)%>)" >
								<bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
						
						<td align="right" class="links" colspan="3">
							<logic:present name="moreAttr"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)+1)%>)" >Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>

			<tr>					
				<td class="sectionhead" width="5%">SrNo.</td>
				<td class="sectionhead" width="35%">AttributeName</td>
				<td class="sectionhead" width="20%">AttributeDesc</td>
				
			</tr>

<% int i=0;%>

					<%
						String pageNum = (String)request.getAttribute("pagenum");
						try{
						    i=Integer.parseInt(pageNum);
								i = i * 20;
						  }catch(NumberFormatException nfe)
						  {
							  i=0;
						  }
						
					%>
	
<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="request" >

	
		
			<tr>
			<td class="SearchResult">
			<% i++; %>
							 <%=i%>
			</td>
			<td class="SearchResult">
			<a href="../GetAttributeAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(AttributeId)=<bean:write name="searchresultnewDisplay" property="answer(Object::ApplicationAttr::AttributeId)" />"><bean:write name="searchresultnewDisplay" property="answer(Object::ApplicationAttr::AttributeName)" /></a>			
			</td>
			<td class="SearchResult"><bean:write name="searchresultnewDisplay" property="answer(Object::ApplicationAttr::AttributeDesc)" />
			</td>
		</tr>
		
</logic:iterate>	
<tr><td colspan="2" >&nbsp;</td></tr>
	
					<tr>
						<td align="left" class="links" colspan="3">
							<logic:present name="prevAttr"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)-1)%>)" >
								<bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
				
						<td align="right" class="links" colspan="3">
							<logic:present name="moreAttr"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)+1)%>)" >Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>
</table>		


</logic:present>
<logic:notPresent name="searchresultnewDisplay" scope="request">
	<table>
	<tr><td class="FormLabels">No records found</td></tr>
	</table>
</logic:notPresent>
<html:hidden  property="answer(ApplicationAttr::Like::AttributeName)"/>
<html:hidden  property ="answer(ApplicationAttr::Equals::AttrColName)"/>
<html:hidden  property ="answer(ApplicationAttr::Equals::Active)"/>
<html:hidden styleId="orderby" property="answer(Attribute::orderBy)" value="attr.ATTRIBUTE_NAME "/>
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</html:form>