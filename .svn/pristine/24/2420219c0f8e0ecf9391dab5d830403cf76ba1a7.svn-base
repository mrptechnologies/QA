<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>


<%String pQId="";%>
<%String pQuoteStatus="";%>
<%Object cId=null;%>
<%String customerCreatedBy=""; %>
<%String customerCreatedDate=""; %>
<%long productId=0; %>
<%long productVerId=0; %>
<%long lngAgencyId=0;%>
<%long lngAgentId=0;%>
<%String agencyName="";%>
<%String agentFName="";%>
<%String agentMName="";%>
<%String agentLName="";%>
<%String agentNumber="";%>
<%String agentBusinessId="";%>
<%String customerId="";%>
<%String custName = "";%>
<%String agentPhone ="";%>
<%String agentFax = "";%>
<%String agencyCode =""; %>
<%String isRenewalEndorsement =""; %>

	
	<%if(request.getParameter("parentQuoteId")!= null) { %>
		<bean:parameter id="parentQuoteId" name="parentQuoteId" />
		<%pQId=parentQuoteId; %>
	<%}%>
	
	<%String isRenewal = "";
		if(request.getParameter("isRenewal") != null) {
			isRenewal = request.getParameter("isRenewal");
	}%>
	
	<%if(request.getParameter("paretQuoteStatus")!= null) {%>
		<bean:parameter name="paretQuoteStatus" id="paretQuoteStatus"/>
		<%pQuoteStatus = paretQuoteStatus;%>
	<%}%>	
	
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
	<html:hidden  property="pId" value="<%=""+pQId%>" styleId="parentQuoteId1"/>
    <dmshtml:get_productDetail_ByQuoteId nameInSession="productDetailMap" ownerId="<%=Long.parseLong(""+ownerId)%>" quoteId="<%=Long.parseLong(pQId.toString())%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
    
    <bean:define id="productDetailmap" name="productDetailMap" scope="request" type="com.dms.ejb.data.QuestionHashMap" />	
    
    <%
    if(!productDetailmap.getString("productId").equalsIgnoreCase("") || !productDetailmap.getString("productId").equalsIgnoreCase("0"))
       productId=Long.parseLong(productDetailmap.getString("productId") );
       productVerId=Long.parseLong(productDetailmap.getString("productVerId")) ;
      %>

			<dmshtml:IsRenewalEndorsement productId='<%=""+productId%>'dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=Long.parseLong(""+ownerId)%>" ></dmshtml:IsRenewalEndorsement>
             <% isRenewalEndorsement = (String) request.getAttribute("isRenewalEndorsement"); 
 		         if(isRenewalEndorsement.equals("Y")){ 
              %>	
            		 <html:hidden property="answer(isRenewalEndorsement)" value="YES" />
             <%}else{ %>
  					<html:hidden property="answer(isRenewalEndorsement)" value="NO" />
 			 <%} %>      	
<%
	
	if(pQId!=null && (!pQId.toString().equals(""))){%>


			<table width="90%" align="Left" border="0" bgcolor="#C6DEEA">
			<tr>
				<td valign="top">
					<table width="550px" align="Left" border="0" bgcolor="#C6DEEA" >

						<tr>
							<td class="FormLabels" align="left" width="30%"><bean:message key="Top.EmployerGroupName"/></td>
							<dmshtml:Get_Customer_Agency_Agent_QuoteSummary nameInSession="quoteInsuredDetail" parentQuoteId="<%=""+pQId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'></dmshtml:Get_Customer_Agency_Agent_QuoteSummary>
							<logic:present name="quoteInsuredDetail" scope="request">
							<bean:define id="customerDetailMap" name="quoteInsuredDetail" scope="request"
																	type="com.dms.ejb.data.QuestionHashMap" />
								
								<%try{
								lngAgencyId=Long.parseLong(customerDetailMap.getString("agencyid"));

								}catch(Exception nfe) {lngAgencyId=0;    }
								try{
								lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
								}catch(Exception nfe) {lngAgentId=0;    }
								agencyName=customerDetailMap.getEncodedString("agencyname");
								agentFName=customerDetailMap.getEncodedString("agentFirstName");
								agentMName=customerDetailMap.getEncodedString("agentMiddleName");
								agentLName=customerDetailMap.getEncodedString("agentLastName");
								custName = customerDetailMap.getString("custname");
								agentBusinessId=customerDetailMap.getString("businessId");
								agentNumber=customerDetailMap.getString("agentNumber");
								customerId=customerDetailMap.getString("customerId");
								customerCreatedBy = customerDetailMap.getEncodedString("customerCreatedBy");
								agencyCode = customerDetailMap.getString("agencyCode");
								agentPhone = customerDetailMap.getString("agentPhone");
								agentFax = customerDetailMap.getString("agentFax");
								customerCreatedDate = customerDetailMap.getString("customerCreatedDate");%>
                              <td class="sectionhead1" align="left" width="220px"><a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+customerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(Object::Agency::AgencyId)=<%=""+lngAgencyId%>" ><%=customerDetailMap.getEncodedString("custname")%></a>
								</td>
							</logic:present>
						 </tr>
						 <%if(!customerCreatedBy.equals("")){ %>
						 <tr>	
							<td  class="FormLabels" align="left"  colspan="1" width="160px">
								<bean:message key="Top.CreatedBy"/>
							</td>
							<td class="FormLabels" align="left"  colspan="1" width="220px">
								<%=""+customerCreatedBy%>
							</td>
						</tr>
						<%} %>
					</table>
				</td>
				
				<td valign="top">
					<table width="340px" align="Left" border="0" bgcolor="#C6DEEA" >		
						<tr>
							<td class="FormLabels" align="left" width="160px">
								<bean:message key="Top.AgencyName"/>
							</td> 
							
							<td class="sectionhead1" align="left" width="240px">
							<html:hidden property="answer(agencyId)" value="<%=""+lngAgencyId %>" styleId="agencyId"/>
								<%
								if(lngAgencyId>0){ %>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="true">	
									<a href="../GetAgencySummary.do?ReadOnly=Yes&agencyId=<%=""+lngAgencyId%>&primaryObjectId=<%=""+lngAgencyId%>&primaryObjectType=AGENCY" onclick="return AgencyPopup(this,'Agency');" target="Agency" ><%=agencyName%></a>
									</dmshtml:dms_static_with_connector >
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_VIEW"}%>' connector='or' negated="false">
									<a><%=agencyName%></a>
									</dmshtml:dms_static_with_connector >	
								<%}%>
							</td>
						</tr>
										
						<tr>
							<td class="FormLabels" align="left" colspan="1">
								<bean:message key="Top.AgentName"/>
							</td> 
							<td class="sectionhead1" align="left" colspan="2">
									<%
								if(!agentFName.equals("") || !agentLName.equals("")){%>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENTS_VIEW"}%>' connector='or' negated="true">
									<a href="../GetAgentSummaryDetail.do?ReadOnly=Yes&entityId=<%=""+lngAgentId%>" onclick="return AgentPopup(this,'Agent');" target="Agent"><%=agentFName%> <%=" "%><%=agentLName%></a>
									</dmshtml:dms_static_with_connector >
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENTS_VIEW"}%>' connector='or' negated="false">
									<a><%=agentFName%> <%=" "%><%=agentLName%></a>
									</dmshtml:dms_static_with_connector >	
								
								<%}%>
							</td>
							<td>
						   	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENCY_AGENT_CHANGE"}%>' connector='or' negated="true"> 
				
							<%String pQStatus = pQuoteStatus.toString();%>
							<%if(!pQStatus.equalsIgnoreCase("Issued") && !pQStatus.equalsIgnoreCase("Lapsed") && !pQStatus.equalsIgnoreCase("Declined") && !pQStatus.equalsIgnoreCase("Bound") && !pQStatus.equalsIgnoreCase("Canceled")){ %>
								<td class="sectionhead1" align="left" colspan="2" >
									<html:hidden property="answer(IsPopupEnabledAgencyFind)" value="true" styleId="IsPopupEnabledAgencyFind" />
									
								</td>
							<% if(isRenewalEndorsement.equals("Y")){%> 
								<td><IMG SRC="../Images/change.jpg"  BORDER="0" align="left" ALT="<bean:message key='ToolTip.InsuredAgency.Change'/>" onmouseover="this.style.cursor='hand';" onclick="return AgentPopupQuoteSummary()"></td>
								<%} else {%>
								<td></td>
								<%} %>
							<%} %>

				</dmshtml:dms_static_with_connector>	
						</td>	
							
						</tr>
					</table>
				</td>
			</tr>
			</table>
			<%}%>