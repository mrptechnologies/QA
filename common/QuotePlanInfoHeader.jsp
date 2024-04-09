<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<script type="text/javascript" src="../Scripts/JScripts/PlanHeader.js">
</script>

<tr>
	<td>
		<table width="100%" align="left" border="0">
			<bean:define id="ownerId"
				property="answer(Object::UserDetail::ownerId)" name="LoginPage"
				scope="session" />
			<bean:parameter id="subQuoteId" name="subQuoteId" />
			<bean:parameter id="customerId" name="customerId" />
			<bean:parameter id="prodId" name="productId" />
			<bean:parameter id="productVerId" name="productVerId" />
			<bean:parameter id="prdGroupId" name="prdGroupId" />
			<bean:parameter id="prdGroupVerId" name="prdGroupVerId" />
			<bean:parameter id="productStatus" name="productStatus" />
			<bean:parameter id="stateCode" name="stateCode" />
		 	
		<%
		String parentQuoteStatus = "";
		%>
		<%if(request.getParameter("paretQuoteStatus") != null){ %>
			<bean:parameter id="pQS" name="paretQuoteStatus" />
			
		<% 
			parentQuoteStatus = pQS;
		}%>
		
		<%
		String parentQuoteId = "";
		%>
		<%if(request.getParameter("answer(parentQuoteId)") != null){ %>
			<bean:parameter id="pQI" name="answer(parentQuoteId)" />
			
		<% 
			parentQuoteId = pQI;
		}%>
		
		
		

		<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
			<%
				String productName = "";
				String productVerNumber = "";
				String groupName = "";
				String groupVerNumber = "";
			%>
			<dmshtml:dms_static_with_connector ruleName='privilage'
				property='<%=new String[]{"SHOW_PRODUCT_INFO"}%>' connector='or'
				negated="true">
				<dmshtml:get_GroupDetail_ByGroupVerId nameInSession="aGroupDetail"
					groupId="<%=""+prdGroupId%>" groupVerId="<%=""+prdGroupVerId%>"
					ownerId="<%=""+ownerId%>"
					dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
				<logic:present name="aGroupDetail" scope="request">
					<bean:define id="groupverName" property="groupverName"
						name="aGroupDetail" scope="request" />
					<bean:define id="groupVerNum" property="groupVerNum"
						name="aGroupDetail" scope="request" />
					<%
						groupName = ""+groupverName;
						groupVerNumber = ""+groupVerNum;
					%>
				</logic:present>
				<dmshtml:get_ProductDetail_ByProductVerId
					nameInSession="aProductDetail" productId="<%=""+prodId%>"
					productVerId="<%=""+productVerId%>" ownerId="<%=""+ownerId%>"
					dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
				<logic:present name="aProductDetail" scope="request">
					<bean:define id="MProductVerName" property="MProductVerName"
						name="aProductDetail" scope="request" />
					<bean:define id="MProductVerNumber" property="MProductVerNumber"
						name="aProductDetail" scope="request" />
					<%
						productName = ""+MProductVerName;
						productVerNumber = ""+MProductVerNumber;
					%>
				</logic:present>
			</dmshtml:dms_static_with_connector>
		
			<%System.out.println("#####111subQuoteId " + subQuoteId);%>
			<dmshtml:Get_HealthIns_QuoteDetail nameInSession="aSubQuote"
				quoteId="<%=""+subQuoteId%>"
				dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'
				ownerId="<%=""+ownerId%>" />
			<%System.out.println("#####111subQuoteId " + subQuoteId);%>

			<tr>
				<td>
					
					<div id="planheadercontainer">
						<div id="planheadernav" align="left"> 
							<logic:present name="aSubQuote" scope="request">
								<bean:define id="customerState" property="customerState"
									name="aSubQuote" scope="request" />
								<%com.dms.ejb.insurance.quote.common.quote.QuoteDetail healthInsQuoteDetail = (com.dms.ejb.insurance.quote.common.quote.QuoteDetail) request
						                            .getAttribute("aSubQuote");
						                    com.dms.ejb.insurance.quote.common.plan.PlanDetail healthInsPlanDetail = healthInsQuoteDetail
						                            .getHealthInsPlanDetail();
																					com.dms.ejb.insurance.quote.common.renewal.RenewalQuoteDetail healthInsRenewalQuoteDetail =healthInsQuoteDetail.getHealthInsRenewalQuoteDetail();
									String rateType = request.getParameter("rateType");%>
						
								<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
									<tr>
										<td width="40%">
											<a rel="planheader" onclick="showHidePlanHeader();" id="planHeaderLink">
												<img src="/Images/plus.gif" name="planHeaderImg" height="12" width="12" align="left">&nbsp;
												<span id="Plan:TxtChange">Click here to show detail</span></a>
											</td>
										<td>
											<b class="Title"><%="Plan Information - Plan # "+ healthInsQuoteDetail.getQuoteNumber() %></b>
										</td>
									</tr>
								</table>
								<!-- /div -->	
						
								<!-- tr>
									<td class="SectionHeading" align="center" colspan="4" width="100%"></td>
								</tr  -->						
							</logic:present>
						</div>
					
				<!-- /td>
			</tr -->
		
		
		<!--##########################NEW PLAN HEADER START #########################################-->
				
			<!-- tr>
				<td -->
					<div id="planheader_inner">
						<div id="planheader" class="innercontent2">
							<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="#C6DEEA">
								<tr>
									<td>
								
											<dmshtml:Get_Quote_Header_Html nameInSession="headerDetail1" quoteId="<%=Long.parseLong(""+subQuoteId)%>" productId="<%=Long.parseLong(""+prodId)%>" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="PLAN_HEADER_ALGORITHM" stateCode="<%=""+stateCode%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 								
											<logic:present name="headerDetail1" scope="request">									
												<bean:define id="htmlPage" name="headerDetail1"	type="java.lang.StringBuffer" />
													<%out.println(htmlPage.toString());%>							
											</logic:present>
									
			
									</td>
								</tr>
							</table>
						</div>
					</div>				
				</div>
				
				</td>
			</tr>	
			
		
		</table>
	
	<!--##########################NEW PLAN HEADER END #########################################-->		
	</td>
</tr>