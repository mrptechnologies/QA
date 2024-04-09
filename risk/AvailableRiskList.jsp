<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<bean:define id="ownerID" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<table width="85%" border="0" align="right">
<tr><td>&nbsp;</td></tr>
	<tr>
<dmshtml:GetParameterByOwnerId nameInSession="RiskNameLabel" ownerId="<%=ownerID.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="RISK_NAME_LABEL" />

			<%
			  String riskNameLable =(String) request.getAttribute("RiskNameLabel");
			  String tempRiskNameLable=riskNameLable;
			  String selectRiskLabel="";
	     		String riskNoLable ="";
				if (riskNameLable.length() <= 0 || riskNameLable == null){
					riskNameLable = "Risk Name";
					riskNoLable = "Risk #";	
					selectRiskLabel="Select Risks";
				  }else {
					  riskNameLable=riskNameLable+" Name";
					  riskNoLable=tempRiskNameLable+" #";
					  selectRiskLabel="Select "+tempRiskNameLable+"s";
			  }
			
			%>
			

		<logic:present name="availableRiskList" scope="request">		
		<td width="32%" align="left" class="FormLabels"><%=selectRiskLabel %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- <input type="button" value='<%="Select All "+tempRiskNameLable %>' class="sbttn" onclick="selectAllRisk()"> -->
			</td>		
									
	<tr>					
			<td>
				<bean:define id="availableRiskList" name="availableRiskList" type="java.util.ArrayList"/>	
					<table width="100%" border="0" align="center">	
						<tr>
						<td style="FONT-SIZE: 12px;FONT-WEIGHT:bolder;" class="sectionhead1" width="15%" >Location #</td>
						<td style="FONT-SIZE: 12px;FONT-WEIGHT:bolder;" class="sectionhead1" width="20%">Location Name</td>
						<td style="FONT-SIZE: 12px;FONT-WEIGHT:bolder;" class="sectionhead1"width="10%" >Type</td>
						<td style="FONT-SIZE: 12px;FONT-WEIGHT:bolder;" class="sectionhead1" width="15%"><%=riskNoLable%></td>
						<td style="FONT-SIZE: 12px;FONT-WEIGHT:bolder;" class="sectionhead1"width="15%" ><%=riskNameLable%></td>
						<td style="FONT-SIZE: 12px;FONT-WEIGHT:bolder;" class="sectionhead1"width="100%" >Include</td>
						</tr>
						
	<%	
							for(int riskListcount=0;riskListcount<availableRiskList.size();riskListcount++) {	
								
						      			com.dms.ejb.data.QuestionHashMap riskMap=(com.dms.ejb.data.QuestionHashMap)availableRiskList.get(riskListcount);						      
						      %>  
						      <tr>
						       <td style="FONT-WEIGHT:normal;" class="sectionhead1"><%=riskMap.getString("Object::Risk::LocationNumber")%></td>
							   <td style="FONT-WEIGHT:normal;" class="sectionhead1"><%=riskMap.getEncodedString("Object::Risk:LocationName")%></td>
							   <td style="FONT-WEIGHT:normal;" class="sectionhead1" ><%=riskMap.getString("Object::Risk::RiskType")%></td>
							   <td style="FONT-WEIGHT:normal;" class="sectionhead1" ><%=riskMap.getString("Object::Risk:RiskNum")%></td>
							   <td style="FONT-WEIGHT:normal;" class="sectionhead1"><%=riskMap.getEncodedString("Object::Risk::RiskName")%></td>
							   <td><input  type="checkbox" name="answer(Object::Quote::SelectedRiskList)"  value ='<%=riskMap.getString("Object::Risk::RiskId")%>' id="SelectedRiskID" checked="checked"><html:hidden property="answer(Object::Quote::SelecteRiskList)" styleId='<%=riskMap.getString("Object::Risk::RiskType")+"_"+riskMap.getString("Object::Risk::RiskId")%>' value='<%=riskMap.getString("Object::Risk::RiskType")%>' /></td>							   						
							  <html:hidden property="answer(Object::Plan::StateCode)" styleId="locationState" value='<%=riskMap.getString("Object::Plan::StateCode")%>' />
							  </tr>
							  
							<%
							} 
							%>
							</table>
			</td>
			</tr>
		</logic:present>
		
</table>						

	
