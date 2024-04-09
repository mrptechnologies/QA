<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<bean:define id="productVerId" name="AddProduct" property="answer(Object::ProductVer::ProductVerId)" />
<bean:define id="productId" name="AddProduct" property="answer(Object::Product::ProductId)" />
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<script type="text/javascript">
	function deactivateConfirm(){
			var ans = window.confirm("Are you sure you need to deactivate");
			
			if(ans){
			     return true;
			 }else{
			 	 return false;
			 }	 	    
			
	}
</script>


<html:form action="/DeactivePolicyNumber.do" onsubmit="return deactivateConfirm()">
		
	
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		 	<tr>
				<td>				
					<jsp:include page="../common/ProductHeader.jsp">
						<jsp:param name="ProductId" value="<%=productId.toString()%>" />
						<jsp:param name="ProductVerId" value="<%=productVerId.toString()%>" />
					</jsp:include>
				 </td>
			</tr>
	</table>  		
	
	
	
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">

		  <tr>
		  		<td class="NewSectionHead" align="center" colspan="9">PRODUCT POLICY NUMBER</td>
    	  </tr>
    	  
    	    <tr><td>&nbsp;</td></tr> 
    	    <tr>
	    	   <td class="Error" colspan="9">
	    	   
				<logic:present name="message">
					<%=""+request.getAttribute("message") %> 
				</logic:present>
				
				<logic:present name="Deactivemessage">
					<%=""+request.getAttribute("Deactivemessage") %> 
				</logic:present>
				</td>
				
				&nbsp;&nbsp;
			</tr>
			 <tr><td>&nbsp;</td></tr> 
    	  
    	  <tr>
    	  <td class="links" colspan="3" >
    	   	<a href='../ListPolicyNumber.do?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>'>Associate Policy Number </a>
    	  </td>
    	  <td class="links" colspan="3" >
    	  	<a href="../product/savePolicyNumber.jsp?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(Object::ProductVer::ProductVerId)=<%=""+productVerId%>&answer(Object::Product::ProductId)=<%=""+productId%>">Create New Policy Number </a>
    	  </td>
    	  </tr>
    	  
    	  
    	  
    	    <tr>
    	   <td>&nbsp;</td></tr>
    	  
    	  <tr>
    	    <td class="sectionheadLink" align="left" width="3%">SNo</td>
    	    <td class="sectionheadLink" align="left" width="12%" >Policy Number Prefix</td>
    	  	<td class="sectionheadLink" align="left" width="12%">Policy Number Suffix</td>
    	  	<td class="sectionheadLink" align="left" width="12%">Policy Beginning Number</td>
       	  	<td class="sectionheadLink" align="left" width="12%">Policy End Number</td>
       	  	<td class="sectionheadLink" align="left" width="11%">Last Number Used</td>
       	  	<td class="sectionheadLink" align="left" width="1%">Active</td>
       	  	<td class="sectionheadLink" align="right" width="5%">Select</td>
       	  </tr>	
       	  
       	   <tr>
    	   <td>&nbsp;</td></tr>
	       
		       
		       	<%int count = 0; %>
			    	<logic:present name="PolicyNumberList" scope="request">
		          		
		          		  	
			           <logic:iterate id="PolicyNumberList" name="PolicyNumberList" >
			           	<% count++; %>	
			           	<% 		
										String styleClass="";
										if(count%2==0){
											styleClass = "altdisply";
										}
										else{
											styleClass = "SearchResult";	
										}
									%>
			           	
			           <tr> 
			           		<td width="3%" align="center" class=<%= styleClass %>><%=""+count%></td>
			           		<td width="12%" align="left" class=<%= styleClass %>><bean:write name="PolicyNumberList" property="Object::Product::PolicyNumPreFix"/></td>   
			           		<td width="12%" align="left" class=<%= styleClass %>><bean:write name="PolicyNumberList" property="Object::Product::PolicyNumSuffix"/></td>   
			           	    <td width="12%" align="right" class=<%= styleClass %> ><bean:write name="PolicyNumberList" property="Object::Product::PolicyBegNum"/></td> 
			           	    <td width="12%" align="right" class=<%= styleClass %>><bean:write name="PolicyNumberList" property="Object::Product::PolicyEndNum"/></td>     
							<td width="11%" align="right" class=<%= styleClass %>><bean:write name="PolicyNumberList" property="Object::Product::PolicyNumLastUsed"/></td>   
							<td width="1%" align="center" class=<%= styleClass %>>
							<bean:write name="PolicyNumberList" property="Object::Product::PolicyNumActive"/>
							<bean:define id="policyNumActive" name="PolicyNumberList" property="Object::Product::PolicyNumActive" />
							</td> 
							<td width="5%" align="center" class=<%= styleClass %> >
						
							<% String isActive = ""+policyNumActive; 
					 			   if(isActive.equals("Y")){%>
										<input type="radio" name="answer(Object::Product::PolicyNumMasterId)" value='<bean:write name="PolicyNumberList" property="Object::Product::PolicyNumMasterId"/>' />	
					 			  <%}else{ %>	
					 					<input type="radio" name="answer(Object::Product::PolicyNumMasterId)"  value='<bean:write name="PolicyNumberList" property="Object::Product::PolicyNumMasterId"/>' disabled="disabled" />	
							 <%} %>
						
					         </td>
						</tr>	    
						</logic:iterate>
						
			     </logic:present>
			
		 	
	</table>
	
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
 	 	<tr><td>&nbsp;</td></tr>
 	 	<tr>
 	 	<td align="right">
 	 	
 	 		<html:submit property="answer(DeActivate)" value="DeActivate"  styleId="sbttn"/>
 	 		
 	 	</td>
 	 	</tr>
   </table>
  	 <html:hidden property="answer(Object::Product::ProductId)" value="<%=""+productId %>"/>												
	<html:hidden property="answer(Object::ProductVer::ProductVerId)" value="<%=""+productVerId %>"/>
	<html:hidden property="answer(Object::Product::userName)" value="<%=""+userId %>"/>
	<html:hidden property="answer(Object::Product::ownerId)" value="<%=""+ownerId %>"/>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />
 </html:form>


