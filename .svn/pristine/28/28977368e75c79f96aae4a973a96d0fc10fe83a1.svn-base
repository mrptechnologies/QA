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

<!-- <title><%=session.getAttribute("PageTitle")%> - Agency LookUp</title>
<link rel="stylesheet" href="../styles/Styles.css" type="text/css"> -->
<%


String pagenum=(String)request.getAttribute("pagenum");
String totrec=(String)request.getAttribute("totrec");
//String frmName=(String)request.getParameter("FormName");
String frmName="CheckClearance";
	System.out.println("frmName  :"+frmName);
%>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/AddAgent.js"></SCRIPT>
<SCRIPT type="text/javascript">
<!--


function CloseWindow(){
top.opener.location.reload(true);
window.close();
}
function loadParent(){
//window.opener.location.href=url;
setTimeout( "window.close();", 1250 );
}
function submitToParent(frm)
 {
	 if(tempAgencyName==null){
		 alert("Please select a agency from the list");
		 return false;
	 }
	 else{
		 var formname = frm.parentFormName.value;
		 //alert(formname);
		 window.opener.document.<%=frmName%>.AgencyName.value = tempAgencyName;//instead of tempAgencyName
		 if(window.opener.document.<%=frmName%>.AgencyNameDisplay!=undefined){
		 window.opener.document.<%=frmName%>.AgencyNameDisplay.value = tempAgencyName;}
			window.opener.document.<%=frmName%>.AgencyIdFromPopup.value = tempAgencyId;
			window.opener.document.<%=frmName%>.AgencyIdFromPopup1.value = tempAgencyId;
		 setTimeout( "window.close();", 2 );
		 return true;
	 }
}


function submitToChild()
 {

	 var frm = document.forms[0];		
     frm.thisAgencyName.value = (window.opener.document.<%=frmName%>.AgencyName.value);	 
	 return true;
}


var searchFlag = 0;
//-->
</SCRIPT>


		
<html:form action="/AgencyForAgentSearchPage2.do"  styleId="searchAgency">
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
	<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
		 <tr><td>&nbsp;</td></tr> 
	<!-- 	<tr><td height="5px"class="NewSectionHead" colspan="6" align="center">AGENCY SEARCH</td></tr> -->
		
	
	
		<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
		<tr>
			<td width="40%" align="right" class="FormLabels">
			Agency Id
			</td> 
			<td align="left" ><html:text  property="answer(Agency::Equals::AgencyId)" styleClass="txtbox"/></td>

		</tr>	
		</dmshtml:dms_static_with_connector>
		


		<tr>
			<td width="40%" align="right" class="FormLabels">
			Agency Name
			</td> 
			<td align="left" ><html:text property="answer(Agency::Like::BusinessName)" styleClass="txtbox" styleId="thisAgencyName"/></td>
		</tr>


		<tr>
			<td  align="right" class="FormLabels">State</td><td>
			<dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=Long.parseLong(""+ownerId) %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
			<html:select property="answer(Address::Equals::State)" styleClass="txtbox">
			<html:option value ="">Select</html:option>
			<logic:iterate id="details" name="arStates" scope="request" >
			<bean:define id='test' name="details"  property="typeDesc" />
			<html:option value ='<%=test.toString()%>'>
			<bean:write name="details" property="dmsType" />
			</html:option>
			</logic:iterate>
			</html:select>
			</td>
		</tr>


		<tr>
			<td colspan="2" align="center" >
			<html:submit value="Find" property="Search" styleClass="sbttn"/>
			</td>
		</tr>
		
	</table>

	<html:hidden property="LimitSearch" value="yes" />
	<html:hidden styleId="inpPageNum" property="answer(Object::Agency::PageNum)" value="0"/>
	<html:hidden styleId="inpPageNum" property="answer(Agency::NotEquals::ParentAgencyId)" value="-1"/>	
	<html:hidden styleId="orderby" property="answer(Agency::orderBy)" value="DMS_AGENCY.BUSINESS_NAME, DMS_AGENCY.DMS_AGENCY_ID "/>
	<html:hidden styleId="ownerId" property="answer(Agency::Equals::OwnerId)" value="<%=""+ownerId %>"/>
</html:form>







<!-- ################################################################################################ -->




	<html:form action="/AgencyForAgentSearchPage2.do" styleId="getAgencyDetail" onsubmit="return submitToParent(this);">
			<%java.util.ArrayList agencyArrList=new java.util.ArrayList();%>
			
			<logic:present name="searchresultnewDisplay" scope="request">
			<bean:define id="arrList" name="searchresultnewDisplay" type="java.util.ArrayList" />
				<%agencyArrList=arrList;%>
			</logic:present>
			
			<%
			if(request.getAttribute("searchresultnewDisplay")!=null)
				{%>
				<script type="text/javascript">
				<!--
					searchFlag = 1;
				//-->
				</script>

		<table width="100%" align="center" border="0" >
			<tr>
				<td width="100%" align="left" class="links" colspan="3">Number of search results found : <%=totrec%></td>
			</tr>
		<%
			String encodedOrderBy = java.net.URLEncoder.encode("DMS_AGENCY.BUSINESS_NAME,DMS_AGENCY.DMS_AGENCY_ID");
		%>

			
				<logic:present name="prevAgency" scope="request">
				<bean:parameter id="strAgentName" name="answer(Agency::Like::BusinessName)"/>
				<bean:parameter id="strState" name="answer(Address::Equals::State)"/><tr>
					<td class="links" colspan="2">
					<a href="../AgencyForAgentSearchPage1.do?&LimitSearch=yes&answer(Address::Equals::State)=<%=strState%>&answer(Object::Agency::TotalRec)=<%=totrec%>&answer(Agency::Like::BusinessName)=<%=strAgentName%>&FormName=<%=frmName%>&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(Agency::orderBy)=<%=encodedOrderBy%>">&lt;&lt;Previous</a></td></tr>
				</logic:present>
			

				<logic:present name="moreAgency" scope="request">
				<bean:parameter id="strAgentName" name="answer(Agency::Like::BusinessName)"/>
				<bean:parameter id="strState" name="answer(Address::Equals::State)"/>
					<tr><td align="right" class="links" colspan="1">
					<a href="../AgencyForAgentSearchPage1.do?&LimitSearch=yes&answer(Address::Equals::State)=<%=strState%>&answer(Object::Agency::TotalRec)=<%=totrec%>&answer(Agency::Like::BusinessName)=<%=strAgentName%>&FormName=<%=frmName%>&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(Agency::orderBy)=<%=encodedOrderBy%>">Next
					>></a></td></tr>
				</logic:present>
			
				
		</table>





		<table width="100%" align="center" border="0" CELLSPACING="2" CELLPADDING="0">
	
			<tr >	
				<td class="sectionhead" width="20%" align="center">Agency Id</td>
				<td class="sectionhead" width="65%" align="center">Agency Name</td>
				<td class="sectionhead" width="15%" align="center">Select</td>
			</tr>



			
			<%

			for(int i=0; i<agencyArrList.size();i++)
			{
				com.dms.ejb.data.QuestionHashMap qmap_Temp = (com.dms.ejb.data.QuestionHashMap)agencyArrList.get(i);
				%>
					<tr>
						<!-- <td class="SearchResult" name="CheckClearance" scope="request"  align="center">
							 <%=(i+1)%>
						</td> -->
					
						<td class="SearchResult" align="center">
						 <%=qmap_Temp.getString("Object::AGENCY::AGENCYID")%>
						 <input type="hidden" id="SelectedAgencyNum" value='<%=qmap_Temp.getString("Object::AGENCY::AGENCYID")%>'/>
						</td>
					
						<td class="SearchResult"><%=qmap_Temp.getString("Object::AGENCY::BUSINESSNAME")%> 
						<input type="hidden" id="SelectedAgencyNum" value='<%=qmap_Temp.getString("Object::AGENCY::BUSINESSNAME")%>'/>
						</td>
						<td class="SearchResult"  align="center">			
						<INPUT TYPE="radio" value="<%=(i)%>" name="CheckClearance" onclick="return selectValue(this)"/>
						</td>
					</tr>
			<%}
			%>
			
		</table>


		<table width="100%" align="center" border="0" >

			
				<logic:present name="prevAgency" scope="request">
				<bean:parameter id="strAgentName" name="answer(Agency::Like::BusinessName)"/>
				<bean:parameter id="strState" name="answer(Address::Equals::State)"/>
				<tr>	
					<td class="links" colspan="2">
					<a href="../AgencyForAgentSearchPage1.do?&LimitSearch=yes&answer(Address::Equals::State)=<%=strState%>&answer(Object::Agency::TotalRec)=<%=totrec%>&answer(Agency::Like::BusinessName)=<%=strAgentName%>&FormName=<%=frmName%>&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(Agency::orderBy)=<%=encodedOrderBy%>">&lt;&lt;Previous</a>
					</td>
				</tr>
				</logic:present>
			
				<logic:present name="moreAgency" scope="request">
				<bean:parameter id="strAgentName" name="answer(Agency::Like::BusinessName)"/>
				<bean:parameter id="strState" name="answer(Address::Equals::State)"/>
					<tr><td align="right" class="links" colspan="1">
					<a href="../AgencyForAgentSearchPage1.do?&LimitSearch=yes&answer(Address::Equals::State)=<%=strState%>&answer(Object::Agency::TotalRec)=<%=totrec%>&answer(Agency::Like::BusinessName)=<%=strAgentName%>&FormName=<%=frmName%>&answer(Object::Agency::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(Agency::orderBy)=<%=encodedOrderBy%>">Next
					>></a></td></tr>
				</logic:present>
			
				

		<tr>
			<td  colspan="3" align="right">
				<html:submit value="Select"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
			</td>
		</tr>
			</table>



		<%
		}
		else
		{
			System.out.println("ARRAY LIST IS NULL ");
			if(request.getParameter("Search")!=null)
			{
			%>
				<table border="0"width="100%">
					<tr>
						<td class="Error">No Results Found !!</td>
					</tr>
				</table>
			<%}
		}
		%>

		<table>
		<tr>
			<td colspan="1" align="left">
				<a href="javascript:window.close();"><img style="margin-right:20px;" src="../Images/button_close_window.gif" alt="Close Window" border="0" /></a>
			</td>
		</tr>
	</table>
	
	<%System.out.println("frmName  :"+frmName);%>
			<input name="FormName" type="hidden" value="<%=frmName%>" id="parentFormName" />
			<input name="FormName1" type="hidden" value="<%=frmName%>"/>

</html:form>






<script type="text/javascript">
<!--
	if (searchFlag==0)
		submitToChild();
//-->
</script>
