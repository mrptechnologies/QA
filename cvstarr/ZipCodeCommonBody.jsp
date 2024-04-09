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


<bean:define id="objOwnerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>

<%
String formID="";
String isMultipleFormWithSameName="";

String pagenum=(String)request.getAttribute("pagenum");
String totrec=(String)request.getAttribute("totrec");
String frmName=(String)request.getParameter("FormName");
String HomeFlag=(String)request.getParameter("HomeFlag"); 
String BillingCity=(String)request.getParameter("BillingCity");
String BillingCounty=(String)request.getParameter("BillingCounty");
String BillingState=(String)request.getParameter("BillingState");
String BillingZip=(String)request.getParameter("BillingZip");

long ownerId=0;
ownerId = Long.parseLong((""+objOwnerId));
if(HomeFlag==null){%>
	<bean:define id="HomeFlag1" name="SearchZipCodeCommon" property="answer(HomeFlag)"/> 
	
<%

HomeFlag=""+HomeFlag1;
}

isMultipleFormWithSameName=(String)request.getParameter("MultiplefrmWithSameName");
formID=(String)request.getParameter("FormID");
%>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCodeCommon.js"></SCRIPT>
<SCRIPT type="text/javascript">
<!--
var flag = "<%=HomeFlag%>";
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
 	 if(tempZipCode==null){
		 alert("Please select a zipcode from the list");
		 return false;
	 }
	 
	 var isMultipleForm = '<%=isMultipleFormWithSameName%>'
	var formname = frm.parentFormName.value;
	
	var BillingAddress='<%=BillingState%>';
	var BillingCity='<%=BillingCity%>';
	

	if(isMultipleForm=="YES") {
		 submitToParentForm(frm);	
	} else {
	//Checking for Billing Address
	if(BillingAddress!="" && BillingAddress!="null"){			
			window.opener.document.<%=frmName%>.BillingZip.value = tempZipCode;		
			window.opener.document.<%=frmName%>.BillingCity.value = tempZipCity;
			window.opener.document.<%=frmName%>.BillingCounty.value = tempCounty;
			window.opener.document.<%=frmName%>.BillingState.value = tempStateCode;
			window.opener.document.<%=frmName%>.BillingZip.focus();
	}
	else{ 
		if(flag=="Home"){
			window.opener.document.<%=frmName%>.HomeZip.value = tempZipCode;
			window.opener.document.<%=frmName%>.HomeCity.value = tempZipCity;
			window.opener.document.<%=frmName%>.HomeCounty.value = tempCounty;
			window.opener.document.<%=frmName%>.HomeState.value = tempStateCode;
			window.opener.document.<%=frmName%>.Zip.focus();
			
		}
		else{
			window.opener.document.<%=frmName%>.Zip.value = tempZipCode;
			window.opener.document.<%=frmName%>.City.value = tempZipCity;
			if(window.opener.document.<%=frmName%>.County != undefined && window.opener.document.<%=frmName%>.County != null){
				window.opener.document.<%=frmName%>.County.value = tempCounty;
			}
			window.opener.document.<%=frmName%>.State.value = tempStateCode;
			window.opener.document.<%=frmName%>.Zip.focus() ;
		}
	}
	}
	setTimeout( "window.close();", 2 );
	return true;
}

function submitToChild()
 {
 	var isMultipleForm = '<%=isMultipleFormWithSameName%>'
 	var BillingAddress='<%=BillingState%>';
	var frm = document.forms[0];
	//Checking whether the search is for home realted zip code and related details
	if(isMultipleForm=="YES"){
		submitToChildForm(frm);
	} else {
	//Checking for Billing Address
	
	if(BillingAddress!="" && BillingAddress!="null"){
			frm.ThisZip.value = (window.opener.document.<%=frmName%>.BillingZip.value).replace('-','  ');
			frm.ThisCity.value = window.opener.document.<%=frmName%>.BillingCity.value;
			frm.ThisCounty.value = window.opener.document.<%=frmName%>.BillingCounty.value;
			frm.ThisState.value = window.opener.document.<%=frmName%>.BillingState.value;
	
	}	
	else{
		if(flag=="Home"){
			frm.ThisZip.value = (window.opener.document.<%=frmName%>.HomeZip.value).replace('-','  ');
			frm.ThisCity.value = window.opener.document.<%=frmName%>.HomeCity.value;
			frm.ThisCounty.value = window.opener.document.<%=frmName%>.HomeCounty.value;
			frm.ThisState.value = window.opener.document.<%=frmName%>.HomeState.value;
		}
		else{
			 frm.ThisZip.value = (window.opener.document.<%=frmName%>.Zip.value).replace('-','  ');
			 frm.ThisCity.value = window.opener.document.<%=frmName%>.City.value;
			 if( window.opener.document.<%=frmName%>.County != undefined &&  window.opener.document.<%=frmName%>.County != null){
			 frm.ThisCounty.value = window.opener.document.<%=frmName%>.County.value;
			 }
			 frm.ThisState.value = window.opener.document.<%=frmName%>.State.value;
		}
	}
	}
	return true;

}

function submitToParentForm(frm) {
	var formId = '<%=formID%>'
	if(flag=="Home"){
		window.opener.document.getElementById(formId).HomeZip.value = tempZipCode;
		window.opener.document.getElementById(formId).HomeCity.value = tempZipCity;
		window.opener.document.getElementById(formId).HomeCounty.value = tempCounty;
		window.opener.document.getElementById(formId).HomeState.value = tempStateCode;
		window.opener.document.getElementById(formId).Zip.focus();
		
	}
	else{
		window.opener.document.getElementById(formId).Zip.value = tempZipCode;
		window.opener.document.getElementById(formId).City.value = tempZipCity;
		if(window.opener.document.getElementById(formId).County !=null && window.opener.document.getElementById(formId).County!=undefined) {
			window.opener.document.getElementById(formId).County.value = tempCounty;
		}
		window.opener.document.getElementById(formId).State.value = tempStateCode;
		window.opener.document.getElementById(formId).Zip.focus();
	}
}

function submitToChildForm(frm) {
	
	var formId = '<%=formID%>'
	if(flag=="Home"){
		frm.ThisZip.value = (window.opener.document.getElementById(formId).HomeZip.value).replace('-','  ');
		frm.ThisCity.value = window.opener.document.getElementById(formId).HomeCity.value;
		frm.ThisCounty.value = window.opener.document.getElementById(formId).HomeCounty.value;
		frm.ThisState.value = window.opener.document.getElementById(formId).HomeState.value;
	}
	else{
		 frm.ThisZip.value = (window.opener.document.getElementById(formId).Zip.value).replace('-','  ');
		 frm.ThisCity.value = window.opener.document.getElementById(formId).City.value;
		 if(window.opener.document.getElementById(formId).County !=null && window.opener.document.getElementById(formId).County!=undefined) {
		 	frm.ThisCounty.value = window.opener.document.getElementById(formId).County.value;
		 }
		 frm.ThisState.value = window.opener.document.getElementById(formId).State.value;
	}
}

var searchFlag = 0;
//-->
</SCRIPT>
<html:form action="/CVSearchZipCodeCommon.do"  styleId="SearchZipCodeCommon" onsubmit="return validateRequest(this)">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td colspan="3" align="center" class="sectionhead">Zip Code Search<BR></td></tr>
		
			<tr><td class="FormLabels" align="left" >Zip Code</td>
				<td><dmshtml:dms_text name="SearchZipCodeCommon"  property="answer(Object::ZipCode::Like::ZipCode)"  title="Please enter Zip Code to search" styleId="ThisZip" size="30" maxlength="30" styleClass="txtbox"/></td>
			</tr>
			<tr><td class="FormLabels" align="left" height="25">City Name</td>
				<td><dmshtml:dms_text name="SearchZipCodeCommon"  property="answer(Object::ZipCode::Like::CityName1)"  title="Please enter City Name to search"  styleId="ThisCity" size="30" maxlength="30" styleClass="txtbox"/></td>
			</tr>
			<tr>
				<td class="FormLabels" align="left">State</td>
				<td><dmshtml:get_type nameInSession="arStates"  dcdObjectType="USSTATES" ownerId="<%=ownerId %>" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/><html:select name="SearchZipCodeCommon"  property="answer(Object::ZipCode::Like::StateCode)"  styleId="ThisState">
		<html:option value ="">Select</html:option>
        <logic:present name="arStates" scope="request">
           <logic:iterate id="details" name="arStates" scope="request" >
		    <bean:define id='test' name="details"  property="typeDesc" />
		    <html:option value ='<%=test.toString()%>'>
		       <bean:write name="details" property="dmsType" />
		    </html:option>
		</logic:iterate>
		</logic:present>
		</html:select>
		</td>
		</tr>


		<tr>
			<td class="FormLabels" align="left" >County</td>
			<td><dmshtml:dms_text name="SearchZipCodeCommon"  property="answer(Object::ZipCode::Like::County)"  title="Please enter County to search" styleId="ThisCounty" size="20" maxlength="20" styleClass="txtbox"/></td>
		
			<td align="right">
			<input type="submit" name="Search" value="Search" title="Please click button to start search" class="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
			</td>
		</tr>
		<tr><td colspan="3" align="center" class="sectionhead">&nbsp;</td></tr>
		<tr><td><html:hidden property="answer(Object::ZipCode::PageNum)" value="0" /></td>
			<td><html:hidden property="answer(Object::ZipCode::TotalRec)" value="1" /></td>
			<html:hidden property="answer(ownerId)" value="<%=""+ownerId%>" /></td></tr>
			<td><input name="FormName" type="hidden" value="<%=frmName%>" /></td>
			<td><input name="MultiplefrmWithSameName" type="hidden" value="<%=isMultipleFormWithSameName%>" /></td>
			<td><input name="BillingState" type="hidden" value="<%=BillingState%>" /></td>
			<td><input name="BillingZip" type="hidden" value="<%=BillingZip%>" /></td>
			<td><input name="BillingCounty" type="hidden" value="<%=BillingCounty%>" /></td>
			<td><input name="BillingCity" type="hidden" value="<%=BillingCity%>" /> </td>			
			<td><input name="FormID" type="hidden" value="<%=formID%>" /></td>
		</tr>
		</table>
		<html:hidden property="answer(HomeFlag)" value="<%=""+HomeFlag%>" />

			</html:form>
			<html:form action="/CVSearchZipCodeCommon.do" styleId="getZipCodeDetail" onsubmit="return submitToParent(this)">
			<%if(request.getAttribute("searchresultZipCode")!=null){%>
				<script type="text/javascript">
				<!--
					searchFlag = 1;
				//-->
				</script>
			<table width="100%" align="center" border="0" ><tr><td width="100%" align="left" class="links" colspan="6">Number of search results found : <%=totrec%></td></tr>
	
		<tr>
			<td  colspan="6" align="right">
				<html:submit value="Select"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
			</td>
		</tr>
	
	<!-- Previous and next links - top -->
		
		
		<tr><td>&nbsp;</td></tr>
		 <tr>	
			<logic:present name="prevZip"  scope="request" >
				<td  class="links">
					<a href="../CVSearchZipCodeCommon.do?&FormName=<%=frmName%>&MultiplefrmWithSameName=<%=isMultipleFormWithSameName%>&FormID=<%=formID%>&HomeFlag=<%=""+HomeFlag%>&answer(Object::ZipCode::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(ownerId)=<%=""+ownerId%>"><< Previous</a>
				</td>
			</logic:present>

			<logic:present name="moreZip"  scope="request" >
				<td align="right" class="links" colspan="6">
					<a href="../CVSearchZipCodeCommon.do?&FormName=<%=frmName%>&MultiplefrmWithSameName=<%=isMultipleFormWithSameName%>&FormID=<%=formID%>&HomeFlag=<%=""+HomeFlag%>&answer(Object::ZipCode::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(ownerId)=<%=""+ownerId%>">Next >></a>
				
				</td>
			</logic:present>
		</tr>

		

			</table>

			<table width="100%" align="center" border="0" CELLSPACING="2" CELLPADDING="0">
			<tr><td><html:hidden property="answer(Object::ZipCode::PageNum)" value="0" />
			<html:hidden property="answer(Object::ZipCode::TotalRec)" value="1" />
			<html:hidden property="answer(Object::ZipCode::currentRec)" value="1" />
			<html:hidden property="answer(Object::ZipCode::currentRecValue)" value="1" />
			<input name="FormName" type="hidden" value="<%=frmName%>" id="parentFormName" />
			</td></tr>
			<tr>	
				<td class="sectionhead" width="15%">ZipCode</td>
				<td class="sectionhead" width="35%">CityName</td>
				<td class="sectionhead" width="10%">State</td>
				<td class="sectionhead" width="30%">County</td>
				<td class="sectionhead" width="25%">County Code</td>
				<td class="sectionhead">Select</td>
			</tr>
	<%
	java.util.ArrayList arrList=(java.util.ArrayList)request.getAttribute("searchresultZipCode");
	boolean blnRFlag=true;
	String strStyleClass="TextMatterAltranateBlue";
	for(int i=0; i<arrList.size();i++)
	{
		com.dms.ejb.data.QuestionHashMap qmap_Temp = (com.dms.ejb.data.QuestionHashMap)arrList.get(i);
		
		if(blnRFlag){
			strStyleClass="TextMatterAltranateBlue";
			blnRFlag=false;
		}
		else{
			strStyleClass="TextMatterAltranateGreen";
			blnRFlag=true;
		}
	
		%>
			<tr>
			<td class='<%=""+strStyleClass%>'><%=qmap_Temp.getString("Object::ZipCode::ZipCode")%>
			<input type="hidden" value='<%=qmap_Temp.getString("Object::ZipCode::ZipCode")%>'/>		 
			</td>
			<td class='<%=""+strStyleClass%>'><%=qmap_Temp.getString("Object::ZipCode::CityName1")%>
			<input type="hidden" value='<%=qmap_Temp.getString("Object::ZipCode::CityName1")%>'/>
			</td>
			<td class='<%=""+strStyleClass%>'><%=qmap_Temp.getString("Object::ZipCode::StateCode")%>
			<input type="hidden" value='<%=qmap_Temp.getString("Object::ZipCode::StateCode")%>'/>
			</td>
			<td class='<%=""+strStyleClass%>'><%=qmap_Temp.getString("Object::ZipCode::County")%>
			<input type="hidden" value='<%=qmap_Temp.getString("Object::ZipCode::County")%>'/>
			</td>
			<td class='<%=""+strStyleClass%>'><%=qmap_Temp.getString("Object::ZipCode::CountyCode")%>
			<input type="hidden" value='<%=qmap_Temp.getString("Object::ZipCode::CountyCode")%>'/>
			</td>
			<td class='<%=""+strStyleClass%>' align="center">			
			<INPUT TYPE="radio" align="MIDDLE" value="<%=(i+1)%>" name="selectZip" style="Id:selectZipId" onclick="return selectValue(this)"/>
			</td>
		</tr>
		<%}
		%>
	

		<%System.out.println("Test 1");%>
<!-- Previous and next links - bottom -->
		
		
		<tr><td>&nbsp;</td></tr>

		 <tr>	
			<logic:present name="prevZip"  scope="request" >
				<td  class="links" colspan="3">
					<a href="../CVSearchZipCodeCommon.do?&FormName=<%=frmName%>&MultiplefrmWithSameName=<%=isMultipleFormWithSameName%>&FormID=<%=formID%>&HomeFlag=<%=""+HomeFlag%>&answer(Object::ZipCode::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(ownerId)=<%=""+ownerId%>"><< Previous</a>
				</td>
			</logic:present>

			<logic:present name="moreZip"  scope="request">
				<td align="right" class="links" colspan="6">
					<a href="../CVSearchZipCodeCommon.do?&FormName=<%=frmName%>&MultiplefrmWithSameName=<%=isMultipleFormWithSameName%>&FormID=<%=formID%>&HomeFlag=<%=""+HomeFlag%>&answer(Object::ZipCode::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(ownerId)=<%=""+ownerId%>">Next >></a>
				
				</td>
			</logic:present>
		</tr> 

		<tr><td>&nbsp;</td></tr>
		

		<tr>
			<td  colspan="6" align="right">
				<html:submit value="Select"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
			</td>
		</tr>
		</table>
		<%
		}
		else{
		System.out.println("ARRAY LIST IS NULL ");
			if(request.getParameter("Search")!=null){
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


</html:form>

<script type="text/javascript">
<!--
	if (searchFlag==0)
		submitToChild();
//-->
</script>
