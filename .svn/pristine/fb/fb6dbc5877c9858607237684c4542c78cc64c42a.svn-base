
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<table align="center" border="0" width="100%">
<tr>
	<td>
		<bean:parameter id="policyId" name="policyId" />
		<bean:parameter id="policyVerId" name="policyVerId" />
		<bean:parameter id="policyNumber" name="policyNumber" />
		<bean:parameter id="title" name="title" />
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
		
		<%String quoteId = "";
		if(request.getParameter("quoteId") != null) {
			quoteId = ""+request.getParameter("quoteId");
		}else if(request.getParameter("answer(QuoteId)")!=null){
			quoteId = ""+request.getParameter("answer(QuoteId)");
		}
		%>
		
		<%String isRenewal = "";
		if(request.getParameter("isRenewal") != null) {
			isRenewal = request.getParameter("isRenewal");
		}%>
		
		<%String renewalPolicyId = "";
		if(request.getParameter("renewalPolicyId") != null) {
			renewalPolicyId = request.getParameter("renewalPolicyId");
		}
		String renewalPolicyVerId = "";
		if(request.getParameter("renewalPolicyVerId") != null) {
			renewalPolicyVerId = request.getParameter("renewalPolicyVerId");
		}%>
		
		<%String documentType ="ISSUANCE";%>
		
		<dmshtml:isActivePolicy policyId="<%=""+policyId%>" policyVerId="<%=""+policyVerId%>" ownerId="<%=""+ownerId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
		<%String isActivePolicy =(String) request.getAttribute("isActivePolicy");  
		  String bcolor ="#C6DEEA";
		  String header ="policyheadernav";
		   if (!(isActivePolicy.equals("Y"))){
			   bcolor ="#CCCCCC";
			   header ="priorpolicyheadernav";
			   
		   }
		   
		%>
		
		<%	String primaryPolicyId = "" + policyId;
			String primaryPolicyVerId = "" + policyVerId;
			String expiringParentPolicyId = "";
			String expiringParentPolicyVerId = "";
			String expiringPolicyId = "";
			String expiringPolicyVerId = "";%>
		
		<%if(!quoteId.equals("")){ %>
			<dmshtml:Get_Expiring_Policy_Info nameInSession="expiringPolicyHeaderInfo" quoteId='<%=""+quoteId%>' ownerId='<%=""+ownerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
			<logic:present name="expiringPolicyHeaderInfo">
				<bean:define id="expiringPolicyMap" name="expiringPolicyHeaderInfo" type="com.dms.ejb.data.QuestionHashMap" />
				<%	expiringPolicyId = expiringPolicyMap.getString("expiringPolicyId");
					expiringPolicyVerId = expiringPolicyMap.getString("expiringPolicyVerId");
					expiringParentPolicyId = expiringPolicyMap.getString("expiringParentPolicyId");
					expiringParentPolicyVerId = expiringPolicyMap.getString("expiringParentPolicyVerId");
					
					if(!isRenewal.equalsIgnoreCase("true")) {
						if(!expiringPolicyId.equals("")) {
							policyId= "" + expiringPolicyId ;
							policyVerId = "" + expiringPolicyVerId;	
						}
					} else {
						if(!expiringParentPolicyId.equals("")) {
							policyId = "" + expiringParentPolicyId;
							policyVerId = "" + expiringParentPolicyVerId;
						}
					}
					%>
			</logic:present>
		<%} %>
		
		<script type="text/javascript" src="../Scripts/JScripts/PolicyHeader.js">
		</script>		

		<table align="center" border="0" width="100%">
			<tr>
				<td>
					<div id="policyheadercontainer">
						<div id="<%=header%>">	
							<table align="center" border="0" width="100%">
								<tr>
									<td align="left" width="45%">						
										<a rel="policyheader" onclick="showHidePolicyHeader('<%=header%>');"><img src="../Images/minus.gif" name="policyHeaderImg" height="12" width="12" align="left"></img>&nbsp;<span id="Policy:TxtChange">Click to hide the detail</span></a>						
									</td>	
									<td align="left"><b class="title"><%=""+title%></b></td>												
								</tr>
							</table>
						</div>
						<dmshtml:Get_Policy_HeaderInfo nameInSession="policyHeaderInfo" policyId='<%=""+primaryPolicyId%>' policyVerId='<%=""+primaryPolicyVerId %>' policyNumber="<%=""+policyNumber%>" documentType='<%=documentType%>' ownerId='<%=""+ownerId%>' dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
						<logic:present name="policyHeaderInfo">
							<bean:define id="prodId" name="policyHeaderInfo" property="productId" scope="request"/>
							<bean:define id="prodVerId" name="policyHeaderInfo" property="productVerId" scope="request"/>
								<div id="policyheader" class="innercontent3">
									<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="#C6DEEA">
										<tr>
											<td>
											<%--  	<dmshtml:Get_Policy_Header_Html nameInSession="headerDetail1" policyId="<%=Long.parseLong(""+policyId)%>"  policyVerId='<%=Long.parseLong(""+policyVerId)%>' productId="<%=Long.parseLong(""+prodId)%>" productVerId="<%=Long.parseLong(""+prodVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="POLICY_HEADER"  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>--%> 
												
												<%if(isRenewal.equals("true")) { %>
													<dmshtml:Get_Endorsement_Policy_Header_Html nameInSession="headerDetail1" policyId="<%=Long.parseLong(""+expiringPolicyId)%>"  policyVerId='<%=Long.parseLong(""+expiringPolicyVerId)%>' renewalPolicyId="<%=Long.parseLong(""+policyId)%>"  renewalPolicyVerId='<%=Long.parseLong(""+policyVerId)%>' productId="<%=Long.parseLong(""+prodId)%>" productVerId="<%=Long.parseLong(""+prodVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="ENDORSEMENT_POLICY_HEADER"  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
												<%} else { %>
													<% if(!renewalPolicyVerId.equalsIgnoreCase("") && !renewalPolicyId.equalsIgnoreCase("")) { 
														policyId = renewalPolicyId;
														policyVerId = renewalPolicyVerId;
													} %>
													<dmshtml:Get_Endorsement_Policy_Header_Html nameInSession="headerDetail1" policyId="<%=Long.parseLong(""+policyId)%>"  policyVerId='<%=Long.parseLong(""+policyVerId)%>' renewalPolicyId="<%=Long.parseLong(""+primaryPolicyId)%>"  renewalPolicyVerId='<%=Long.parseLong(""+primaryPolicyVerId)%>' productId="<%=Long.parseLong(""+prodId)%>" productVerId="<%=Long.parseLong(""+prodVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="ENDORSEMENT_POLICY_HEADER"  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/>
												<%} %> 
												<logic:present name="headerDetail1" scope="request">
												 	<bean:define id="htmlPage" name="headerDetail1"	type="java.lang.StringBuffer" />												
														<div id="policyHeader"><%out.println(htmlPage.toString());%></div>
												</logic:present>
											</td>
										</tr>
									</table>
								</div>
								</logic:present>
						</div>
				
				<!--##########################NEW QUOTE HEADER END #########################################-->	
				
					
				</td>
			</tr>
		</table>
	</td>
</tr>	
</table>
