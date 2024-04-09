<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dms.ejb.data.QuestionHashMap" %>
<script type="text/javascript" src="../Scripts/JScripts/PlanHeader.js">
</script>

			<bean:define id="ownerId"
				property="answer(Object::UserDetail::ownerId)" name="LoginPage"
				scope="session" />
			<bean:parameter id="subQuoteId" name="subQuoteId" />
			<bean:parameter id="customerId" name="customerId" />
			<bean:parameter id="prodId" name="productId" />
			<bean:parameter id="productVerId" name="productVerId" />
			<bean:parameter id="prdGroupId" name="prdGroupId" />
			<bean:parameter id="prdGroupVerId" name="prdGroupVerId" />
			<bean:parameter id="productStatus" name="productStatus" />
			<bean:parameter id="stateCode" name="stateCode" />
		 	
		<%
		String parentQuoteStatus = "";
		%>
		<%if(request.getParameter("paretQuoteStatus") != null){ %>
			<bean:parameter id="pQS" name="paretQuoteStatus" />
			
		<% 
			parentQuoteStatus = pQS;
		}%>
		
		<%
		String parentQuoteId = "";
		%>
		<%if(request.getParameter("answer(parentQuoteId)") != null){ %>
			<bean:parameter id="pQI" name="answer(parentQuoteId)" />
			
		<% 
			parentQuoteId = pQI;
		}%>
		
		
		

		<bean:define id="objDescId" property="answer(Object::UserDetail::PrimaryRoleId)"  name="LoginPage" scope="session" />
			<%
				String productName = "";
				String productVerNumber = "";
				String groupName = "";
				String groupVerNumber = "";
			%>
			<dmshtml:dms_static_with_connector ruleName='privilage'
				property='<%=new String[]{"SHOW_PRODUCT_INFO"}%>' connector='or'
				negated="true">
				<dmshtml:get_GroupDetail_ByGroupVerId nameInSession="aGroupDetail"
					groupId="<%=""+prdGroupId%>" groupVerId="<%=""+prdGroupVerId%>"
					ownerId="<%=""+ownerId%>"
					dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
				<logic:present name="aGroupDetail" scope="request">
					<bean:define id="groupverName" property="groupverName"
						name="aGroupDetail" scope="request" />
					<bean:define id="groupVerNum" property="groupVerNum"
						name="aGroupDetail" scope="request" />
					<%
						groupName = ""+groupverName;
						groupVerNumber = ""+groupVerNum;
					%>
				</logic:present>
				<dmshtml:get_ProductDetail_ByProductVerId
					nameInSession="aProductDetail" productId="<%=""+prodId%>"
					productVerId="<%=""+productVerId%>" ownerId="<%=""+ownerId%>"
					dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
				<logic:present name="aProductDetail" scope="request">
					<bean:define id="MProductVerName" property="MProductVerName"
						name="aProductDetail" scope="request" />
					<bean:define id="MProductVerNumber" property="MProductVerNumber"
						name="aProductDetail" scope="request" />
					<%
						productName = ""+MProductVerName;
						productVerNumber = ""+MProductVerNumber;
					%>
				</logic:present>
			</dmshtml:dms_static_with_connector>
		
			<%System.out.println("#####111subQuoteId " + subQuoteId);%>
			<dmshtml:Get_HealthIns_QuoteDetail nameInSession="aSubQuote"
				quoteId="<%=""+subQuoteId%>"
				dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'
				ownerId="<%=""+ownerId%>" />
			<%System.out.println("#####111subQuoteId " + subQuoteId);%>

												
		<!--##########################NEW PLAN HEADER START #########################################-->
							
	<%boolean premiumViewPrivilage=false;%>

<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"PREMIUM_VIEW"}%>' connector='or' negated="true">  
<%premiumViewPrivilage=true;%>
</dmshtml:dms_static_with_connector>
<%String strSubQuoteId = subQuoteId; 
if(!strSubQuoteId.equals("null") && !strSubQuoteId.equals(""))
{%>
<dmshtml:Get_Quote_Header_Values nameInSession="headerDetail1" quoteId="<%=Long.parseLong(""+subQuoteId)%>" productId="<%=Long.parseLong(""+prodId)%>" hasPrimiumViewPrivileage="<%=premiumViewPrivilage %>" privileagedQueryString="PRIVILEGED_PLAN_HEADER_ALGORITHM" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>"  queryString="PLAN_HEADER_ALGORITHM"  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
<%} %>
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