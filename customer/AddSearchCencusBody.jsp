<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.7.0/build/container/assets/skins/sam/container.css" />
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.7.0/build/container/assets/containerariaplugin.js"></script>



<SCRIPT SRC="../Scripts/JScripts/AddEmployeeCensus.js" type="text/javascript"></SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/Common.js" type="text/javascript"></SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/Employee.js" type="text/javascript"> </SCRIPT>
<script type="text/javascript" src="../Scripts/prototype.js"></script>
<SCRIPT SRC="../Scripts/JScripts/SendEmail.js" type="text/javascript"> </SCRIPT>
<SCRIPT SRC="../Scripts/JScripts/commonPopUp.js" type="text/javascript"> </SCRIPT>

<bean:define id="totRecCount" value="" />
<bean:define id="actionToGo" value="QuickAllEmployeeCencus.do" />

<logic:present name="SEARCH_COUNT" scope="request">
	<bean:define id="totRecCount" name="SEARCH_COUNT" scope="request" type="java.lang.String" />
	<bean:define id="actionToGo" value="QuickAllEmployeeCencus.do" />
</logic:present>
<bean:parameter id="custid" name="answer(Object::Customer::CustomerId)" />
<bean:parameter id="agencyIdTemp" name="answer(Object::Agency::AgencyId)" />
<bean:parameter id="ownerId" name="answer(Object::UserDetail::ownerId)" />
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
<%--<a
	href="../GetCustomerAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&customerId=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>"
	title="Click to go to Customer Summary Page" />Summary</a>--%>

<body class="yui-skin-sam">
<html:form styleId="addCencusFrm" action="/AddEmployeeCencus" onsubmit="return validateEmployee()">
<logic:present name='AddEmp'>
	<%
						boolean errorOccured = false;
						%>
	<bean:define id="ansmap" name="AddEmp" property="answerMap"
		type="com.dms.ejb.data.QuestionHashMap" />
	<logic:iterate id="element" name="ansmap">
		<bean:define id="errorListkey" name="element" property="key" />
		<logic:equal name="errorListkey" value="Object::error::list">
			<bean:define id="errorListvalue" name="element" property="value" />
			<logic:iterate id="errmsg" name="errorListvalue">
				<tr>
					<td class="Error" colspan="5"><bean:write name="errmsg"
						property="errorMessage" /> <% errorOccured = true;%></td>
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
<div id="ERROR_CONTAINER"></div>

<%-- <p align="right">&nbsp;<a href="../customer/CoseEnrollmentApplication.jsp"><img
	src="../Images/MainMenuButton.jpg"></a></p>--%>
<p style="margin:0;" class="pagehead">Employee Census</p>
<p>Now you are ready to identify those employees who are eligible for health insurance. 
 You can add, edit or delete employees from your employee census. 
 To add an employee, enter the required information below and click "Add". 
 You can also use this form to search for employees already in the system by entering your criteria and pressing "search".
 </p>
 <p>Once all your eligible employees have been added, 
 select the email icon to create an email that will provide a link to an electronic application.  
 The email can be customized.</p>


<div class="frameEmpCenborder">

<table>
	<tr>
		<td>
		<div class="field" style="margin-left:15px;">First Name<br>
		</div>
		<html:text property="answer(Object::Employee::fname)" value=""
			styleId="empFname" style="margin-left:15px;" tabindex="1"  /></td>

		<td>
		<div class="field">Last Name<br>
		<html:text property="answer(Object::Employee::lname)" tabindex="2" value="" style="margin-top:5px;"/></div>
		</td>

		<td>
		<div class="field">Gender<br>
		<html:select property="answer(Object::Employee::gender)"
			styleClass="txtbox" value="M" styleId="comboGender" tabindex="3" style="margin-top:5px;">
			<html:option value="M">M</html:option>
			<html:option value='F'>F</html:option>
			<html:option value=''>All</html:option>
		</html:select></div>
		</td>

		<%-- <td>
		<div class="field">Age<br>
		<html:text property="answer(Object::Employee::Age)" tabindex="4" styleId="styleAge" style="margin-top:5px;width:40px;" value="" /></div>
		</td>--%>
		
		<html:hidden property="answer(Object::Employee::Age)" styleId="styleAge"/>
		<td>
		<div class="field" style="width:190px;margin-left:10px" >Date of Birth
		(mm/dd/yyyy)<br>
		<html:text property="answer(Month)" size="2" tabindex="5" styleId="dobMonth" maxlength="2"
			style="width:40px;margin-top:5px;" value=""
			onkeyup="if(this.value.length==2) {document.getElementById('addCencusFrm').dobDate.focus();}" />

		<html:text property="answer(Date)" size="2" tabindex="6" styleId="dobDate" maxlength="2"
			style="width:40px;margin-top:5px;" value=""
			onkeyup="if(this.value.length==2) {document.getElementById('addCencusFrm').dobYear.focus();}" />

		<html:text property="answer(Year)" size="4" tabindex="7" styleId="dobYear" maxlength="4"
			style="width:60px;margin-top:5px;" value="" /></div>
		</td>
	</tr>
	<tr>
		<td colspan="5">
		<table border="0" width="70%" id="table1" cellspacing="0"
			cellpadding="3">
			<tr>
			<!-- Increased the maximum length of the textbox -->
			
				<td>
				<div class="field">Contact E-mail<br>
				<html:text property="answer(Object::Employee::emailAddress1)" style="margin-top:5px"
					styleId="emailId" onblur="return validateAccount()" maxlength="127"
					size="30" value="" tabindex="8" /></div>
				</td>
					
				<td>
				<div class="field">Confirm Contact E-mail<br>
				<html:text property="answer(ConfirmEmail)" styleId="ConfirmEmailId" style="margin-top:5px"
					maxlength="127" size="30" value="" tabindex="9" /></div
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</div>
<%
						com.dms.ejb.data.QuestionHashMap qmapArea = new com.dms.ejb.data.QuestionHashMap(10);
				                    qmapArea.put("ownerId", "" + ownerId);
				                    qmapArea.put("dbname", ""  + com.dms.web.util.DbUtils.getWriteDS(pageContext));
				                    qmapArea.put("Object::Customer::CustomerId", "" + custid);
								%>

<dmshtml:execute_rules nameInSession="CHECKFORMEDICAREPRIMARY"
	dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'
	formName="form::CHECKFORMEDICAREPRIMARY" answerMap="<%=qmapArea%>"
	processInstance="preprocess" />

<logic:present name='CHECKFORMEDICAREPRIMARY' scope='request'>

	<%
			                                if (qmapArea.getString("ISMEDICARE") != null
			                                && qmapArea.getString("ISMEDICARE").length() > 0
			                                && qmapArea.getString("ISMEDICARE").equalsIgnoreCase("yes")) {
									%>
	<td><html:hidden property="answer(Object::Employee::medicarePrimary)"
		value="YES" /></td>
	<%
										} else {
										%>
	<td><html:hidden property="answer(Object::Employee::medicarePrimary)"
		value="NO" /></td>
	<%
									}
									%>
</logic:present>
	<p align="right" style="margin-right:23px;"><html:button value="Search"
		property="answer(button)" style="width:80px"  styleClass="button"
		onclick="submitToSearchEmployeeCencus()" /> &nbsp;&nbsp;<html:submit value="Add" style="width:60px"
		property="answer(submit)" styleClass="button" />
		</p>


				<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />

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
				<html:hidden property="answer(Object::Employee::ApplicationStatus)" value="IN_PROGRESS" />

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
				<html:hidden property="formName" value="form::ADDEMPLOYEE1" />
				<html:hidden property="answer(Object::Employee::PageNum)" value="0" />
				<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>' />
				
				<input type="hidden" name="answer(search)" value="Search" />
				<input type="hidden" id="SubmitSequence" name="answer(SubmitSequence)" value="first" />
				
				<html:hidden property="answer(Object::Employee::TotalRec)" /> </td></tr>
				<!-- To create user account -->
				<html:hidden property="answer(Object::UserDetail::PrimaryObjectType)" value="EMPLOYEE" />
				<html:hidden property="answer(Object::UserDetail::email)" value=""/>
				<html:hidden property="answer(Object::UserDetail::userName)" value=""/>
				<html:hidden property="answer(Object::UserDetail::passWord)" value="" />
				<html:hidden property="answer(Object::UserDetail::passWordConfirm)" value="" />
				<html:hidden property="answer(Object::UserDetail::PasswordKey)" value="COSE_DEFAULT_PASSWORD" />
				<html:hidden property="answer(Object::UserDetail::roleName)" value="EMPLOYEE"/>
				<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />
				<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" />
				<html:hidden property="answer(Object::UserDetail::User)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(forwardNavigate)" value="success" />
				
<p align="justify"><b>Employee census list:</b> This list shows the full
list of employees entered for your employer. To edit an employee, click
on the pencil icon on the left. To delete an employee, select the
employee you wish to delete by checking their corresponding "select"
box, then click the delete button. You can sort the list by first name
and last name by clicking on the sort buttons above those particular
columns:</p>
<bean:define id="countSearchResult1" name="countSearchResult" />
<p><logic:present name="countSearchResult">
	<logic:notEmpty name="countSearchResult">
		<logic:greaterThan name="countSearchResult1" value="0">
			<b>Total Number of Employees &nbsp;&nbsp;<%=countSearchResult1%></b>
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
</logic:notPresent></p>
</html:form>

<%-- <p align="right"><a href="/GetEmployeeFlashUI.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Customer::CustomerId)=<%=""+custid%>">Employee Health Application</a></p>
 <p align="right"><a
href="../EmployeeCensus/CoseEmployeeFlashLanding.jsp">Employee Health
Application </a></p> --%>

<html:form action="/DeleteEmployeeCensusConfirmAction" onsubmit="return validateDelete(this)">
		<bean:define id="email" property="answer(Object::UserDetail::email)" name="LoginPage" scope="session" />
		<bean:define id="roleName" property="answer(Object::UserDetail::roleName)" name="LoginPage" scope="session" />
			<logic:notPresent name='searchresultnewDisplay'>
									<logic:equal name="SEARCH_COUNT" scope="request" value="0">
										Your Search Returned No Records.
									</logic:equal>
			</logic:notPresent>
			<logic:present name="SEARCH_COUNT" scope="request">
										Your Search Returned <bean:write name="SEARCH_COUNT"
					scope="request" /> Records.
									</logic:present>
			
			<logic:present name='searchresultnewDisplay'>
				<bean:define id="nextRec" name="countSearchResult" />
				<bean:define id="pagenum" name='pagenum' scope='request' />
				<bean:define id="totpagenum" name='totpagenum' scope='request' />
			<p align="left"><logic:greaterThan name="totpagenum" scope="request" value="1">
				<a
					href="../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Employee::PageNum)=0&customerId=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&orderBy=LNAME&<%=qstr%>&<%=sortStr%>&answer(Object::Employee::TotalRec)=<%=nextRec%>"><img
					src="/Images/first.png" width="81" height="18" border="0"
					alt="First"></a>
			</logic:greaterThan>
			<logic:present name="prevEntity" scope="request">
				<a
					href='../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Employee::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&customerId=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&orderBy=LNAME&<%=qstr%>&<%=sortStr%>&answer(Object::Employee::TotalRec)=<%=nextRec%>'><img
					src="/Images/prev.png" width="81" height="18" border="0"
					alt="Previous"></a>
			</logic:present>
			<span style="margin:0px 0px 0px 200px" class="pageno">Page <%=(Integer.parseInt(pagenum.toString()) + 1)%> of <%=totpagenum%>			</span>
			<span style="margin:0px 0px 0px 220px">
			<logic:present name="moreEntity" scope="request">
				<a
					href='../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Employee::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&customerId=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&orderBy=LNAME&<%=qstr%>&<%=sortStr%>&answer(Object::Employee::TotalRec)=<%=nextRec%>'><img
					src="/Images/next.png" width="81" height="18" border="0" alt="Next">
				</a>
			</logic:present>
			<span style="margin:0px 0px 0px 10px"><logic:greaterThan name="totpagenum" scope="request" value="1">
				<a
					href='../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&LimitSearch=yes&answer(Object::Employee::PageNum)=<%=(Integer.parseInt(""+totpagenum)-1)%>&customerId=<%=custid.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&answer(Object::Customer::CustomerId)=<%=custid.toString()%>&orderBy=LNAME&<%=qstr%>&<%=sortStr%>&answer(Object::Employee::TotalRec)=<%=nextRec%>'><img
					src="/Images/last.png" width="81" height="18" border="0" alt="Last">
				</a>
			</logic:greaterThan></span>
			</span></p>

			<%-- <p>Click <img src="/Images/up_arrow.png" border="0" width="17"
				height="18" alt="Sort Up"> to Sort Census List in Ascending Order.
			Click <img src="/Images/down_arrow.png" border="0" width="17"
				height="18" alt="Sort Down"> to Sort Census List in Descending Order.<BR>
			To Edit an Employee Record, Click on the <IMG SRC="../Images/go.gif"
				WIDTH="15" HEIGHT="12" BORDER="0" ALT=""> (Edit Button).
			</p>--%>
			<table border="0" cellpadding="3" cellspacing="0" width="98%" class="datadispborder" align=center>
			<tr>
					<td class="datadispcolhead" colspan="1" width="7%">Edit</td>
					<td class="datadispcolhead" width="3%">No.</td>
					<td class="datadispcolhead" width="15%" nowrap align="center">
									Last Name 
									<a href="../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&<%=qstr%>&answer(sort)=Object::Employee::lname&answer(order)=asc&answer(Object::Employee::TotalRec)=<%=nextRec%>"><img
																			src="/Images/up_arrow.png" border="0" width="17" height="18"
										alt="Sort Up"></a> 
									<a 	href="../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&<%=qstr%>&answer(sort)=Object::Employee::lname&answer(order)=desc&answer(Object::Employee::TotalRec)=<%=nextRec%>"><img
										src="/Images/down_arrow.png" border="0" width="17" height="18"
										alt="Sort Down"></a>
					</td>
					<td class="datadispcolhead" width="15%" nowrap align="center">
									 First Name 
									 <a href="../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&<%=qstr%>&answer(sort)=Object::Employee::fname&answer(order)=asc&answer(Object::Employee::TotalRec)=<%=nextRec%>"><img
									 										src="/Images/up_arrow.png" border="0" width="17" height="18"
										alt="Sort Up"></a>
									<a href="../<%=actionToGo%>?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&<%=qstr%>&answer(sort)=Object::Employee::fname&answer(order)=desc&answer(Object::Employee::TotalRec)=<%=nextRec%>"><img
										src="/Images/down_arrow.png" border="0" width="17" height="18"
										alt="Sort Down"></a>
					</td>
	
					<td class="datadispcolhead" width="5%">Gender</td>
					<!--<td class="datadispcolhead" width="5%">Age</td>
								
					 <td class="sectionhead" width="20%">&nbsp;&nbsp;Date Of Birth<br>&nbsp;&nbsp;mm/&nbsp;dd/&nbsp;yy</td> -->
					  <td class="datadispcolhead" width="20%" align="center">Last email sent</td>
								
					<td class="datadispcolhead" width="30%" align="center">Email Id</td>
								
					<td class="datadispcolhead" width="20%" align="left">Status</td> 
					<td class="datadispcolhead" width="20%" align="left">Select</td>
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
			<bean:define id="countSearchResult2" name="countSearchResult" />
			<%	int countSearchResult1 = 0; 
				String alternateColorClass;
			%>
			<logic:present name="searchresultnewDisplay" scope="request">
				<logic:iterate id="searchresultnewDisplay"
					name="searchresultnewDisplay" scope="request">
					
					<!-- Modified the style to be applied for the datagrid  -->
					
					<%if (++countSearchResult1 % 2 == 0) {
						 alternateColorClass = "dgrowbg1";
     				} else {
    	 					alternateColorClass = "dgaltrowbg1";
   					  }
   					%>
					<bean:define id="applicationStatus1" name="searchresultnewDisplay"
						property="answer(Object::Employee::ApplicationStatus)" />
					<tr>
						<td class="<%=alternateColorClass%>"><a
							href="../EditEmployeeCencus.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&employeeId=<bean:write name='searchresultnewDisplay' property='answer(Object::Employee::employeeId)' />&answer(Object::Employee::employeeId)=<bean:write name='searchresultnewDisplay' property='answer(Object::Employee::employeeId)'/>&answer(Object::Customer::CustomerId)=<%=custid%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp%>&formName=form::EDITEMPLOYEE&AddNewEntity=no&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&NoofEmployees_Count=<%=countSearchResult2%>">
						<IMG SRC="../Images/go.gif" WIDTH="15" HEIGHT="12" BORDER="0"
							ALT=""> </a></td>

						<td class="<%=alternateColorClass%>"><ahref="../EditEmployeeCencus.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&employeeId=<bean:write name='searchresultnewDisplay' property='answer(Object::Employee::employeeId)'/>&answer(Object::Employee::employeeId)=<bean:write name='searchresultnewDisplay' property='answer(Object::Employee::employeeId)'/>&answer(Object::Customer::CustomerId)=<%=custid%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp%>&formName=form::EDITEMPLOYEE&AddNewEntity=no&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>&NoofEmployees_Count=<%=countSearchResult2%>"><%=++i%>
						</a></td>

						<td class="<%=alternateColorClass%>"><bean:write name="searchresultnewDisplay"
							property="answer(Object::Employee::lname)" />&nbsp;</td>

						<td class="<%=alternateColorClass%>"><bean:write name="searchresultnewDisplay"
							property="answer(Object::Employee::fname)" />&nbsp;</td>

						<td class="<%=alternateColorClass%>"><bean:write name="searchresultnewDisplay"
							property="answer(Object::Employee::gender)" />&nbsp;</td>
	
						<bean:define id="employeeId" name='searchresultnewDisplay' property='answer(Object::Employee::employeeId)'/>
						<dmshtml:get_latest_email_sent nameInSession="lastEmailSent" objectId='<%=Long.parseLong(""+employeeId)%>' ownerId='<%=Long.parseLong(""+ownerId)%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
						
						<td class="<%=alternateColorClass%>"><%=""+request.getAttribute("lastEmailSent")%></td>
						<%-- <td class="<%=alternateColorClass%>"><bean:write name="searchresultnewDisplay"
							property="answer(Object::Employee::Age)" />&nbsp;</td> --%>
						
						<td class="<%=alternateColorClass%>"><a href="javaScript:void(0)"
							onclick="EmailPopup('../ComposeMail1.do?answer(Object::Notification::Email::ObjectId)=<bean:write name='searchresultnewDisplay' property='answer(Object::Employee::employeeId)' />&answer(Object::Customer::CustomerName)=<bean:write name="searchresultnewDisplay" property="answer(Object::Employee::fname)" /> <bean:write name="searchresultnewDisplay" property="answer(Object::Employee::lname)" />&answer(Object::Notification::UserDetail::ToEmail)=<bean:write name="searchresultnewDisplay" property="answer(Object::Employee::emailAddress1)" />&answer(Object::Notification::UserDetail::Email)=<%=""+email%>&answer(Object::Notification::UserDetail::RoleName)=<%=""+roleName%>&answer(Object::Notification::Email::ObjectVerId)=<%="0"%>&answer(Object::Notification::Email::ObjectType)=EMPLOYEE&answer(Object::Notification::Email::NotificationType)=<%="EMAIL"%>&answer(Object::UserDetail::ownerId)=<%=""+ownerId %>&answer(Object::Notification::Email::EmailPurpose)=COSE_INIVITATION_EMPLOYER','Email')"
							BORDER="0" align="top" id="emailIMG"><IMG SRC="../Images/mail1.jpg" height="20px" border="0"
							width="20px">&nbsp;<bean:write
							name="searchresultnewDisplay"
							property="answer(Object::Employee::emailAddress1)" />&nbsp;</a>
						</td>

						<td class="<%=alternateColorClass%>"><%
					     					String applicationStatus=""+applicationStatus1;
					     					if(applicationStatus.equalsIgnoreCase("IN_PROGRESS")){
					     						applicationStatus="In Progress";
					     					}else if(applicationStatus.equalsIgnoreCase("E_SUBMITTED")){
					     						applicationStatus="E Submitted";
					     					}else if (applicationStatus.equalsIgnoreCase("PAPER_SUBMITTED")){
					     						applicationStatus="Paper Submitted";
					     					}else if (applicationStatus.equalsIgnoreCase("SENT_TO_UNDERWRITING")){
					     						applicationStatus="Sent to Underwriting";
					     					}else{
					     						applicationStatus="";
					     					}
			
										%> <%=""+applicationStatus %></td>
						<td class="<%=alternateColorClass%>"><bean:define id='test'
							name="searchresultnewDisplay"
							property="answer(Object::Employee::employeeId)" /> <dmshtml:dms_multibox
							property="answer(Object::Employee::employeeId)"
							value="<%=test.toString() %>">
						</dmshtml:dms_multibox></td>
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
				<html:button property="answer(button)" value="Delete All Employees" styleClass="button"  onclick="javascript:doDeleteAll(this.form)" />
				<html:submit value="Delete Selected" styleClass="button" style="width:125px"/>
			</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td>&nbsp;</td></tr>
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYER_HOME"}%>' connector='or' negated="true">
			<tr><td colspan="9" align="center">
			
<!-- 			<a href="../customer/CoseEnrollmentApplication.jsp"><img src="../Images/Continue_Button.png"></a> -->
			<input type="button" name="continue" value ="" onmouseover="style.cursor='hand'" title="continue to step 3" class="continuebutton" onclick="parent.location='../customer/CoseEnrollmentApplication.jsp'"/>
			</td>
			</tr>
			</dmshtml:dms_static_with_connector>
			</logic:present>
			</table>
					</td>
				</tr>
			</logic:present>
			<!-- 
			<tr>
				<td>
					<table width="100%" border="0">
						<tr>
							<td height="8px"></td>
						</tr>
						<tr>
							<td class="links">
								<a href='../AddEntity.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&clear=yes&answer(System::flag::requiredMultiSubmissionCheck)=no&AddNewEntity=yes&answer(Object::Customer::CustomerId)=<%=custid%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp%>&answer(Object::UserDetail::ownerId)=<%=ownerId.toString()%>'
									title="Click to go to Add Employee page" />Add Employees</a>	
									<%
									String CustomerNameForExport="";
									String CustomerNumForExport="";
									%>																																
									<dmshtml:Get_Customer_Detail_ByCustomerId nameInSession="customerDetail1" customerId="<%=custid.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
										<logic:present name="customerDetail1" scope="request">
											<bean:define id="CustomerName" name="customerDetail1" property="customerName" scope="request" />
											<bean:define id="CustomerNum" property="customerNumber" name="customerDetail1" scope="request" />	
											<%
											CustomerNameForExport=""+CustomerName;
											CustomerNumForExport=""+CustomerNum;
											%>										
										</logic:present>
								<bean:define id="userName"
									property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="../FileUpLoad.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&CustomerId=<%=custid%>&CustomerName=<%=java.net.URLEncoder.encode(CustomerNameForExport.toString())%>&userName=<%=java.net.URLEncoder.encode(userName.toString())%>&CustomerNumber=<%=java.net.URLEncoder.encode(CustomerNumForExport.toString())%>"
									title="Click to Upload Files" onClick="return FileUploadPopup(this, 'FileUpload');" />Upload File</a>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SYS_ADMIN"}%>' connector='or' negated="true">
								<a href="../ImportCensus.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&CustomerId=<%=java.net.URLEncoder.encode(custid)%>&CustomerName=<%=java.net.URLEncoder.encode(CustomerNameForExport.toString())%>&userName=<%=java.net.URLEncoder.encode(userName.toString())%>&CustomerNumber=<%=java.net.URLEncoder.encode(CustomerNumForExport.toString())%>&answer(Object::Agency::AgencyId)=<%=""+java.net.URLEncoder.encode(agencyIdTemp)%>"
									title="Click to Import Census" />Import Census</a>
								</dmshtml:dms_static_with_connector>&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			-->
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

					<html:hidden property="answer(Object::Customer::CustomerId)" value="<%=custid.toString()%>" />
					<html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>" />
					<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" />
			
					<input type="hidden" name="SearchObjectId" value="<%=custid.toString()%>" />
					<input type="hidden" name="SearchObjectType" value="CUSTOMER" /></td></tr>

					<!-- <tr><td colspan="3" class="sectionhead1" >
						<a href="../doc.do?docName=Benicorp/EmployerGroup/Employees/Template/CensusImportTemplate.csv&docType=excel" target="new">
							<IMG SRC="../Images/excel.jpg" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">CensusImportTemplate.csv
						</td></tr> -->
				<!-- -	<tr>
						<td colspan="3" class="sectionhead1" height="20px" valign="bottom">
							<a href="../doc.do?disposition=attachment&docName=Benicorp/EmployerGroup/Employees/Template/CensusImportTemplate.xls&docType=excel&filename=doc.xls" target="new">
							<IMG SRC="../Images/excel.jpg" WIDTH="15" HEIGHT="15" BORDER="0" ALT="">CensusImportTemplate.xls
							</a>
						</td>
					</tr>
				-->
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
									<a href="../doc.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&docName=Benicorp/EmployerGroup/Employees/<%=custid.toString()%>/Files/<%=fileName.toString()%>&docType=excel" target="new">
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
		</table>
		</td>
		</tr>
		</table>	
		<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
		</html:form>
		</body>


<SCRIPT type="text/javascript">
	document.getElementById("addCencusFrm").empFname.focus();	
</SCRIPT>			


