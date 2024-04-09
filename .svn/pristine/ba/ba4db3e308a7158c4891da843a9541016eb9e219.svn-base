<!--
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
-->


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>




<%String agentId="";%>
<%if (request.getParameter("answer(Object::Entity::EntityId)")!= null) {
agentId=request.getParameter("answer(Object::Entity::EntityId)");
}%>
<%String agencyId="";%>
<%if (request.getParameter("answer(agencyId)")!= null) {
	agencyId=request.getParameter("answer(agencyId)");
}%>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)" value="<%=ownerId.toString()%>" /> 
<html:hidden property="answer(isDuplicateAllowed)" value="NO"/>
<html:hidden property="ownerId" value="<%=ownerId.toString()%>" /> 
<html:hidden property="page" value="2" /> 
<html:hidden property="answer(Object::UserDetail::roleName)" value="AGENT" />
<html:hidden property="answer(Object::Entity::EntityType)" value="AGENT" />
<html:hidden property="answer(Object::Entity::OwnerId)" value="<%=ownerId.toString()%>" />
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 

<html:hidden property="answer(Object::Entity::User)" value="<%=userName.toString()%>" />

<html:hidden property="answer(Object::UserDetail::roleName)" value="AGENT" />
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::OwnerId)" value="<%=ownerId.toString()%>" />
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::User)" value="SysUser" />
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::User)" value="SysUser" />
<bean:define id="userpassword" property="answer(Object::UserDetail::passWord)" name="AddAgent" scope="request"/> 
<bean:define id="passwordCnfirm" property="answer(Object::UserDetail::passWordConfirm)" name="AddAgent" scope="request"/> 
<html:hidden property="answer(Object::UserDetail::passWordConfirmHidden)"  value="<%=passwordCnfirm.toString()%>" />
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />

<!-- Code to Prevent the back Button Issue-->


<%if(! agentId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::EntityId)" value="<%=agentId.toString()%>"  />
<html:hidden property="answer(Object::UserDetail::PrimaryObjectId)" value="<%=agentId.toString()%>"  />
<%} %>

<bean:define id="AgencyId" name="AddAgent" property="answer(Agency::AgencyId)"/> 
<%if(! AgencyId.toString().equals("")) {%>
<html:hidden property="answer(Agency::AgencyId)" value="<%=AgencyId.toString()%>"  styleId="AgencyIdFromPopup" />
<%} else{%>
<html:hidden property="answer(Agency::AgencyId)" value="<%=agencyId.toString()%>"  styleId="AgencyIdFromPopup" />
<%} %>

<!-- Passing Agent Address ID  -->
<bean:define id="AgentAddressId" name="AddAgent" property="answer(Object::Entity::PrimaryAddressId)"/> 

<%if(AgentAddressId==null) {%>
<html:hidden property="answer(Object::Entity::PrimaryAddressId)" value="-1"  />
<%} else if(! AgentAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::PrimaryAddressId)" value="<%=AgentAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::PrimaryAddressId)" value="-1"  />
<%}%>



<!-- Passing Agent BUSINESS Address ID -->
<bean:define id="AgentBusinessAddressId" name="AddAgent" property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::AddressId)"/> 

<%if(AgentBusinessAddressId==null) {%>
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
<%} else if(! AgentBusinessAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::AddressId)" value="<%=AgentBusinessAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::Addresses::BUSINESS::Object::Address::AddressId)" value="0"  />
<%}%>

<!-- Passing Agent HOME Address ID -->
<bean:define id="AgentHomeAddressId" name="AddAgent" property="answer(Object::Entity::Addresses::HOME::Object::Address::AddressId)"/> 

<%if(AgentHomeAddressId==null) {%>
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::AddressId)" value="0"  />
<%} else if(! AgentHomeAddressId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::AddressId)" value="<%=AgentHomeAddressId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::Addresses::HOME::Object::Address::AddressId)" value="0"  />
<%}%>



<!-- Passing Primary Agent Contact ID -->
<bean:define id="AgentPrimaryContactId" name="AddAgent" property="answer(Object::Entity::PrimaryContactId)"/> 

<%if(AgentPrimaryContactId==null) {%>
<html:hidden property="answer(Object::Entity::PrimaryContactId)" value="0"  />
<%} else if(! AgentPrimaryContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::PrimaryContactId)" value="<%=AgentPrimaryContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::PrimaryContactId)" value="0"  />
<%}%>

<!-- Passing BUSINESS Agent Contact ID -->
<bean:define id="AgentBusSinessContactId" name="AddAgent" property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::ContactId)"/> 

<%if(AgentBusSinessContactId==null) {%>
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
<%} else if(! AgentBusSinessContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::ContactId)" value="<%=AgentBusSinessContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::Contacts::BUSINESS::Object::Contact::ContactId)" value="0"  />
<%}%>

<!-- Passing HOME Agency Contact ID -->
<bean:define id="AgentHomeContactId" name="AddAgent" property="answer(Object::Entity::Contacts::HOME::Object::Contact::ContactId)"/> 

<%if(AgentHomeContactId==null) {%>
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
<%} else if(! AgentHomeContactId.toString().equals("")) {%>
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::ContactId)" value="<%=AgentHomeContactId.toString()%>"  />
<%} else {%>
<html:hidden property="answer(Object::Entity::Contacts::HOME::Object::Contact::ContactId)" value="0"  />
<%}%>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:hidden property="answer(Object::UserDetail::userName)" value="<%=userName.toString()%>"/>

<bean:define id="password" property="answer(Object::UserDetail::passWord)" name="AddAgent" scope="request"/> 
<html:hidden property="answer(Object::UserDetail::userName)" value="<%=userName.toString()%>"/>
<html:hidden property="answer(Object::UserDetail::passWord)" value="<%=password.toString()%>"/>
<html:hidden property="answer(Object::UserDetail::passWordConfirm)" value="<%=password.toString()%>"/>
<html:hidden property="answer(EDIT)" value="YES"/>
