<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dms.ejb.data.QuestionHashMap" %>
<script type="text/javascript" src="../Scripts/JScripts/QuoteHeader.js">
</script>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>

		<%Object cId=null;%>
<%String customerCreatedBy=""; %>
<%String customerCreatedDate="";
String customerUpdatedDate=""; 
%>

<%long lngAgencyId=0;%>
<%long lngAgentId=0;%>
<%String agencyName="";%>
<%String agentFName="";%>
<%String agentLName="";%>
<%String generalAgencyId="";%>
<%long lngGeneralAgencyId=0;%>
<%String generalAgencyName="";
boolean isRenewal=false;%>

<bean:parameter name="paretQuoteStatus" id="paretQuoteStatus"/>
<bean:parameter name="policyNumber" id="policyNumber"/>
<bean:parameter name="customerId" id="customerId"/>

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
	<%}
    String cId1 = ""+cId;
	if(Integer.parseInt(cId1) <= 0){%>
	<%
	cId = ""+customerId;
	}%>
	
<%
	
if(cId!=null && (!cId.toString().equals(""))){%>
	<dmshtml:Get_Customer_Agency_Agent_Details nameInSession="customerDetail1" customerId="<%=cId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>	
	<logic:present name="customerDetail1" scope="request">

		<bean:define id="customerDetailMap" name="customerDetail1" scope="request" type="com.dms.ejb.data.QuestionHashMap" />
		
		<%try{
		lngAgencyId=Long.parseLong(customerDetailMap.getString("agencyid"));
		}catch(Exception nfe) {lngAgencyId=0;    }
		try{
		lngAgentId=Long.parseLong(customerDetailMap.getString("agentid"));
		}catch(Exception nfe) {lngAgentId=0;    }
		agencyName=customerDetailMap.getString("agencyname");
		agentFName=customerDetailMap.getString("agentfirstname");
		agentLName=customerDetailMap.getString("agentlastname");
		customerCreatedBy = customerDetailMap.getString("customerCreatedBy");
		customerCreatedDate = customerDetailMap.getString("customerCreatedDate");
		
		try{
		lngGeneralAgencyId=Long.parseLong(customerDetailMap.getString("generalagencyid"));
		}catch(Exception nfe) {lngGeneralAgencyId=0;    }
		generalAgencyName=customerDetailMap.getString("generalagencyname");%>
		

		<bean:parameter id="parentQuoteId" name="ParentQuoteId" />
		<bean:parameter id="subQuoteVerId" name="subQuoteVerId" />
		<bean:parameter id="subQuoteId" name="subQuoteId" />
		<bean:parameter id="productVerId" name="productVerId" />
		<bean:parameter id="heading" name="heading"  />		
		<%
		String parentQuoteStatus = "";
		%>
		<%if(request.getParameter("paretQuoteStatus") != null){ %>
			<bean:parameter id="pQS" name="paretQuoteStatus" />
			
		<% 
			parentQuoteStatus = pQS;
		}%>
		
		<%if(request.getAttribute("answer(Object::Quote::QuoteStatus)") != null){ %>
			
			
		<% 
			parentQuoteStatus = paretQuoteStatus.toString();
		}%>
		
		
		
		<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
			
		
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<%
String strQuoteId = parentQuoteId;
if(!strQuoteId.equals("null") && !strQuoteId.equals("")){ %>
<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>" />
<%} %>
<logic:present name="parentQuoteDetail" scope="request">
	<bean:define id="parentQuoteDetailObject" name="parentQuoteDetail" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>
	
	<bean:define id="prodId" name="parentQuoteDetail" property="productId" scope="request"/>
	<bean:define id="prodVerId" name="parentQuoteDetail" property="productVerId" scope="request"/>
	
	<dmshtml:isFeatureAvailableForProductRoleStatus roleId='<%=Long.parseLong(""+objDescId) %>' productId='<%=Long.parseLong(""+prodId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' featureId="CREATE_RENEWAL_PDF" 
						property='<%=new String[]{"In Progress","Offered","Bind Request","Bind","Lapsed"}%>' value="<%=paretQuoteStatus.toString()%>" negated="true">
						<%isRenewal=true; %>
					</dmshtml:isFeatureAvailableForProductRoleStatus>
<!--##########################NEW QUOTE HEADER START #########################################-->
<%boolean premiumViewPrivilage=false;%>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREMIUM_VIEW"}%>' connector='or' negated="true">  
	<%premiumViewPrivilage=true;%>
</dmshtml:dms_static_with_connector>



<div class="formpagenew1">
 	<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0">
	<tr>
	
	
		<td align="left" valign="top">
			<%
				if(subQuoteVerId==null && (""+subQuoteVerId).equals("")){
					subQuoteVerId = "0";
				}
				if(subQuoteId==null && (""+subQuoteId).equals("")){
					subQuoteId = "0";
				}
			%>			
			<dmshtml:Get_Quote_Header_Values nameInSession="headerDetail1" quoteId="<%=Long.parseLong(""+parentQuoteId)%>" productId="<%=Long.parseLong(""+prodId)%>" hasPrimiumViewPrivileage="<%=premiumViewPrivilage %>" privileagedQueryString="PRIVILEGED_QUOTE_HEADER_ALGORITHM" productVerId="<%=Long.parseLong(""+prodVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>"  queryString="QUOTE_HEADER_ALGORITHM"  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' subQuoteVerId="<%=Long.parseLong(""+subQuoteVerId)%>" subQuoteId="<%=Long.parseLong(""+subQuoteId)%>" /> 

         <logic:present name="headerDetail1" scope="request">
         	<bean:define id="htmlPage" name="headerDetail1"	/>	
	<div class="frame4border2">
	
	<div class="formhead"><h2 class="left"><a style='color: #003a76; text-decoration:none' href='javascript:void(0);' id='endorsementHeader' onClick='showHideQuoteHeaderUI3();'>- Endorsement Quote Information</a></h2></div>											
	<%
		QuestionHashMap headerMap = (QuestionHashMap)htmlPage;
		if(headerMap.get("Object::Header::RowHeadings") !=null && !headerMap.get("Object::Header::RowHeadings").equals("")){
		ArrayList headingList = (ArrayList)headerMap.get("Object::Header::RowHeadings");
		ArrayList valueList = (ArrayList)headerMap.get("Object::Header::RowValues");
		int headerSize = headingList.size();
		int rowNos = headerSize/2;
		int extraNos = headerSize%2;
		int firstColumnSize = rowNos;
		%>
		<table id="endorsementContent" style="display:block;">
		<tr>
		<td valign="top">
		<div class="frlabel42 ">
				<%for (int i=0;i< firstColumnSize;i++){%>
				  <%String value1 = ""+valueList.get(i);%>
				  <%if(!value1.equals("")){%>
				 	  <%=headingList.get(i)+":"%><br />
				  <%}%>
				<%}%>
				&nbsp;
		</div>
		</td>
		<td valign="top">
		<div class="frinfo4policyheader ">
				<%for (int j=0;j< firstColumnSize;j++){%>
					<%String rowHead1 = ""+headingList.get(j);
				      String val1 = ""+valueList.get(j);%> 
			  	   <%if(!val1.equals("")){%>
						<%if(val1.indexOf("ENDORSEMENT")!=-1 && isRenewal ){%>
						 	    <%="Renewal"%><br />
						 <%}else{%>
						       <%=valueList.get(j)%><br />
						 <%}%>
			   	   <%}%>
       			<%}%>
				&nbsp;
		</div>	
		</td>
		<td valign="top">
		<div class="frlabel42 ">
	        	<%for (int i=firstColumnSize;i< headingList.size();i++){%>
			       <%String value1 = ""+valueList.get(i);%>
				  <%if(!value1.equals("")){%>
				 	  <%=headingList.get(i)+":"%><br />
				  <%}%>
				<%}%>
		</div>
		</td>
		<td valign="top">
	    <div class="frinfo4policyheader ">
	           
				<%for (int j=firstColumnSize;j< valueList.size();j++){%>
		          <%String rowHead1 = ""+headingList.get(j);
				    String val1 = ""+valueList.get(j);%> 
			  	   <%if(!val1.equals("")){%>
			  	    <%if(val1.indexOf("ENDORSEMENT")!=-1 && isRenewal ){%>
						 	    <%="Rnenewal"%><br />
						 <%}else{%>
						       <%=valueList.get(j)%><br />
						 <%}%>
			  	    <%}
			   	  %>
				<%}%>
				&nbsp;
		</div>
		</td>	
		</tr>
	</table>
	<%}%>
	</div>
   </logic:present>
		</td >
		</tr>
		</table>
		
</div>
</logic:present>
</logic:present>
	<%}%>
