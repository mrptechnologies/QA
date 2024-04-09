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
<%@page  import="com.dms.common.ObjectDescriptor" %>

<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(ownerId)=2&answer(Object::Customer::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
</SCRIPT>

<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />

<link rel="stylesheet" type="text/css" 	href="../styles/yahoo/2.4.1/build/autocomplete/assets/skins/sam/autocomplete.css" />
<link rel="stylesheet" type="text/css"  href="../styles/style.css"/>

<html:form action="/XMLGeneratorAction" >

	<%String agencyIdtoLink="";%>
	<%if (request.getParameter("answer(1*Customer::Equals::SearchObjectId)")!= null) {
		agencyIdtoLink=request.getParameter("answer(1*Customer::Equals::SearchObjectId)");
	}%>
	<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td height="5"></td>
		</tr>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
		<tr>
			<td class="pagehead" colspan="4" >Employer Group List</td>
		</tr>

		<tr><td>&nbsp;</td></tr>
		
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CUSTOMER_CREATE","CUSTOMER_MODIFY"}%>' connector='or' negated="true">	
			<tr>
				<td class="links" align="left" colspan="2"><a href="../AddCustomers.do?TabPanelName=Insured_Panel&clear=yes" >Add Employer Group</a></td></tr>
		</dmshtml:dms_static_with_connector>	
		<!-- Add Employer Link to show separete page for COSE -->
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"EMPLOYER_GROUP_ADD_APPLICATION"}%>' connector='or' negated="true">
			<tr>
				<td class="links" align="left" colspan="2">
					<a href="../AddCustomersApplication.do?TabPanelName=Insured_Panel&clear=yes">Add Employer Group</a>
				</td>
			</tr>
		</dmshtml:dms_static_with_connector>					

		<logic:present name="customersSize" scope="request">
			<bean:define id="customersSize1" name="customersSize" scope="request"/>
			<tr><td><html:hidden property="answer(Object::Customer::TotalRec)" value="<%=customersSize1.toString()%>"/></td></tr>	
			<tr><td class="FormLabels">No of Employer Groups Found:&nbsp;<%=customersSize1.toString()%></td></tr>
		</logic:present>
		
		<logic:present name="showAllCustomers" scope="request">
			<tr>
			<td class="FormLabels" >
				<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"SALESMANAGER","ADMIN","UNDERWRITER"}%>' connector='or' negated="true">
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=a&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">A</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=b&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">B</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=c&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">C</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=d&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">D</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=e&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">E</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=f&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">F</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=g&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">G</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=h&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">H</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=i&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">I</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=j&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">J</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=k&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">K</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=l&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">L</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=m&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">M</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=n&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">N</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=o&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">O</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=p&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">P</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=q&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Q</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=r&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">R</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=s&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">S</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=t&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">T</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=u&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">U</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=v&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">V</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=w&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">W</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=x&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">X</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=y&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Y</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=z&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Z</A>&nbsp;
					<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">ALL</A>&nbsp;
				</dmshtml:dms_static_with_connector>
				
				<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"SALESMANAGER","ADMIN","UNDERWRITER"}%>' connector='or'>
					   <logic:present name="LoginPage" scope="session">
						<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
						<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
						<%String objType="";%>
							<logic:present name="objectDescriptor" scope="request">
								<bean:define id="objDescType" name="objectDescriptor" property="objectType"/>
								<%if(objDescType.toString().equals("ENTITY")){%>
									<dmshtml:get_entityid_by_userid nameInSession="entityIdentity" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
									<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN"}%>' connector='or' negated="true">
										<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>"/>
										<logic:present name="agencyIdent" scope="session">
											<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=a&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">A</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=b&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">B</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=c&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">C</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=d&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">D</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=e&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">E</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=f&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">F</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=g&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">G</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=h&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">H</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=i&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">I</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=j&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">J</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=k&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">K</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=l&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">L</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=m&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">M</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=n&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">N</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=o&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">O</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=p&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">P</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=q&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Q</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=r&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">R</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=s&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">S</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=t&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">T</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=u&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">U</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=v&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">V</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=w&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">W</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=x&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">X</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=y&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Y</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=z&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Z</A>&nbsp;
												<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0&all=yes">ALL</A>&nbsp;
	
	
										</logic:present>
									</dmshtml:dms_static_with_connector>
									<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"GENERAL_AGENT","GENERAL_EMPLOYEE","GENERAL_ADMIN"}%>' connector='or' negated="true">
										<dmshtml:Get_GeneralAgency_By_AgentUserId userId="<%=usernameId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' nameInSession="gaagencyIdentity"/>  
										<logic:present name="gaagencyIdentity" scope="session">
											<bean:define id="gaIdent" name="gaagencyIdentity" type="java.lang.Long" scope="session"/>
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=a&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">A</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=b&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">B</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=c&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">C</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=d&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">D</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=e&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">E</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=f&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">F</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=g&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">G</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=h&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">H</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=i&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">I</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=j&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">J</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=k&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">K</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=l&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">L</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=m&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">M</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=n&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">N</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=o&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">O</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=p&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">P</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=q&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Q</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=r&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">R</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=s&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">S</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=t&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">T</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=u&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">U</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=v&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">V</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=w&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">W</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=x&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">X</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=y&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Y</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=z&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Z</A>&nbsp;
											<A href="../FindAllCustomersXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">ALL</A>&nbsp;
										</logic:present>
									</dmshtml:dms_static_with_connector>
								<%}%>
							</logic:present>
					</logic:present>
				</dmshtml:dms_static_with_connector>
			</td>
			</tr>
		</logic:present>
		
		<logic:notPresent name ='searchresultCustomerDisplay' scope ='request'>
			<tr>
				<table>
					<tr><td>&nbsp;</td></tr>
		
					<tr>
						<td class="Error" >
							<% String DisplayString ="No Employer Group Found starting with letter ";
							String searchLetter=request.getParameter("answer(Object::Customer::Like::customerName)");%>	
							<%if (searchLetter==null || searchLetter.equals("")) {
								DisplayString="No Employer Group Found";
							}%>
							<%=DisplayString%>
							<%if (searchLetter!=null) {%>	
								<%=searchLetter%>
							<%}%>	
				
						</td>
					</tr>
			
					<tr><td>&nbsp;</td></tr>
				</table>
			</tr>
		</logic:notPresent>
		
		<logic:present name ='searchresultCustomerDisplay' scope ='request'>
		<tr>
			<td>
				<table WIDTH="100%" ALIGN="Left" cellspacing=0 cellpadding="2">
					<bean:define id="pagenum" name='pagenum' scope='request'/>
					<bean:define id="totpagenum" name='totpagenum' scope='request'/>

					<tr><td><html:hidden name="FindCustomerXml" property="answer(Customer::orderBy)"/>
					<html:hidden name="FindCustomerXml" property="answer(dbname)"/>
					<html:hidden name="FindCustomerXml" property="answer(Object::Customer::Like::CustomerNumber)"/>
					<html:hidden name="FindCustomerXml" property="answer(Object::Customer::Equals::CreatedDateEnd)"/>
					<html:hidden name="FindCustomerXml" property="answer(Object::Customer::Like::customerName)"/>
					<html:hidden name="FindCustomerXml" property="answer(Object::Customer::Equals::CreatedDateBegin)"/>
					<html:hidden name="FindCustomerXml" property="answer(Object::Customer::Equals::OwnerId)"/>
					<html:hidden name="FindCustomerXml" property="answer(Object::Customer::Equals::UpdatedDateEnd)" />
					<html:hidden name="FindCustomerXml" property="answer(Object::Customer::Equals::UpdatedDateBegin)"/>
					<html:hidden name="FindCustomerXml" property="answer(1*Customer::Equals::SearchObjectType)"/>
					<html:hidden name="FindCustomerXml" property="answer(1*Customer::Equals::SearchObjectId)"/>					
					<html:hidden name="FindCustomerXml" property="answer(2*Customer::Equals::SearchObjectType)"/>
					<html:hidden name="FindCustomerXml" property="answer(2*Customer::Equals::SearchObjectId)"/>
					<html:hidden name="FindCustomerXml" property="answer(3*Customer::Equals::SearchObjectType)"/>
					<html:hidden name="FindCustomerXml" property="answer(3*Customer::Equals::SearchObjectId)"/>
					<html:hidden name="FindCustomerXml" property="answer(4*Customer::Equals::SearchObjectType)"/>
					<html:hidden name="FindCustomerXml" property="answer(4*Customer::Equals::SearchObjectId)"/>
					<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
					</td></tr>

					<logic:present name="searchCriteria" scope="request">
						<bean:define id="searchMap" name="searchCriteria" scope="request" />
					</logic:present>

					<tr>
						<td align="Left" class="links" colspan="3">
							<logic:present name="prevCustomer"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)-1)%>)" >
								<bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
						
						<td align="right" class="links" colspan="3">
							<logic:present name="moreCustomer"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)+1)%>)" >Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>
					
					<tr><td colspan="6" >&nbsp;</td></tr>
					
					<tr>
						<td class="datadispcolhead" width="5%">
							<bean:message key="CustomerSearchResult.SlNo"/>
						</td>
					
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
						      	<td class="datadispcolhead" width="10%">Customer Id</td>
						</dmshtml:dms_static_with_connector>

						<td class="datadispcolhead" width="20%">
						<bean:message key="CustomerSearchResult.EmployerGroupNameHealthIns"/>							
						</td>
						<td class="datadispcolhead" width="10%">Group Number
						</td>
						<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"SALESMANAGER","ADMIN"}%>' connector='or' negated="true">
							 <td class="datadispcolhead" width="10%">Agency Name</td>
						</dmshtml:dms_static_with_connector >
						
						<td class="datadispcolhead" width="5%">
							<bean:message key="CustomerSearchResult.NumberofEmployeesHealthIns"/>
						</td>
						<!-- <td class="datadispcolhead" width="12%">
							<bean:message key="CustomerSearchResult.City" />
						</td> -->

						<td class="datadispcolhead" width="5%">
							<bean:message key="CustomerSearchResult.State"/>
						</td>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_ENTRY"}%>' connector='or' negated="true">
							<td class="datadispcolhead" width="10%">Data Entry</td>
						</dmshtml:dms_static_with_connector>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYERGROUP_STATUS"}%>' connector='or' negated="true">	
						<td class="datadispcolhead" width="15%"><bean:message key="Top.EmployerGroupStatus"/></td>
						</dmshtml:dms_static_with_connector>
					</tr>
					<% int i=0;%>
					<% String alternateColorClass="dgaltrowbg"; %>

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
	

					<!--logic:iterate id="searchresultCustomerDisplay" name="searchresultCustomerDisplay" scope="request" -->
					<%
						java.util.ArrayList arrlistcusts = (java.util.ArrayList) request.getAttribute("searchresultCustomerDisplay");
						for (int mn=0; mn<arrlistcusts.size(); mn++){
							com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistcusts.get(mn);
					%>
					
					<%if (i % 2 == 0) {
											 alternateColorClass = "dgrowbg";
					     				} else {
					    	 					alternateColorClass = "dgaltrowbg";
					   					  }
   					%>
					
					<tr>
						
						
	   					<td class="<%=alternateColorClass%>">	   
							 <% i++; %>
							 <%=i%>
						</td>

		 				<%
							String cId = qmap.getString("Object::Customer::CustomerId");
						%>

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
							<td class="<%=alternateColorClass%>">
								<%=cId%>
							</td>
						</dmshtml:dms_static_with_connector>


						<td class="<%=alternateColorClass%>" >
							<a href="../GetCustomerAction.do?TabPanelName=Insured_Panel&customerId=<%=cId%>&forwardTag=HEALTH_INS_EMPGROUP_DETAIL_SUCCESS" >
							 	<%=qmap.getString("Object::Customer::CustomerName")%>
							</a>	
						</td>
	
						<td class="<%=alternateColorClass%>" >
							<a href="../GetCustomerAction.do?TabPanelName=Insured_Panel&customerId=<%=cId%>&forwardTag=HEALTH_INS_EMPGROUP_DETAIL_SUCCESS" >
								<%=qmap.getString("Object::Customer::CustomerNumber")%>
							</a>&nbsp;&nbsp;
						</td>
		
		
						<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"SALESMANAGER","ADMIN"}%>' connector='or' negated="true">
							<td class="<%=alternateColorClass%>" >
							
							

								<dmshtml:Get_Objects_Linked_To_Customers nameInRequest="objectsLinkToEmployeerGroup" objectId="<%=cId.toString()%>" objectType="AGENCY" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
								<logic:present name="objectsLinkToEmployeerGroup" scope="request">
									<%
										String agencyId = "0";
										java.util.Vector vect = (java.util.Vector) request.getAttribute("objectsLinkToEmployeerGroup");			
										com.dms.common.ObjectDescriptor objdesc = (com.dms.common.ObjectDescriptor)vect.get(vect.size()-1);
										agencyId = ""+objdesc.getObjectId();
									%>
								        <!--logic:iterate id="agencyObjectDescriptor" name="objectsLinkToEmployeerGroup" type="com.dms.common.ObjectDescriptor"-->
										
								        <!--bean:define id="agencyId" name="agencyObjectDescriptor" property="objectId"/-->

									<dmshtml:get_agency_detail nameInSession="agencyDetail2" agencyId="<%=agencyId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
									<logic:present name="agencyDetail2" scope="request">
										<bean:define id="agdetail2" name="agencyDetail2" type="com.dms.ejb.agency.DMSAgencyDetail" scope="request"/>
										<bean:write name="agdetail2" property="businessName"/>
									</logic:present>
									<!--/logic:iterate-->
								</logic:present>&nbsp;
							</td>
						</dmshtml:dms_static_with_connector >


						<td class="<%=alternateColorClass%>" >
							<%
						 		java.util.ArrayList arrList=new java.util.ArrayList();
								String customerId=cId.toString();
								long lnObjectId=0;
						 		lnObjectId=Long.parseLong(customerId);
								ObjectDescriptor objectDescriptor=new ObjectDescriptor(lnObjectId,"CUSTOMER");
								arrList.add(objectDescriptor);
						 	%>

							<%=qmap.getString("NUMOFEMPS")%>
							<%request.removeAttribute("searchresultCustomerDisplay");%>&nbsp;	
						</td>
						
						<!-- <td class="<%=alternateColorClass%>" >&nbsp;</td> -->
		
						<td class="<%=alternateColorClass%>" >
							<%=qmap.getString("Object::Customer::State")%>&nbsp;
						</td>
						
						 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_ENTRY"}%>' connector='or' negated="true">	
							 <td class="<%=alternateColorClass%>" >
								 <%=qmap.getString("Object::CustomerAdditional::DataEntry")%>&nbsp;
							</td>
						</dmshtml:dms_static_with_connector>
						
						
						<%	
		     					String applicationStatus=""+qmap.getString("Object::Customer::Status");
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

						%>
						
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_EMPLOYERGROUP_STATUS"}%>' connector='or' negated="true">	
							<td class="<%=alternateColorClass%>" >
								<%=""+applicationStatus%>&nbsp;
							</td>
						</dmshtml:dms_static_with_connector>	
					</tr>
					<!--/logic:iterate-->
					<%}%>
					
					<tr><td colspan="2" >&nbsp;</td></tr>
	
					<tr>
						<td align="left" class="links" colspan="3">
							<logic:present name="prevCustomer"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)-1)%>)" >
								<bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
				
						<td align="right" class="links" colspan="3">
							<logic:present name="moreCustomer"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)+1)%>)" >Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		</logic:present>
		<tr>
			<td>
				<table>
					<tr>
						<td align="center"><dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
						</td>
						<logic:present name ='searchresultCustomerDisplay' scope ='request'>
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"AGENY_EDIT"}%>' connector='or' negated="true">	
								<td  align="center">
									<html:submit  value="Export XML" property="answer(submit)" styleClass="sbttn"/>
								</td>
								<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
								<input type="hidden" name="answer(Object::UserDetail::userName)" value="<%=userName.toString()%>"/>

								<logic:present name="XMLGenerated"  scope="session" >
									<td class="links">
										<a href="javascript:void(0);" onClick="javascript:window.open('/EmployerGroupXml/EmployerGroup/EmployerGroupXMLExportDirectory/'+'<%=userName.toString()%>'+'.xml')">DownLoad XML</a>
									</td>
								</logic:present >
								<%session.removeAttribute("XMLGenerated");%>
							</dmshtml:dms_static_with_connector>
						</logic:present>
					</tr>
				</table>
			</td>
		</tr>

		<logic:present name="xmlValidationErrorList"  scope="request" >
		<!-- tr --> <!-- td -->
			<table>
				<tr><td>&nbsp;</td></tr>
				<tr><td class="sectionheadblackbig" align="center"><u><b><%="XML Has been generated with following validation Errors"%></b></u></td></tr>

				<tr>
					<td class="Error" COLSPAN="2">
						<ol>
							<bean:define id="arrList" name="xmlValidationErrorList" type="java.util.ArrayList"/>
							<logic:iterate id="errMsg" name="arrList" type="java.lang.String">
								<li>
									<%=errMsg%>
								</li>
							</logic:iterate>
						</ol>
					</td>
				</tr>
			</table>
		<!-- /td --> <!-- /tr -->	
		</logic:present >
	</table>
</html:form>


