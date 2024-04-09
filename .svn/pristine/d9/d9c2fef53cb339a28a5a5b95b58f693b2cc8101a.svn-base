<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>

<%Object cId=null;%>
<%String customerCreatedBy=""; %>
<%String customerCreatedDate="";
String customerUpdatedDate="";
String customerName = "";
String customerName2 = "";
String insuredNameType ="";
String zipCode = "";
%>

<%long lngAgencyId=0;%>
<%long lngAgentId=0;%>
<%String agencyName="";%>
<%String agentFName="";%>
<%String agentLName="";%>
<%String generalAgencyId="";%>
<%long lngGeneralAgencyId=0;%>
<%String generalAgencyName="";%>

<%
	Object custId = request.getAttribute("Object::Customer::CustomerId");	
    if((""+custId).length()>0 && custId !=null && !((""+custId).equals("0"))) {
		cId=custId; 
	}else if(request.getParameter("answer(Object::Customer::CustomerId)")!= null && request.getParameter("answer(Object::Customer::CustomerId)")!="") {%>
	<bean:parameter id="cIdpara" name="answer(Object::Customer::CustomerId)" />
	<%cId=cIdpara;%>
	<%}else if(request.getParameter("answer(customerId)")!= null) {%>
	<bean:parameter id="cIdparam2" name="answer(customerId)" />
	<%cId=cIdparam2;
	} else {%>	
	<bean:define id="cIdSession" name="AddCustomer" property="answer(Object::Customer::CustomerId)"/>
	<%	cId=cIdSession;%>
	<%}%>
	
<%if(cId!=null && (!cId.toString().equals(""))){%>
<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
 <logic:present name="customerDetail1" scope="request">
  <bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
  <%try{
		lngAgencyId=Long.parseLong(customerDetailMap.getString("agencyid"));
		}catch(Exception nfe) {lngAgencyId=0;    }
		try{
		lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
		}catch(Exception nfe) {lngAgentId=0;    }
		agencyName=customerDetailMap.getEncodedString("agencyname");
		agentFName=customerDetailMap.getEncodedString("agentfirstname");
		agentLName=customerDetailMap.getEncodedString("agentlastname");
		customerCreatedBy = customerDetailMap.getEncodedString("customerCreatedBy");
		customerCreatedDate = customerDetailMap.getString("customerCreatedDate");
	    customerUpdatedDate = customerDetailMap.getString("customerUpdatedDate");
	    customerName = customerDetailMap.getEncodedString("custname");
	    customerName2 = customerDetailMap.getEncodedString("customerName2");
		insuredNameType = customerDetailMap.getString("insuredNameType");
		zipCode = customerDetailMap.getString("zip");
		try{
		lngGeneralAgencyId=Long.parseLong(customerDetailMap.getString("generalagencyid"));
		}catch(Exception nfe) {lngGeneralAgencyId=0;    }
		generalAgencyName=customerDetailMap.getString("generalagencyname");%>
  </logic:present>
  <dmshtml:Get_Formatted_Date nameInSession="customerDetail1" strDate="<%=""+customerCreatedDate%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
  <logic:present name="customerDetail1" scope="request">
  <bean:define id="customerCreatedDateId" name="customerDetail1" scope="request" />
  <%System.out.println("XXXX:"+customerCreatedDateId);%>
   <%customerCreatedDate=""+customerCreatedDateId; %>
  </logic:present>
  <dmshtml:Get_Formatted_Date nameInSession="customerDetail1" strDate="<%=""+customerUpdatedDate%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
  <logic:present name="customerDetail1" scope="request">
  <bean:define id="customerUpdatedDateId" name="customerDetail1" scope="request" />
  <% System.out.println("YYYY:"+customerUpdatedDateId);%>
   <%customerUpdatedDate=""+customerUpdatedDateId; %>
  </logic:present>
  
   <div class="frame11ForInsuredHeader">
   		<div class="frlabelLenForInsuredHeader left frVerLineForInsuredHeader">
				Name 1:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><a id="insuredSummaryPageLink" href="../GetInsuredAction.do?TabPanelName=Insured_Panel&customerId=<%=""+cId%>" title="<bean:message key='ToolTip.InsuredSummary.InsuredName'/>"><%=""+customerName%></a></span><br/>
				Name Type:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><%=""+insuredNameType%></span><br />
				
		</div>		
		<div class="frlabelLenForInsuredHeader left frVerLineForInsuredHeader">
				Name 2:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><%=""+customerName2%></span><br />
				Zipcode:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"> <%=zipCode%></span><br />
		</div>
		<div class="frlabelLenForInsuredHeader1 left">
					Agency Name:&nbsp;&nbsp;&nbsp;<span class="frinfoLen">
					<%if(lngAgencyId>0){ %>
						<a href="../GetAgencySummary.do?ReadOnly=Yes&agencyId=<%=""+lngAgencyId%>&primaryObjectId=<%=""+lngAgencyId%>&primaryObjectType=AGENCY" onclick="return AgencyPopup(this,'Agency');" target="Agency" title="<bean:message key='ToolTip.InsuredSummary.AgencyName'/>"><%=agencyName%></a>
					<%}%>
					</span><br />
					Agent Name:&nbsp;&nbsp;&nbsp;<span class="frinfoLen">
					<%if(!agentFName.equals("") || !agentLName.equals("")){%>
						<%=agentFName%> <%=" "%><%=agentLName%>
					<%}%>
					</span><br />
		</div>	
	</div>
  
  
  
  			
			<%}%>