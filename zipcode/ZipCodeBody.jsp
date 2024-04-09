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


<%


String pagenum=(String)request.getAttribute("pagenum");
String totrec=(String)request.getAttribute("totrec");
String frmName=(String)request.getParameter("FormName");
long ownerId=0;
if(request.getParameter("answer(ownerId)")!=null){
	ownerId=Long.parseLong(""+request.getParameter("answer(ownerId)"));	
}
%>
<SCRIPT type="text/javascript" SRC="../Scripts/JScripts/ZipCode.js"></SCRIPT>
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
 	 if(tempZipCode==null){
		 alert("Please select a zipcode from the list");
		 return false;
	 }
	 
	 var formname = frm.parentFormName.value;
	  window.opener.document.<%=frmName%>.City.value = tempZipCity;
	  window.opener.document.<%=frmName%>.County.value = tempCounty;
	  window.opener.document.<%=frmName%>.State.value = tempStateCode;
      window.opener.document.<%=frmName%>.Zip.value = tempZipCode; 
      window.opener.document.<%=frmName%>.Zip.focus();        
     
	 setTimeout( "window.close();", 2 );
	 return true;
}

function submitToChild()
 {

	 var frm = document.forms[0];
	
     frm.ThisZip.value = (window.opener.document.<%=frmName%>.Zip.value).replace('-','  ');
	 frm.ThisCity.value = window.opener.document.<%=frmName%>.City.value;
     frm.ThisCounty.value = window.opener.document.<%=frmName%>.County.value;
     frm.ThisState.value = window.opener.document.<%=frmName%>.State.value;   
     
	 if(window.opener.document.<%=frmName%>.State.value==""){
		 frm.ThisState.value ="AR";
	 }

	 return true;
}


var searchFlag = 0;
//-->
</SCRIPT>
<html:form action="/SearchZipCode.do"  styleId="searchZipCode" onsubmit="return validateRequest(this)">
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		<tr><td colspan="3" align="center" class="sectionhead">Zip Code Search<BR></td></tr>
		
			<tr><td class="FormLabels" align="left" >Zip Code</td>
			<td><dmshtml:dms_text name="SearchZipCode"  property="answer(Object::ZipCode::Like::ZipCode)"  title="Please enter Zip Code to search" styleId="ThisZip" size="30" maxlength="30" styleClass="txtbox"/></td>
		</tr>
		<tr>
		<td class="FormLabels" align="left" height="25">City Name</td>
			<td><dmshtml:dms_text name="SearchZipCode"  property="answer(Object::ZipCode::Like::CityName1)"  title="Please enter City Name to search"  styleId="ThisCity" size="30" maxlength="30" styleClass="txtbox"/></td>
		</tr>
		<tr>
			<td class="FormLabels" align="left" >State</td>
			<td>
				<dmshtml:get_all_risk_states nameInSession="arStates" ownerId='<%=ownerId%>' dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
				<html:select name="SearchZipCode"  property="answer(Object::ZipCode::Like::StateCode)"  styleId="ThisState">
					<html:option value ="">Select</html:option>
			        <logic:present name="arStates" scope="request">
			           <logic:iterate id="details" name="arStates">
					    <bean:define id='test' name="details"  property="stateCode" />
					    <html:option value ='<%=test.toString()%>'>
					       <bean:write name="details" property="state" />
					    </html:option>
					</logic:iterate>
					</logic:present>
				</html:select>
							
			<!-- <html:select name="SearchZipCode"  property="answer(Object::ZipCode::Like::StateCode)" styleClass="txtbox"   styleId="ThisState">
			
			<html:option value ="" styleClass="txtbox">Select A State</html:option>			
			<html:option value ="DE">Delaware</html:option>
			<html:option value ="DC">District of Columbia</html:option>
			<html:option value ="FL">Florida</html:option>
			<html:option value ="GA">Georgia</html:option>
			<html:option value ="MD">Maryland</html:option>
			<html:option value ="NJ">New Jersey</html:option>
			<html:option value ="NC">North Carolina</html:option>
			<html:option value ="PA">Pennsylvania</html:option>
			<html:option value ="SC">South Carolina</html:option>
			<html:option value ="TX">Texas</html:option>
			<html:option value ="VA">Virginia</html:option>
		
		     <html:option value ='AR'>Arkansas</html:option>
		    <html:option value ='GA'>Georgia</html:option>
			<html:option value ='KS'>Kansas</html:option>
			<html:option value ='IN'>Indiana</html:option>
			<html:option value ='MO'>Missouri</html:option>
			<html:option value ='NV'>Nevada</html:option>
			<html:option value ='NE'>Nebraska</html:option>
			<html:option value ='OH'>Ohio</html:option>
			<html:option value ='TN'>Tennessee</html:option>
			<html:option value ='IL'>Illinois</html:option>
			<html:option value ='IA'>Iowa</html:option>	
			
			<html:option value="AL">Alabama</html:option>		    
		    <html:option value="AK">Alaska</html:option>		    
		    <html:option value="AS">American Samoa</html:option>
		    <html:option value="AZ">Arizona</html:option>	    
		    <html:option value="AR">Arkansas</html:option>		    
		    <html:option value="CA">California</html:option>		    
		    <html:option value="CO">Colorado</html:option>		    
		    <html:option value="CT">Connecticut</html:option>		    
		    <html:option value="DE">Delaware</html:option>		    
		    <html:option value="DC">District of Columbia</html:option>		    
		    <html:option value="FM">Federated States of</html:option>		    
		    <html:option value="FL">Florida</html:option>		    
		    <html:option value="GA">Georgia</html:option>		    
		    <html:option value="GU">Guam</html:option>		    
		    <html:option value="HI">Hawaii</html:option>		    
		    <html:option value="ID">Idaho</html:option>		    
		    <html:option value="IL">Illinois</html:option>		    
		    <html:option value="IN">Indiana</html:option>		    
		    <html:option value="IA">Iowa</html:option>		    
		    <html:option value="KS">Kansas</html:option>	    
		    <html:option value="KY">Kentucky</html:option>		    
		    <html:option value="LA">Louisiana</html:option>		    
		    <html:option value="ME">Maine</html:option>		    
		    <html:option value="MH">Marshall Islands</html:option>		    
		    <html:option value="MD">Maryland</html:option>		    
		    <html:option value="MA">Massachusetts</html:option>		    
		    <html:option value="MI">Michigan</html:option>
		    <html:option value="MN">Minnesota</html:option>
		    <html:option value="MS">Mississippi</html:option>
		    <html:option value="MO">Missouri</html:option>
		    <html:option value="MT">Montana</html:option>
		    <html:option value="NE">Nebraska</html:option>
		    <html:option value="NV">Nevada</html:option>
		    <html:option value="NH">New Hampshire</html:option>
		    <html:option value="NJ">New Jersey</html:option>
		    <html:option value="NM">New Mexico</html:option>
		    <html:option value="NY">New York</html:option>
			<html:option value="NC">North Carolina</html:option>
		    <html:option value="ND">North Dakota</html:option>
		    <html:option value="MP">Northern Mariana Isl</html:option>
		    <html:option value="OH">Ohio</html:option>
		    <html:option value="OK">Oklahoma</html:option>
		    <html:option value="OR">Oregon</html:option>
		    <html:option value="PW">Palau</html:option>
		    <html:option value="PA">Pennsylvania</html:option>
		    <html:option value="PR">Puerto Rico</html:option>
		    <html:option value="RI">Rhode Island</html:option>
		    <html:option value="SC">South Carolina</html:option>
		    <html:option value="SD">South Dakota</html:option>
		    <html:option value="TN">Tennessee</html:option>
		    <html:option value="TX">Texas</html:option>
		    <html:option value="UT">Utah</html:option>
		    <html:option value="VT">Vermont</html:option>
		    <html:option value="VI">Virgin Islands</html:option>
		    <html:option value="VA">Virginia</html:option>
		    <html:option value="WA">Washington</html:option>
		    <html:option value="WV">West Virginia</html:option>
		    <html:option value="WI">Wisconsin</html:option>
		    <html:option value="WY">Wyoming</html:option> 
		</html:select>
			
			--></td>
		</tr>
		<tr>
			<td class="FormLabels" align="left" >County</td>
			<td><dmshtml:dms_text name="SearchZipCode"  property="answer(Object::ZipCode::Like::County)"  title="Please enter County to search" styleId="ThisCounty" size="20" maxlength="20" styleClass="txtbox"/></td>
		
			<td align="right">
			<input type="submit" name="Search" value="Search" title="Please click button to start search" class="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
			</td>
		</tr>
		<tr><td colspan="3" align="center" class="sectionhead">&nbsp;</td></tr>
		<tr><td><html:hidden property="answer(Object::ZipCode::PageNum)" value="0" />
		<html:hidden property="answer(Object::ZipCode::TotalRec)" value="1" />
		<html:hidden property="answer(ownerId)" value="<%=""+ownerId%>" /></td></tr>
		<tr><td><input name="FormName" type="hidden" value="<%=frmName%>" /></td></tr>
		</table>
			</html:form>
			
			<html:form action="/SearchZipCode.do" styleId="getZipCodeDetail" onsubmit="return submitToParent(this)">
			<%if(request.getAttribute("searchresultZipCode")!=null){%>
				<script type="text/javascript">
				<!--
					searchFlag = 1;
				//-->
				</script>
			<table width="100%" align="center" border="0" >
				<tr>	
					<td width="100%" align="left" class="links" colspan="6">Number of search results found : <%=totrec%></td>
				</tr>				
				
	
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
					<a href="../SearchZipCode.do?&FormName=<%=frmName%>&answer(Object::ZipCode::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(ownerId)=<%=""+ownerId%>"><< Previous</a>&nbsp;
				</td>
			</logic:present>

			<logic:present name="moreZip"  scope="request" >
				<td align="right" class="links" colspan="6">
					<a href="../SearchZipCode.do?&FormName=<%=frmName%>&answer(Object::ZipCode::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(ownerId)=<%=""+ownerId%>">Next >></a>
				
				</td>
			</logic:present>
		
		</tr>
		
				

			</table>

			<table width="100%" align="center" border="0" CELLSPACING="2" CELLPADDING="0">
			<tr><td><html:hidden property="answer(Object::ZipCode::PageNum)" value="0" />
			<html:hidden property="answer(Object::ZipCode::TotalRec)" value="1" />
			<html:hidden property="answer(Object::ZipCode::currentRec)" value="1" />
			<html:hidden property="answer(Object::ZipCode::currentRecValue)" value="1" />
			<input name="FormName" type="hidden" value="<%=frmName%>" id="parentFormName" /></td></tr>
			<tr >	
				<td class="sectionhead" width="15%">ZipCode</td>
				<td class="sectionhead" width="35%">CityName1</td>
				<td class="sectionhead" width="35%">CityName2</td>
				<td class="sectionhead" width="10%">State</td>
				<td class="sectionhead" width="10%">County</td>
				<td class="sectionhead" width="30%">County Code</td>
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
			<td class='<%=""+strStyleClass%>'><%=qmap_Temp.getString("Object::ZipCode::CityName2")%>
			<input type="hidden" value='<%=qmap_Temp.getString("Object::ZipCode::CityName2")%>'/>
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
			<INPUT TYPE="radio" align="middle" value="<%=(i+1)%>" name="selectZip" style="id:selectZipId" onclick="return selectValue(this)"/>
			</td>
		</tr>
		<%}
		%>
	


<!-- Previous and next links - bottom -->
		
		
		<tr><td>&nbsp;</td></tr>

			<tr>
			<logic:present name="prevZip"  scope="request" >
				<td  class="links" colspan="3">
					<a href="../SearchZipCode.do?&FormName=<%=frmName%>&answer(Object::ZipCode::PageNum)=<%=(Integer.parseInt(""+pagenum)-1)%>&answer(ownerId)=<%=""+ownerId%>"><< Previous</a>
				</td>
				
			</logic:present>
<td>&nbsp;</td>
			<logic:present name="moreZip"  scope="request">
				<td align="right" class="links" colspan="6">
					<a href="../SearchZipCode.do?&FormName=<%=frmName%>&answer(Object::ZipCode::PageNum)=<%=(Integer.parseInt(""+pagenum)+1)%>&answer(ownerId)=<%=""+ownerId%>">Next >></a>
				
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
