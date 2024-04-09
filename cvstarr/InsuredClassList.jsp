<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%response.setHeader("Cache-Control", "no-store");%>
<%System.out.println("Entered"); %>
		 <table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" class="todotab_yellowbox">
    	    <tr>   <td colspan="2">&nbsp;</td></tr>
    	       <logic:present name='classListArray'>
        	<logic:iterate id="classListArray" name="classListArray" >
	       <tr>
			<td  width="19%" align="right" class="field">Class Name:&nbsp;&nbsp;&nbsp;</td>
			<td  width="10%" align="right" class="field"></td>
			<td width="71%" align="left">
			<bean:write name="classListArray" property="Object::Risk::RiskName" />
			</td>
		   </tr> 
		   <tr>
			<td  width="19%" align="right" class="field">Class Description:&nbsp;&nbsp;&nbsp;</td>
			<td  width="10%" align="right" class="field"></td>
			<td width="71%" align="left">
			<bean:write name="classListArray" property="Object::Risk::ClassDescription" />
			</td>
		   </tr> 
		   <tr>   <td colspan="2">&nbsp;</td></tr>
		   <tr>   <td colspan="2">&nbsp;</td></tr>
		   </logic:iterate>
		   </logic:present>
		   </table>


		
		
		
		