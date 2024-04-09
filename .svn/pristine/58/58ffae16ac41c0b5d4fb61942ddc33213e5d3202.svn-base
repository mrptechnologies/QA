<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddResPropertyRiskForQuickQuote.js"> </SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/TerritoryLookupForQuickQuote.js"></SCRIPT>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></SCRIPT>

<html:form action="/NewPCQuote.do" onsubmit="return validate()">
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
	<tr>
		<td>
			<table WIDTH="100%" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
				<tr>
					<td>
						<table WIDTH="780px" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>													
																		
<%String agencytemporaryId="";%>						
 <!-- ******START********For Agency Header- Copied From AddCustomerBody.jsp********START ***********   -->
									<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
									<%int dataBaseIdViewPrivillage=0;%>
									<%String customerCreatedDate=""; 
									String agencyAgentId="";%>
									<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' 
										connector='or' negated="true">	
										<%dataBaseIdViewPrivillage=1;%>
									</dmshtml:dms_static_with_connector>
									
									<%String agencyIdTemp="";%> 
									<%String agencyIdtoLink="";%>
									
									<%String strAgentFName="";%>
									<%String strAgentLName="";%>
									<%long lngAgentId1=0;%>
									<%long lngAgencyTemp=0;%>
									<%long agencyId2=0;%>
									<%String agencyName2="";%>
									<%long generalagencyid2=0;%>
									<%String generalagencyname2="";%>
								
									<%if (request.getParameter("agencyIdtoLink")!= null) {
									agencyIdtoLink=request.getParameter("agencyIdtoLink");
									agencyId2=Long.parseLong(agencyIdtoLink.toString());
									}%>
									<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
									<html:hidden property="versionNum" value="1.0" />
									<input type="hidden" name="frmtmpid" value="CUSTOMERDETAILSMICACARE">
															
									<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
										<tr>
											<td>&nbsp;</td>
										</tr>
										<tr>
											<td valign="top" align="left">
								
												<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
													<logic:present name="staleDataSubmissionMsg"  scope="request">
													<tr>
														<td class="Error" >
															<bean:message key="error.staleDataSubmissionMsg"/>
														</td>
													</tr>
													<tr>
															<td>&nbsp;</td>
														</tr>
													</logic:present>
								
													<tr> 
														<td colspan="3">
															<logic:notPresent name="staleDataSubmissionMsg"  scope="request">
															<table WIDTH="760px" ALIGN="center" border="0"CELLSPACING="0" CELLPADDING="2" bgcolor="#C6DEEA">
																<tr>
																	<td valign="top">
																		<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
																			<tr>	
																				<td  class="FormLabels" align="left"  colspan="1" width="160px">
																					<bean:message key="Top.EmployerGroupName"/>
																				</td>
																				<td class="FormLabels" align="left"  colspan="1" width="220px">
																					<div id="InsuredName1">	
																							<bean:write name='QuickQuote' property='answer(Object::Customer::CustomerName)'/>														
																					</div>	
																				</td>
																			</tr>	
																			<tr>	   
																				<td  class="FormLabels" align="left"  colspan="1" width="160px">
																					<bean:message key="Top.CreatedBy"/>
																				</td>
																				<td class="FormLabels" align="left"  colspan="1" width="220px">
																					<div id="CreatedBy">	
																						<bean:write name='QuickQuote' property='answer(Object::Customer::CreatedBy)'/>
																					</div>
																				</td>
																			</tr>			
																		<!-- /td -->
																		</table>
																	</td>
																	<td valign="top">
																		<table width="380px" align="Left" border="0"bgcolor="#C6DEEA" >
																			<tr>
																				<td  class="FormLabels" align="left" colspan="1">
																					<bean:message key="Top.AgencyName"/>
																				</td> 
																				<td class="sectionhead1" align="left" colspan="2" >
																					<bean:define id="cId" name="QuickQuote" property="answer(Object::Customer::CustomerId)"/>
																					<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
																				
									
									<!-- ********************agency, agent, general ageny details by link *********************-->
									
																					<bean:define id="agencyIdTemp1" name="QuickQuote" property="answer(Agency::AgencyId)"/>
																					<%if(!agencyIdTemp1.toString().equals("")) {
																						if((agencyIdTemp1.toString().indexOf("::"))>0){														
																							String ids[]=(""+agencyIdTemp1).split("::");
																			       			agencyIdTemp1=ids[0];
																			       			agencyAgentId=ids[1];
																							}
																					agencyIdTemp=agencyIdTemp1.toString();	
																					lngAgencyTemp=Long.parseLong(agencyIdTemp);
																					if(lngAgencyTemp>0){%>
																						<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
																					
																						<logic:present name="agencyDetail2" scope="request">
																							<bean:define id="agdetail2" name="agencyDetail2" scope="request"
																												type="com.dms.ejb.data.QuestionHashMap" />
																							<%agencyId2=Long.parseLong(agdetail2.getString("agencyid"));%>
																							<%agencyName2=agdetail2.getString("agencyname");%>
																							<%generalagencyid2=Long.parseLong(agdetail2.getString("generalagencyid"));%>
																							<%generalagencyname2=agdetail2.getString("generalagencyname");%>
																						</logic:present>
																					<%}%>
																	
																					<bean:define id="AgentId1" name="QuickQuote" property="answer(AgentId)"/>
																					<%long lgAgentId1=0;
																							try {
																								System.out.println("AgntAgncy ID was:="+agencyAgentId);
																								if(!agencyAgentId.equals("")){
																									AgentId1=agencyAgentId;
																								}
																							lgAgentId1=Long.parseLong(AgentId1.toString());
																						} catch(Exception ex){} %>
																					<%if(lgAgentId1>0){%>
																						<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId='<%=""+lgAgentId1%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
																						<logic:present name="agentDetail" scope="request">
																							<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
																							<%lngAgentId1=lgAgentId1;%>
																							<%strAgentFName=agentDetail1.getString("agentfname");%>
																							<%strAgentLName=agentDetail1.getString("agentlname");%>
																						</logic:present>
																					<%}%>
								
								<!-- *********************************************************************************************-->
																					<%}else{%>
								<!-- ********************agency, agent, general ageny details by customer id *********************-->
																					<%
																					if(!cId.toString().equals("")){
																					%>
																						<%long agencyId=0;%>
																						<%long lngGeneralAgencyId=0;%>
																						<%long lngAgentId=0;%>
																						<%String agencyName="";%>
																						<%String generalAgencyName="";%>
																						<%String agentFName="";%>
																						<%String agentLName="";%>
																						<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
																						<logic:present name="customerDetail1" scope="request">
																							<bean:define id="customerDetailMap" name="customerDetail1" scope="request"
																																type="com.dms.ejb.data.QuestionHashMap" />
																							<%try{%>
																							<%agencyId=Long.parseLong(customerDetailMap.getString("agencyid"));%>
																							<%}catch(Exception nfe) {agencyId=0;    }%>
																							<%try{%>
																							<%lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));%>
																							<%}catch(Exception nfe) {lngAgentId=0;    }%>
																							<%agencyName=customerDetailMap.getString("agencyname");%>
																							<%agentFName=customerDetailMap.getString("agentfirstname");%>
																							<%agentLName=customerDetailMap.getString("agentlastname");%>
																							<%try{%>
																							<%lngGeneralAgencyId=Long.parseLong(customerDetailMap.getString("generalagencyid"));%>
																							<%}catch(Exception nfe) {lngGeneralAgencyId=0;    }%>
																							<%generalAgencyName=customerDetailMap.getString("generalagencyname");%>
																							<%agencyIdTemp=""+agencyId;
																							lngAgencyTemp=Long.parseLong(agencyIdTemp);
																							agencyId2=Long.parseLong(agencyIdTemp);
																							agencyName2=agencyName;
																							generalagencyid2=lngGeneralAgencyId;
																							generalagencyname2=generalAgencyName;
																							lngAgentId1=lngAgentId;
																							strAgentFName=""+agentFName;
																							strAgentLName=""+agentLName;
																							%>
																						</logic:present>
																			
																						<%} else {
																						%>
																						<!-- ************Agency agent, general agenct detail by user id ******************************-->
																						<bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
																						 <%
																						 	try{
																						 		lngAgencyTemp=Long.parseLong(""+AgencyID);
																						 	}catch(Exception ex){}
																						 	if(lngAgencyTemp < 0){
																						 %>	
								
								
																					<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
																					<logic:present name="agencyIdent" scope="session">
																						<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
																						<%
																						agencyIdTemp=agencyIdid.toString();
																						try {
																							lngAgencyTemp=Long.parseLong(agencyIdTemp);
																						} catch(Exception ex){} %>
																						</logic:present>
																						<% }if(lngAgencyTemp>0){%>
																							<dmshtml:Get_Agency_Details nameInSession="agencyDetail2" agencyId="<%=""+lngAgencyTemp%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />	
																							<logic:present name="agencyDetail2" scope="request">
																								<bean:define id="agdetail2" name="agencyDetail2" scope="request"
																														type="com.dms.ejb.data.QuestionHashMap" />
																								<% agencyId2=Long.parseLong(agdetail2.getString("agencyid"));%>
																								<% agencyName2=agdetail2.getString("agencyname");%>
																								<% generalagencyid2=Long.parseLong(agdetail2.getString("generalagencyid"));%>
																								<% generalagencyname2=agdetail2.getString("generalagencyname");%>
																							</logic:present>
																						<%}%>
																						<bean:define id="AgentId2" name="QuickQuote" property="answer(AgentId)"/>
																						
																						<%long lgAgentId2=0;
																							try {
																							lgAgentId2=Long.parseLong(AgentId2.toString());
																						} catch(Exception ex){} %>
																						<%if(lgAgentId2>0){%>
																							<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId="<%=""+lgAgentId2%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
																							<logic:present name="agentDetail" scope="request">
																								<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
																								<%lngAgentId1=lgAgentId2;%>
																								<%strAgentFName=agentDetail1.getString("agentfname");%>
																								<%strAgentLName=agentDetail1.getString("agentlname");%>
																							</logic:present>
																						<%}else {
																						%>
																						<bean:define id="AgentID" name="userDetailObject" property="agentId" scope="session" />
																						   <% long lgObjAgentId = 0;
																						      try{
																						        lgObjAgentId = Long.parseLong(AgentID.toString());
																						      }catch(Exception ex){} 
																						      if(lgObjAgentId < 0){
																						   %>
																						   <%String objType="";%>
																						  	<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
                 																			<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />
																							<%if(!(objDescType.toString().equals("AGENCY"))){ %>														
																							<%lgObjAgentId=0;
																							try {
																								lgObjAgentId=Long.parseLong(objDescId.toString());
																							} catch(Exception ex){} %>
																							<%} %>
																							<% }if(lgObjAgentId>0){%>
																								<dmshtml:Get_Agent_Details nameInSession="agentDetail" agentId="<%=""+lgObjAgentId%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
																								<logic:present name="agentDetail" scope="request">
																									<bean:define id="agentDetail1" name="agentDetail" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
																									<%lngAgentId1=lgObjAgentId;%>
																									<%strAgentFName=agentDetail1.getString("agentfname");%>
																									<%strAgentLName=agentDetail1.getString("agentlname");%>
																								</logic:present>
																							<%} %>	
																							<!--  /logic:present -->										
																					<%	}%>
																					<!--/logic:present-->
									<!-- ****************************************************************************************** -->
																						<%}%>
																					<%}%>
																							
																				<!-- GENERAL BLOCK -->
																					<%if(agencyId2>0){%>
																						<%agencytemporaryId=""+agencyId2;%>
																					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' 
																					connector='or' negated="true">	
																					<a href="../EditAgencies.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&ReadOnly=Yes&agencyId=<%=""+agencyId2%>&primaryObjectId=<%=""+agencyId2%> &primaryObjectType=AGENCY"><%=agencyName2%></a>
																					</dmshtml:dms_static_with_connector >
																					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="false">
																					<a><%=agencyName2%></a>
																					</dmshtml:dms_static_with_connector >	
																					<%}%>
																					<%if(dataBaseIdViewPrivillage==1) {%>
																							<%="- "%><%=""+agencyId2%>
																							<%}%>
																				</td>
								
									<!-- <tr>
																				<td  class="FormLabels" align="left"  colspan="1" width="160px">
																					<bean:message key="Top.AgencyName"/>
																				</td> 
																				<td  class="FormLabels" align="left"  colspan="1" width="220px">
																		
																					<%if(generalagencyid2>0){%>
																						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="true">	
																						<a href="../EditGAgencies.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&ReadOnly=Yes&agencyId=<%=""+generalagencyid2%>&primaryObjectId=<%=""+generalagencyid2%>&primaryObjectType=GENERAL_AGENCY"><%=generalagencyname2%></a>
																						</dmshtml:dms_static_with_connector >
																						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="false">
																						<%=generalagencyname2%>
																						</dmshtml:dms_static_with_connector >
																						
																					<%}%>
																					<%if(dataBaseIdViewPrivillage==1) {%>
																					<%="- "%><%=""+generalagencyid2%>
																					<%}%>
																				</td>
									</tr> -->	
																				<logic:present name="customerDetail1" scope="request">
																					<bean:define id="customerDetailMap" name="customerDetail1"  type="com.dms.ejb.data.QuestionHashMap" />
																					<%customerCreatedDate = customerDetailMap.getString("customerCreatedDate"); %>
																				</logic:present>
																			</tr>
																			
																																						
																			<tr>
																				<td class="FormLabels" align="left" colspan="1">
																					<bean:message key="Top.AgentName"/>
																				</td> 
																				<td class="sectionhead1" align="left" colspan="2">
																					<%if(!strAgentLName.equals("") || !strAgentFName.equals("")){%>
																					<%=strAgentFName%> <%=" "%><%=strAgentLName%>
																					<%}%>
																					<%if(dataBaseIdViewPrivillage==1) {%>
																					<%="- "%><%=""+lngAgentId1%>
																					<%}%>
																				</td>
																			</tr>
																			
																		<!-- 	<tr>
																				<td  class="FormLabels" align="left"  colspan="1" width="160px">
																					<bean:message key="Top.CreatedDate"/>
																				</td>
																				<td class="FormLabels" align="left"  colspan="1" width="220px">
																					<%= customerCreatedDate%>
																				</td>
																			</tr>	 -->
																		</table>
																	</td>
																</tr>
								<!-- GENERAL BLOCK STOP -->
															</table>
															<table WIDTH="770px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">																					
																<tr>
																	<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
																</tr>
															</table>
															</logic:notPresent>																																	
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
	 <!-- ******END********For Agency Header- Copied From AddCustomerBody.jsp********END ***********   -->
									
									
								</td>
							</tr>																							
							<tr>
								<td class="NewSectionHead" colspan="4" align="center">
									Quick Quote
								</td>
							</tr>
							</table>
							<table WIDTH="780px" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td  class="Error">
										<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color: #ff0000;COLOR:ff0000;" styleId="MultipleZipError" disabled="disabled" property="answer(temp)" value="" styleClass="txtbox" readonly="true" size="70" maxlength="70" />		
									</td>
								</tr>
							</table>
							<table WIDTH="780px" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
								<tr>
									<td>
										&nbsp;
									</td>
								</tr>
								<tr>
									<td colspan="2" align="left" class="sectionhead">
										INSURED DETAILS
									</td>
								</tr>
																																								
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CHANGE_INSURED_AGENCY"}%>' connector='or' negated="true">															
								<tr>
									<td width="42%" class="FormLabels" align="left">
										Agency *
									</td>
									<td class="links">										
										<html:text  name="QuickQuote" property ="answer(AgencyName)" value='<%=agencyName2%>' size="35" maxlength="60" styleClass="txtbox" readonly="true" styleId="Agenname" />
										<IMG SRC="../Images/zipcodefind.jpg" border="0" align="top" ALT="Search for Agency." onmouseover="this.style.cursor='hand';" onclick="return GoTOFindButton()">
									</td>
								</tr>								
								</dmshtml:dms_static_with_connector>
							
								
								<tr>
									<td width="42%" class="FormLabels" align="left">
										Insured Name(Last Name, First Name)*
									</td>
									<td class="links">
										<html:text property ="answer(Object::Customer::CustomerName)" name="QuickQuote" size="35" maxlength="60" styleClass="txtbox" styleId="InsuredName" />
										<a href="../customer/InsuredPopUpFind.jsp?answer(AgencyId)=<%=agencytemporaryId %>&FormName=AddParentQuote&answer(requestFrom)=QuickQuote" title="Search for Insured Details" onClick="return InsuredPopup(this, 'InsuredFind');"/><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Insured."></a>
									</td>
								</tr>
							</table>
							<table WIDTH="780px" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">														
							<tr>
								<td colspan="2" id="dwellingHeader" align=""left"" class="sectionhead">
									DWELLING DETAILS
								</td>
							</tr>
							</table>
							<table WIDTH="780px" ALIGN="center" border="0" CELLSPACING="2" CELLPADDING="0">							
							<tr>
								<td width="42%" class="FormLabels" align="left">
									Risk Name
								</td>
								<td class="links" width="16">
									<html:text property="answer(Object::Risk::ResProperty::RiskName)" name="QuickQuote" styleId="riskName" size="20" maxlength="20" styleClass="txtbox" />
								</td>
							</tr>														 
        
       						<!--  tr>
						        <td width="42%" class="FormLabels" align="left">State/City/County</td>
						        
						        <td>
							         <html:select property="answer(Object::Risk::ResProperty::State)" style="border:0px solid #000000;" name="QuickQuote" styleClass="txtbox" styleId="State" >
										<html:option value ="">Select</html:option>
										<html:option value ="DE">Delaware</html:option>
										<html:option value ="DC">District of Columbia</html:option>
										<html:option value ="GA">Georgia</html:option>
										<html:option value ="MD">Maryland</html:option>
										<html:option value ="NJ">New Jersey</html:option>
										<html:option value ="NC">North Carolina</html:option>
										<html:option value ="PA">Pennsylvania</html:option>
										<html:option value ="SC">South Carolina</html:option>
										<html:option value ="VA">Virginia</html:option>
									</html:select>
								</td>
										
						       					        
      						 </tr -->
      						 
      						 <tr>
								<td width="42%" class="FormLabels" align="left">
									Street Number
								</td>
								<td class="links" width="16">
									<html:text property="answer(Object::Risk::ResProperty::StreetNumber)" name="QuickQuote" styleId="streetNumber" size="20" maxlength="20" styleClass="txtbox" />
								</td>
							</tr>	
							<tr>
								<td width="42%" class="FormLabels" align="left">
									Street Name 
								</td>
								<td class="links" width="16">
									<html:text property="answer(Object::Risk::ResProperty::StreetName)" name="QuickQuote" styleId="streetName" size="20" maxlength="20" styleClass="txtbox" />
								</td>
							</tr>	

       						<tr>
						        <td width="42%" class="FormLabels" align="left">Zip Code*</td>
						        <td class="links" >
       								  <html:text property="answer(Object::Risk::ResProperty::Zip)" onblur="getTerritory(this.form)" name="QuickQuote" styleId="Zip" size="10" maxlength="10" styleClass="txtbox"/>
       								  <a href="../SearchZipCode.do?answer(Object::ZipCode::PageNum)=0&FormName=AddParentQuote&HomeFlag=Business&clear=yes&PopupWindowName=Zip Code Search" title="Search for zip code, state, county" onClick="return ZipCodePopup(this, 'ZipCode');"/><IMG SRC="../Images/zipcodefind.jpg"  BORDER="0" align="top" ALT="Search for Zip code, City, State and County."></a>
       								  	<html:hidden property="answer(Object::Risk::ResProperty::State)" name="QuickQuote" styleId="State" />
									  <html:hidden property="answer(Object::Risk::ResProperty::City)"  name="QuickQuote" styleId="City" styleClass="txtbox"  />																
									  <html:hidden property="answer(Object::Risk::ResProperty::CountyName)" name="QuickQuote" styleId="County" styleClass="txtbox"/> 
									  <html:hidden property="answer(Object::Risk::ResProperty::RatingTerritory)" name="QuickQuote" styleClass="txtbox" styleId ="RatingTerritory" />
									  <html:hidden property="answer(Object::Risk::ResProperty::RatingTerritoryName)" name="QuickQuote" styleClass="txtbox" styleId ="RatingTerritoryName" />
									  <html:hidden property="answer(Object::Risk::ResProperty::Zone)" name="QuickQuote" styleClass="txtbox" styleId ="Zone" />
									  <html:hidden property="answer(ownerId)" value="<%=""+ownerId %>" styleId="ownerIdfrmjsp"/>
      							</td>
      							<td align="left" class="FormLabels" id="City1">
      																  		
						       	 </td>
      							
          					</tr>
          							
							<tr>
								<td class="FormLabels">
								<html:text style="display:none; border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color:solid #000000;" styleId="Q1" disabled="disabled" property="answer(Object::Risk::ResProperty::RuleQuestion)" value="Are you in Beach Territory" styleClass="txtbox" size="35" maxlength="35" readonly="true"/>
								</td>
								<td class="TextMatter1">
								<html:select property="answer(Object::Risk::ResProperty::RuleNameGA)" name="QuickQuote" onchange="territoryLookpupForRules(this.form, this.document);" style="display:none;" disabled="disabled" styleClass="txtbox" styleId="Rulename1">
									<html:option value="Beach_Territory_NO">No</html:option>	
									<html:option value="Beach_Territory_YES">Yes</html:option>										
								</html:select>
								</td>
							</tr>
							<tr>
								<td class="FormLabels">
								<html:text style="display:none;border: 0px solid #000000;font-family:Verdana;font-size:11px;FONT-WEIGHT: bold;font-color:solid #000000;" styleId="Q2" disabled="disabled" property="answer(Object::Risk::ResProperty::RuleQuestion)" value="Which Side of the Route 113" styleClass="txtbox" size="35" maxlength="35" readonly="true"/>
								</td>
								<td class="TextMatter1">
								<html:select property="answer(Object::Risk::ResProperty::RuleNameDE)" name="QuickQuote" onchange="territoryLookpupForRules(this.form, this.document);" style="display:none;" disabled="disabled" styleClass="txtbox" styleId="Rulename2">
									<html:option value="">Select</html:option>
									<html:option value="Route_113_EAST">East</html:option>
									<html:option value="Route_113_WEST">West</html:option>		
								</html:select>
								</td>
							</tr>																								
							<tr>
								<td width="42%" class="FormLabels" >Year Built*</td>
								<td class="links">
									<html:text property="answer(Object::Risk::ResProperty::DateBuilt)" name="QuickQuote" styleId="YearBuilt" size="4" maxlength="4" styleClass="txtbox" onblur="displayQuestionForWiringUpdated()" />
									<IMG SRC="../Images/spinner1.gif" style="display:none;"  BORDER="0" align="top" id="territorySpinner">
								</td>
							</tr>
						</table>
						<table WIDTH="780px" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">							
							<tr>
								<td colspan="2" align="left" class="sectionhead">
									ADDITIONAL DWELLING DETAILS
								</td>
							</tr>	
										<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="RENEWAL_REQUIRED" />	
							<tr>
								<td width="42%" class="FormLabels">Type of Residence*</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::ResType)" styleId="ResidenceType" styleClass="txtbox">
										<html:option value="Primary">Primary</html:option>
										<html:option value="Secondary">Secondary</html:option>										
									</html:select>		
								</td>
							</tr>
							
							<tr>
								<td width="42%" class="FormLabels"> Occupancy </td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::Occupancy)" styleId="Occupancy" styleClass="txtbox" onchange="getConstructionTypeByOccupancy(this.form)">
										<html:option value="Owner">Owner</html:option>
										
										<logic:present name="paramValue">
											<logic:equal value="TRUE" name="paramValue">
											    <html:option value="Tenant">Tenant</html:option>
												<html:option value="Vacant">Vacant</html:option>
												<html:option value="Builders Risk">Builders Risk</html:option>
												<html:option value="Other">Other</html:option>
											</logic:equal>
										</logic:present>
									</html:select>
								</td>
							</tr>
							
							<tr id="ConstructionType1" style="display:inline">
								<td width="42%" class="FormLabels" align="left">Construction Type*</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::ConstructionType1)" name="QuickQuote" styleId="constructionType1" styleClass="txtbox" >
										<html:option value="Frame">Frame</html:option>
										<html:option value="Brick">Brick</html:option>										
										<logic:present name="paramValue">
											<logic:equal value="TRUE" name="paramValue">
												<html:option value="Other">Other</html:option>
											</logic:equal>
										</logic:present>		
									</html:select>
								</td>
							</tr>
							<tr id="ConstructionType2" style="display:none">
								<td width="42%" class="FormLabels" align="left">Construction Type*</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::ConstructionType2)" name="QuickQuote" styleId="constructionType2" styleClass="txtbox" >
										<html:option value="Frame">Frame</html:option>
										<html:option value="Masonry">Masonry</html:option>		
									</html:select>
								</td>
							</tr>
							<tr id="ConstructionType3" style="display:none">
								<td width="42%" class="FormLabels" align="left">Construction Type*</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::ConstructionType3)" name="QuickQuote" styleId="constructionType3" styleClass="txtbox" >
										<html:option value="Frame">Frame</html:option>
										<html:option value="Masonry">Masonry</html:option>
										<html:option value="Masonry Non-Comb">Masonry Non-Comb</html:option>
										<html:option value="Mod Fire Resistive">Mod Fire Resistive</html:option>
										<html:option value="Non-Combustible">Non-Combustible</html:option>		
									</html:select>
								</td>
							</tr>
														
							<tr>
								<td width="42%" class="FormLabels" align="left">Protection Class*</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::ProtectionClass)" name="QuickQuote" styleId="ProtectionClass" styleClass="txtbox">
										<html:option value="1">1</html:option>
										<html:option value="2">2</html:option>
										<html:option value="3">3</html:option>
										<html:option value="4">4</html:option>
										<html:option value="5">5</html:option>
										<html:option value="6">6</html:option>
										<html:option value="7">7</html:option>
										<html:option value="8">8</html:option>
										<html:option value="9">9</html:option>
										<html:option value="10">10</html:option>
									</html:select>
								</td>
							</tr>
							<tr>
 								<td class="FormLabels" >Primary Source of Heat*</td>
								<td class="links">
									<html:select property="answer(Object::Risk::ResProperty::HeatSource)" name="QuickQuote" styleId="heatSourceType" styleClass="txtbox" >
										<html:option value="Electrical">Electrical</html:option>
										<html:option value="Oil">Oil</html:option>
										<html:option value="Natural Gas">Natural Gas</html:option>
										<html:option value="Wood">Wood</html:option>
										<html:option value="Wood/Pellet/Kerosene/Coal Burning Stove">Wood/Pellet/Kerosene/Coal Burning Stove</html:option>
										<html:option value="Space heater">Space heater</html:option>
										<html:option value="Other">Other</html:option>
									</html:select>	
								</td>							
							</tr>
							<logic:present name="paramValue">
								<logic:equal value="TRUE" name="paramValue">
					
									<tr id="CostalWaterTemp1" style="display:inline">
										<td class="FormLabels" width="42%">Distance to Coastal Waters* </td>
										<td class="links">	
											<html:select property="answer(Object::Risk::ResProperty::CostalWaterDistance1)" name="QuickQuote" styleId="CostalWaterDistanceTemp1" styleClass="txtbox">
												<html:option value="">Select</html:option>
												<html:option value="500">Within 1000 feet</html:option>
												<html:option value="4000">1001 ft - 1 mile</html:option>
												<html:option value="20000">> 1 mile - 5 miles</html:option>
												<html:option value="30000">5+ miles</html:option>
											</html:select>
										</td>	
									</tr>
									
									
									<tr id="CostalWaterTemp2" style="display:none">
										<td class="FormLabels" width="42%">Distance to Coastal Waters* </td>
										<td class="links">	
											<html:select property="answer(Object::Risk::ResProperty::CostalWaterDistance2)" name="QuickQuote" styleId="CostalWaterDistanceTemp2" styleClass="txtbox">
												<html:option value="">Select</html:option>
												<html:option value="25000">< 3 miles</html:option>
												<html:option value="50000">3-10 miles</html:option>
												<html:option value="100000">1st tier county >10 miles</html:option>
												<html:option value="-1">2nd tier county</html:option>
											</html:select>
										</td>	
									</tr>
									
									<tr id="CostalWaterTemp3" style="display:none">
										<td class="FormLabels" width="42%">Distance to Coastal Waters* </td>
										<td class="links">	
											<html:select property="answer(Object::Risk::ResProperty::CostalWaterDistance3)" name="QuickQuote" styleId="CostalWaterDistanceTemp3" styleClass="txtbox">
												<html:option value="">Select</html:option>
												<html:option value="60000">Within 1000 feet</html:option>
												<html:option value="4000">1001 ft - 1 mile</html:option>
												<html:option value="20000">> 1 mile - 5 miles</html:option>
												<html:option value="21000">5+ miles</html:option>
											</html:select>
										</td>	
									</tr>
									
									<tr id="CostalWaterTemp4" style="display:none">
										<td class="FormLabels" width="42%">Distance to Coastal Waters* </td>
										<td class="links">	
											<html:select property="answer(Object::Risk::ResProperty::CostalWaterDistance4)" name="QuickQuote" styleId="CostalWaterDistanceTemp4" styleClass="txtbox">
												<html:option value="">Select</html:option>
												<html:option value="5000">< 2 Miles</html:option>
												<html:option value="55000">2+ Miles</html:option>
											</html:select>
										</td>	
									</tr>
									
									<tr id="CostalWaterTemp5" style="display:none">
										<td class="FormLabels" width="42%">Distance to Coastal Waters* </td>
										<td class="links">	
											<html:select property="answer(Object::Risk::ResProperty::CostalWaterDistance5)" name="QuickQuote" styleId="CostalWaterDistanceTemp5" styleClass="txtbox">
												<html:option value="">Select</html:option>
												<html:option value="5000">< 2 Miles</html:option>
												<html:option value="55000">2-10 Miles</html:option>
												<html:option value="25000">10-25 Miles</html:option>
												<html:option value="15000">25+ Miles</html:option>
											</html:select>
										</td>	
									</tr>
									
									<tr id="CostalWaterTemp6" style="display:none">
										<td class="FormLabels" width="42%">Distance to Coastal Waters* </td>
										<td class="links">	
											<html:select property="answer(Object::Risk::ResProperty::CostalWaterDistance6)" name="QuickQuote" styleId="CostalWaterDistanceTemp6" styleClass="txtbox">
												<html:option value="">Select</html:option>
												<html:option value="5000">< 1 Miles</html:option>
												<html:option value="55000">1-5 Miles</html:option>
												<html:option value="25000">5-25 Miles</html:option>
												<html:option value="15000">25+ Miles</html:option>
											</html:select>
										</td>	
									</tr>
									
									<tr id="CostalWaterTemp7" style="display:none">
										<td class="FormLabels" width="42%">Distance to Coastal Waters* </td>
										<td class="links">	
											<html:select property="answer(Object::Risk::ResProperty::CostalWaterDistance7)" name="QuickQuote" styleId="CostalWaterDistanceTemp7" styleClass="txtbox">
												<html:option value="">Select</html:option>
												<html:option value="25000">< 2 miles</html:option>
												<html:option value="50000">2-10 miles</html:option>
												<html:option value="100000">1st tier county >10 miles</html:option>
												<html:option value="-1">2nd tier county</html:option>
											</html:select>
										</td>	
									</tr>
									
									
								</logic:equal>
							</logic:present>
							<logic:present name="paramValue">
								<logic:equal value="FALSE" name="paramValue">
							
									<tr id="CostalWaterTemp7" style="display:inline">
										<td class="FormLabels" width="42%">Distance to Coastal Waters* </td>
										<td class="links">	
											<html:select property="answer(Object::Risk::ResProperty::CostalWaterDistance7)" name="QuickQuote" styleId="CostalWaterDistanceTemp7" styleClass="txtbox">
												<html:option value="">Select</html:option>
												<html:option value="6000">< 2,500 Feet</html:option>
												<html:option value="7000">2,500+ Feet</html:option>
											</html:select>
										</td>	
									</tr>
								</logic:equal>
							</logic:present>		
							<tr>
								<td class="FormLabels" >Distance to Fire Hydrant</td>
								<td class="TextMatter1">
									<html:text property="answer(Object::Risk::ResProperty::FireHydrantDistance)" name="QuickQuote" size="6" maxlength="6" styleId="FireHydrant" styleClass="txtbox" />&nbsp;feet
								</td>
							</tr>
						</table>
						<table WIDTH="780px" style="display:none" id="questionForWiringUpdated" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">
							<tr>
								<td class="FormLabels" width="42%">
									 i) Has the wiring, heating, and plumbing <br>been fully updated in the past years?
								 </td>
								 <td class="TextMatter1" align="left">
								 	<html:radio value="Y" property="answer(Object::Risk::ResProperty::IsWiringUpdated)" name="QuickQuote" onclick="wiringEnable(this.form,this.document)" styleId="wiringUpdatedYes">Yes</html:radio>
								 	<html:radio value="N" property="answer(Object::Risk::ResProperty::IsWiringUpdated)" name="QuickQuote" onclick="wiringDisable(this.form,this.document)" styleId="wiringUpdatedNo">No</html:radio>
								 </td>
							</tr>
											
							<tr>
								<td class="FormLabels" align="left" width="42%">&nbsp;&nbsp;a)&nbsp;Wiring</td>
								<td class="links" align="left">
									<html:text property="answer(Object::Risk::ResProperty::WiringUpdated)" name="QuickQuote" styleId="WiringUpdated" size="4" maxlength="4" styleClass="txtbox" />
								</td>
							</tr>
							<tr>
								<td class="FormLabels" align="left" width="42%">&nbsp;&nbsp;b)&nbsp;Heating</td>
								<td class="links" >
									<html:text property="answer(Object::Risk::ResProperty::HeatingUpdated)" name="QuickQuote" styleId="heatingUpdated" size="4" maxlength="4" styleClass="txtbox"  />
								</td>
							</tr>
														
							<tr>
								<td class="FormLabels" align="left" width="42%">&nbsp;&nbsp;c)&nbsp;Plumbing</td>
								<td class="links">
									<html:text property="answer(Object::Risk::ResProperty::PlumbingUpdated)" name="QuickQuote" styleId="plumbingUpdated" size="4" maxlength="4" styleClass="txtbox" />
								</td>
							</tr>	
							
							<tr>
								<td class="FormLabels" width="42%">
									 ii) The roof been updated in the last 25 years?
								 </td>
								 <td class="TextMatter1" align="left">
								 	<html:radio value="Y" property="answer(Object::Risk::ResProperty::IsRoofUpdated)" name="QuickQuote" onclick="roofEnable(this.form,this.document)" styleId="roofUpdatedYes">Yes</html:radio>
								 	<html:radio value="N" property="answer(Object::Risk::ResProperty::IsRoofUpdated)" name="QuickQuote" onclick="roofDisable(this.form,this.document)" styleId="roofUpdatedNo">No</html:radio>
								 </td>
							</tr>
														
							<tr>
								<td class="FormLabels" align="l" width="42%">&nbsp;&nbsp;a)&nbsp;Roof</td> 
								<td class="links">
									<html:text property="answer(Object::Risk::ResProperty::RoofUpdated)" name="QuickQuote" styleId="roofUpdated" size="4" maxlength="4" styleClass="txtbox"  />
								</td>
							</tr>																				
						</table>	
						<table WIDTH="780px" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">							
							<tr>
								<td colspan="2" align="left" class="sectionhead">
									CLAIMS DETAILS
								</td>
							</tr>	
						</table>						
						<table WIDTH="780px" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">		
							<tr>
								<td class="links">
								<a href="javascript:;" onclick="getClaimDetail()">Add Claim Details</a>
								</td>
							</tr>											
							<tr>
								<td class="FormLabels" width="42%" align="left">
									# of claims in the past 3 years
								</td>
								<td class="links" align="left">
									<html:text property="answer(Object::Risk::ResProperty::NumberOfClaims)" name="QuickQuote" size="5" maxlength="5" styleId="claimInLast3Years" styleClass="txtbox"  />
								</td>
							</tr>
							
							<tr>
								<td class="FormLabels" align="left">
									Any 1 claim > $10,000?
								</td>
								
								<td class="TextMatter1">
									<html:radio value="Y" name="QuickQuote" property="answer(Object::Risk::ResProperty::ClaimGTAmount)">Yes</html:radio>
									<html:radio value="N" name="QuickQuote" property="answer(Object::Risk::ResProperty::ClaimGTAmount)" styleId="ClaimGTAmount">No</html:radio>
								</td>
							</tr>							
						</table>	
						<table WIDTH="780px" ALIGN="center" border="0"CELLSPACING="2" CELLPADDING="0">														
							<tr>
								<td id="losshistoryheading" align="left" width="100%">
									
								</td>
							</tr>
							<tr>
								<td id="losshistory" width="780px">
									<html:hidden property="answer(claimcount)" styleId="claimcount" value="0"/>
								</td>
							</tr>																									
						</table>
						<table WIDTH="800px" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td align="center">
								<html:submit value="Next" property="answer(button)" styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/>								
							</td>
						</tr>
						
						</table>	
				  	</td>
				</tr>
				
				<% String riskTypeId = ""; %>
 					<dmshtml:GetRiskTypeId nameInSession="riskTypeIds" riskType="Residential" ownerId='<%=""+ownerId%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" />
 					<logic:present name="riskTypeIds" scope="request">
 					<bean:define id="riskTypeId1" name="riskTypeIds"/>
 					<%riskTypeId = ""+riskTypeId1;%>
 				</logic:present>

				<tr>
					<td>
			
						<html:hidden property="answer(Object::Risk::ResProperty::CostalWaterDistance)" name="QuickQuote" styleId="CostalWaterDistance" />
						<html:hidden property="answer(Object::Risk::ResProperty::ConstructionType)" name="QuickQuote" styleId="ConstructionType" />
						<html:hidden property="answer(Object::Risk::ResProperty::NumberOfFamilies)" value="1" />
						<html:hidden property="answer(agencylookup)" name="QuickQuote" styleId="agencyLookup" />
						<html:hidden property="answer(Object::Plan::SeasonalSurcharge)" value="No" />						
						<html:hidden property="answer(Object::Plan::FireAlarm)" value="N" />
						<html:hidden property="answer(Object::Plan::BurglaryAlarm)" value="N" />
						<html:hidden property="answer(Object::Plan::Bankruptcy)" value="N" />
						<html:hidden property="answer(Object::Plan::Foreclosure)" value="N" />
						<html:hidden property="answer(Object::Risk::ResProperty::SwimmingPoolAnfFenceType)" value="No" />
						<html:hidden property="answer(Object::Risk::ResProperty::RiskType)" value="Residential"/>
						<html:hidden property="answer(Object::Risk::ResProperty::ElectricSerciveType)" value="Circuit Breaker"/>
						<html:hidden property="answer(NewClaimWithoutAdd)" styleId="NewClaim"/>	
						
						<html:hidden property="answer(Object::Risk::ResProperty::RuleCheck)" styleId="ruleCheck" value="AddN"/>
						<html:hidden property="answer(Object::Risk::ResProperty::Zip)" name="QuickQuote" styleId="zipChange"/>
						<html:hidden property="answer(Object::Risk::ResProperty::PageRefresh)" styleId="pageRefreshCheck" value="N"/> 
						<html:hidden property="answer(Object::Risk::ResProperty::Active)" value="Y"/>
						<html:hidden property="answer(cityCountyEmpty)" styleId="cityCountyEmpty" value="<%=""+request.getAttribute("cityCountyEmpty")%>"/>
						<html:hidden property="answer(MultipleZIP)" styleId="reqVal" value="NO"/>
						<html:hidden property="answer(FromRiskJsp)" value="YES"/>
						<html:hidden property="answer(zipvalidation)" styleId="isValidZip" value="YES" />
						<html:hidden property="answer(requestFrom)" value="QuickQuote"/>	
						<html:hidden property="answer(Object::Risk::ResProperty::Address1)" styleId="riskAdd1"/>													
						
					<!-- Parameters need for Product Browsw Page -->	
						<bean:define id="ObjectId" property="answer(Object::UserDetail::PrimaryObjectId)" name="LoginPage" scope="session"/>
						
					 	<html:hidden property="answer(Object::Customer::CustomerId)" styleId="quickQuoteCustomerId" value="0" />						
						<html:hidden property="answer(Object::Quote::primaryEntityId)" value="<%=""+ObjectId %>" /> 
						<html:hidden property="answer(createQuoteEffectiveDate)" value="yes" />
						<html:hidden property="answer(Object::Quote::QuoteStatus)" value="In Progress" />
						<html:hidden property="answer(Object::Quote::OwnerId)" value="<%=ownerId.toString()%>" />
						<html:hidden property="answer(Object::Risk::RiskId)" value="<%=""+riskTypeId%>"/>
						<html:hidden property="formName" value="<%= "form::ADDQUOTEDETAILSALLRISKFORQUICKQUOTE_"+ownerId.toString()%>" />
						<html:hidden property="answer(formname)" value="<%="form::ADDQUOTEDETAILSALLRISKFORQUICKQUOTE_"+ownerId.toString()%>" />						
						<html:hidden property="answer(claimHtml)" name="QuickQuote" styleId="claimHtml"/>		
						<html:hidden property="answer(Object::Risk::InsuranceTypeId)" value="0" />
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					<!-- ****START***For Insured in formation**START*** -->	
					
						<html:hidden name="QuickQuote" property="answer(AgentId)" value="<%=""+lngAgentId1%>" />
									
												
						<%if(agencyId2>0){%>
							<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=""+agencyId2%>" />
							<html:hidden property="answer(Agency::AgencyId)" value="<%=""+agencyId2%>" />
						<%}%>
						
						<html:hidden property="answer(GeneralAgency::AgencyId)" value="<%=""+generalagencyid2%>" />
					<!-- ****END****For Insured in formation****END*** -->		
																				
 					</td>
 				<tr>
 			</table>	
		
		<!-- End -->
			
	  	</td>
	</tr>
</table>
</html:form>
<script type="text/javascript">
setDefault();
</script>