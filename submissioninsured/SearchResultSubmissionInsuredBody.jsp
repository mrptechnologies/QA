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
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<%String objType1="";
 String agencyIdtoLink1 ="";%>
<%if (request.getParameter("answer(1*Customer::Equals::SearchObjectId)")!= null) {
		agencyIdtoLink1=request.getParameter("answer(1*Customer::Equals::SearchObjectId)");
		objType1="AGENCY";
}%> 

<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="../SubmissionSearchResult.do?answer(Object::Submission::CreatedBy)=<%=""+userId %>&answer(1*Customer::Equals::SearchObjectType)=<%=""+objType1%>&answer(1*Customer::Equals::SearchObjectId)=<%=""+agencyIdtoLink1%>&answer(ownerId)=<%=""+ownerId %>&answer(Object::Customer::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
</SCRIPT>

<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<html:form action="/XMLGeneratorAction" >


	<%String agencyIdtoLink="";%>
	<%if (request.getParameter("answer(1*Customer::Equals::SearchObjectId)")!= null) {
		agencyIdtoLink=request.getParameter("answer(1*Customer::Equals::SearchObjectId)");
		
	}%> 
	
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		<tr>
			<td height="15" WIDTH="100%"></td>
		</tr>

		<tr>
			<td class="sectionhead" align="center" WIDTH="100%">SUBMISSION LIST</td>
		</tr>

		<tr><td WIDTH="100%">&nbsp;</td></tr>
			<logic:present name="customersSize" scope="request">
			<bean:define id="customersSize1"   name="customersSize" scope="request"/>
			<tr><td WIDTH="100%"><html:hidden property="answer(Object::Customer::TotalRec)" value="<%=customersSize1.toString()%>"/></td></tr>	
			<tr><td class="FormLabels" WIDTH="100%">No of Submission Found:&nbsp;<%=customersSize1.toString()%>
			</td></tr>
		</logic:present>
		
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CUSTOMER_CREATE","CUSTOMER_MODIFY"}%>' connector='or' negated="true">	
				<tr>
					<td class="links" align="left"  WIDTH="100%"><a href="../AddInsured.do?TabPanelName=Insured_Panel&clear=yes" >Add Insured</a></td></tr>
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
	
		<logic:present name="showAllCustomers" scope="request">
		
		
			<tr>
			<td class="FormLabels" WIDTH="100%">
				<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"SALESMANAGER","ADMIN","UNDERWRITER"}%>' connector='or' negated="true">
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=a&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">A</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=b&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">B</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=c&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">C</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=d&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">D</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=e&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">E</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=f&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">F</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=g&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">G</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=h&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">H</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=i&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">I</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=j&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">J</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=k&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">K</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=l&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">L</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=m&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">M</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=n&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">N</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=o&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">O</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=p&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">P</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=q&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Q</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=r&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">R</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=s&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">S</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=t&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">T</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=u&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">U</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=v&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">V</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=w&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">W</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=x&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">X</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=y&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Y</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=z&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Z</A>&nbsp;
					<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(Object::Customer::Like::customerName)=&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">ALL</A>&nbsp;
				</dmshtml:dms_static_with_connector>

				<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"SALESMANAGER","ADMIN","UNDERWRITER"}%>' connector='or'>
					   <logic:present name="LoginPage" scope="session">
						<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
						<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>"/>
						<%String objType="";%>
							<logic:present name="objectDescriptor" scope="session">
								<bean:define id="objDescType" name="objectDescriptor" property="objectType"/>
								<%if(objDescType.toString().equals("ENTITY")){%>
									<dmshtml:get_entityid_by_userid nameInSession="entityIdentity" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>" />
									<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN"}%>' connector='or' negated="true">
										<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>"/>
										<logic:present name="agencyIdent" scope="session">
											<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=a&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">A</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=b&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">B</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=c&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">C</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=d&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">D</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=e&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">E</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=f&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">F</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=g&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">G</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=h&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">H</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=i&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">I</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=j&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">J</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=k&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">K</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=l&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">L</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=m&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">M</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=n&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">N</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=o&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">O</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=p&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">P</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=q&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Q</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=r&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">R</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=s&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">S</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=t&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">T</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=u&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">U</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=v&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">V</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=w&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">W</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=x&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">X</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=y&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Y</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Object::Customer::Like::customerName)=z&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Z</A>&nbsp;
												<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=agencyIdid.toString()%>&answer(1*Customer::Equals::SearchObjectType)=AGENCY&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0&all=yes">ALL</A>&nbsp;
	 <%="137"+agencyIdid%>
		
										</logic:present>
									</dmshtml:dms_static_with_connector>
									<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"GENERAL_AGENT","GENERAL_EMPLOYEE","GENERAL_ADMIN"}%>' connector='or' negated="true">
										<dmshtml:Get_GeneralAgency_By_AgentUserId userId="<%=usernameId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' nameInSession="gaagencyIdentity"/>  
										<logic:present name="gaagencyIdentity" scope="session">
											<bean:define id="gaIdent" name="gaagencyIdentity" type="java.lang.Long" scope="session"/>
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=a&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">A</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=b&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">B</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=c&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">C</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=d&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">D</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=e&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">E</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=f&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">F</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=g&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">G</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=h&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">H</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=i&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">I</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=j&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">J</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=k&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">K</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=l&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">L</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=m&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">M</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=n&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">N</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=o&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">O</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=p&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">P</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=q&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Q</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=r&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">R</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=s&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">S</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=t&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">T</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=u&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">U</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=v&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">V</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=w&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">W</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=x&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">X</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=y&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Y</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Object::Customer::Like::customerName)=z&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">Z</A>&nbsp;
											<A href="../FindAllInsuredXml.do?TabPanelName=Insured_Panel&answer(1*Customer::Equals::SearchObjectId)=<%=gaIdent.toString()%>&answer(1*Customer::Equals::SearchObjectType)=GENERAL_AGENCY&answer(Customer::orderBy)=DMS_CUSTOMER_VER.CUSTOMER_NAME&answer(Object::Customer::PageNum)=0">ALL</A>&nbsp;
									 <%="172"+gaIdent%>		
										</logic:present>
									</dmshtml:dms_static_with_connector>
								<%}%>
							</logic:present>
					</logic:present>
				</dmshtml:dms_static_with_connector>
			</td>
			</tr>
		</logic:present>
			
	<bean:define id="status" property="answer(Object::Customer::Status)" name="FindForm" scope="request"/>
	<bean:define id="customerName" property="answer(Object::Customer::Like::customerName)" name="FindForm" scope="request"/>
	<bean:define id="submissionNumber" property="answer(Object::Customer::Like::SubmissionNumber)" name="FindForm" scope="request"/>
	<bean:define id="active" property="answer(Object::Customer::Equals::Active)" name="FindForm" scope="request"/>
	<bean:define id="createdDateBegin" property="answer(Object::Customer::Equals::CreatedDateBegin)" name="FindForm" scope="request"/>
	<bean:define id="createdDateEnd" property="answer(Object::Customer::Equals::CreatedDateEnd)" name="FindForm" scope="request"/>
	<bean:define id="updatedDateBegin" property="answer(Object::Customer::Equals::UpdatedDateBegin)" name="FindForm" scope="request"/>
	<bean:define id="updatedDateEnd" property="answer(Object::Customer::Equals::UpdatedDateEnd)" name="FindForm" scope="request"/>
	<bean:define id="CustomerId" property="answer(Object::Submission::Insured::Id)" name="FindForm" scope="request"/>
	
	
	<html:hidden property="answer(Object::Customer::Status)" value='<%=""+status %>' />
	<html:hidden property="answer(Object::Customer::Like::customerName)" value='<%=""+customerName %>' />
	<html:hidden property="answer(Object::Customer::Like::SubmissionNumber)" value='<%=""+submissionNumber %>' />
	<html:hidden property="answer(Object::Customer::Equals::Active)" value='<%=""+active %>' />
	<html:hidden property="answer(Object::Customer::Equals::CreatedDateBegin)" value='<%=""+createdDateBegin %>' />
	<html:hidden property="answer(Object::Customer::Equals::CreatedDateEnd)" value='<%=""+createdDateEnd %>' />
	<html:hidden property="answer(Object::Customer::Equals::UpdatedDateBegin)" value='<%=""+updatedDateBegin %>' />
	<html:hidden property="answer(Object::Customer::Equals::UpdatedDateEnd)" value='<%=""+updatedDateEnd %>' />
	<html:hidden property="answer(Object::Submission::Insured::Id)" value='<%=""+CustomerId %>' />
	
	
		<logic:notPresent name ='searchresultCustomerDisplay' scope ='request'>
			<tr>
				<td WIDTH="100%">
				<table>
					<tr><td>&nbsp;</td></tr>
		
					<tr>
						<td class="Error" >
							<% String DisplayString ="No Submission Insured Found starting with letter ";
							String searchLetter=request.getParameter("answer(Object::Customer::Like::customerName)");%>	
							<%if (searchLetter==null || searchLetter.equals("")) {
								DisplayString="No Submission Found";
							}%>
							<%=DisplayString%>
							<%if (searchLetter!=null) {%>	
								<%=searchLetter%>
							<%}%>	
				
						</td>
					</tr>
			
					<tr><td>&nbsp;</td></tr>
				</table>
			</td>
			</tr>
		</logic:notPresent>
		
		<logic:present name ='searchresultCustomerDisplay' scope ='request'>
		
		<tr>
			<td WIDTH="100%">
				<table class="loctable" cellpadding="0" cellspacing="0">
				<tr colspan=13 align="left" style ="font-size:10pt;">Click on either Submission Number or Submission Name to goto Submission Summary<br></tr>
					<bean:define id="pagenum" name='pagenum' scope='request'/>
					<bean:define id="totpagenum" name='totpagenum' scope='request'/>

 
					<logic:present name="searchCriteria" scope="request">
						<bean:define id="searchMap" name="searchCriteria" scope="request" />
					</logic:present>

					<tr>
						<td align="Left" class="links" colspan="3">
							<logic:present name="prevCustomer"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)-1)%>)" title="<bean:message key='ToolTip.SubmissionList.PrevPage'/>">
								<bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
						
						<td align="right" class="links" colspan="11">
							<logic:present name="moreCustomer"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)+1)%>)" title="<bean:message key='ToolTip.SubmissionList.NextPage'/>">Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>
					
					<tr><td colspan="14" >&nbsp;</td></tr>
					
					<tr>
						<th valign="center" align="center">
							<bean:message key="CustomerSearchResult.SlNo"/>
						</th>
						
						<th>
							Broker Name
						</th>	
					
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
						      	<th valign="center" align="center">Submission <br>Id</th>
						</dmshtml:dms_static_with_connector>
						
						<th valign="center" align="center">
							Submission Number
						</th>

						<th>
							Submission Name
						</th>
						<th>
							Submission Status
						</th>
						<th>
							Clearance Status
						</th>
						<th>
							DBA
						</th>
																							
						<th>
							<bean:message key="CustomerSearchResult.Address" />
						</th> 
						
						 <th>
							<bean:message key="CustomerSearchResult.City" />
						</th> 
						<th>
							<bean:message key="CustomerSearchResult.State"/>
						</th>
						<th>
							<bean:message key="CustomerSearchResult.Zip"/>
						</th>
						<th NOWRAP>
							Created Date
						</th>
						<th>
						</th>
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
	

					<!--logic:iterate id="searchresultCustomerDisplay" name="searchresultCustomerDisplay" scope="request" -->
					<%
						java.util.ArrayList arrlistcusts = (java.util.ArrayList) request.getAttribute("searchresultCustomerDisplay");
						for (int mn=0; mn<arrlistcusts.size(); mn++){
							com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistcusts.get(mn);
					%>
					<%
							String cId = qmap.getString("Object::Customer::CustomerId");
					%>
					
					<tr bordercolor="#000000">
	   					<td>	   
							 <% i++; %>
							 <%=i%>
						</td>
						
						<% 
							String agencyName="";
							String submissionId = "";
							String submissionVerId = "";
						%>
						<dmshtml:GetSubmissionDetailsByCustomerId nameInSession="submissionList" customerId='<%=Long.parseLong(cId.toString())%>' ownerId='<%=Long.parseLong(ownerId.toString())%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
						<%
						java.util.ArrayList arrlistSubmission = (java.util.ArrayList) request.getAttribute("submissionList");
						for (int mn1=0; mn1<arrlistSubmission.size(); mn1++){
							com.dms.ejb.data.QuestionHashMap submissionMap = (com.dms.ejb.data.QuestionHashMap) arrlistSubmission.get(mn1);
							submissionId = ""+submissionMap.getString("Object::Submission::SubmissionId");
							submissionVerId = ""+submissionMap.getString("Object::Submission::SubmissionVerId");
						}	
						%>	
						<dmshtml:Get_Submission_Insured_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" submissionId='<%=submissionId.toString()%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
							<logic:present name="customerDetail1" scope="request">
								<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
									<% agencyName=customerDetailMap.getString("agencyname"); %>
							</logic:present>						
						<td>
							<%=agencyName%>
						</td>				

		 				

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
							<td class="SearchResult">
								<%=qmap.getString("Object::Submission::SubmissionId")%>
							</td>
						</dmshtml:dms_static_with_connector>
						
						<td>
							<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+qmap.getString("Object::Submission::SubmissionVerId")%>&answer(Object::Submission::SubmissionId)=<%=""+qmap.getString("Object::Submission::SubmissionId")%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=cId%>&customerId=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+cId %>" title="<bean:message key='ToolTip.SubmissionList.SubmissionNumber'/>">
								<%=qmap.getString("Object::Customer::SubmissionNumber"+"")%>	
							</a>
						</td>


						<td width="25%" style="WORD-BREAK:BREAK-ALL;">
							<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+qmap.getString("Object::Submission::SubmissionVerId")%>&answer(Object::Submission::SubmissionId)=<%=""+qmap.getString("Object::Submission::SubmissionId")%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=cId%>&customerId=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+cId %>" title="<bean:message key='ToolTip.SubmissionList.SubmissionName'/>">
							 	<%=qmap.getString("Object::Customer::CustomerName")%>
							</a>	
						</td>	
						<td>
							<%=qmap.getString("Object::Customer::Status")%>
						</td>	
						<td>
							<%=qmap.getString("Object::Customer::ClearanceStatus")%>
						</td>	
						<td>
							<%=qmap.getString("Object::Customer::DBA")%>
						</td>	
														
						<!-- <td class="SearchResult" >&nbsp;</td> -->
						
						<!-- NEWLY ADDED FOR ALLRISKS INSURED LIST
							 By- Anantha kumar.G
						 -->
						 <% String address1=qmap.getString("Object::Customer::Address1");  %>						
						 <% String address2=qmap.getString("Object::Customer::Address2"); %>						
						 <% String address=address1+" "+address2; %>
						
						<td>
							<%= address %>
						</td>
						<td>
							<%=qmap.getString("Object::Customer::City")%>						
						</td>
						<td>							
							<%=qmap.getString("Object::Customer::State")%>
						</td>
						<td>
							<%=qmap.getString("Object::Customer::Zip")%>
						</td>
						<td NOWRAP>														
								<% String createdDate1 ="";
									String date ="";
								createdDate1 = qmap.getString("Object::Submission::CreatedDate"); 				 					
									if(!createdDate1.equals("")){
                                        String arrCreatedDate[] = createdDate1.split(" ");
                                        date =""+arrCreatedDate[0];
                                        String arrCreatedDate1[] = date.split("-");
                                        String YYYY = arrCreatedDate1[0];
										String MM = arrCreatedDate1[1];
										String DD = arrCreatedDate1[2];
										
										createdDate1 = MM+"-"+DD+"-"+YYYY;
									}
									%>												
				 			<%=createdDate1 %>
						</td>
						 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_ENTRY"}%>' connector='or' negated="true">	
							<!-- <td class="SearchResult" >
								 <%=qmap.getString("Object::CustomerAdditional::DataEntry")%>&nbsp;
							</td> -->
						</dmshtml:dms_static_with_connector>
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"COPY_SUBMISSION"}%>' connector='or' negated="false">						
						<td colspan="20" class="links" title="<bean:message key='ToolTip.CopySubmission.CopySubmission'/>">	
						
						<%String copySubmissionID = "copySubmission(document.getElementById('Copy_Submission_"+i+"'),this)"; %>
							<a href="/CopySubmission.do?answer(TabPanelName)=Submission_Panel&answer(Object::Customer::Status)=<%=""+status %>&answer(Object::Customer::Like::SubmissionNumber)=<%=""+submissionNumber %>&answer(Object::Customer::PageNum)=0&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::SubmissionId)=<%=""+qmap.getString("Object::Submission::SubmissionId")%>&answer(Object::Submission::SubmissionVerId)=<%=""+qmap.getString("Object::Submission::SubmissionVerId")%>&answer(Object::Submission::InsuredId)=<%=""+cId%>&answer(Object::Customer::CustomerId)=<%=""+cId%>&answer(customerId)=<%=""+cId%>&answer(Agency::AgencyId)=<%=""+qmap.getString("Object::Submission::AgencyId")%>&answer(1*Customer::Equals::SearchObjectType)=<%=""+objType1%>&answer(1*Customer::Equals::SearchObjectId)=<%=""+agencyIdtoLink1%>&answer(AgentId)=<%=""+qmap.getString("Object::Submission::AgentId")%>&answer(Object::Customer::Like::customerName)=<%=""+customerName %>" id="<%="Copy_Submission_"+i %>" ></a><html:button styleClass="linkButton" property="answer(CopySubmission)" value="Copy" onclick='<%=""+copySubmissionID %>'/>					        								
						</td>
						</dmshtml:dms_static_with_connector>
					</tr>
					<!--/logic:iterate-->
					<%}%>
					
					<tr><td colspan="14" >&nbsp;</td></tr>
	
					<tr>
						<td align="left" class="links" colspan="3">
							<logic:present name="prevCustomer"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)-1)%>)" title="<bean:message key='ToolTip.SubmissionList.PrevPage'/>">
								<bean:message key="Common.Previous"/></a>
							</logic:present>
						</td>
				
						<td align="right" class="links" colspan="11">
							<logic:present name="moreCustomer"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pagenum)+1)%>)" title="<bean:message key='ToolTip.SubmissionList.NextPage'/>">Next&gt;&gt;</a>
							</logic:present>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		</logic:present>
		<!-- <tr>
			<td width="100%">
				<table>
					<tr>
						<td align="center"><dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
						</td>-->
					<!-- 	<logic:present name ='searchresultCustomerDisplay' scope ='request'>
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
								<%//session.removeAttribute("XMLGenerated");%>
							</dmshtml:dms_static_with_connector>
						</logic:present> -->
					<!-- </tr>
				</table>
			</td>
		</tr>-->

		<logic:present name="xmlValidationErrorList"  scope="request" >
		<!--  tr --> <!-- td -->
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
		<!--  </td> </tr >	 -->
		</logic:present >
	</table>

	
	
	<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN","GENERAL_AGENT","GENERAL_EMPLOYEE","GENERAL_ADMIN","AGENCY_EMPLOYEE","SSO_AGENT","SSO_AGENCY"}%>' connector='or' negated="true">


<logic:present name="LoginPage" scope="session">

	<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
	<bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
	<% 
	    long agencyId = 0;
	 	try{
	 		agencyId=Long.parseLong(""+AgencyID);
	 	}catch(Exception ex){}
	 	if(agencyId > 0){
    %>
       <html:hidden property="answer(1*Customer::Equals::SearchObjectType)" value="AGENCY"/>
	   <html:hidden property="answer(1*Customer::Equals::SearchObjectId)" value="<%=""+agencyId%>"/>
	   
    <%}else{ 
    %>
	<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>" />
	<%String objType="";%>
	<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
	<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />
	
		<%if(objDescType.toString().equals("ENTITY")){%>			
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN","AGENCY_EMPLOYEE"}%>' connector='or' negated="true">
				<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"userId="<%=usernameId.toString()%>"/>
				<logic:present name="agencyIdent" scope="session">
					<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
					<html:hidden property="answer(1*Customer::Equals::SearchObjectId)" value="<%=agencyIdid.toString()%>"  styleId="objectId"/>
					<html:hidden property="answer(1*Customer::Equals::SearchObjectType)" value="AGENCY"/>	
					
				</logic:present>
				</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"GENERAL_AGENT","GENERAL_EMPLOYEE","GENERAL_ADMIN"}%>' connector='or' negated="true">
				<dmshtml:Get_GeneralAgency_By_AgentUserId userId="<%=usernameId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' nameInSession="gaagencyIdentity"/>  
				<logic:present name="gaagencyIdentity" scope="session">
					<bean:define id="gaIdent" name="gaagencyIdentity" type="java.lang.Long" scope="session"/>
					<html:hidden property="answer(2*Customer::Equals::SearchObjectId)" value="<%=gaIdent.toString()%>"/>
					<html:hidden property="answer(2*Customer::Equals::SearchObjectType)" value="GENERAL_AGENCY"/>
				</logic:present>
			</dmshtml:dms_static_with_connector>
		<%}else if(objDescType.toString().equals("GENERAL_AGENCY")){%>
				<html:hidden property="answer(3*Customer::Equals::SearchObjectId)" value="<%=""+objDescId%>"/>
				<html:hidden property="answer(3*Customer::Equals::SearchObjectType)" value="GENERAL_AGENCY"/>
		<%}else if(objDescType.toString().equals("AGENCY")){%>
				<html:hidden property="answer(4*Customer::Equals::SearchObjectId)" value="<%=""+objDescId%>"/>
				<html:hidden property="answer(4*Customer::Equals::SearchObjectType)" value="AGENCY"/>
<%				objType1 = "AGENCY"; %>
		<%}%>
		<%}%>
	
</logic:present>



</dmshtml:dms_static_with_connector>
	<html:hidden property="TabPanelName" value="Submission_Panel" />
	
			<html:hidden property="answer(1*Customer::Equals::SearchObjectId)" value="<%=""+agencyIdtoLink1%>"  />
			
			
</html:form>

<html:form styleId="SubmissionList" action="/CopySubmission.do">
<logic:present name="LoginPage" scope="session">
	<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
	<bean:define id="usernameId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>	
	<bean:define id="AgencyID" name="userDetailObject" property="agencyid" scope="session" />
	<% 
	    long agencyId = 0;
	 	try{
	 		agencyId=Long.parseLong(""+AgencyID);
	 	}catch(Exception ex){}
	 	if(agencyId > 0){
    %>
       <html:hidden property="answer(1*Customer::Equals::SearchObjectType)" value="AGENCY"/>
	   <html:hidden property="answer(1*Customer::Equals::SearchObjectId)" value="<%=""+agencyId%>"/>
    <%}else{ 
    %>
	
	<dmshtml:Get_ObjDesc_By_UserId nameInSession="objectDescriptor" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>" />
	<%String objType="";%>
	<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryObjectId)" 	name="LoginPage" scope="session" />
	<bean:define id="objDescType" property="answer(Object::UserDetail::PrimaryObjectType)" name="LoginPage" scope="session" />
		<%if(objDescType.toString().equals("ENTITY")){%>			
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"AGENT","AGENCY_ADMIN","AGENCY_EMPLOYEE"}%>' connector='or' negated="true">
				<dmshtml:Get_AgencyId_By_UserId nameInSession="agencyIdent" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>" userId="<%=usernameId.toString()%>" />
				<logic:present name="agencyIdent" scope="session">
					<bean:define id="agencyIdid" name="agencyIdent" type="java.lang.Long" scope="session"/>
					<html:hidden property="answer(1*Customer::Equals::SearchObjectId)" value="<%=agencyIdid.toString()%>"/>
					<html:hidden property="answer(1*Customer::Equals::SearchObjectType)" value="AGENCY"/>				
				</logic:present>
			</dmshtml:dms_static_with_connector>
			<dmshtml:dms_static_with_connector ruleName='role' property='<%=new String[]{"GENERAL_AGENT","GENERAL_EMPLOYEE","GENERAL_ADMIN"}%>' connector='or' negated="true">
				<dmshtml:Get_GeneralAgency_By_AgentUserId userId="<%=usernameId.toString()%>" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' nameInSession="gaagencyIdentity"/>  
				<logic:present name="gaagencyIdentity" scope="session">
					<bean:define id="gaIdent" name="gaagencyIdentity" type="java.lang.Long" scope="session"/>
					<html:hidden property="answer(2*Customer::Equals::SearchObjectId)" value="<%=gaIdent.toString()%>"/>
					<html:hidden property="answer(2*Customer::Equals::SearchObjectType)" value="GENERAL_AGENCY"/>
				</logic:present>
			</dmshtml:dms_static_with_connector>
		<%}else if(objDescType.toString().equals("GENERAL_AGENCY")){%>
				<html:hidden property="answer(3*Customer::Equals::SearchObjectId)" value="<%=""+objDescId%>"/>
				<html:hidden property="answer(3*Customer::Equals::SearchObjectType)" value="GENERAL_AGENCY"/>
		<%}else if(objDescType.toString().equals("AGENCY")){%>
				<html:hidden property="answer(4*Customer::Equals::SearchObjectId)" value="<%=""+objDescId%>"/>
				<html:hidden property="answer(4*Customer::Equals::SearchObjectType)" value="AGENCY"/>
		<%}%>
		
 <%} %>		
		
	
</logic:present>
</html:form>


<SCRIPT type="text/javascript" >
	function copySubmission(url,obj)
	{
	document.getElementById('SubmissionList').action=url;
	obj.disabled=true;
	document.getElementById('SubmissionList').submit();
	}
</SCRIPT>
	