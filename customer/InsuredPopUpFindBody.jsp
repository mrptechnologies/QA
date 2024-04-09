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

String frmName=(String)request.getParameter("FormName");
String agencyName = "";
String agencyTempId = "";
if(request.getParameter("answer(AgencyName)") != null){
	agencyName=(String)request.getParameter("answer(AgencyName)");
}
if(request.getParameter("answer(AgencyId)") != null){
	agencyTempId=(String)request.getParameter("answer(AgencyId)");
}
%> 

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<html:form name="FindForm" type="com.dms.web.data.DataForm" action="/FindAllInsuredPopUp.do">
<%if(request.getAttribute("searchresultCustomerDisplay")==null && request.getParameter("IsFindForm")==null ){%>
<bean:parameter id="requestFrom" name="answer(requestFrom)" />
<html:hidden property="answer(requestFrom)" value="<%=requestFrom%>" />
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<table WIDTH="98%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td>
			<table WIDTH="90%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
				<tr><td class="sectionhead" colspan ="2" align="center" >INSURED SEARCH CRITERIA</td></tr>
			    <tr><td>&nbsp;</td></tr>
			    <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_AGENCY_SEARCH_CRITERIA_IN_INSURED_SEARCH"}%>' connector='or' negated="true"> 	
					<tr>
						<td width="40%" align="right" class="FormLabels">
						Agency/Broker Code 
						</td> 
							<td align="left" ><html:text  property="answer(1*Customer::Equals::SearchObjectId)" value="<%=agencyTempId%>" styleClass="txtbox"/></td>
							<html:hidden property="answer(1*Customer::Equals::SearchObjectType)" value="AGENCY"/>
					</tr>	
				<!-- 
					<tr>
						<td width="40%" align="right" class="FormLabels">
						Agency Name
						</td> 
						<td align="left" ><html:text property="answer(Object::Agency::BusinessName)" value="<%=agencyName%>" styleClass="txtbox"/></td>
					</tr>
				-->	
			</dmshtml:dms_static_with_connector>
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Insured Name (Business Name or Last Name, First Name) &nbsp;&nbsp;
					</td> 
					<td align="left" ><html:text  property="answer(Object::Customer::Like::customerName)" styleClass="txtbox" styleId="InsuredName"/></td>
				</tr>
				
				<tr>
					<td width="40%" align="right" class="FormLabels">
						State &nbsp;&nbsp;
					</td> 
					<td class="links" style="Class:txtbox">
							<html:select property="answer(Object::Customer::Like::State)" styleClass="txtbox" styleId="State">
										<html:option value ="" styleClass="txtbox">Select A State</html:option>
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
									    <html:option value="FM">Federated States of Micronesia</html:option>		    
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
									    <html:option value="MP">Northern Mariana Islands</html:option>
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
								</td>
				</tr>
				
				<tr>
					<td width="40%" align="right" class="FormLabels">
						City &nbsp;&nbsp;
					</td> 
					<td align="left" ><html:text  property="answer(Object::Customer::Like::City)" styleClass="txtbox" styleId="City"/></td>
				</tr>
				
				<tr>
					<td width="40%" align="right" class="FormLabels">
						Zip Code &nbsp;&nbsp;
					</td> 
					<td align="left" ><html:text  property="answer(Object::Customer::Like::Zip)" styleClass="txtbox" styleId="Zip"/></td>
				</tr>

				<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"OBJECT-DELETE"}%>' 
				connector='or' negated="true">
				<tr>
					<td width="40%" align="right" class="FormLabels">
					Active  &nbsp;&nbsp;
					</td> 
					<td align="left" >
						<html:select  property="answer(Object::Customer::Equals::Active)">
							<html:option value="Y">Active</html:option>
							<html:option value="D">Deactive</html:option>
						</html:select></td>
				</tr>
				</dmshtml:dms_static_with_connector>
	
				 <tr>
				 	<td>&nbsp;</td>
				 	<td><html:hidden property="IsFindForm" value="Yes" /> </td>
				 </tr>


				<tr>
						<td colspan="2" align="center" >
						<html:submit value="Find" property="Search" styleClass="sbttn"/>
						&nbsp;&nbsp;&nbsp;<html:reset value="Clear" styleClass="sbttn"/>&nbsp;&nbsp;&nbsp;
						</td>
				</tr>

			</table>
		</td>
	</tr>			
 </table>

<html:hidden property="answer(Object::Customer::Equals::CreatedDateBegin)" value="" styleId="inpCreatedDateBegin"/>
<html:hidden property="answer(Object::Customer::Equals::CreatedDateEnd)" value="" styleId="inpCreatedDateEnd"/>
<html:hidden property="answer(Object::Customer::Equals::UpdatedDateBegin)" value="" styleId="inpUpdatedDateBegin"/>
<html:hidden property="answer(Object::Customer::Equals::UpdatedDateEnd)" value="" styleId="inpUpdatedDateEnd"/>


<html:hidden styleId="inpPageNum" property="answer(Object::Customer::PageNum)" value="0"/>
<html:hidden property="answer(Object::Customer::TotalRec)" value="1" />
<html:hidden styleId="orderby" property="answer(Customer::orderBy)" value="DMS_CUSTOMER_VER.CUSTOMER_NAME"/>
<html:hidden styleId="orderby1" property="answer(Agency::orderBy)" value="DMS_CUSTOMER_VER.CUSTOMER_NAME"/>
<html:hidden property="FormName" value="<%=frmName%>" styleId="parentFormName" />


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
<%} %>

<%if(request.getAttribute("searchresultCustomerDisplay")==null && request.getParameter("IsFindForm")!=null ){%>

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
						<td>
							<dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
						</td>
					</tr>

<%} %>
</html:form>


<html:form name="ResultForm" type="com.dms.web.data.DataForm" action="/FindAllInsuredPopUp.do" styleId="getInsuredDetail"  onsubmit="return submitToParent(ResultForm)" >
<%if(request.getAttribute("searchresultCustomerDisplay")!=null){%>
<%String totalNoOfInsured = "";%>
<bean:define id="requestFrom" property="answer(requestFrom)" name="FindCustomerXml" />
<bean:define id="pagenum" property="answer(Object::Customer::PageNum)" name="FindCustomerXml" />
<html:hidden property="answer(requestFrom)" value="<%=""+requestFrom %>"/>
	<input name="FormName" type="hidden" value="<%=frmName%>" id="frmName123" />

		<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="2" CELLPADDING="0">
			<tr>
				<td height="5"></td>
			</tr>
	
			<tr>
				<td class="sectionhead" colspan="4" align="center">INSURED LIST</td>
			</tr>
	
			
			<logic:present name="customersSize" scope="request">
				<bean:define id="customersSize1" name="customersSize" scope="request"/>
				<tr><td><html:hidden property="answer(Object::Customer::TotalRec)" value="<%=customersSize1.toString()%>"/></td></tr>	
				<tr><td class="FormLabels">No of Insured Found:&nbsp;<%=customersSize1.toString()%></td></tr>
				<%totalNoOfInsured = ""+customersSize1; %>
			</logic:present>			
			
			<tr align="right">
				<td  colspan="6" align="right">
					<html:submit value="Select"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
				</td>
			</tr>
			
			<% int i=0;
				String pageNum = (String)request.getAttribute("pagenum");
				int pagetempNum = Integer.parseInt(""+pageNum);
				try{
				    i=Integer.parseInt(pageNum);
						i = i * 20;
				  }catch(NumberFormatException nfe)
				  {
					  i=0;
				  }
				%>	
				<logic:present name ='searchresultCustomerDisplay' scope ='request'>	  
						
			<tr>
				<td>
					<table WIDTH="100%" ALIGN="Left" cellspacing="2" cellpadding="2">
						<bean:define id="pagenum" name='pagenum' scope='request'/>
						<bean:define id="totpagenum" name='totpagenum' scope='request'/>
	
						<tr><td><html:hidden name="FindCustomerXml" property="answer(Customer::orderBy)"/>
						<html:hidden name="FindCustomerXml" property="answer(Agency::orderBy)"/>
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
							<a href="javascript:navigate(<%=(Integer.parseInt(""+pageNum)-1)%>)" >Back&gt;&gt;</a>
							<%pagetempNum--;%>
						</logic:present>
					</td>
					
					<td align="right" class="links" colspan="4">
						<logic:present name="moreCustomer"  scope="request" >
							<a href="javascript:navigate(<%=(Integer.parseInt(""+pageNum)+1)%>)" >Next&gt;&gt;</a>
							<%pagetempNum++;%>
						</logic:present>
					</td>
				</tr>	

						<tr>
							<td class="sectionhead" width="8%">
								<bean:message key="CustomerSearchResult.SlNo"/>
							</td>
							<td class="sectionhead" width="8%">
								Agency Id
							</td>
							<td class="sectionhead" width="8%">
								Agency Name
							</td>
						
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
							      	<td class="sectionhead" width="15%">Insured Id</td>
							</dmshtml:dms_static_with_connector>
							
							<td class="sectionhead" width="20%">
								<bean:message key="CustomerSearchResult.EmployerGroupName"/>
							</td>	
													
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
							<td class="sectionhead" width="10%">Select</td>
							
						</tr>
						
						<%	
							boolean blnRFlag=true;
							String strStyleClass="TextMatterAltranateBlue";
							java.util.ArrayList arrlistcusts = (java.util.ArrayList) request.getAttribute("searchresultCustomerDisplay");
							
							for (int mn=0; mn<arrlistcusts.size(); mn++){
								
								com.dms.ejb.data.QuestionHashMap qmap = (com.dms.ejb.data.QuestionHashMap) arrlistcusts.get(mn);
								
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
		   					<td class='<%=""+strStyleClass%>'>	   
								 <% i++; %>
								 <%=i%>
							</td>
	
			 				<%
								String cId = qmap.getString("Object::Customer::CustomerId");
							%>
							<td class='<%=""+strStyleClass%>' >
								<%=qmap.getString("Object::Agency::AgencyId")%>	
								<input type="hidden" id="agencyTempId" value='<%=qmap.getString("Object::Agency::AgencyId")%>'/>						
							</td>
							<td class='<%=""+strStyleClass%>' >
								<%=qmap.getString("Object::Agency::BusinessName")%>	
								<input type="hidden" value='<%=qmap.getString("Object::Agency::BusinessName")%>'/>						
							</td>
	
							<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATABASE-ID-VIEW"}%>' connector='or' negated="true">	
								<td class='<%=""+strStyleClass%>'>
									<%=cId%>
								</td>
							</dmshtml:dms_static_with_connector>
							
							<td class='<%=""+strStyleClass%>'>
								 	<%=qmap.getString("Object::Customer::CustomerName")%>
								 	<input type="hidden" value='<%=cId%>'/>	
								 	<input type="hidden"  value='<%=qmap.getString("Object::Customer::CustomerName")%>'/>
								 	<input type="hidden"  value='<%=qmap.getString("Object::Customer::CreatedBy")%>'/>
							</td>												
							 
							 <% String address1=qmap.getString("Object::Customer::Address1");  %>						
							 <% String address2=qmap.getString("Object::Customer::Address2"); %>						
							 <% String address=address1+" "+address2; %>
							
							<td class='<%=""+strStyleClass%>' >
								<%= address %>
								<input type="hidden" value='<%= address %>'/>
							</td>
							<td class='<%=""+strStyleClass%>' >
								<%=qmap.getString("Object::Customer::City")%>	
								<input type="hidden" value='<%=qmap.getString("Object::Customer::City")%>'/>						
							</td>
							<td class='<%=""+strStyleClass%>'>							
								<%=qmap.getString("Object::Customer::State")%>
								<input type="hidden" value='<%=qmap.getString("Object::Customer::State")%>'/>
							</td>
							<td class='<%=""+strStyleClass%>' >
								<%=qmap.getString("Object::Customer::Zip")%>
								<input type="hidden" value='<%=qmap.getString("Object::Customer::Zip")%>'/>
							</td>
							<td class='<%=""+strStyleClass%>' align="center">			
								<INPUT TYPE="radio" align="middle" value="<%=(mn+2)%>" name="selectInsured" style="id:selectInsuredId" onclick="return selectInsuredValue(this)"/>
							</td>
							 <dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"DATA_ENTRY"}%>' connector='or' negated="true">	
									 <%=qmap.getString("Object::CustomerAdditional::DataEntry")%>
							</dmshtml:dms_static_with_connector>
						</tr>
						<%}%>

							<tr>
						<td align="Left" class="links" colspan="3">
							<logic:present name="prevCustomer"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pageNum)-1)%>)" >Back&gt;&gt;</a>
								<%pagetempNum--;%>
							</logic:present>
						</td>
							
						<td align="right" class="links" colspan="4">
							<logic:present name="moreCustomer"  scope="request" >
								<a href="javascript:navigate(<%=(Integer.parseInt(""+pageNum)+1)%>)" >Next&gt;&gt;</a>
								<%pagetempNum++;%>
							</logic:present>
						</td>
					</tr>
					</table>
				</td>
			</tr>
			</logic:present>
			
				<tr align="right">
					<td  colspan="6" align="right">
						<html:submit value="Select"  styleClass="sbttn" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';"/> 
					</td>
				</tr>
				
			<html:hidden styleId="orderby" property="answer(Customer::orderBy)" value="DMS_CUSTOMER_VER.CUSTOMER_NAME"/>
			<html:hidden styleId="orderby1" property="answer(Agency::orderBy)" value="DMS_CUSTOMER_VER.CUSTOMER_NAME"/>
			<html:hidden property="FormName" value="<%=frmName%>" styleId="parentFormName" />
			<html:hidden property="answer(Object::Customer::PageNum)" value="<%=""+pagetempNum %>"/>
		
			
	<tr>
		<td>
			<html:hidden property="answer(Object::Customer::TotalRec)" value="<%=""+totalNoOfInsured%>"/> 
			<html:hidden styleId="orderby" property="answer(Customer::orderBy)" value="DMS_CUSTOMER_VER.CUSTOMER_NAME"/>
		</td>
	</tr>	
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

<%} %>	
<tr align="left">
			<td  colspan="6" align="left">
				<a href="javascript:window.close();"><img style="margin-right:20px;" src="../Images/button_close_window.gif" alt="Close Window" border="0" /></a>
			</td>
</tr>
</html:form>

				

<SCRIPT>
	function submitToParent(frm){
	 	 if(tempInsuredName==null){
			 alert("Please select a Insured Name from the list");
			 return false;
		 } 
		 var formname = frm.parentFormName.value;
		 window.opener.document.<%=frmName%>.quickQuoteCustomerId.value = tempInsuredId; 
	     window.opener.document.<%=frmName%>.InsuredName.value = tempInsuredName; 
	     var link =  "<a href=../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId="+tempInsuredId+">"+tempInsuredName+"</a>";
	     window.opener.document.getElementById("InsuredName1").innerHTML = link;
	     window.opener.document.getElementById("CreatedBy").innerHTML = tempCreatedBy;
	     window.opener.document.<%=frmName%>.InsuredName.focus();        
		 setTimeout( "window.close();", 2 );
		 return true;
	}
	
	function selectInsuredValue(radio){
		var index = parseInt(radio.value);
		var noOfFields = 10;
		var i =  noOfFields*index;
		tempInsuredId=radio.form.elements[i-1].value;
		tempInsuredName=radio.form.elements[i].value;
		tempCreatedBy=radio.form.elements[i+1].value;
		return true;
	}
	
	function navigate(nextOrPre){
	 var formElement=document.forms["ResultForm"];
	 formElement.action="../FindAllInsuredPopUp.do?FormName=<%=""+frmName%>&answer(requestFrom)=QuickQuote&answer(ownerId)=<%=""+ownerId%>&answer(Object::Customer::PageNum)="+nextOrPre;
	 document.forms["ResultForm"].submit();
	}
	
		
</SCRIPT>
