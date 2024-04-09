
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dms.ejb.data.QuestionHashMap" %>


		<bean:parameter id="policyId" name="policyId" />
		<bean:parameter id="policyVerId" name="policyVerId" />
		<bean:parameter id="policyNumber" name="policyNumber" />
		<bean:parameter id="prodId" name="prodId" />
		<bean:parameter id="ProductVerId" name="ProductVerId" />
		<bean:parameter id="title" name="title" />
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
		
		<%String documentType ="ISSUANCE";%>
		
		<dmshtml:isActivePolicy policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
		<%String isActivePolicy =(String) request.getAttribute("isActivePolicy");  
		  String bcolor ="#C6DEEA";
		  String header ="policyheadernav";
		  String parentQuoteId1="";
		  String customerId1="";
		   if (!(isActivePolicy.equals("Y"))){
			   bcolor ="#CCCCCC";
			   header ="priorpolicyheadernav";
			   
		   }
		   
		%>
		
		<script type="text/javascript" src="../Scripts/JScripts/PolicyHeader.js">
		</script>
		
		
	<div id="policyheadercontainer" class="formpagenew1">
	<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId='<%=""+policyId%>' policyVerId='<%=""+policyVerId %>' policyNumber="<%=""+policyNumber%>" documentType='<%=documentType%>' ownerId='<%=""+ownerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
		<logic:present name="policyHeaderInfo">	
				<bean:define id="parentQuoteId" name="policyHeaderInfo" property="MParentQuoteId" scope="request"/>
				<%parentQuoteId1=""+parentQuoteId;%>
				<bean:define id="customerId" name="policyHeaderInfo" property="dmsCustomerId" scope="request"/>
				<%customerId1=""+customerId;%>		
		</logic:present>	
	<dmshtml:Get_Policy_Header_Values nameInSession="headerDetail2" policyId="<%=Long.parseLong(""+policyId)%>"  policyVerId='<%=Long.parseLong(""+policyVerId)%>' productId="<%=Long.parseLong(""+prodId)%>" productVerId="<%=Long.parseLong(""+ProductVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="POLICY_HEADER"  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
    <logic:present name="headerDetail2" scope="request">
   <bean:define id="htmlPage" name="headerDetail2"	/>		
	<div class="frame4border2">
	
	<div class="formhead"><h2 class="left"><a style='color: #003a76; text-decoration:none' id="policyHeader" href="javascript:void(0);" onClick="showHidePolicyHeaderUI3();">+ Policy</a></h2></div>											
	<%
		QuestionHashMap headerMap = (QuestionHashMap)htmlPage;
		ArrayList headingList = (ArrayList)headerMap.get("Object::Header::RowHeadings");
		ArrayList valueList = (ArrayList)headerMap.get("Object::Header::RowValues");
		int headerSize = headingList.size();
		int rowNos = headerSize/2;
		int extraNos = headerSize%2;
		int firstColumnSize = rowNos;
		%>
		<table id="policyContent" style="display:none;">
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
						 <%if(rowHead1.indexOf("Quote")!=-1){%>
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
						 <%if(rowHead1.indexOf("Quote")!=-1){%>
							<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=""+customerId1%>&answer(QuoteId)=<%=parentQuoteId1.toString()%>&answer(parentQuoteId)=<%=parentQuoteId1.toString()%>"><%=valueList.get(j)%></a>	
						 <%}else{%>
						       <%=valueList.get(j)%><br />
						 <%}%>
			   	   <%}%>
				<%}%>
				&nbsp;
		</div>
		</td>	
		</tr>
	</table>
	</div>
				
				<!--##########################NEW QUOTE HEADER END #########################################-->	
				
					</logic:present>
					</div>
			
	

