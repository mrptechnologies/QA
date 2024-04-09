
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td >&nbsp;</td></tr>

	<tr>
	
		<td valign="top" align="center">
		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr><td colspan="2" >&nbsp;</td></tr>
	<logic:present name="msgInfo" scope="request">
	<tr>
		<td class="Error">
		<%=request.getAttribute("msgInfo")%>
		</td>
	</tr>
</logic:present>
	<tr><td width="100%" class="TextMatter" valign="top">
	
	<!-- bean:message key="Home.welcome"/ --><br><br><!--  bean:message key="Home.welcome1"/ -->
	<jsp:include page="../HomePanel/Home_Panel_Container.jsp" />
	</td>
	<!-- <td align="right"><img SRC="../Images/ARImage.jpg" ></td> -->
	</tr>
</table>

		</td>
	</tr>
	

</table>



