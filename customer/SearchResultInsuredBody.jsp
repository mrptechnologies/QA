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
<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 var pagenumber = "&answer(Object::Customer::PageNum)="+nextOrPre;
	 formElement.action="../FindAllInsuredXml.do?&answer(ownerId)=<%=""+ownerId %>"+pagenumber;
	 document.forms[0].submit();
	}
</SCRIPT>

<bean:define id="LoginType" property="answer(Object::UserDetail::LoginType)" name="LoginPage" scope="session"/>
<html:form action="/XMLGeneratorAction" >


	<%String agencyIdtoLink="";%>
	<%if (request.getParameter("answer(1*Customer::Equals::SearchObjectId)")!= null) {
		agencyIdtoLink=request.getParameter("answer(1*Customer::Equals::SearchObjectId)");
	}%>
	<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td height="5"></td>
		</tr>

		<tr>
			<td class="NewSectionHead" colspan="4" align="center">INSURED LIST</td>
		</tr>

		<tr><td>&nbsp;</td></tr>
		
		<!--<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_EMPLOYER_GROUP_MENU"}%>' connector='or' negated="true">
			<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CUSTOMER_CREATE","CUSTOMER_MODIFY"}%>' connector='or' negated="true">	
			 	<tr>
					<td class="links" align="left" colspan="2"><a href="../AddInsured.do?TabPanelName=Insured_Panel&clear=yes" >Add Insured</a></td></tr> 
			</dmshtml:dms_static_with_connector>
		</dmshtml:dms_static_with_connector>
	  	<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"ADD_LIU_INSURED_MENU"}%>' connector='or' negated="true">
	  			<tr><td>
				<a href="../AddLIUInsured.do?TabPanelName=Insured_Panel&clear=yes&answer(Object::PageType)=ADD_INSURED">Add Insured</a>
				</td></tr>
		</dmshtml:dms_static_with_connector>		
         -->
		<logic:present name="customersSize" scope="request">
			<bean:define id="customersSize1" name="customersSize" scope="request"/>
			<tr><td><html:hidden property="answer(Object::Customer::TotalRec)" value="<%=customersSize1.toString()%>"/></td></tr>	
			<tr><td class="FormLabels">No of Insured Found:&nbsp;<%=customersSize1.toString()%></td></tr>
		</logic:present>
		
		<logic:present name="showAllCustomers" scope="request">
			<tr>
			<td class="FormLabels" >
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
				<td>
				<table>
					<tr><td>&nbsp;</td></tr>
		
					<tr>
						<td class="Error" >
							<% String DisplayString ="No Insured Found starting with letter ";
							String searchLetter=request.getParameter("answer(Object::Customer::Like::customerName)");%>	
							<%if (searchLetter==null || searchLetter.equals("")) {
								DisplayString="No Insured Found";
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
					<html:hidden name="FindCustomerXml" property="answer(1*Customer::Equals::SearchObjectId)"/></td></tr>

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
						<td class="sectionhead" width="8%">
							<bean:message key="CustomerSearchResult.SlNo"/>
						</td>
					
						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
						      	<td class="sectionhead" width="15%">Insured Id</td>
						</dmshtml:dms_static_with_connector>
						
						<td class="sectionhead" width="8%">
							<bean:message key="CustomerSearchResult.InsuredNumber"/>
						</td>

						<td class="sectionhead" width="20%">
							<bean:message key="CustomerSearchResult.EmployerGroupName"/>
						</td>	
												
						<!-- NEWLY ADDED FOR ALLRISKS INSURED LIST
							 By- Anantha kumar.G
						 -->
						<td class="sectionhead" width="12%">
							<bean:message key="CustomerSearchResult.Address" />
						</td> 
						
						 <td class="sectionhead" width="12%">
							<bean:message key="CustomerSearchResult.City" />
						</td> 

						<td class="sectionhead" width="10%">
							<bean:message key="CustomerSearchResult.State"/>
						</td>
						<td class="sectionhead" width="10%">
							<bean:message key="CustomerSearchResult.Zip"/>
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
	

					<!--logic:iterate id="searchresultCustomerDisplay" name="searchresultCustomerDisplay" scope="request" -->
					<%
						java.util.ArrayList arrlistcusts = (java.util.ArrayList) request.getAttribute("searchresultCustomerDisplay");
						for (int mn=0; mn<arrlistcusts.size(); mn++){
							com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistcusts.get(mn);
					%>
					
					<tr>
	   					<td class="SearchResult">	   
							 <% i++; %>
							 <%=i%>
						</td>

		 				<%
							String cId = qmap.getString("Object::Customer::CustomerId");
						%>

						<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
							<td class="SearchResult">
								<%=cId%>
							</td>
						</dmshtml:dms_static_with_connector>
						
						<td class="SearchResult" >
							<a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=cId%>" >
								<%=qmap.getEncodedString("Object::Customer::CustomerNumber")%>
							</a>&nbsp;&nbsp;
						</td>


						<td class="SearchResult" >
							<a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=cId%>" >
							 	<%=qmap.getEncodedString("Object::Customer::CustomerName")%>
							</a>	
						</td>												
						
						<!-- <td class="SearchResult" >&nbsp;</td> -->
						
						<!-- NEWLY ADDED FOR ALLRISKS INSURED LIST
							 By- Anantha kumar.G
						 -->
						 <% String address1=qmap.getEncodedString("Object::Customer::Address1");  %>						
						 <% String address2=qmap.getEncodedString("Object::Customer::Address2"); %>						
						 <% String address=address1+" "+address2; %>
						
						<td class="SearchResult" >
							<%= address %>&nbsp;
						</td>
						<td class="SearchResult" >
							<%=qmap.getString("Object::Customer::City")%>&nbsp;							
						</td>
						<td class="SearchResult" >							
							<%=qmap.getString("Object::Customer::State")%>&nbsp;
						</td>
						<td class="SearchResult" >
							<%=qmap.getString("Object::Customer::Zip")%>&nbsp;
						</td>
						
						 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_ENTRY"}%>' connector='or' negated="true">	
							<!-- <td class="SearchResult" >
								 <%=qmap.getString("Object::CustomerAdditional::DataEntry")%>&nbsp;
							</td> -->
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
						<td align="center">&nbsp;
						</td>
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
					</tr>
				</table>
			</td>
		</tr>

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
		<%}%>
	
</logic:present>



</dmshtml:dms_static_with_connector>
	<html:hidden property="TabPanelName" value="Insured_Panel" />
</html:form>


