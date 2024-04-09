<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>


<table width="75%" border="0" align="center">
	<tr>

		<logic:present name="riskList" scope="request">							
			<td width="32%" align="left" class="FormLabels">Select Risk&nbsp;</td>
			<td class="sectionhead1">
				<bean:define id="riskList" name="riskList" type="java.util.ArrayList"/>										
						<%
							for(int i=0;i<riskList.size();i++) {
								com.dms.ejb.data.QuestionHashMap riskMap=(com.dms.ejb.data.QuestionHashMap)riskList.get(i);	
						%>
								<input type="checkbox" name="answer(Object::Quote::SelectedRiskList)"  value ='<%=riskMap.getString("Object::Risk::RiskId")%>'>							
								<%=riskMap.getString("Object::Risk::RiskName")%><br>
							<%}%>
			</td>
		</logic:present>

	</tr>
</table>								
