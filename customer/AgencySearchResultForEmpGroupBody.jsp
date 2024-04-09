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

		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:form action="/LinkAgenttoEmpGroupAction.do">
	<table WIDTH="700px" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr><td height="0"><html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/></td></tr>
		<tr><td height="0"><html:hidden property="formName" value="form::SEARCHAGENT" /></td></tr>

		<tr><td  height="0"><jsp:include page="../common/CustomerAgencyLinkspage.jsp" /></td></tr>

		<tr><td height="5"></td></tr>
		<tr>
			<td class="NewSectionHead" colspan="4" align="center">AGENCIES FOUND IN SEARCH</td>
		</tr>


		<!-- br -->
		<tr><td>&nbsp;</td></tr>
		<tr><td class="FormLabels" colspan="4"><b>

			<bean:define id="pagenum" name='pagenum' scope='request'/>
			<bean:define id="totpagenum" name='totpagenum' scope='request'/>
			<%String strcnt="";%>
			<logic:present name ='countSearchResult' scope ='request'>
				<bean:define id="countSearchResult1" name="countSearchResult" scope="request"/>
				<%strcnt=""+countSearchResult1;%>
			</logic:present>
		</b></td></tr>



		<logic:present name ='searchresultnewDisplay' scope ='request'>
		<tr><td class="sectionhead" >
			<b>Total Number of Agencies Found &nbsp;&nbsp;<%=strcnt%></b>
		</td></tr>

		<tr><td class="sectionhead"  align="center">
			page <%=(Integer.parseInt(""+pagenum)+1)%> of <%=(Integer.parseInt(""+totpagenum))%>
		</td></tr>


		<tr><td>

			<table WIDTH="75%" ALIGN="Left" cellspacing=0 cellpadding="2" border="0">
			
				<bean:define id="pagenum" name='pagenum' scope='request'/>
				<bean:define id="totpagenum" name='totpagenum' scope='request'/>
				<tr><td>&nbsp;</td></tr>
	
				<tr>
					<td align="right" colspan="4">
						<html:submit value="Select" property="answer(Select)" styleClass="sbttn"/>
					</td>
				</tr>
	
	
				<tr>
					<td align="Left" class="links" colspan="2" >
						<logic:present name="firstAgency"  scope="request" >
							<a href="../AgencySearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=0">&lt;&lt;First</a>
						</logic:present>&nbsp;&nbsp;
						<logic:present name="prevAgency"  scope="request" >
							<a href="../AgencySearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>"><bean:message key="Common.Previous"/></a>
						</logic:present>
					</td>
					
					<td align="right" class="links" colspan="2">
						<logic:present name="moreAgency"  scope="request" >
							<a href="../AgencySearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>">Next&gt;&gt;</a>
						</logic:present>&nbsp;&nbsp;
						<logic:present name="lastAgency"  scope="request" >
							<a href="../AgencySearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+totpagenum)-1)%>">Last&gt;&gt;</a>
						</logic:present>   
					</td>
				</tr>


				<tr >
			     		<td class="sectionhead" width="10%">
			      			<bean:message key="CustomerSearchResult.SlNo"/>
					</td>
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
					 	 <td class="sectionhead" width="20%">Agency Id
						 </td>
					</dmshtml:dms_static_with_connector>
					<td class="sectionhead" width="50%">Agency Name
					</td>
					
					<td class="sectionhead" width="10%">State
					</td>
					
					<td class="sectionhead" width="10%">Select
					</td>
				</tr>
				<% int i=0;%>
				
				<%
				String pageNum = (String)request.getAttribute("pagenum");
				try{
				    i=Integer.parseInt(pageNum);
						i = i * 20;
				  }catch(NumberFormatException nfe)
				  {
					  i=0;
				  }
				
				%>
				
				<% boolean checked=false; %>
				

				<logic:iterate id="qmap" name="searchresultnewDisplay" scope="request" type="com.dms.ejb.data.QuestionHashMap">
				<tr>
					<td class="SearchResult">
					  	 <%=++i%>
						<bean:define id="agencySel" name="AddCustomer" property="answer(Agency::AgencyId)" scope="session"/>
						
						<%	  
						if(agencySel.toString().equals(""))
						{
						if(i==1)
						    
							       {
							          checked=true ;
						
							       }
						else{
						    checked=false;
						}
						}

						   %>
						
					</td>
					
					<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
						<td class="SearchResult">
							<%	
							if(!agencySel.toString().equals(""))
							{
							if(Long.parseLong(agencySel.toString()) !=Long.parseLong(qmap.getString("Object::AGENCY::AGENCYID")) )
							{
							if(i==1)
							    
								       {
								          checked=true ;
							
								       }
							else{
							    checked=false;
							}
							}
							}
	   						%>
		
	
							<%=qmap.getString("Object::AGENCY::AGENCYID")%>
						</td> 
					</dmshtml:dms_static_with_connector>
					<td class="SearchResult" >
						<!--bean:write name="agencysearchresult" property="businessName" /-->
						<%=qmap.getString("Object::AGENCY::BUSINESSNAME")%>
					</td>
					<td class="SearchResult" >
						<!--bean:write name="agencysearchresult" property="businessName" /-->
						<%=qmap.getString("Object::AGENCY::AddressState")%>
					</td>

					<td class="SearchResult" align="center" >
						<%
					       		if(checked) { 
					        %> 
						<INPUT TYPE="radio" name="answer(Agency::AgencyId)" value="<%=qmap.getString("Object::AGENCY::AGENCYID")%>"  checked />
					        <%
					                }else {
					        %> 
						<html:radio property="answer(Agency::AgencyId)" value="<%=qmap.getString("Object::AGENCY::AGENCYID")%>" >
						</html:radio>
				                <%
				                        }
				                %>
					</td>
	
				</tr>
				</logic:iterate>
				
				<tr><td colspan="2" >&nbsp;</td></tr>
				<tr>
					<td align="left" class="links" colspan="3"></td>
					<td align="right" class="links" colspan="3"></td>
				</tr>


<!--  -->
				<tr>
					<td align="Left" class="links" colspan="2">
						<logic:present name="firstAgency"  scope="request" >
							<a href="../AgencySearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=0">&lt;&lt;First</a>
						</logic:present>&nbsp;&nbsp;
						<logic:present name="prevAgency"  scope="request" >
							<a href="../AgencySearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>"><bean:message key="Common.Previous"/></a>
						</logic:present>
					</td>
				
					<td align="right" class="links" colspan="2">
						<logic:present name="moreAgency"  scope="request" >
							<a href="../AgencySearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>">Next&gt;&gt;</a>
						</logic:present>&nbsp;&nbsp;
						<logic:present name="lastAgency"  scope="request" >
							<a href="../AgencySearchAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+totpagenum)-1)%>">Last&gt;&gt;</a>
						</logic:present> 
					</td>
				</tr>
<!--  -->

				<tr>
					<td align="right" colspan="4">
						<dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>&nbsp;&nbsp;<html:submit value="Select" property="answer(Select)" styleClass="sbttn"/>
					</td>
				</tr>


			</table>
		</td></tr>

			<tr><td>&nbsp;</td></tr>	

			</logic:present>

			<logic:notPresent name ='searchresultnewDisplay' scope ='request'>
				<tr>
					<td class="Error" >No agency Found</td>
				<tr>
				<tr>
					<td align="center"><dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/></td>
				</tr>
			</logic:notPresent>
		
	</table>
 <bean:define id="Customerid" name="AddCustomer" property="answer(Object::Customer::CustomerId)" /> 


  <html:hidden property="answer(Object::Customer::CustomerId)" value="<%=Customerid.toString()%>" />
  <html:hidden property="answer(1*Entity::Equals::SearchObjectType)" value="AGENCY" />
   
  <html:hidden property="entityType" value="AGENT" />
  <html:hidden property="answer(Object::UserDetail::ownerId)" value='<%=""+ownerId %>' />	

	<html:hidden property="LimitSearch" value="yes" />
	<html:hidden property="answer(Entity::orderBy)" value="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID " />
	<html:hidden property="answer(Object::Entity::PageNum)" value="0"/>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
  
</html:form>
