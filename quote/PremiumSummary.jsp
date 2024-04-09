
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<bean:define id="subTotal" name="UWWorkSheet" property="answer(Object::Plan::SubTotalAllPremium)"/>
<bean:define id="CalculateBasePremium" name="UWWorkSheet" property="answer(Object::Plan::CalculateBasePremium)"/>
<bean:define id="localTotalBasePremium" name="UWWorkSheet" property="answer(Object::Plan::TotalBasePremium)" scope="request" />
<bean:define id="soldToTechnicalRatio" name="UWWorkSheet" property="answer(Object::Plan::TechnicalRatio)" scope="request" />
<bean:define id="soldToModifiedTechnicalRatio" name="UWWorkSheet" property="answer(Object::Plan::ModifiedTechnicalRatio)" scope="request" />
<bean:define id="isRegulatorySurchargeApplicable" name="UWWorkSheet" property="answer(Object::Plan::IsRegulatorySurchargeApplicable)"/> 
<%if(isRegulatorySurchargeApplicable.equals("")){isRegulatorySurchargeApplicable="N";} %>
<bean:define id="regulatorySurchargeFactor" name="UWWorkSheet" property="answer(Object::Plan::RegulatorySurchargeFactor)"/> 
<bean:define id="regulatorySurcharge" name="UWWorkSheet" property="answer(Object::Plan::RegulatorySurcharge)"/>
<bean:define id="BranchCode" name="UWWorkSheet" property="answer(Object::Company::Paper::BranchCode)"/>
<%boolean isEndorsement = false;
String soldToTechRatio= soldToTechnicalRatio+"";
String soldToModifiedTechRatio= soldToModifiedTechnicalRatio+"";
if(soldToTechRatio.equals("0.0") || soldToModifiedTechRatio.equals("0.0")){
	isEndorsement = true;
}
%>
<table>


			<tr>
					<td colspan="4">
						<table border="0" cellspacing="0" cellpadding="0" align="center"
							width="100%">
							<tr>
								<td class="sectionhead" align="center">Premium Summary</td>
							
							</tr>
							
						</table>
					</td>
				</tr>
				
				<tr>	
				<td width="50%" colspan="5">
					<table border="0" cellspacing="4" cellpadding="0" WIDTH="89%">		
							<tr>					
							<td class="SearchResult" align="left" width="40%">
								Technical Premium
							</td>
							<td class="SearchResult" align="right" >
							<%
							String AppendedTechnicalPremium = subTotal+"";
							if(AppendedTechnicalPremium.substring(AppendedTechnicalPremium.indexOf(".")).length()==2){%>
							<%="$"+AppendedTechnicalPremium+"0"%>
							<%} else {
							double technicalPremium=(new Double(subTotal+"")).doubleValue();
										com.dms.ejb.common.DMSDetail dmsDetailtechpremium = new com.dms.ejb.common.DMSDetail();
										technicalPremium = dmsDetailtechpremium.decimalFormat(technicalPremium, 2);%>					
							<%="$"+technicalPremium%>
							<%}%></td>
							
							<td class="SearchResult" align="left" width="20%">
								Sold To Technical Ratio
							</td>
							<td class="SearchResult" align="right" >
							<%
								double techRatio=0.0;
								double subtotalAllPremium = new Double(subTotal+"").doubleValue();
								if(subtotalAllPremium!=0){
										techRatio=(new Double(localTotalBasePremium+"")).doubleValue()/(new Double(subTotal+"")).doubleValue()*100;
								}
										com.dms.ejb.common.DMSDetail dmsDetailtechRatio = new com.dms.ejb.common.DMSDetail();%>					
									<html:text name="UWWorkSheet" property="answer(Object::Plan::TechnicalRatio)" value='<%=""+dmsDetailtechRatio.decimalFormat(techRatio, 2)%>' styleId="TechnicalRatio" size="14" maxlength="6" style="TEXT-ALIGN: right" readonly="true"/>
																				
							</td>
							<td>%</td>
						</tr>	
						<tr>							   
							<td class="SearchResult" align="left" width="20%">
								Modified Technical Premium
							</td>
							
							<td class="SearchResult" align="right" >
						<%
							String AppendedModifiedTechnicalPremium = CalculateBasePremium+"";
							if(AppendedModifiedTechnicalPremium.substring(AppendedModifiedTechnicalPremium.indexOf(".")).length()==2){%>
							<%="$"+AppendedModifiedTechnicalPremium+"0"%>
							<%} else {
							double modifiedTechnicalPremium=(new Double(CalculateBasePremium+"")).doubleValue();
							com.dms.ejb.common.DMSDetail dmsDetailmodifiedtechpremium = new com.dms.ejb.common.DMSDetail();
							modifiedTechnicalPremium = dmsDetailmodifiedtechpremium.decimalFormat(modifiedTechnicalPremium, 2);
							%><%="$"+modifiedTechnicalPremium%>
							<%}%></td>
							
							<td class="SearchResult" align="left" width="40%">
								Sold To Modified Technical Ratio
							</td>
							<td>
							<%
								double modifiedtechRatio=0.0;
								double calculateBasePremiumValue = new Double(CalculateBasePremium+"").doubleValue();
								if(calculateBasePremiumValue!=0){
										modifiedtechRatio=(new Double(localTotalBasePremium+"")).doubleValue()/(new Double(CalculateBasePremium+"")).doubleValue()*100;
								}
										com.dms.ejb.common.DMSDetail dmsDetailmodifiedtechRatio = new com.dms.ejb.common.DMSDetail();%>					
									<html:text name="UWWorkSheet" property="answer(Object::Plan::ModifiedTechnicalRatio)" value='<%=""+dmsDetailmodifiedtechRatio.decimalFormat(modifiedtechRatio, 2)%>' styleId="ModifiedTechnicalRatio" size="14" maxlength="6" style="TEXT-ALIGN: right" readonly="true"/>
															
							</td>
							
							<td>%</td>
							
							
						</tr>	
						<tr>
						<td class="SearchResult" align="left" width="40%">
								
							</td>
							<td class="SearchResult" align="left" >
							
							</td>
							
							<td class="SearchResult" align="left" width="40%">
								Sold Premium
							</td>
							<td class="SearchResult" align="right" >
							<%String AppendedSoldPremium = localTotalBasePremium+"";
							if(AppendedSoldPremium.substring(AppendedSoldPremium.indexOf(".")).length()==2){
						//		if(isRegulatorySurchargeApplicable.equals("Y") && BranchCode.equals("PR")){
						//			AppendedSoldPremium = ""+(new Double(localTotalBasePremium+"").doubleValue() + new Double(regulatorySurcharge+"").doubleValue());
						//		}
							%>
							<%="$"+AppendedSoldPremium+"0"%>
							<%} else {
							double SoldPremium=(new Double(localTotalBasePremium+"")).doubleValue();
						//	if(isRegulatorySurchargeApplicable.equals("Y") && BranchCode.equals("PR")){
						//		SoldPremium = (new Double(localTotalBasePremium+"").doubleValue() + new Double(regulatorySurcharge+"").doubleValue());
						//	}
							com.dms.ejb.common.DMSDetail dmsDetailSoldPremium = new com.dms.ejb.common.DMSDetail();
							SoldPremium = dmsDetailSoldPremium.decimalFormat(SoldPremium, 2);%>					
							<%="$"+SoldPremium%>
							<%}%>
						</td>
						</tr>	
						</table>
						</td>
						</tr>			
			

						</table>

