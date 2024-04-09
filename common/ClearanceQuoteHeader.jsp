<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<script type="text/javascript" src="../Scripts/JScripts/QuoteHeader.js">
</script>

<tr>
	<td>

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
			
		<table ALIGN="left" BORDER="0" width="100%" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td align="left" colspan=2>
					<table width="100%" align="left" border="0" >
						<tr>
							
						</tr>
					</table>
				</td>
			</tr>
		</table>

	</td>
</tr>

	<tr>
		<td>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />

<dmshtml:Get_HealthIns_QuoteHeaderDetail nameInSession="parentQuoteDetail" quoteId="<%=""+parentQuoteId%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' ownerId="<%=""+ownerId%>"  />
<logic:present name="parentQuoteDetail" scope="request">
	<bean:define id="parentQuoteDetailObject" name="parentQuoteDetail" scope="request" type="com.dms.ejb.insurance.quote.common.quote.QuoteDetail"/>
	
	<bean:define id="prodId" name="parentQuoteDetail" property="productId" scope="request"/>

	
<!--##########################NEW QUOTE HEADER START #########################################-->
		
				
				<div id="quoteheadercontainer">
					<div id="quoteheadernav" align="left">
						<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
						<tr><td width="50%">
						<a rel="quoteheader" onclick="showHideHeader();">
						<img src="/Images/plus.gif" name="quoteHeaderImg" height="12" width="12" align="left">
						&nbsp;
						<span id="Quote:TxtChange">Click here to show detail</span></a></td>
						<%String insType = (String)session.getAttribute("InsType"); %>       
					      <%if(insType.equals("Professional Liability")) {%>           <td>
					       <b class="title"><span>Enrollment Information</span></b>          
					       </td>
					      <%} else{ %>
					       <td>
					       <b class="title"><span>Quote Information</span></b>          
					       </td>
					      <%} %>				
						</tr></table>
					</div>
				
							<div id="quoteheader_inner">
							<div id="quoteheader" class="innercontent1">
								<table WIDTH="100%" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0" bgcolor="#C6DEEA">
								<tr><td>

								
									<dmshtml:Get_Quote_Header_Html nameInSession="headerDetail1" quoteId="<%=Long.parseLong(""+parentQuoteId)%>" productId="<%=Long.parseLong(""+prodId)%>" productVerId="<%=Long.parseLong(""+productVerId)%>" ownerId="<%=Long.parseLong(""+ownerId)%>" queryString="QUOTE_HEADER_ALGORITHM"  dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>'/> 
									<logic:present name="headerDetail1" scope="request">
									 	<bean:define id="htmlPage" name="headerDetail1"	type="java.lang.StringBuffer" />												
										<%out.println(htmlPage.toString());%>
									</logic:present>
						
							
														
								</td></tr></table>
							</div>
							</div>
																	
				</div>
				

<!--##########################NEW QUOTE HEADER END #########################################-->	

</logic:present>
</td>
		</tr>