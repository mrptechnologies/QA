<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<SCRIPT SRC="../Scripts/JScripts/ListOfEmployees.js" type="text/javascript"></SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/Common.js" type="text/javascript"></SCRIPT>


<bean:define id="totRecCount" value="" />
<bean:define id="actionToGo" value="QuickAllEmployees.do" />
<logic:present name="SEARCH_COUNT" scope="request">
	<bean:define id="totRecCount" name="SEARCH_COUNT" scope="request" type="java.lang.String" />
	<bean:define id="actionToGo" value="SearchEmployees.do" />
</logic:present>

<%
                // this will preserve the search criteria when doing sort
                String qstr = "";
                String cusId = "";
                if (request.getParameter("customerId") != null)
                    cusId = request.getParameter("customerId");
                else
                    cusId = request.getParameter("answer(Object::Customer::CustomerId)");
                qstr = qstr + "customerId=" + cusId;
                qstr = qstr + "&answer(Object::Customer::CustomerId)=" + cusId;
                qstr = qstr + "&answer(Object::Employee::customerId)=" + cusId;
                qstr = qstr + "&answer(Object::Agency::AgencyId)="
                        + request.getParameter("answer(Object::Agency::AgencyId)");
                qstr = qstr + "&answer(Object::UserDetail::ownerId)="
                        + request.getParameter("answer(Object::UserDetail::ownerId)");
                qstr = qstr + "&dbname=" + request.getParameter("dbname");
                qstr = qstr + "&answer(Object::Employee::PageNum)="
                        + request.getParameter("answer(Object::Employee::PageNum)");
                qstr = qstr + "&answer(Object::Employee::fname)="
                        + request.getParameter("answer(Object::Employee::fname)");
                qstr = qstr + "&answer(Object::Employee::lname)="
                        + request.getParameter("answer(Object::Employee::lname)");
                qstr = qstr + "&answer(Object::Employee::gender)="
                        + request.getParameter("answer(Object::Employee::gender)");
                qstr = qstr + "&answer(Object::Employee::Age)="
                        + request.getParameter("answer(Object::Employee::Age)");
                qstr = qstr + "&answer(Month)=" + request.getParameter("answer(Month)");
                qstr = qstr + "&answer(Date)=" + request.getParameter("answer(Date)");
                qstr = qstr + "&answer(Year)=" + request.getParameter("answer(Year)");
                qstr = qstr + "&answer(Object::Employee::healthCareOption)="
                        + request.getParameter("answer(Object::Employee::healthCareOption)");
                qstr = qstr + "&answer(Object::Employee::numOfChildren)="
                        + request.getParameter("answer(Object::Employee::numOfChildren)");
                qstr = qstr + "&answer(Object::Employee::medicarePrimary)="
                        + request.getParameter("answer(Object::Employee::medicarePrimary)");
                qstr = qstr + "&answer(dbname)=" + request.getParameter("answer(dbname)");
                qstr = qstr + "&answer(Object::Employee::PageNum)="
                        + request.getParameter("answer(Object::Employee::PageNum)");
                //	qstr=qstr+"&answer(submitType)="+request.getParameter("answer(submitType)");
                qstr = qstr + "&answer(Object::Employee::TotalSearchCount)=" + totRecCount;

                String sortStr = "";
                sortStr = sortStr + "answer(sort)=" + request.getParameter("answer(sort)");
                sortStr = sortStr + "&answer(order)=" + request.getParameter("answer(order)");
%>

<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td><jsp:include page="../common/CustomerAgencyLinkspage.jsp"/></td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td class="NewSectionHead" align="center">EMPLOYEE CENSUS</td>
	</tr>
	<tr>
		<td height="8px"></td>
	</tr>

	<tr>
		<bean:parameter id="custid" name="answer(Object::Customer::CustomerId)" />
		<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
		<bean:parameter id="ownerId" name="answer(Object::UserDetail::ownerId)" />
		<td class="links" align="left">
		<a href="../GetCustomerAction.do?TabPanelName=Insured_Panel&customerId=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>"
			title="Click to go to Customer Summary Page" />Summary</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href='../AllQuotes.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>'
			title="Click to go to Quotes" />Quotes</a></td>
	</tr>

	<tr>
		<td height="8px"></td>
	</tr>

	<tr>
		<td valign="top">
		<html:form action="/AddEmployee" onsubmit="return validateFields()">
		<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td class="FormLabels" colspan="6">
				<logic:present name="countSearchResult">
					<bean:define id="countSearchResult1" name="countSearchResult" />
						<logic:notEmpty name="countSearchResult">
							<logic:greaterThan name="countSearchResult1" value="0">
								<b>Total Number of Employees &nbsp;&nbsp;<%=countSearchResult1.toString()%></b>
							</logic:greaterThan>
							<logic:equal name="countSearchResult1" value="0">
								<span class="Error">Currently no employees are listed</span>
							</logic:equal>
						</logic:notEmpty>
						<logic:empty name="countSearchResult">
							<span class="Error">Currently no employees are listed</span>
						</logic:empty>
				</logic:present>
				
				<logic:notPresent name='countSearchResult'>
					<span class="Error">Currently no employees are listed</span>
				</logic:notPresent></td>
			</tr>
			<tr>
				<td class="FormLabels" colspan="6">
				
					<logic:present name='AddEmp'>
						<%
						boolean errorOccured = false;
						%>
						<bean:define id="ansmap" name="AddEmp" property="answerMap" type="com.dms.ejb.data.QuestionHashMap" />
							<logic:iterate id="element" name="ansmap">
								<bean:define id="errorListkey" name="element" property="key" />
									<logic:equal name="errorListkey" value="Object::error::list">
										<bean:define id="errorListvalue" name="element" property="value" />
											<logic:iterate id="errmsg" name="errorListvalue">
												<tr>
													<td class="Error" colspan="5"><bean:write name="errmsg" property="errorMessage" /> <% errorOccured = true;%>
													</td>
												</tr>
											</logic:iterate>
									</logic:equal>
								</logic:iterate>
							<%
                            if (errorOccured) {
                            ((com.dms.ejb.data.QuestionHashMap) ansmap)
                                    .remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
                            ((com.dms.ejb.data.QuestionHashMap) ansmap)
                                    .remove(com.dms.util.Constants.OBJECT_ERROR_LIST);
                        }
						%>

						<%
						session.removeAttribute("AddEmp");
						%>
					</logic:present>

					<tr>
						<td valign="top">
						<table width="100%" align="left" border="0" CELLSPACING="1"	CELLPADDING="2">
							<tr>
								<td class="sectionhead" align="left" height="25" width="20%">First Name</td>
								<td class="sectionhead" align="left" height="25" width="20%">Last Name</td>
								<td align="left" class="sectionhead" height="25" width="5%">
									<bean:message key="EmployeeDetails.Gender" />*&nbsp;
								</td>
								<td class="sectionhead" align="left" height="25" width="20%">Age*</td>
								<td class="sectionhead" align="left" height="25" width="20%">DOB(mm/dd/yyyy)</td>
								<td class="sectionhead" align="left" height="25" width="25%">Health Plan Coverage Election</td>
								<td class="sectionhead" align="left" height="25" width="5%">No of Children*</td>
							</tr>

							<tr>
								<td class="links">
									<dmshtml:dms_text
										property="answer(Object::Employee::fname)" size="15"
										maxlength="15" styleClass="txtbox" value="" styleId="empFname" />
								</td>

								<td class="links">
									<dmshtml:dms_text
										property="answer(Object::Employee::lname)" size="15"
										maxlength="15" styleClass="txtbox" value="" />
								</td>

								<td class="links">&nbsp; 
									<html:select
										property="answer(Object::Employee::gender)" styleClass="txtbox"
										value="M" styleId="comboGender">
										<html:option value="M">M</html:option>
										<html:option value='F'>F</html:option>
										<html:option value=''>All</html:option>
									</html:select>
								</td>

								<td class="links">
									<dmshtml:dms_text
										property="answer(Object::Employee::Age)" styleId="styleAge"
										maxlength="10" size="10" styleClass="txtbox" value="" />
								</td>

								<td class="links">
									<dmshtml:dms_text
										property="answer(Month)" size="2" styleId="dobMonth"
										maxlength="2" styleClass="txtbox" value=""
										onkeyup="if(this.value.length==2) {document.forms[0].elements[6].focus()}" />
	
									<dmshtml:dms_text property="answer(Date)" size="2"
										styleId="dobDate" maxlength="2" styleClass="txtbox" value=""
										onkeyup="if(this.value.length==2) {document.forms[0].elements[7].focus()}" />
	
									<dmshtml:dms_text property="answer(Year)" size="4"
										styleId="dobYear" maxlength="4" styleClass="txtbox" value="" />
								</td>

								<td class="links" align="left">&nbsp;&nbsp;
									<html:select
										property="answer(Object::Employee::healthCareOption)"
										styleClass="txtbox" value="EEOnly" styleId="comboHealth" onchange="checkChildren();">
										<html:option value="EEOnly">E</html:option>
										<html:option value='EEandSpouse'>S</html:option>
										<html:option value='EEandChildren'>C</html:option>
										<html:option value='Family'>F</html:option>
										<!--<html:option value='none'>N</html:option>
										<html:option value=''>All</html:option> -->
									</html:select>
								</td>

								<td class="links">
									<dmshtml:dms_text
										property="answer(Object::Employee::numOfChildren)" size="2"
										styleId="noOfChild" maxlength="2" styleClass="txtbox" value="" />
								</td>
								
								<%
									com.dms.ejb.data.QuestionHashMap qmapArea = new com.dms.ejb.data.QuestionHashMap(10);
				                    qmapArea.put("ownerId", "" + ownerId);
				                    qmapArea.put("dbname", ""  + com.dms.web.util.DbUtils.getWriteDS(pageContext));
				                    qmapArea.put("Object::Customer::CustomerId", "" + custid);
								%>

								<dmshtml:execute_rules nameInSession="CHECKFORMEDICAREPRIMARY"
									dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'
									formName="form::CHECKFORMEDICAREPRIMARY"
									answerMap="<%=qmapArea%>" processInstance="preprocess" />

								<logic:present name='CHECKFORMEDICAREPRIMARY' scope='request'>

									<%
			                                if (qmapArea.getString("ISMEDICARE") != null
			                                && qmapArea.getString("ISMEDICARE").length() > 0
			                                && qmapArea.getString("ISMEDICARE").equalsIgnoreCase("yes")) {
									%>
										<td><html:hidden property="answer(Object::Employee::medicarePrimary)" value="YES" /></td>
										<%
										} else {
										%>
										<td><html:hidden property="answer(Object::Employee::medicarePrimary)" value="NO" /></td>
									<%
									}
									%>
								</logic:present>
							</tr>
							
							<tr>
								<td colspan="4">&nbsp;</td>
								<td align="right" colspan="2">
									<html:button value="Search"
										property="answer(button)" styleClass="sbttn"
										onclick="submitToSearch()" />&nbsp;
								</td>

								<td>&nbsp;
									<html:submit value="Add" styleClass="sbttn"
										property="answer(submit)" />&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr><td><html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />

				<input type="hidden" name="objectType" value="ENTITY" />
				<input type="hidden" name="entityType" value="EMPLOYEE" />
				
				<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />
				<html:hidden property="answer(1*Entity::Equals::SearchObjectType)" value="CUSTOMER" />
				<html:hidden property="answer(Object::Entity::SiteId)" value="2" />
				<html:hidden property="answer(Object::Entity::ObjectType)" value="ENTITY" />
				<html:hidden property="answer(Object::Entity::EntityType)" value="EMPLOYEE" />
				<html:hidden property="answer(Object::Employee::spouseSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::employeeSelected)" value="1" />
				<html:hidden property="answer(Object::Employee::childSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::empOnlySelected)" value="0" />
				<html:hidden property="answer(Object::Employee::empSpouseSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::empChildSelected)" value="0" />
				<html:hidden property="answer(Object::Employee::familySelected)" value="0" />
				<html:hidden property="answer(Object::Employee::lifeSelected)" value="1" />
				<html:hidden property="answer(Object::Employee::wdiSelected)" value="1" />
				<html:hidden property="answer(Entity::Equals::OwnerId)" value="2" />

				<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" />

				<html:hidden property="answer(Object::Employee::createdBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Employee::updatedBy)"	value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=custid.toString()%>" />
				<html:hidden property="answer(Object::Employee::customerId)" value="<%=custid.toString()%>" />
				<html:hidden property="answer(1*Entity::Equals::SearchObjectId)" value="<%=custid.toString()%>" />
				<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>" />
				<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />
				<html:hidden property="answer(Object::Entity::SearchObjectId)" value="<%=custid.toString()%>" />
				<html:hidden property="answer(Object::Entity::SearchObjectType)" value="CUSTOMER" />
				
				<html:hidden property="AddNewEntity" value="yes" /> 
				<html:hidden property="formName" value="form::ADDEMPLOYEE" />
				<html:hidden property="answer(Object::Employee::PageNum)" value="0" />
				<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
				
				<input type="hidden" name="answer(search)" value="Search" />
				<input type="hidden" id="SubmitSequence" name="answer(SubmitSequence)" value="first" />
				
				<html:hidden property="answer(Object::Employee::TotalRec)" /> </td></tr>
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					<!-- SCRIPT type="text/javascript" -->
					<!--
						document.forms[0].elements[1].focus();
						checkChildren();
					-->
				<!-- /SCRIPT -->					
    		</table>
    		</html:form>
		</td>
		</tr>
	
		
		<tr><td>
		<html:form action="/DeleteEmployeeConfirmAction" onsubmit="return validateDelete(this)">
			<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<logic:notPresent name='searchresultnewDisplay'>
				<tr>
					<td valign="top">
						<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td height="20px" colspan="9" class="MH" style="{color:red;}">
									<logic:equal name="SEARCH_COUNT" scope="request" value="0">
										Your Search Returned No Records.
									</logic:equal>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</logic:notPresent>
			
			<logic:present name='searchresultnewDisplay'>
				<bean:define id="nextRec" name="countSearchResult" />
				<bean:define id="pagenum" name='pagenum' scope='request' />
				<bean:define id="totpagenum" name='totpagenum' scope='request' />
				<tr>
					<td valign="top">
						<table width="100%" align="center" border="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td height="20px" colspan="9" class="MH">
									<logic:present name="SEARCH_COUNT" scope="request">
										Your Search Returned <bean:write name="SEARCH_COUNT" scope="request" /> Records.
									</logic:present>
								</td>
							</tr>
							<tr>
								<td colspan="9">
									<table border="0" width="100%">
										<tr>
											<td class="links" nowrap="nowrap" width="90px">
												<logic:greaterThan name="totpagenum" scope="request" value="1">
													<a href="../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(Object::Employee::PageNum)=0&customerId=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&orderBy=LNAME&<%=qstr%>&<%=sortStr%>&answer(Object::Employee::TotalRec)=<%=nextRec%>"><img
														src="/Images/first.png" width="81" height="18" border="0" alt="First">
													</a>
 												</logic:greaterThan>
											</td>
										
											<td class="links" nowrap="nowrap" width="90px">
												<logic:present name="prevEntity" scope="request">
													<a href='../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Employee::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&customerId=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&orderBy=LNAME&<%=qstr%>&<%=sortStr%>&answer(Object::Employee::TotalRec)=<%=nextRec%>'><img
														src="/Images/prev.png" width="81" height="18" border="0"
														alt="Previous">
													</a>
												</logic:present>
											</td>

											<td width="100%" align="center" class="sectionhead">
												Page <%=(Integer.parseInt(pagenum.toString()) + 1)%> of <%=totpagenum%>
											</td>

											<td align="right" class="links" nowrap="nowrap" width="90px">
												<logic:present name="moreEntity" scope="request">
													<a href='../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Employee::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&customerId=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&orderBy=LNAME&<%=qstr%>&<%=sortStr%>&answer(Object::Employee::TotalRec)=<%=nextRec%>'><img
														src="/Images/next.png" width="81" height="18" border="0"
														alt="Next">
													</a>
												</logic:present>
											</td>
			
											<td align="right" class="links" nowrap="nowrap" width="90px">
												<logic:greaterThan name="totpagenum" scope="request" value="1">
													<a href='../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Employee::PageNum)=<%=(Integer.parseInt(""+totpagenum)-1)%>&customerId=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&orderBy=LNAME&<%=qstr%>&<%=sortStr%>&answer(Object::Employee::TotalRec)=<%=nextRec%>'><img
														src="/Images/last.png" width="81" height="18" border="0"
														alt="Last">
													</a>
												</logic:greaterThan>
											</td>
										</tr>
									</table>
								</td>
							</tr>
					
							<tr>
								<td colspan="9" class="HPSearch" height="30px">Click 
									<img src="/Images/up_arrow.png" border="0" width="17" height="18" alt="Sort Up"> to Sort Census List in Ascending Order. Click <img src="/Images/down_arrow.png" border="0" width="17" height="18" alt="Sort Down"> to Sort Census List in Descending Order<BR>
										To Edit an Employee Record, Click on the
									 <IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT=""> (Edit Button).<br/>
								</td>
							</tr>

							<tr>
								<td class="sectionhead" width="5%">Edit</td>
								<td class="sectionhead" width="2%">No.</td>
								<td class="sectionhead" width="15%" nowrap align="center">
									<a href="../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&<%=qstr%>&answer(sort)=Object::Employee::lname&answer(order)=asc&answer(Object::Employee::TotalRec)=<%=nextRec%>"><img
										src="/Images/up_arrow.png" border="0" width="17" height="18"
										alt="Sort Up"></a> Last Name 
									<a 	href="../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&<%=qstr%>&answer(sort)=Object::Employee::lname&answer(order)=desc&answer(Object::Employee::TotalRec)=<%=nextRec%>"><img
										src="/Images/down_arrow.png" border="0" width="17" height="18"
										alt="Sort Down"></a>
								</td>
								<td class="sectionhead" width="20%" nowrap align="center">
									<a href="../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&<%=qstr%>&answer(sort)=Object::Employee::fname&answer(order)=asc&answer(Object::Employee::TotalRec)=<%=nextRec%>"><img
										src="/Images/up_arrow.png" border="0" width="17" height="18"
										alt="Sort Up"></a> First Name 
									<a href="../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&<%=qstr%>&answer(sort)=Object::Employee::fname&answer(order)=desc&answer(Object::Employee::TotalRec)=<%=nextRec%>"><img
										src="/Images/down_arrow.png" border="0" width="17" height="18"
										alt="Sort Down"></a>
								</td>
	
								<td class="sectionhead" width="10%">Gender</td>
								<td class="sectionhead" width="10%">Age</td>
								
								<!-- <td class="sectionhead" width="20%">&nbsp;&nbsp;Date Of Birth<br>&nbsp;&nbsp;mm/&nbsp;dd/&nbsp;yy</td> -->
								
								<td class="sectionhead" width="30%">Health Plan Coverage Election</td>
								<td class="sectionhead" width="8%">No of Children</td>
								<td class="sectionhead">Select</td>
							</tr>

							<%
							int i = 0;
							%>

							<%
					       	String pageNum = (String) request.getAttribute("pagenum");
					        try 
					        {
					        	i = Integer.parseInt(pageNum);
					            i = i * Integer.parseInt("" + com.dms.util.Constants.getVersionedValueOf("noOfsearchResultPerPage"));
					        }
					        catch (NumberFormatException nfe)
					       	{					                            
					        	i = 0; 					       	
					       	}
							%>
							
							<logic:present name="searchresultnewDisplay" scope="request">
								<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="request">
									<tr>
										<td class="SearchResult">
											<a href="../EditEmployee.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&employeeId=<bean:write name='searchresultnewDisplay' property='answer(Object::Employee::employeeId)' />&answer(Object::Employee::employeeId)=<bean:write name='searchresultnewDisplay' property='answer(Object::Employee::employeeId)'/>&answer(Object::Customer::CustomerId)=<%=custid%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp%>&formName=form::EDITEMPLOYEE&AddNewEntity=no&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>">
												<IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0" ALT="">
											</a>
										</td>

										<td class="SearchResult">
											<a href="../EditEmployee.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&employeeId=<bean:write name='searchresultnewDisplay' property='answer(Object::Employee::employeeId)'/>&answer(Object::Customer::CustomerId)=<%=custid%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp%>&formName=form::EDITEMPLOYEE&AddNewEntity=no&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>"><%=++i%>
											</a>
										</td>

										<td class="SearchResult">
											<bean:write name="searchresultnewDisplay" property="answer(Object::Employee::lname)" />&nbsp;
										</td>

										<td class="SearchResult">
											<bean:write name="searchresultnewDisplay" property="answer(Object::Employee::fname)" />&nbsp;
										</td>
			
										<td class="SearchResult">
											<bean:write name="searchresultnewDisplay" property="answer(Object::Employee::gender)" />&nbsp;
										</td>

										<td class="SearchResult">
											<bean:write name="searchresultnewDisplay" property="answer(Object::Employee::Age)" />&nbsp;
										</td>
						
										<td class="SearchResult">
										 	<bean:define id="healthPlan" name="searchresultnewDisplay" property="answer(Object::Employee::healthCareOption)" />
										 		<dmshtml:dms_compare_string_tag first="<%=healthPlan.toString()%>" second="EEOnly" ruleName="areStringsSame" negated="true">
													<%="EE Only"%>
												</dmshtml:dms_compare_string_tag>

												<dmshtml:dms_compare_string_tag first="<%=healthPlan.toString()%>" second="EEandSpouse" ruleName="areStringsSame" negated="true">
													<%="EE and Spouse"%>
												</dmshtml:dms_compare_string_tag>
												
												<dmshtml:dms_compare_string_tag first="<%=healthPlan.toString()%>" second="EEandChildren" ruleName="areStringsSame" negated="true">
													<%="EE and Child(ren)"%>
												</dmshtml:dms_compare_string_tag>
												
												<dmshtml:dms_compare_string_tag first="<%=healthPlan.toString()%>" second="Family" ruleName="areStringsSame" negated="true">
													<%="Family"%>
												</dmshtml:dms_compare_string_tag> 
												
												<dmshtml:dms_compare_string_tag first="<%=healthPlan.toString()%>" second="LifeOnly" ruleName="areStringsSame" negated="true">
													<%="Life Only"%>
												</dmshtml:dms_compare_string_tag>
											  
											   <dmshtml:dms_compare_string_tag first="<%=healthPlan.toString()%>" second="none" ruleName="areStringsSame" negated="true">
													<%="none"%>
												</dmshtml:dms_compare_string_tag>&nbsp;
										</td>

										<td class="SearchResult">
											<bean:write name="searchresultnewDisplay" property="answer(Object::Employee::numOfChildren)" /> &nbsp;
										</td>

										<td class="SearchResult">
											<bean:define id='test' name="searchresultnewDisplay" property="answer(Object::Employee::employeeId)" />
												<dmshtml:dms_multibox property="answer(Object::Employee::employeeId)" value="<%=test.toString() %>">
												</dmshtml:dms_multibox>
										</td>
									</tr>
								</logic:iterate>
							</logic:present>
							<%
							i = 0;
							%>
							<tr>
								<td colspan="9" height="8px"></td>
							</tr>
					
							<logic:present name='searchresultnewDisplay' scope='request'>
								<tr>
									<td colspan="9" align="right">
										<table border="0" cellpadding="3" align="right">
											<tr>
												<td align="right">
													<input type="button" value="Delete All Employees" class="bigSbttn" onclick="javascript:doDeleteAll(this.form)"/>
												</td>
												<td align="right">
													<html:submit value="Delete" styleClass="sbttn" />
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</logic:present>
						</table>
					</td>
				</tr>
			</logic:present>
			
			<tr>
				<td>
					<table width="100%" border="0">
						<tr>
							<td height="8px"></td>
						</tr>
						<tr>
							<td class="links">
								<a href='../AddEntity.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&clear=yes&answer(System::flag::requiredMultiSubmissionCheck)=no&AddNewEntity=yes&answer(Object::Customer::CustomerId)=<%=custid%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>'
									title="Click to go to Add Employee page" />Add Employees</a>
								<bean:define id="CustomerNameForExport" name="AddCustomer"
									property="answer(Object::Customer::CustomerName)" scope="session" />
								<bean:define id="CustomerNumForExport" name="AddCustomer"
									property="answer(Object::Customer::CustomerNumber)" scope="session" />
								<bean:define id="userName"
									property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="../FileUpLoad.do?CustomerId=<%=custid%>&CustomerName=<%=java.net.URLEncoder.encode(CustomerNameForExport.toString())%>&userName=<%=java.net.URLEncoder.encode(userName.toString())%>&CustomerNumber=<%=java.net.URLEncoder.encode(CustomerNumForExport.toString())%>"
									title="Click to Upload Files" onClick="return FileUploadPopup(this, 'FileUpload');" />Upload File</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="true">
								<a href="../ImportCensus.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&CustomerId=<%=java.net.URLEncoder.encode(custid)%>&CustomerName=<%=java.net.URLEncoder.encode(CustomerNameForExport.toString())%>&userName=<%=java.net.URLEncoder.encode(userName.toString())%>&CustomerNumber=<%=java.net.URLEncoder.encode(CustomerNumForExport.toString())%>&answer(Object::Agency::AgencyId)=<%=""+java.net.URLEncoder.encode(agencyIdTemp)%>"
									title="Click to Import Census" />Import Census</a>
								</dmshtml:dms_static_with_connector>&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td>
					<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
					<html:hidden property="answer(entityType)" value="EMPLOYEE" />
					<html:hidden property="answer(objectType)" value="ENTITY" />
					<input type="hidden" name="deleteAll" value="" />
			
					<script type="text/javascript">
					<!--
						document.forms[1].deleteAll.value="NO";
					//-->
					</script>

					<table align="left" width="100%">
					<tr><td>
					<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=custid.toString()%>" />
					<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>" />
					<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />
			
					<input type="hidden" name="SearchObjectId" value="<%=custid.toString()%>" />
					<input type="hidden" name="SearchObjectType" value="CUSTOMER" /></td></tr>

					<!-- <tr><td colspan="3" class="sectionhead1" >
						<a href="../doc.do?docName=Benicorp/EmployerGroup/Employees/Template/CensusImportTemplate.csv&docType=excel" target="new">
							<IMG SRC="../Images/excel.jpg" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">CensusImportTemplate.csv
						</td></tr> -->
					<tr>
						<td colspan="3" class="sectionhead1" height="20px" valign="bottom">
							<a href="../doc.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&disposition=attachment&docName=CENSUS_IMPORT_EXCEL_PATH&docType=excel&filename=doc.xls" target="new">
							<IMG SRC="../Images/excel.jpg" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">CensusImportTemplate.xls
							</a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td>
				<%
					java.util.ArrayList pdfList = new java.util.ArrayList();
				%>
				
				
				<%
					com.dms.util.Constants qPDF = new com.dms.util.Constants();
					pdfList = qPDF.listFilesInsideADirectory("EmployeeFILE_Path", custid.toString() + "/" + "Files");
					if(pdfList.size()>0){
				%>
				<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
					<tr>
						<td colspan="8"><hr size="1" noshade>
						</td>
					</tr>
					<tr>
						<td class="sectionhead1" COLSPAN="2">UpLoaded Files
							<ol>
								<%
				                	for (int i = 0; i < pdfList.size(); i++) {
				                    String fileName = (String) pdfList.get(i);
								%>
								<li>
									<a href="../doc.do?TabPanelName=<%=""+request.getParameter("TabPanelName") %>&docName=Benicorp/EmployerGroup/Employees/<%=custid.toString()%>/Files/<%=fileName.toString()%>&docType=excel" target="new">
										<IMG SRC="../Images/excel.jpg" WIDTH="15" HEIGHT="15" BORDER="0" ALT=""><%=fileName.toString()%>
								 	</a>
								</li>
								<%
									}
								%>
							</ol>
						</td>
					</tr>
				</table>
					<%
						}
					%>
				
				</td></tr>

				<bean:define id="ansQmap" name="DataForm" property="answerMap" type="com.dms.ejb.data.QuestionHashMap" />
				<%          
					((com.dms.ejb.data.QuestionHashMap) ansQmap).remove(com.dms.util.Constants.RULE_EXECUTION_STAUS);
	                ((com.dms.ejb.data.QuestionHashMap) ansQmap).remove(com.dms.util.Constants.OBJECT_ERROR_LIST);
				%>
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
		</table>
		</html:form>
		</td></tr>
	</table>

<SCRIPT type="text/javascript">
	document.forms[0].empFname.focus();	
</SCRIPT>			
