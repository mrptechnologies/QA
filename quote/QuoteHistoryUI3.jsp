<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
<bean:parameter id="customerId" name="answer(Object::Customer::CustomerId)" />
<bean:define id="ownerId1" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/>
<bean:define id="ObjectType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session"/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<br>
<table class="loctable1" cellpadding="0" cellspacing="0" border="0">
					
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CVSTARR_SUBMISSION_SHOW"}%>' connector='or' negated="true" >	
						<dmshtml:Get_QuoteDetails_ByCustomerId nameInSession="quoteDetails" objectId="<%=customerId.toString()%>" objectType="CUSTOMER" ownerId="<%=""+ownerId1%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
					</dmshtml:dms_static_with_connector>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"LIU_SUBMISSION_SHOW"}%>' connector='or' negated="true" >	 
						<dmshtml:Get_AllQuoteDetails_ByCustomerId nameInSession="quoteDetails" customerId="<%=customerId.toString()%>" ownerId="<%=""+ownerId1%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
					</dmshtml:dms_static_with_connector>
					
					<logic:present name="quoteDetails" scope="request">
					<tr colspan=9 align="left" style ="font-size:10pt;">Click on the Quote No. to goto Quote Summary<br></tr>
					<tr>
						<td valign="center" align="left">Quote No.</td>
						<td valign="center" align="left">Effective Date</td>
						<td valign="center" align="left">Status</td>		
						<td valign="center" align="left">Quote Type</td>
						<td valign="center" align="left">Quote Created Date</td>
						<td valign="center" align="left">Last Saved Date</td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_TOTAL_PREMIUM"}%>' connector='or' negated="true">  		
							<td valign="center" align="left">Total Premium</td>	
						</dmshtml:dms_static_with_connector>
							
					</tr>
					<%int count=0;
					  String renewalFlag = "N";
					  String quoteType1 = "";%>
					<logic:iterate id="aQuote" name="quoteDetails" scope="request">

					<bean:define id="parentQuoteVerId" name="aQuote" property="verId"/>
					<bean:define id="quoteId" name="aQuote" property="quoteId" />
					<bean:define id="quoteName" name="aQuote" property="quoteName" />
					<bean:define id="product" name="aQuote" property="quoteId" />
					<bean:define id="planName" name="aQuote" property="healthInsPlanDetail" />
					<bean:define id="totalPremium" name="aQuote" property="totalPremium" />
					<bean:define id="fee1" name="aQuote" property="fee1" />
					<bean:define id="fee2" name="aQuote" property="fee2" />
					<bean:define id="quoteType" name="aQuote" property="quoteType" />
					
					<%if((""+quoteType).equals("ENDORSEMENT")) {
							renewalFlag = "Y";
							quoteType1 = "RENEWAL";
					} else {
							renewalFlag = "N";
							quoteType1 = ""+quoteType;						
					}
					%>
					
					<%
					double grandTotal = 0;
					double dbTotalPremium = 0;
					double dbFee1 = 0;
					double dbFee2 = 0;
					try{
						dbTotalPremium = Double.parseDouble(""+totalPremium);
					}catch(Exception ex){}
					try{
						dbFee1 = Double.parseDouble(""+fee1);
					}catch(Exception ex){}
					try{
						dbFee2 = Double.parseDouble(""+fee2);
					}catch(Exception ex){}
					grandTotal = dbTotalPremium + dbFee1 + dbFee2;
					%>
						<tr height="25px">
						
						<td align="left">
						<logic:present name="LoginPage" scope="session">
						<%if(renewalFlag.equals("N")){ %>
						<a href="../SyncQuoteWithEmployerGroupAndProductAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=""+quoteId%>&answer(parentQuoteId)=<bean:write name='aQuote' property='quoteId' />&answer(ownerId)=<%=ownerId1.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(userId)=<%=""+userId%>&answer(Object::Customer::State)=<bean:write name='aQuote' property='customerState' />" title="<bean:message key='ToolTip.InsuredSummary.QuoteNumber'/>">
<!-- Added to show subnumber along with quote number start -->
						<%} else if(renewalFlag.equals("Y")){ %>
						<a href="../SyncQuoteWithEmployerGroupAndProductAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(QuoteId)=<%=""+quoteId%>&answer(parentQuoteId)=<bean:write name='aQuote' property='quoteId' />&answer(ownerId)=<%=ownerId1.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(userId)=<%=""+userId%>&answer(Object::Customer::State)=<bean:write name='aQuote' property='customerState' />" title="<bean:message key='ToolTip.InsuredSummary.QuoteNumber'/>">
						<%} %>
						<bean:define id="quoteSubNum" name="aQuote" property="quoteSubNumber"/>
						<bean:write name="aQuote" property="quoteNumber"/><%try{if(Integer.parseInt(""+quoteSubNum.toString())>=1){%>-<%=""+quoteSubNum%><%}
							}
							catch(NumberFormatException nfe)
							{}
						%>
<!-- Added to show subnumber along with quote number end -->
						<BR></a>
						</logic:present></TD>

						<td valign="center" align="left"><bean:write name="aQuote" property="quoteStartDate" /></td>
						<td valign="center" align="left"><bean:write name="aQuote" property="quoteStatus" /></td>
						<td valign="center" align="left"><%=quoteType1 %></td>	
						<td valign="center" align="left"><bean:write name="aQuote" property="createdDate" /></td>
						<td valign="center" align="left"><bean:write name="aQuote" property="updatedDate" /></td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_TOTAL_PREMIUM"}%>' connector='or' negated="true">  		
							<td valign="center" align="left">
						       <%java.text.DecimalFormat dFormat = new java.text.DecimalFormat("$#,##0.00");%>
						       <%=dFormat.format(Double.parseDouble(grandTotal+"")) %>
						    </td>
						</dmshtml:dms_static_with_connector>
					</tr>
					</logic:iterate>
					</logic:present>
					<logic:notPresent name="quoteDetails" scope="request">
					<tr>
						<td colspan="3">
						<span class="Error">Currently no Quotes are listed</span></td>
					</tr>
					</logic:notPresent>

						
				</table>