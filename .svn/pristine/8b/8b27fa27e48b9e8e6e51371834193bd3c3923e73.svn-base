<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dms.ejb.data.QuestionHashMap" %>
<script type="text/javascript" src="../Scripts/JScripts/QuoteHeader.js">
</script>


		<bean:parameter id="parentQuoteId" name="parentQuoteId" />
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
			<bean:define id="paretQuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" />
			
		<% 
			parentQuoteStatus = paretQuoteStatus.toString();
		}%>
		
		
		
		<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
			
		
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<%
String strQuoteId = parentQuoteId;
if(!strQuoteId.equals("null") && !strQuoteId.equals("")){ %>
<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
<%} %>
<logic:present name="parentQuoteDetail" scope="request">
	<bean:define id="parentQuoteDetailObject" name="parentQuoteDetail" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>
	
	<bean:define id="prodId" name="parentQuoteDetail" property="productId" scope="request"/>

	
<!--##########################NEW QUOTE HEADER START #########################################-->
<%boolean premiumViewPrivilage=false;%>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREMIUM_VIEW"}%>' connector='or' negated="true">  
<%premiumViewPrivilage=true;%>
</dmshtml:dms_static_with_connector>
<dmshtml:Get_Quote_Header_Values nameInSession="headerDetail1" quoteId="<%=Long.parseLong(""+parentQuoteId)%>" productId="<%=Long.parseLong(""+prodId)%>" hasPrimiumViewPrivileage="<%=premiumViewPrivilage %>" privileagedQueryString="PRIVILEGED_QUOTE_HEADER_ALGORITHM" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>"  queryString="QUOTE_HEADER_ALGORITHM"  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
<logic:present name="headerDetail1" scope="request">
 	<bean:define id="htmlPage" name="headerDetail1"	/>	
 	<div class="frame3">											
	<%
		QuestionHashMap headerMap = (QuestionHashMap)htmlPage;
		ArrayList headingList = (ArrayList)headerMap.get("Object::Header::RowHeadings");
		ArrayList valueList = (ArrayList)headerMap.get("Object::Header::RowValues");
		int headerSize = headingList.size();
		int rowNos = headerSize/3;
		int extraNos = headerSize%3;
		int firstColumnSize = rowNos;
		int secColumnSize = rowNos;
		if(extraNos==2){
			firstColumnSize = rowNos+1;
			secColumnSize = rowNos+1;
		}else if(extraNos==1){
			firstColumnSize = rowNos+1;
		}					
		%>
		<div class="frlabelLen left frVerLine">
		<%
		for(int index=0;index<firstColumnSize;index++){%>
			<%=""+headingList.get(index) %>:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><%=""+valueList.get(index) %></span><br />
		<%}
		%>
		</div>		
		<div class="frlabelLen left frVerLine">
		<%
		for(int index=firstColumnSize;index<(firstColumnSize+secColumnSize);index++){%>
			<%=""+headingList.get(index) %>:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><%=""+valueList.get(index) %></span><br />
		<%}
		%>
		</div>		
		<div class="frlabelLen left frVerLine">
		<%
		for(int index=(firstColumnSize+secColumnSize);index<headingList.size();index++){%>
			<%=""+headingList.get(index) %>:&nbsp;&nbsp;&nbsp;<span class="frinfoLen"><%=""+valueList.get(index) %></span><br />
		<%}
		%>
		</div>		
	</div>
</logic:present>
<!--
<div class="frame2Hight">
	<div class="frlabel left">
		Quote Number<br />
		Quote Version #<br />
		Quote Status<br />
		Agency Commission %<br />
		Quote Typedd<br />
	</div>
</div>
-->	

<!--##########################NEW QUOTE HEADER END #########################################-->	

</logic:present>
