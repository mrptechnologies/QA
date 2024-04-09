<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<tr>
	<td>

		<bean:parameter id="parentQuoteId" name="parentQuoteId" />
		<bean:parameter id="heading" name="heading" />		
		<table>
		<tr>
			<td align="left" colspan=2>
				<table width="1200px" align="left" border="0" >
					<tr>
						<td class="NewSectionHead" align="center"><%=""+heading%></td>
					</tr>
				</table>
			</td>
		</tr>
		</table>

	</td>
</tr>
<tr>

	<td>
			

		<table width="760px" align="Left" border="0"bgcolor="#C6DEEA">
			
			<tr>
				<td valign="top">
					<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >

				<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

					<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
					<logic:present name="parentQuoteDetail" scope="request">
						<bean:define id="parentQuoteDetailObject" name="parentQuoteDetail" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/> 
						
						<bean:define id="prodId" name="parentQuoteDetail" property="productId" scope="request"/>

						<tr>
							<td  class="FormLabels" align="left"  colspan="1" width="160px">
								<bean:message key="QuoteHeader.QuoteNumber"/>
							</td>
							<td align="left" class="sectionhead1"  colspan="1" width="215px"><b>
							
							<bean:write name="parentQuoteDetail" scope="request" property="quoteNumber"/>				
							</b>
							</td>
						</tr>


						<tr> 
							<td  class="FormLabels" align="left"  colspan="1">
								<bean:message key="QuoteHeader.QuoteType"/>
							</td>
							<td align="left" class="sectionhead1" ><b>
							<bean:define id="quoteType" name="parentQuoteDetail" property="quoteType" scope="request"/>
							<%=quoteType.toString()%>
							<html:hidden property="answer(Object::quoteType)" value="<%=""+quoteType%>" styleId="QuoteType"/> 
							</b>
							</td>
						</tr>


						<tr>
							<td  class="FormLabels" align="left" colspan="1" >
								<bean:message key="QuoteHeader.Status"/>
							</td>
							<td align="left" class="sectionhead1" >
							<b>
							<bean:write name="parentQuoteDetail" scope="request" property="quoteStatus"/>		
							</b>
							</td>
						</tr>	
<bean:define id="customerState" name="parentQuoteDetail" property="customerState"/>
	<dmshtml:dms_HasFeature_Available_InProduct productId='<%=Long.parseLong(""+prodId)%>' featureName="No_Composite" negated="false" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" state="<%=""+customerState%>" >	

						<tr>
							<td  class="FormLabels" align="left" colspan="1"  >
								<bean:message key="QuoteHeader.CompositeRate"/>
							</td>
							<td align="left" class="sectionhead1" >
							<b><bean:define id="compositeRate" name="parentQuoteDetail" property="compositeRate"/>
							<%=compositeRate%>
							</b>
							</td>

						</tr>
</dmshtml:dms_HasFeature_Available_InProduct>
						<tr>
							<td  class="FormLabels" align="left" colspan="1"  >
								<bean:message key="QuoteHeader.EffectiveDate"/>  
							</td>
							<td align="left" class="sectionhead1" >
							<b><bean:define id="quoteStartDate" name="parentQuoteDetail" property="quoteStartDate"/>
							<%=quoteStartDate.toString()%>
							</b>
							</td>
						</tr>


						<tr>
							<td  class="FormLabels" align="left"  colspan="1">
								<bean:message key="QuoteHeader.LastSavedDate"/>
							</td>
							<td align="left" class="sectionhead1" >
							<b>
							<bean:write name="parentQuoteDetail" scope="request" property="updatedDate"/>		
							</b>					
							</td>
						</tr>
<!-- -->				
				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SHOW_QUOTE_COMMISSION"}%>' connector='or' negated="true">
					<%
						double commissionPercent = parentQuoteDetailObject.getHealthInsQuoteCommissionDetail().getCommissionPercentage();
						double commissionAmt = parentQuoteDetailObject.getHealthInsQuoteCommissionDetail().getCommissionAmount();
					%>
						<tr>
							<td  class="FormLabels" align="left"  colspan="1">
								Commission Percentage
							</td>
							<td align="left" class="sectionhead1" >
							<b>
							<%=""+commissionPercent%>	
							</b>					
							</td>
						</tr>

						<tr>
							<td  class="FormLabels" align="left"  colspan="1">
								Commission Amount
							</td>
							<td align="left" class="sectionhead1" >
							<b>
							<dmshtml:CurrencyFormatTag format="<%=""+commissionAmt%>"/>
							</b>					
							</td>
						</tr>
				</dmshtml:dms_static_with_connector>
<!-- -->


						<tr>
							<td  class="FormLabels" align="left" colspan="1"  >
								<bean:message key="QuoteHeader.TotalMonthlyPremium"/>
							</td>
							<td align="left" class="sectionhead1" >
							<b>
							<%
								double totalPremium = parentQuoteDetailObject.getTotalPremium();
								double fee1 = parentQuoteDetailObject.getFee1();
								double fee2 = parentQuoteDetailObject.getFee2();
								totalPremium = totalPremium + fee1 + fee2;
								String strTotalPremium = Double.toString(totalPremium);
							%>
								<dmshtml:CurrencyFormatTag format="<%=strTotalPremium%>"/>
								</b>
							</td>
						</tr>


					</table>
				</td>
				<!-- /tr -->
				
				<td valign="top">
					<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
				
						<tr>  
							<td  class="FormLabels" align="left" colspan="1" width="160px" >
								<bean:message key="QuoteHeader.State"/>
							</td>
							<td align="left" class="sectionhead1" width="215px">
							<b>
										<%=customerState%></b>
							</td>
						</tr>

			
						<tr>
							
							<td  class="FormLabels" align="left" colspan="1"  width="160px">
								<bean:message key="QuoteHeader.Area"/>
							</td>
							<td align="left" class="sectionhead1" width="215px">
							<b><bean:define id="zip" name="parentQuoteDetail" property="zip"/>
							<%=zip%></b>
							</td>
						</tr>


						<tr>
							<td class="FormLabels" align="left" colspan="1">
								<bean:message key="QuoteHeader.SICCode"/>
							</td>
							<td class="sectionhead1" colspan="1" >
							<bean:write name="parentQuoteDetail" scope="request" property="sic"/>
							</td>
						</tr>

					<dmshtml:dms_HasFeature_Available_InProduct productId="<%=Long.parseLong(""+prodId)%>" featureName="Medicare_Primary" negated="true" 	dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+customerState%>" >	
						<tr>
							<td class="FormLabels" align="left" colspan="1">
								<bean:message key="QuoteHeader.MedicarePrimary"/> 
							</td>
							<td class="sectionhead1" colspan="1">
							<bean:write name="parentQuoteDetail" scope="request" property="medicarePrimary"/>
							</td>
						</tr>
					</dmshtml:dms_HasFeature_Available_InProduct>

					<dmshtml:dms_HasFeature_Available_InProduct productId="<%=Long.parseLong(""+prodId)%>" featureName="HRA" negated="true" 	dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+customerState%>" >	
						<tr>
							<td  class="FormLabels" align="left" colspan="1"  >
								<bean:message key="QuoteHeader.HRA"/>
							</td>
							<td align="left" class="sectionhead1" >
							<b><bean:define id="helthHra" name="parentQuoteDetail" property="helthHra"/>
										<%=helthHra%></b>
							</td>
						</tr>
					</dmshtml:dms_HasFeature_Available_InProduct>
				
						
							<!-- PPO Detail shows only while available -->
							

							<dmshtml:dms_HasFeature_Available_InProduct productId="<%=Long.parseLong(""+prodId)%>" featureName="PPO_Network" negated="true" 	dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  state="<%=""+customerState%>" >
								<tr>					
									<td  class="FormLabels" align="left" colspan="1"  >
										<bean:message key="QuoteHeader.PPO"/>
									</td>
									<td align="left" class="sectionhead1" >
										<b>
										<bean:define id="areaNetWorkKey" name="parentQuoteDetail" property="areaNetWorkKey"/>
										<bean:define id="areaNetWorkKeyDesc" name="parentQuoteDetail" property="areaNetWorkKeyDesc"/>

										<%=areaNetWorkKeyDesc%> (<%=areaNetWorkKey%>)</b>
									</td>
								</tr>
							</dmshtml:dms_HasFeature_Available_InProduct>

							<dmshtml:dms_static_with_connector ruleName='privilage'  property='<%=new String[]{"SHOW_QUOTE_VERSION"}%>' connector='or' negated="true">
								<tr>					
									<td  class="FormLabels" align="left" colspan="1"  >
										Quote Version #
									</td>
									<td align="left" class="sectionhead1" >
										<b>
										<bean:define id="quoteVersionNumber" name="parentQuoteDetail" property="quoteVersionNum"/>
										<%=""+quoteVersionNumber%></b>
									</td>
								</tr>
							</dmshtml:dms_static_with_connector>
								<dmshtml:dms_HasFeature_Available_InProduct productId='<%=Long.parseLong(""+prodId)%>' featureName="Member_Based_Rate" negated="true" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" state="<%=""+customerState%>" >
							<tr>					
									<td  class="FormLabels" align="left" colspan="1"  >
										Renewal Date
									</td>
									<td align="left" class="sectionhead1" >
										<b>
										<bean:define id="policyRenewalDate" name="parentQuoteDetail" property="policyRenewalDate"/>
										<%=""+policyRenewalDate%></b>
									</td>
								</tr>
								</dmshtml:dms_HasFeature_Available_InProduct>
						

 
					</logic:present>
				</table>	
			</td>
		</tr>
			
	</table>
	</td>
</tr>

