
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<% String SubmissionFile=request.getParameter("fileContent");

%>

<table WIDTH="960px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr>
	<td height="20"></td></tr>
<tr>
	<td class="NewSectionHead" align="center" colspan ="10" >Response XML FILE</td></tr>

<tr>
<tr>
	<td align="left">	
	    <html:textarea property="SubmissionFile" styleId="fileContainer" styleClass="txtbox" rows="15" cols="30" value=""  readonly="true"/>
	</td>

</tr>


</table>
<script type="text/javascript">
<!--
document.getElementById("fileContainer").value="<%=SubmissionFile%>";

//-->
</script>
