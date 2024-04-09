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

<SCRIPT type="text/javascript" >
	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="../FindClearanceAction.do?answer(Object::Clearance::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
</SCRIPT>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:form action="/SaveInsuredSubmissionClearanceAction.do">
<div class="formpage01">
<div class="formhead"><h2 class="left">CLEARANCE LIST</h2></div>
<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"CLEARANCE_AGENCY"}%>' connector='or' negated="true">	
 <logic:notPresent name='ClearanceRecords' scope="request" >
   <table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td class="Error" >No Records Found</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
        <td>
           <a href="javascript:;" onclick="document.location.href='/clearance/FindClearance.jsp';" class="button2" style="width:90px;">Back</a> 
        </td>
    </tr>
  </table>
 </logic:notPresent>
 <logic:present name='ClearanceRecords' scope="request" >
	<bean:define id="NoOfRecords"   name="ClRecordsSize" scope="request"/>
	<bean:define id="pageNum" name='pageNum' scope='request'/>
	<bean:define id="totPageNum" name='totPageNum' scope='request'/>
	
	<html:hidden property="answer(Object::Clearance::TotalRec)" value="<%=NoOfRecords.toString()%>"/>
	
	<table WIDTH="90%" ALIGN="center" class="loctablenew" BORDER="0" CELLSPACING="0" CELLPADDING="0" >
	
	 <tr><td colspan="15"><h3>No of Clearance Found:&nbsp;<%=NoOfRecords.toString()%></h3></td></tr>
	 <tr>
	     <td align="center" class="sectionhead" colspan="15">
			<%="Page "+(Integer.parseInt(""+pageNum)+1)%>
       	 </td>
   	 </tr>
   	 <tr><td colspan="15">&nbsp;</td></tr>
     <tr>
   		 <td align="Left" class="links" colspan="7">
			<logic:present name="prevCustomer"  scope="request" >
				<a href="javascript:navigate(<%=(Integer.parseInt(""+pageNum)-1)%>)" >
				<bean:message key="Common.Previous"/></a>
			</logic:present>
		 </td>
	  	 <td align="right" class="links" colspan="8">
			<logic:present name="moreCustomer"  scope="request" >
				<a href="javascript:navigate(<%=(Integer.parseInt(""+pageNum)+1)%>)" >Next&gt;&gt;</a>
			</logic:present>
	     </td>
	</tr>
	<tr><td colspan="15" >&nbsp;</td></tr>							
	<tr>				
		<td  valign="top">SI.No &nbsp;</td>
		<td  valign="top">Data Source &nbsp;</td>
		<td  valign="top">Submission # &nbsp;</td>
		<td  valign="top">Submission Has Reservation &nbsp;</td>
		<td  valign="top">Submission Name1 &nbsp;</td>
		<td  valign="top">Submission Name2 &nbsp;</td>
		<td  valign="top">DBA &nbsp;</td>
		<td  valign="top">State &nbsp;</td>
		<td  valign="top">Zip code &nbsp;</td>
		<td  valign="top">Quote # &nbsp;</td>
		<td  valign="top">Quote Has Reservation &nbsp;</td>					
		<td  valign="top">Policy # &nbsp;</td>
		<td  valign="top">Policy Has Reservation &nbsp;</td>
		<td  valign="top">Broker Name &nbsp;</td>
		<td  valign="top">Linked&nbsp;</td>					
	</tr>					
	<% int index=0;%>

		<%
			try{
				index=Integer.parseInt(pageNum.toString());
				index = index * 20;
			  }catch(NumberFormatException nfe)
			  {
				  index=0;
			  }
			
		%>								
	<%
		java.util.ArrayList arrlistdocs = (java.util.ArrayList)request.getAttribute("ClearanceRecords");
		
		for(int docIndex=0;docIndex<arrlistdocs.size();docIndex++){
			com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistdocs.get(docIndex);										
	%>														
    <tr>
		<td  align="left">
			<% index++;%>
			<a href='../GetClearnceSummaryAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Clearance::ClearanceSource)=<%=qmap.getString("Object::Clearance::Source")%>&answer(Object::Clearance::LineOfBusinessId)=<%="1"%>&answer(Object::Clearance::CustomerId)=<%=qmap.getString("Object::Customer::CustomerId")%>&answer(Object::Clearance::AgencyId)=<%=qmap.getString("Object::Agency::AgencyId")%>&answer(Object::Submission::SubmissionId)=<%=qmap.getString("Object::Submission::SubmissionId")%>&answer(Object::Quote::QuoteId)=<%=qmap.getString("Object::Quote::QuoteId")%>&answer(Object::Clearance::PolicyId)=<%=qmap.getString("Object::Policy::PolicyId")%>&answer(Object::Customer::ClearanceLinked)=<%=qmap.getString("Object::Clearance::Linked")%>&answer(Object::Policy::PolicyNumber)=<%=qmap.getString("Object::Clearance::PolicyNumber")%>&answer(Object::Clearance::Status)=<%=qmap.getString("Object::Clearance::Status")%>&answer(pagename)=Search in Clearance Database Old UI'>
			 <%=index%>	
			</a>
										
		</td>
		<td align="left" >	
				<%=qmap.getString("Object::Clearance::Source") %>
		</td>
		
		<td align="left" class="links">
			<%
				String cId = qmap.getString("Object::Customer::CustomerId");
			%>
			<%if(qmap.getString("Object::Clearance::Source").equals("SOLARTIS")){ %>
			<a href="../GetSubmissionInsuredDetailAction.do?TabPanelName=Submission_Panel&answer(Object::Submission::SubmissionVerId)=<%=""+qmap.getString("Object::Submission::SubmissionVerId")%>&answer(Object::Submission::SubmissionId)=<%=""+qmap.getString("Object::Submission::SubmissionId")%>&answer(TabPanelName)=Submission_Panel&answer(customerId)=<%=cId%>&customerId=<%=cId%>&answer(Object::Customer::CustomerId)=<%=cId%>&answer(requestForm)=Submission&answer(Object::Application::ApplicationType)=SUBMISSION_APPLICATION&answer(Object::Submission::InsuredId)=<%=""+cId %>" >
				<%=qmap.getString("Object::Clearance::SubmissionNumber") %>
			</a>
			<%}else{ %>
			<%=qmap.getString("Object::Clearance::SubmissionNumber") %>
			<%} %>
			 &nbsp;
		</td>
		<td  align="left" >
			<%=qmap.getString("Object::Clearance::SubmissionHasReserved") %>&nbsp;
		</td>	
		<td  align="left" >
		<%if(qmap.getString("Object::Clearance::Source").equals("SOLARTIS")){ %>
			<a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=qmap.getString("Object::Customer::CustomerId")%>" >
			<%=qmap.getString("Object::Clearance::LegalName1") %>&nbsp;					
			</a>		
			<%} else { %>
			<a href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=qmap.getString("Object::Customer::ExtCustomerId")%>" >
			<%=qmap.getString("Object::Clearance::LegalName1") %>&nbsp;					
			</a>		
			<%}%>
		</td>									
		<td  align="left" >
			<%=qmap.getString("Object::Clearance::LegalName2") %>&nbsp;									
		</td>
		<td  align="left" >
			<%=qmap.getString("Object::Clearance::DBA") %>	&nbsp;								
		</td>
		<td  align="left" >
			<%=qmap.getString("Object::Clearance::State") %>&nbsp;
		</td>
		<td  align="left" >
			<%=qmap.getString("Object::Clearance::Zipcode") %>&nbsp;
		</td>
		<td class="links" align="left" >
		<%if(qmap.getString("Object::Clearance::Source").equals("SOLARTIS")){ %>
			<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=qmap.getString("Object::Customer::CustomerId")%>&answer(Object::Agency::AgencyId)=<%=qmap.getString("Object::Agency::AgencyId")%>&answer(QuoteId)=<%=qmap.getString("Object::Quote::QuoteId")%>&answer(policyNumber)=<%=qmap.getString("Object::Clearance::PolicyNumber")%>&answer(parentQuoteId)=<%=qmap.getString("Object::Quote::QuoteId")%>"><%=qmap.getString("Object::Clearance::QuoteNumber")%></a>
		<%}else{ %>
			<%=qmap.getString("Object::Clearance::QuoteNumber")%>
			<%} %>
		</td>
		
		<td  align="left" >
			<%=qmap.getString("Object::Clearance::QuoteHasReserved") %>&nbsp;
		</td>
		<td class="links" align="left" >
		<%if(qmap.getString("Object::Clearance::Source").equals("SOLARTIS")){ %>
				<a href="../GetPolicySummary.do?TabPanelName=Policy_Panel&answer(TabPanelName)=Policy_Panel&answer(policyNumber)=<%=qmap.getString("Object::Quote::PolicyNumber") %>">						
							<%=qmap.getString("Object::Quote::PolicyNumber") %> 
				</a>
				<%}else{ %>
			<%=qmap.getString("Object::Clearance::PolicyNumber")%>
			<%} %>
				
		</td>
		<td align="left" >
			<%=qmap.getString("Object::Clearance::PolicyHasReserved") %>&nbsp;
		</td>
		<td  align="left" >
			<%=qmap.getString("Object::Clearance::AgencyName") %>&nbsp;
		</td>
		
		<td  align="center" >
		<a href='../GetClearnceSummaryAction.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::Clearance::ClearanceSource)=<%=qmap.getString("Object::Clearance::Source")%>&answer(Object::Clearance::LineOfBusinessId)=<%="1"%>&answer(Object::Clearance::CustomerId)=<%=qmap.getString("Object::Customer::CustomerId")%>&answer(Object::Clearance::AgencyId)=<%=qmap.getString("Object::Agency::AgencyId")%>&answer(Object::Submission::SubmissionId)=<%=qmap.getString("Object::Submission::SubmissionId")%>&answer(Object::Quote::QuoteId)=<%=qmap.getString("Object::Quote::QuoteId")%>&answer(Object::Clearance::PolicyId)=<%=qmap.getString("Object::Policy::PolicyId")%>&answer(Object::Customer::ClearanceLinked)=<%=qmap.getString("Object::Clearance::Linked")%>&answer(Object::Policy::PolicyNumber)=<%=qmap.getString("Object::Clearance::PolicyNumber")%>&answer(Object::Clearance::Status)=<%=qmap.getString("Object::Clearance::Status")%>&answer(pagename)=Search in Clearance Database Old UI'>
			<%if(qmap.getString("Object::Clearance::Linked").equals("Y")){ %>
				Yes
			<%} %>
			<%if(qmap.getString("Object::Clearance::Linked").equals("N")){ %>
				No
			<%} %>	
		</a>					
		</td>
	</tr>							
				<%}%>							
	<tr><td colspan="15">&nbsp;</td></tr>
	<tr>
		<td align="left" class="links" colspan="3">
			<logic:present name="prevCustomer"  scope="request" >
				<a href="javascript:navigate(<%=(Integer.parseInt(""+pageNum)-1)%>)" >
				<bean:message key="Common.Previous"/></a>
			</logic:present>
		</td>

		<td align="right" class="links" colspan="12">
			<logic:present name="moreCustomer"  scope="request" >
				<a href="javascript:navigate(<%=(Integer.parseInt(""+pageNum)+1)%>)" >Next&gt;&gt;</a>
			</logic:present>
		</td>
	</tr>
	<tr><td colspan="15">&nbsp;</td></tr>		
	<tr>
	    <td colspan="15" align="Left">
					&nbsp;
		</td>
    </tr>
    <tr><td colspan="15">&nbsp;</td></tr>		
	</table>								
  </logic:present>						
</dmshtml:dms_static_with_connector>
			
<bean:define id="clearanceDataSource" name="CheckClearance" property="answer(Object::Clearance::Source)" /> 
<bean:define id="clearanceNameType" name="CheckClearance" property="answer(Object::Clearance::NameType)" /> 
<bean:define id="clearanceDBA" name="CheckClearance" property="answer(Object::Clearance::DBA)" /> 
<bean:define id="LegalName1" name="CheckClearance" property="answer(Object::Clearance::LegalName1)" /> 
<bean:define id="LegalName2" name="CheckClearance" property="answer(Object::Clearance::LegalName2)" /> 
<bean:define id="FirstName" name="CheckClearance" property="answer(Object::Clearance::FirstName)" />
<bean:define id="LastName" name="CheckClearance" property="answer(Object::Clearance::LastName)" />
<bean:define id="Zipcode" name="CheckClearance" property="answer(Object::Clearance::Zipcode)" /> 
<bean:define id="State" name="CheckClearance" property="answer(Object::Clearance::State)" /> 
<bean:define id="SubmissionNumber" name="CheckClearance" property="answer(Object::Clearance::SubmissionNumber)" /> 
<bean:define id="SESDate" name="CheckClearance" property="answer(Object::Clearance::SESDate)" /> 
<bean:define id="SEEDate" name="CheckClearance" property="answer(Object::Clearance::SEEDate)" /> 
<bean:define id="QuoteNumber" name="CheckClearance" property="answer(Object::Clearance::QuoteNumber)" /> 
<bean:define id="QESDate" name="CheckClearance" property="answer(Object::Clearance::QESDate)" /> 
<bean:define id="QEEDate" name="CheckClearance" property="answer(Object::Clearance::QEEDate)" /> 
<bean:define id="PolicyNumber" name="CheckClearance" property="answer(Object::Clearance::PolicyNumber)" /> 
<bean:define id="PESDate" name="CheckClearance" property="answer(Object::Clearance::PESDate)" /> 
<bean:define id="PEEDate" name="CheckClearance" property="answer(Object::Clearance::PEEDate)" /> 
<bean:define id="ClearanceStatus" name="CheckClearance" property="answer(Object::Clearance::ClearanceStatus)" />
<bean:define id="linked" name="CheckClearance" property="answer(Object::Clearance::Linked)" />           
                      	
             	
 <html:hidden property="answer(Object::Clearance::Source)" value="<%=""+clearanceDataSource %>" />
<html:hidden property="answer(Object::Clearance::NameType)" value="<%=""+clearanceNameType %>" /> 
<html:hidden property="answer(Object::Clearance::DBA)"	value="<%=""+clearanceDBA %>" /> 
<html:hidden property="answer(Object::Clearance::LegalName1)" value="<%=""+LegalName1 %>" /> 
<html:hidden property="answer(Object::Clearance::LegalName2)" value="<%=""+LegalName2 %>" /> 
<html:hidden property="answer(Object::Clearance::FirstName)" value="<%=""+FirstName %>" /> 
<html:hidden property="answer(Object::Clearance::LastName)" value="<%=""+LastName %>" /> 
<html:hidden property="answer(Object::Clearance::Zipcode)" value="<%=""+Zipcode %>" /> 
<html:hidden property="answer(Object::Clearance::State)" value="<%=""+State %>" /> 
<html:hidden property="answer(Object::Clearance::SubmissionNumber)" value="<%=""+SubmissionNumber %>" /> 
<html:hidden property="answer(Object::Clearance::SESDate)" value="<%=""+SESDate %>" /> 
<html:hidden property="answer(Object::Clearance::SEEDate)" value="<%=""+SEEDate %>" /> 
<html:hidden property="answer(Object::Clearance::QuoteNumber)" value="<%=""+QuoteNumber %>" /> 
<html:hidden property="answer(Object::Clearance::QESDate)" value="<%=""+QESDate %>" /> 
<html:hidden property="answer(Object::Clearance::QEEDate)" value="<%=""+QEEDate %>" /> 
<html:hidden property="answer(Object::Clearance::PolicyNumber)" value="<%=""+PolicyNumber %>" /> 
<html:hidden property="answer(Object::Clearance::PESDate)" value="<%=""+PESDate %>" /> 
<html:hidden property="answer(Object::Clearance::PEEDate)" value="<%=""+PEEDate %>" /> 
<html:hidden property="answer(Object::Clearance::ClearanceStatus)" value="<%=""+ClearanceStatus %>" />
<html:hidden property="answer(Object::Clearance::Linked)" value="<%=""+linked %>" /> 
  
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />	
</div>
</html:form>
