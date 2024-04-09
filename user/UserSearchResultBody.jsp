<%/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.net.URLEncoder" %>
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

	<tr><td>&nbsp;</td></tr>
	
	<tr><td class="MH">
		USER ACCOUNTS
	</td></tr>
	
	<tr><td class="TextMatter">
		Use this page to view and edit user accounts
	</td></tr>
	
	<tr><td>
	<hr size="1" noshade >
	</td></tr>
	
	<tr>
		<td>
			<table WIDTH="95%" ALIGN="center" cellspacing=0 cellpadding="2">
				<!-- <tr><td class="links"><img SRC="../Images/rtg_rate.gif">&nbsp;&nbsp;<a href="../AddUserAccountLink.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&clear=yes"/><bean:message key="UserAccounts.AddUserAccount"/></td></tr>
				<tr><td>&nbsp;</td></tr> -->
				
				<tr>
					<td>
						<table WIDTH="90%" ALIGN="center" cellspacing=1 cellpadding="2" border="0">
							<tr>
								<td class="FormLabels" colspan="8">
								
									<bean:define id="roleId" name="FindUsers" property="answer(Object::UserDetail::Equals::primaryRoleId)"/>
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=a&answer(Object::UserDetail::Equals::primaryRoleId) = <%=""+roleId%>">A</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=b&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">B</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=c&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">C</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=d&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">D</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=e&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">E</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=f&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">F</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=g&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">G</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=h&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">H</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=i&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">I</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=j&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">J</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=k&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">K</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=l&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">L</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=m&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">M</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=n&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">N</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=o&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">O</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=p&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">P</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=q&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">Q</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=r&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">R</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=s&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">S</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=t&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">T</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=u &answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">U</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=v&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">V</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=w&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">W</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=x&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">X</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=y&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">Y</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)=z&answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">Z</A>&nbsp;
									<A href="../FindAUser.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::UserDetail::Like::userName)= &answer(Object::UserDetail::Equals::primaryRoleId) =<%=""+roleId%>">ALL</A>&nbsp;
														

					
								</td>
							</tr>
							
							<logic:present name ='UsersDisplay' scope ='session'>
								<tr><td colspan="6" >&nbsp;</td></tr>
								<tr><td align="center" class="Error" colspan="6"><bean:message key="UserAccounts.ExistingUsers"/>
								</td></tr>
							</logic:present>

							<logic:notPresent name ='UsersDisplay' scope ='session'>
								<tr><td colspan="6" >&nbsp;</td></tr>
								<tr><td class="Error">No Matching Records Found.
								</td></tr>
							</logic:notPresent>
							
							<tr><td class="TextMatter" colspan="6"><b>
								<logic:present name ='usersSize' scope ='session'>
								<bean:message key="UserAccounts.AllUsersCount"/>
 											&nbsp;&nbsp;<%=session.getAttribute("usersSize").toString()%></b>
								</logic:present>
							</td></tr>
							
							<logic:present name ='UsersDisplay' scope ='session'>
								<tr><td><html:form action="/FindUser"></html:form>
								<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
								</td></tr>
								
								<tr>
									<td  class="links"  colspan="3">
										<logic:present name="minimumValueUserLogs"  scope="session" >
											<a href="../NavigateUserSearchResultAction1.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=de&index=<bean:write 
													name='minRangeUserLogs' scope='session'/>">&nbsp;Previous&nbsp;</a>
										</logic:present>
									</td>
									
									<td align="right" class="links" colspan="3">
										<logic:present name="maxRangeUserLogs"  scope="session" >
											<a href="../NavigateUserSearchResultAction1.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=incre&index=<bean:write 
											name='maxRangeUserLogs' scope='session'/>">&nbsp;Next&nbsp;</a>
										</logic:present>
									</td>
								</tr>
	
								<tr>
									<td colspan="6" >&nbsp;</td>
								</tr>

								<tr>
     								 <td class="sectionhead" width="5">
     								 <bean:message key="GeneralAgencies.SlNo"/>
	 								 </td>
	 								 
									<td class="sectionhead" width="25%">
									<bean:message key="UserAccounts.Name" /></td>
									<td class="sectionhead" width="35%">
										E-Mail Id
									</td>
									<td class="sectionhead" width="30%">
										Role Name
									</td>
  								</tr>
				
							    <% int i=1; %>
	 
	 							 <logic:present name="minimumValueUserLogs" scope="session">
								 <bean:define id="slno" name='minRangeUserLogs' scope='session' />
									  <%
										try
										{
											i=Integer.parseInt(slno.toString());
											if(i!=1)
											{
												i++;
											}
										}
										catch(NumberFormatException nfe)
										{
											i=1;
										}
								
									  %>
								</logic:present>

	  							<logic:iterate id="UsersDisplay" name="UsersDisplay" scope="session" type="com.dms.ejb.user.UserDetail">
									<tr>
										<td class="SearchResult">
											<%= i %>
											<% i++;%>
										</td>
										<td class="SearchResult">
											<% boolean isUWAccount = true;%>
											<bean:define id="userId" name="UsersDisplay" property="id" />

											<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"BRANCH_INFORMATION_AVALIBLE"}%>' connector='or' negated="true">											
												<bean:define id="roleID" name="UsersDisplay" property="primaryRoleId"/>
		
												<%long lgRoleId=Long.parseLong(roleID.toString());%>

												<dmshtml:get_Role_Description_ByRoleId nameInRequest="roleDetail" ownerId="<%=Long.parseLong(""+ownerId) %>" roleId="<%=lgRoleId%>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>

													<logic:present name="roleDetail" scope="request">
														<bean:define id="roleDecription" name="roleDetail" property="roleDesc"/>
														<%if(roleDecription.toString().equalsIgnoreCase("Underwriter")) {%>
															<a href="/EditUWUserAccount.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&userId=<%=URLEncoder.encode(userId.toString())%>"  title="Click to change the underwriter user's account information">
																<bean:write name="UsersDisplay" property="id" />
															</a>
															<% isUWAccount = false; %>
														<% } %>
													</logic:present>
											
											</dmshtml:dms_static_with_connector>
											
											

											<%if(isUWAccount){ %>
												<a href="/EditUserAccount.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&userId=<%=URLEncoder.encode(userId.toString())%>"  title="Click to change the user's account information">
													<bean:write name="UsersDisplay" property="id" />
												</a>
											<%} %>
											
										</td>

										<td class="SearchResult">
										 	<bean:define id="EmailId" name="UsersDisplay" property="emailId" />
											<%=EmailId.toString()%>&nbsp; 
										</td>

										<td class="SearchResult">
													<logic:present name="roleDetail" scope="request">
														<bean:define id="roleDecription" name="roleDetail" property="roleDesc"/>
														<%=roleDecription.toString()%>
													</logic:present>	
										</td>
									</tr>
								</logic:iterate>
		
								<tr><td colspan="6" >&nbsp;</td></tr>

								<tr>
									<td  class="links" colspan="3">
		
										<logic:present name="minimumValueUserLogs"  scope="session" >

											<a href="../NavigateUserSearchResultAction1.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=de&index=<bean:write 
											name='minRangeUserLogs' scope='session'/>">&nbsp;Previous</a>
		
		
										</logic:present>
									</td>
									
									<td align="right" class="links" colspan="3" >
										<logic:present name="maxRangeUserLogs"  scope="session" >
											<a href="../NavigateUserSearchResultAction1.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&flag=incre&index=<bean:write
											 name='maxRangeUserLogs' scope='session'/>">Next &nbsp;</a>
										</logic:present>
									</td>
								</tr>
							
						</logic:present>
					</table>
				</td></tr>

				<tr><td>&nbsp;</td></tr>
			</table>
		</td>
	</tr>
</table>