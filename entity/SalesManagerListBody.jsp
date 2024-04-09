<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<script type="text/javascript">
<!--

function confirmDelete(){
	var frm = document.forms[0];
	var count = 0;
	for(var i=0; frm.elements[i]!=null; i++) {
		if(frm.elements[i].type=="checkbox" && frm.elements[i].name == "answer(Object::Entity::Id)" && frm.elements[i].checked == true) {
			count++;
			break;
		}
	}
	if(count>0) {
		var ans = window.confirm('Are you sure that you want to delete the selected records?');
		if (ans)
			return true;
		else
			return false;
	} else {
		alert("Please select a record to delete.");
		return false;
	}
}

//-->

</script>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:form action="/SalesManagerDeleteAction" onsubmit="return confirmDelete()">
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
<tr><td>&nbsp;</td></tr>

<tr><td class="NewSectionHead" colspan="4" align="center">SALES MANAGER LIST</td></tr>
<tr><td>&nbsp;</td></tr>
<tr><td class="links">

</td></tr>
<tr><td class="links" align="left" colspan="2"><a href="../AddSalesManager.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&clear=yes">Add Sales Manager</a>
</td>
</tr>

<tr><td colspan="4"><hr size="1" noshade ></td></tr>
<tr>
<td valign="top">
<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

<tr>
<td colspan="6">
	
</td></tr>
<tr><td class="TextMatter" colspan="6"><b>
<logic:present name ='countSearchResult' scope ='request'>
Total Number of Sales Managers &nbsp;&nbsp;<%=request.getAttribute("countSearchResult").toString()%></b>
</logic:present></td></tr>
<bean:define id="searchCounter" name="countSearchResult" scope ='request' />
<% 
	int intSearchCounter = 0;
	try{
		intSearchCounter = Integer.parseInt(searchCounter.toString()); 
	} catch(Exception e) {
		intSearchCounter=0;
	}

	if(searchCounter==null || intSearchCounter < 1) { %>
<tr><td>&nbsp;</td></tr>
	<%	String diplayString =  "No Matching Records Found.";
		String searchLetter=""+request.getParameter("answer(Entity::Like::FirstName)");
		searchLetter=""+searchLetter+" "+request.getParameter("answer(Entity::Like::LastName)");
		searchLetter.trim();
		if(searchLetter!=null && searchLetter!="") {
			diplayString = "No Matching Records Found for "+searchLetter;
		}
	%>
	
<!-- 	<tr><td class="Error"><%=diplayString %>
</td></tr> -->

<tr><td>&nbsp;</td></tr>

<%} %>


<logic:present name ='searchresultnewDisplay' scope ='request'>
<!--html:form action="/AddEmployee" -->


<bean:define id="pagenum" name='pagenum' scope='request'/>
<bean:define id="totpagenum" name='totpagenum' scope='request'/>

<bean:define id="fname" name='FindSalesManager' property='answer(Entity::Like::FirstName)' scope='request'/>
<bean:define id="lname"  name='FindSalesManager'  property='answer(Entity::Like::LastName)' scope='request'/>
<bean:define id="TotalRec"  name='FindSalesManager'  property='answer(Object::Entity::TotalRec)' scope='request'/>
<bean:define id="type"  name='FindSalesManager'  property='answer(Entity::Equals::EntityType)' scope='request' />
<bean:define id="active"  name='FindSalesManager'  property='answer(Entity::Equals::Active)' scope='request' />


<tr><td height="6px" colspan="8" >&nbsp;</td></tr>
<%
	String encodedType = java.net.URLEncoder.encode(""+type);
%>



<tr>
		<td  class="links"  colspan="7">		


		<logic:present name="prevEntity"  scope="request" >

		<a href="../SearchSalesManager.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&entityType=<%=""+encodedType%>&answer(Entity::Equals::EntityType)=<%=""+encodedType%>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(entityType)=<%=""+encodedType%>&answer(objectType)=ENTITY&answer(Entity::Like::FirstName)=<%=""+fname%>&answer(Entity::Like::LastName)=<%=""+lname%>&answer(Entity::Equals::Active)=<%=""+active%>&answer(Object::Entity::TotalRec)=<%=""+TotalRec%>&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME,%20DMS_ENTITY.DMS_ENTITY_ID"><bean:message key="Common.Previous"/></a>
		</logic:present>
		</td>
		<td align="right" class="links" colspan="3">
		<logic:present name="moreEntity"  scope="request" >

		
		<a href="../SearchSalesManager.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&entityType=<%=""+encodedType%>&answer(Entity::Equals::EntityType)=<%=""+encodedType%>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(entityType)=<%=""+encodedType%>&answer(objectType)=ENTITY&answer(Entity::Like::FirstName)=<%=""+fname%>&answer(Entity::Like::LastName)=<%=""+lname%>&answer(Entity::Equals::Active)=<%=""+active%>&answer(Object::Entity::TotalRec)=<%=""+TotalRec%>&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME,%20DMS_ENTITY.DMS_ENTITY_ID">Next&gt;&gt;</a>


		</logic:present>
		</td>
</tr>
<tr><td>&nbsp;</td></tr>
<tr>
		
		<td class="sectionhead" width="2%">No.</td>
		<td class="sectionhead" width="25%">First Name</td>
		<td class="sectionhead" width="10%">Middle Name</td>
		<td class="sectionhead" width="15%">Last Name</td>
		<td class="sectionhead" width="15%">Type</td>
		<td class="sectionhead" width="15%">City</td>
		<td class="sectionhead" width="5%">State</td>
		<td class="sectionhead" width="15%">Contact Number</td>
		<td class="sectionhead" width="15%">E-mail</td>
		<td class="sectionhead">Select</td>
		
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

<logic:iterate id="searchresultnewDisplay" name="searchresultnewDisplay" scope="request" >
<bean:define id='test' name="searchresultnewDisplay"  property="answer(Object::Entity::EntityId)" />
<tr>
	

	<td class="SearchResult">
	<a href="../EditSalesManager.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />"><%=++i%></a>
	
	</td>
		
	<td class="SearchResult" >
	<a href="../EditSalesManager.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&entityId=<bean:write name='searchresultnewDisplay' property='answer(Object::Entity::EntityId)' />"><bean:write name="searchresultnewDisplay" property="answer(Object::Entity::FirstName)" /></a>
	&nbsp;
	</td>
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::middleName)" />
	&nbsp;
	</td>
		
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::LastName)" />
	&nbsp;
	</td>

	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::EntityType)" />
	&nbsp;
	</td>

	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::Addresses::HOME::Object::Address::City)" />
	&nbsp;
	</td>
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::Addresses::HOME::Object::Address::State)" />
	&nbsp;
	</td>
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhoneAreaCode)"  />
	<bean:write name="searchresultnewDisplay"
	property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhone)"  />
	<bean:write name="searchresultnewDisplay"
	property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::WorkPhoneAreaCode)" />
	&nbsp;
	</td>
	
	<td class="SearchResult" >
	<bean:write name="searchresultnewDisplay" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::EMailAddress)" />
	&nbsp;
	</td>


<td class="SearchResult" >

		<dmshtml:dms_multibox property="answer(Object::Entity::Id)" value = "<%=test.toString()%>" >
		</dmshtml:dms_multibox> 
		</td>

	
	</tr>		
		</logic:iterate>
		<% i=0;%>
		
<tr><td colspan="10" >&nbsp;</td></tr>
<tr>
		<td  class="links"  colspan="7">		
		<logic:present name="prevEntity"  scope="request" >
		<a href="../SearchSalesManager.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&entityType=<%=""+encodedType%>&answer(Entity::Equals::EntityType)=<%=""+encodedType%>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(entityType)=<%=""+encodedType%>&answer(objectType)=ENTITY&answer(Entity::Like::FirstName)=<%=""+fname%>&answer(Entity::Like::LastName)=<%=""+lname%>&answer(Entity::Equals::Active)=<%=""+active%>&answer(Object::Entity::TotalRec)=<%=""+TotalRec%>&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME,%20DMS_ENTITY.DMS_ENTITY_ID"><bean:message key="Common.Previous"/></a>
		</logic:present>

		</td>
		<td align="right" class="links" colspan="3">
		<logic:present name="moreEntity"  scope="request" >
		
				
		<a href="../SearchSalesManager.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(ownerId)=<%=""+ownerId %>&entityType=<%=""+encodedType%>&answer(Entity::Equals::EntityType)=<%=""+encodedType%>&LimitSearch=yes&answer(Object::Entity::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(entityType)=<%=""+encodedType%>&answer(objectType)=ENTITY&answer(Entity::Like::FirstName)=<%=""+fname%>&answer(Entity::Like::LastName)=<%=""+lname%>&answer(Entity::Equals::Active)=<%=""+active%>&answer(Object::Entity::TotalRec)=<%=""+TotalRec%>&answer(Entity::orderBy)=DMS_ENTITY_VER.LNAME,%20DMS_ENTITY.DMS_ENTITY_ID">Next&gt;&gt;</a>



		</logic:present>
		</td>
</tr>
<tr><td colspan="10" >&nbsp;</td></tr>
<tr><td colspan="10" align="right">
<html:submit value="Delete" styleClass="sbttn"/></td></tr>
<tr><td><html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id='test' name="FindSalesManager"  property="answer(Entity::Equals::EntityType)" />
<%
System.out.println("test-->"+test);
%>


<html:hidden property="answer(entityType)" value="<%=""+type%>" />
<html:hidden property="answer(objectType)" value="ENTITY" />

<html:hidden property="answer(Entity::Like::FirstName)" value="<%=""+fname%>" />
<html:hidden property="answer(Object::Entity::TotalRec)" value="<%=""+TotalRec%>" />
<html:hidden property="answer(Entity::Like::LastName)" value="<%=""+lname%>" />
<html:hidden property="answer(Entity::Equals::EntityType)" value="<%=""+type%>" />
<html:hidden property="answer(Entity::Equals::Active)" value="<%=""+active%>" />
<html:hidden property="LimitSearch" value="yes" />
<html:hidden property="answer(Entity::orderBy)" value="DMS_ENTITY_VER.LNAME, DMS_ENTITY.DMS_ENTITY_ID " />
<html:hidden property="answer(Object::Entity::PageNum)" value="<%=""+(Integer.parseInt(""+pagenum))%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
</td></tr>




</logic:present>
	


</table>



</td></tr>



</table>
 </html:form>



