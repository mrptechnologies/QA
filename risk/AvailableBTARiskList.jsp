<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<bean:define id="ownerID" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<style type="text/css">
  .tableHeader{	border:1px solid #4E4E50;}
  .tableData{line-height:17px;text-align:left;margin:0;padding:0;font-weight:bold;}
  .yui-dt th {border-color:-moz-use-text-color #CBCBCB -moz-use-text-color -moz-use-text-color;border-style:none solid none none;border-width:medium 1px medium medium;margin:0;padding:0;color:#000000;font-weight:normal;text-decoration:none;vertical-align:bottom;background:#D8D8DA;border-collapse:separate;border-spacing:0;font-family:arial;font-size:inherit;}
  .yui-dt-table {border:1px solid #7F7F7F;border-collapse:separate;border-spacing:0;font-family:arial;font-size:inherit;margin:0;padding:0;}

</style>

<% String classDescription = "" ; %>
<table width="80%" border="0" align="center">
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
			<tr><td width="85%" align="left" class="FormLabels"><%="Select Class" %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<!-- <input type="button" value='<%="Select All "+tempRiskNameLable %>' class="sbttn" onclick="selectAllRisk()"> -->
			</td></tr>
				
			<tr>					
				<td>
						<bean:define id="availableRiskList" name="availableRiskList" type="java.util.ArrayList"/>	
						<table  class="yui-dt-table" cellspacing="0" cellpadding="0" width="100%">						
							<tr class="yui-dt">
	        					<th  height="30" VALIGN='top' width="10%"><div class="yui-dt-liner"><p class="tableData">Class No.</p></div></th>
	        					<th  height="30" VALIGN='top' width="20%"><div class="yui-dt-liner"><p class="tableData">Class Name</p></div></th>    		
	        					<th  height="30" VALIGN='top' width="60%"><div class="yui-dt-liner"><p class="tableData">Class Description</p></div></th>   
	        					<th  height="30" VALIGN='top' width="10%"><div class="yui-dt-liner"><p class="tableData">Include</p></div></th>   
	        				</tr>        							
							<%	
								for(int riskListcount=0;riskListcount<availableRiskList.size();riskListcount++) {									
						   			com.dms.ejb.data.QuestionHashMap riskMap=(com.dms.ejb.data.QuestionHashMap)availableRiskList.get(riskListcount);						      
						   			classDescription = riskMap.getString("Object::Risk::ClassDescription");
						   			classDescription = classDescription.replaceAll("\n","<BR>");
						     %>  
						     <tr class="yui-dt-even">
							       <td><div class="yui-dt-liner"><p class="tableData"><%=riskListcount+1%></p></div></td>
								   <td><div class="yui-dt-liner"><p class="tableData"><%=riskMap.getString("Object::Risk::RiskName")%></p></div></td>
								   <td><div class="yui-dt-liner"><p class="tableData"><%=classDescription%></p></div></td>
								   <td><div class="yui-dt-liner"><p class="tableData"><input  type="checkbox" name="answer(Object::Quote::SelectedRiskList)"  value ='<%=riskMap.getString("Object::Risk::RiskId")%>' id="SelectedRiskID" checked="checked"></p></div>								   
							  </tr>							  
							  <tr>		
							  	<td><html:hidden property="answer(Object::Quote::SelecteRiskList)" styleId='<%=riskMap.getString("Object::Risk::RiskType")+"_"+riskMap.getString("Object::Risk::RiskId")%>' value='<%=riskMap.getString("Object::Risk::RiskType")%>' /></td>							   						</td>
							  	<td><html:hidden property="answer(Object::Plan::StateCode)" styleId="locationState" value='<%=riskMap.getString("Object::Plan::StateCode")%>' /></td>
							  </tr>
							  <%	} %>
						</table>
				</td>
			</tr>
			<TR><td colspan="2" align="Center">&nbsp;&nbsp;&nbsp;</td></TR>
			<TR><td colspan="2" align="Center">&nbsp;&nbsp;&nbsp;	
				<div id="submitButton">
					<input type="submit" value="Next" class="covsmallbutton" id="CreateQuoteSubmit" >&nbsp;
				</div>
			</td></TR>
		</logic:present>
	</tr>
</table>			
	

	
	
