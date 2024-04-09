<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>


<table width="100%" cellpadding="1" cellspacing="1" border="0" align="center">
				
				<logic:present name="noPolicy">
					<tr>
						<td class="error">
							No Policies associated to the insured
						</td>
					</tr>
				</logic:present>
				
				<logic:present name="policyList">
					<tr>
						<td colspan=9>&nbsp;</td>
					</tr>
					<tr>
						<td colspan=9 style ="font-size:10pt;">Click on the Policy Number to goto Policy Summary</td>
					</tr>
					<TR>
						<td class="sectionhead" align="left">S.No.</td>
						<td class="sectionhead" align="left" >Policy Number</td>
						<td class="sectionhead" align="left" >Effective Date</td>
						<td class="sectionhead" align="left" >Expiration Date</td>
						<td class="sectionhead" align="left" >Policy Status</td>		
						<td class="sectionhead" align="left" >Policy Type</td>
						<td class="sectionhead" align="left" >Bound By</td>
						<td class="sectionhead" align="left" >Bound Date</td>
						<td class="sectionhead" align="left" >Issued Date</td>
					</TR>	
					<%int count=1;%>			
				<%--
       				java.util.ArrayList arrListpolicy = (java.util.ArrayList)request.getAttribute("policyList");
		     		for(int polIndex=0;polIndex<arrListpolicy.size();polIndex++){
					com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrListpolicy.get(polIndex);							
					String policyNumber = qmap.getString("Object::Policy::PolicyNumber");
				--%>
				<logic:iterate id="policyList" name="policyList">
					<tr>
						<TD class="SearchResult"  align="left">
							<%=count++%>
							<bean:define id="policyNumber" property="Object::Policy::PolicyNumber" name="policyList" />
						</TD>																								
						<td class="SearchResult"  align="left">					
						   		<bean:define id="policyId" property="Object::Policy::PolicyId" name="policyList"/>
						   		<bean:define id="policyVerId" property="Object::Policy::PolVerId" name="policyList"/>
						   		<bean:define id="parentPolicyId" property="Object::Policy::ParentPolicyId" name="policyList"/>
						   		<bean:define id="parentPolicyVerId" property="Object::Policy::ParentPolicyVerId" name="policyList"/>						   		
						   		<bean:define id="policyNumberInVer" name="policyList" property="Object::Policy::PolicyNumberInVer" />
   										<%-- <a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=3112&answer(policyId)=2514&answer(conditionFlag)=Y ">--%>									
										<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(policyVerId)=<%=""+policyVerId%>&answer(policyId)=<%=""+policyId%>&answer(conditionFlag)=Y " title="<bean:message key='ToolTip.InsuredSummary.PolicyNumber'/>">
										<%=""+policyNumberInVer %>
									</a>								
								<%-- =""+qmap.getString("Object::Policy::PolicyNumber") --%>
						</td>
						<td class="SearchResult"  align="left">
							<bean:define id="polEfftDate" name="policyList" property="Object::Policy::PolEfftDate" />
							<%
								String polEffDate ="";
								String polEffDate1 = "";
								polEffDate =""+polEfftDate;																							
								String arrPolEffDate[] = polEffDate.split(" ");
								polEffDate1 = arrPolEffDate[0];											
								String arrPolEffDate1[] = polEffDate1.split("-"); 										    
								String YYYY1 = arrPolEffDate1[0];
								String MM1 = arrPolEffDate1[1];
								String DD1 = arrPolEffDate1[2];
								
								polEffDate = MM1+"-"+DD1+"-"+YYYY1;
							%>												
	 						<%=polEffDate %>
							<%-- =""+qmap.getString("Object::Policy::PolEfftDate") --%>
						</td>
						<td class="SearchResult"  align="left">
							<bean:define id="polExptDate" name="policyList" property="Object::Policy::PolExpDate" />
							<%
								String polExpDate ="";
								String polExpDate1 = "";
								polExpDate =""+polExptDate;
												
								String arrPolExpDate[] = polExpDate.split(" ");
								polExpDate1 = arrPolExpDate[0];
								String arrPolExpDate1[] = polExpDate1.split("-");      
								String YYYY2 = arrPolExpDate1[0];
								String MM2 = arrPolExpDate1[1];
								String DD2 = arrPolExpDate1[2];
								
								polExpDate = MM2+"-"+DD2+"-"+YYYY2;
							%>												
	 						<%=polExpDate %>	
							<%-- =""+qmap.getString("Object::Policy::PolExpDate") --%>
						</td>						
						<td class="SearchResult"  align="left">
							<bean:write name="policyList" property="Object::Policy::PolicyStatus" />
							<%-- =""+qmap.getString("Object::Policy::PolicyStatus") --%>
						</td>						
						<td class="SearchResult"  align="left">
							<bean:define id="isRenewal" name="policyList" property="Object::Policy::IsRenewal" />
							<%if((""+isRenewal).equalsIgnoreCase("Y")) { %>
								RENEWAL
							<%}else {%>
								<bean:write name="policyList" property="Object::Policy::PolicyType" />
							<%} %>
							<%-- =""+qmap.getString("Object::Policy::PolicyType") --%>
						</td>
						<td class="SearchResult"  align="left">
							<bean:define id="polCreatedBy" name="policyList" property="Object::Policy::CreatedBy" />

							<bean:write  name="policyList" property="Object::Policy::CreatedBy" />
							<%-- =""+qmap.getString("Object::Policy::polCreatedBy") --%>
						</td>
						<td class="SearchResult"  align="left">
						<bean:define id="polPolicyVerCreatedDate" name="policyList" property="Object::Policy::PolVerCreatedDate" />
						<bean:define id="polPolicyCreatedDate" name="policyList" property="Object::Policy::PolCreatedDate" />
						<%
						String createdDate ="";	
						if((""+isRenewal).equalsIgnoreCase("Y")) {								
								String createdDate1 = "";
								createdDate =""+polPolicyVerCreatedDate;
														
								String arrCreatedDate[] = createdDate.split(" ");
								createdDate1 = arrCreatedDate[0];
								String arrCreatedDate1[] = createdDate1.split("-");      
								String YYYY = arrCreatedDate1[0];
								String MM = arrCreatedDate1[1];
								String DD = arrCreatedDate1[2];
								
								createdDate = MM+"-"+DD+"-"+YYYY;
						}else {														
								String createdDate1 = "";
								createdDate =""+polPolicyCreatedDate;
														
								String arrCreatedDate[] = createdDate.split(" ");
								createdDate1 = arrCreatedDate[0];
								String arrCreatedDate1[] = createdDate1.split("-");      
								String YYYY = arrCreatedDate1[0];
								String MM = arrCreatedDate1[1];
								String DD = arrCreatedDate1[2];
								
								createdDate = MM+"-"+DD+"-"+YYYY;		
						} %>									
	 						<%=createdDate %>	
							<%-- =""+qmap.getString("Object::Policy::PolCreatedDate") --%>
						</td>
						<td class="SearchResult"  align="left">
							<bean:define id="polIssuedDate" name="policyList" property="Object::Policy::IssuedDate" />	
							<%
											String issuedDate ="";
											String issuedDate1 = "";
											issuedDate =""+polIssuedDate;
											if(!issuedDate.equals("null"))	{						
												String arrIssuedDate[] = issuedDate.split(" ");
												issuedDate1 = arrIssuedDate[0];
												String arrIssuedDate1[] = issuedDate1.split("-");      
												String YYYY3 = arrIssuedDate1[0];
												String MM3 = arrIssuedDate1[1];
												String DD3 = arrIssuedDate1[2];
												
												issuedDate = MM3+"-"+DD3+"-"+YYYY3;
											}else {
												issuedDate = "";
											}
										%>												
				 			<%=issuedDate %>								
							<%-- =""+qmap.getString("Object::Policy::IssuedDate") --%>
						</td>			
					</tr>		
					</logic:iterate>		
				<%-- } --%>			
				</logic:present>							
			</table>
