<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:parameter id="parentRiskId" name="parentRiskId" />
<bean:parameter id="agencyId" name="agencyId" />

<script type="text/javascript" src="../Scripts/JScripts/HeaderDetail.js">
</script>
<div id="riskheadercontainer">
	<div id="riskheadernav">					
			<table align="left" border="0" width="1220px">
				<tr>
					<td align="left" width="45%">						
							<a rel="riskheader" onclick="showHideHeader();"><img src="/Images/plus.gif" name="riskHeaderImg" height="12" width="12" align="left"></img>&nbsp;<span id="Risk:TxtChange">Click to show the detail</span></a>						
					</td>						
					<td align="left"><b class="title">RISKS</b></td>												
				</tr>
			</table>	
	</div>

	
<div id="riskheader_inner">
<div id="riskheader" class="innercontent3">
<table width="90%" align="Left" border="0" bgcolor="#C6DEEA">
	<tr>
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
		<dmshtml:Get_Risk_HeaderDetail nameInSession="parentRiskDetail" riskId="<%=""+parentRiskId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />

		<logic:present name="parentRiskDetail" scope="request">
		
			<td valign="top">
				<table width="840px" align="Left" border="0" >	
						<bean:define id="parentRiskDetailObject" name="parentRiskDetail" scope="request" type="com.dms.ejb.risk.resproperty.ResPropertyDetail" />
							<tr>
								<td  class="FormLabels" align="left"  colspan="1" width="30%">
								<bean:message key="RiskHeader.RiskName"/>
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="215px">
									<a href="../EditCLRisk.do?answer(TabPanelName)=Insured_Panel&answer(Object::Risk::ComProperty::CustomerId)=<bean:write name="parentRiskDetail" scope="request" property="customerId"/>&answer(Object::Agency::AgencyId)=<%=agencyId.toString()%>&answer(objectId)=0&answer(objectVerId)=0&answer(objectName)=&answer(applicationType)=RISK&answer(applicationSubType)=&Navigation=&tabNo=0&answer(teritory)=&answer(territoryName)=&answer(zone)=&answer(showOnetTab)=Y&answer(state)=&answer(Object::Risk::ComProperty::ComPropertyId)=<%= parentRiskId.toString()%>&answer(SelectedRiskType)=<bean:write name="parentRiskDetail" scope="request" property="riskType"/>"><b><bean:write name="parentRiskDetail" scope="request" property="riskName"/></b></a>	
								</td>
							</tr>
							
							<tr>
								<td  class="FormLabels" align="left"  colspan="1" width="160px">
									<bean:message key="RiskHeader.RiskType"/>
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="215px"><b>
									<b><bean:write name="parentRiskDetail" scope="request" property="riskType"/></b>
								</td>
							</tr>	
							<tr>
								<td  class="FormLabels" align="left"  colspan="1" width="160px">
									Policy Number
								</td>
								<td align="left" class="sectionhead1"  colspan="1" width="215px"><b>
									<b>
										<bean:write name="parentRiskDetail" scope="request" property="policyNumber"/>
									</b>
								</td>
							</tr>					
	
				</table>
			</td>
			
			
			<td valign="top">
	
				<table width="420px" align="Left" border="0">		
	
					<tr>
						<td  class="FormLabels" align="left"  colspan="1" width="160px">
							Effective Date
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="215px">
							<b><bean:write name="parentRiskDetail" scope="request" property="effectiveDate"/></b>
						</td>
					</tr>
							
					<tr>
						<td  class="FormLabels" align="left"  colspan="1" width="160px">
							Expiration Date
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="215px"><b>
							<b><bean:write name="parentRiskDetail" scope="request" property="expirationDate"/></b>
						</td>
					</tr>	
					
					<tr>
						<td  class="FormLabels" align="left"  colspan="1" width="160px">
							Risk Number
						</td>
						<td align="left" class="sectionhead1"  colspan="1" width="215px"><b>
							<b><bean:write name="parentRiskDetail" scope="request" property="riskNumber"/></b>
						</td>
					</tr>					
					
	
				</table>
			</td>	
		</logic:present>	
	</tr>
</table>
</div>
</div>
</div>
<script type="text/javascript">
riskheadertabs.init("riskheadernav", 0);
</script>