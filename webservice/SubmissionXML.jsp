
<% String SubmissionFile=request.getParameter("fileContent");

%>
<%="FILE:"+SubmissionFile %>
<table WIDTH="960px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr>
	<td height="20"></td>	
	</tr>
<tr>
	<td class="NewSectionHead" align="center" colspan ="10" >Submission XML FILE</td></tr>

<tr>
<tr>
<!--
	<td align="left">	
	    <html:textarea property="SubmissionFile" styleId="fileContainer" styleClass="txtbox" rows="40" cols="40" value="" readonly="true"/>
	</td>
	
	
	

--></tr>


</table>
<script type="text/javascript">
<!--

document.getElementById("fileContainer").value="<%=SubmissionFile%>";

//-->
</script>
