<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@ page import="com.dms.ejb.entity.DMSEntityDetail"%>
<script type="text/javascript" src="../Scripts/JScripts/CreateQuoteCL.js"></SCRIPT>
<script type="text/javascript" SRC="../Scripts/JScripts/Common.js"></SCRIPT>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript">
function checksubmitandvalidatedate(){
      
	var dateResult=validateDateBinder('submit');	
	if ( dateResult ) {	
		document.getElementById("IssueBinderSubmit").disabled = true;	
		return true;	
	} else {
	return false;
	}	
}

function validateEffectiveDate(){
   
   var  parentQuoteId = document.getElementById("ParentQuoteId").value ;
   alert(parentQuoteId)
   
   var SubQuoteId =   document.getElementById("SubQuoteId").value ;
   alert(SubQuoteId)
   var OwnerId = document.getElementById("OwnerId").value ;
   alert(OwnerId)
   var productVerId = document.getElementById("productVerId").value ;
   alert(productVerId)
   
  // var pars='ObjectId='+ObjectId+'&ObjectVerId='+ObjectVerId+'&ObjectType='+ObjectType+'&OwnerId='+OwnerId;
   var pars='answer(RULE_OBJECT_ID)='+520+'&answer(RULE_OBJECT_VER_ID)='+637+'&answer(RULE_OBJECT_TYPE)='+"PRODUCT"+'&answer(RULE_OBJECT_NAME)='+"ISSUE_ELIGIBILITY_PRODUCT"+'&answer(ParentQuoteId)='+parentQuoteId+'&answer(SubQuoteId)='+SubQuoteId+'&answer(OwnerId)='+OwnerId+'&answer(ProductVerId)='+productVerId+'&answer(ProductId)='+520+'&answer(RULE_CRITERIA_1)='+159;
   var ajax = new Ajax.Updater({success: 'IssueBinder'},'../IssueBinderExcecuteRulesAction.do',{method: 'post', parameters:pars,onComplete:function(){forwardToLoginPageIfInvalidSession(document.getElementById("IssueBinder").innerHTML);}});		

}
</script>
<script type="text/javascript" src="../Scripts/JScripts/tabMenu.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>

		<%
			
			String agencyIdTemp="";
			if(request.getParameter("answer(Object::Agency::AgencyId)")!=null)
			{
				agencyIdTemp=request.getParameter("answer(Object::Agency::AgencyId)");
			}
		
			String customerId="";
			if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
			{
				customerId=request.getParameter("answer(Object::Customer::CustomerId)");
			}
			
			String strParetQuoteStatus="";
			if(request.getParameter("answer(Object::Quote::QuoteStatus)")!=null)
			{
				strParetQuoteStatus=request.getParameter("answer(Object::Quote::QuoteStatus)");
			}

			String strParentQuoteId="";
			if(request.getParameter("answer(parentQuoteId)")!=null)
			{
				strParentQuoteId=request.getParameter("answer(parentQuoteId)");
			}

			String ProductVerId="";
			if(request.getParameter("answer(Object::Quote::ProductVerId)")!=null)
			{
				ProductVerId=request.getParameter("answer(Object::Quote::ProductVerId)");
			}
			
			String noOfSubQuotes="";
			if(request.getParameter("answer(numberOfSubQuotes)")!=null)
			{
				noOfSubQuotes=request.getParameter("answer(numberOfSubQuotes)");
			}
			
			String teritory="";
			if(request.getParameter("answer(teritory)")!=null)
			{
				teritory=request.getParameter("answer(teritory)");
			}
			
			String territoryName="";
			if(request.getParameter("answer(territoryName)")!=null)
			{
				territoryName=request.getParameter("answer(territoryName)");
			}
			
			String zone="";
			if(request.getParameter("answer(zone)")!=null)
			{
				zone=request.getParameter("answer(zone)");
			}
			
			String tabNo="";
			if(request.getParameter("tabNo")!=null)
			{
				tabNo=request.getParameter("tabNo");
			}
			
			String Navigation="";
			if(request.getParameter("Navigation")!=null)
			{
				Navigation=request.getParameter("Navigation");
			}
			String prevSubQuoteVerId="";
			if(request.getParameter("answer(subQuoteVerId)")!=null)
			{
				prevSubQuoteVerId=request.getParameter("answer(subQuoteVerId)");
			} 
		%>		
		

<% long ProductId = Long.parseLong((request.getParameter("answer(Object::Quote::ProductId)")).toString()); %>
<% long QuoteId = Long.parseLong((request.getParameter("answer(parentQuoteId)")).toString()); %>
<% long SubQuoteId = Long.parseLong((request.getParameter("answer(Object::Quote::FirstSubQuoteId)")).toString()); %>
<% long SubQuoteVerId = Long.parseLong((request.getParameter("answer(Object::Quote::QuoteVerId)")).toString()); %>
<% long subQuoteVerId = Long.parseLong((request.getParameter("answer(subQuoteVerId)")).toString()); %>
<% String QuoteType = (request.getParameter("answer(Object::Quote::QuoteType)")).toString(); %>
<% String planeState = (request.getParameter("answer(state)")).toString(); %>

	<bean:parameter name="answer(DocumentType)" id="DocumentType" />
	
	<html:form action="/IssueBinderCL.do" onsubmit="return checksubmitandvalidatedate();"  >	
	
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>

<bean:define id="paretQuoteStatus" name="AddQuote" property="answer(Object::Quote::QuoteStatus)"/>

<bean:parameter name="answer(Object::Quote::QuoteStartDate)" id="quoteStartDate" />

<%
if(request.getParameter("quoteId")!=null)
			{
		%>
<html:hidden name="AddQuote" property="quoteId" value="<%=request.getParameter("quoteId")%>"/>
<%
			}
%>
	<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
	<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
	
	<dmshtml:GetQuoteDetailByQuoteId nameInSession="GetQuoteDetailByQuoteId" quoteId='<%=""+QuoteId%>' ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' />
	<% String quoteName = ""; %>
	<% String quoteDesc = ""; %>
		
	<logic:present name="GetQuoteDetailByQuoteId" scope="request">
		<bean:define id="quoteNameTemp" name="GetQuoteDetailByQuoteId" property="quoteName" />
		<bean:define id="quoteDescTemp" name="GetQuoteDetailByQuoteId" property="quoteDesc" />
		<% quoteName = ""+quoteNameTemp;  %>
		<% quoteDesc = ""+quoteDescTemp;  %>
	</logic:present>
	<html:hidden property="answer(Object::Quote::QuoteName)" value='<%=""+quoteName%>' />
	<html:hidden property="answer(Object::Quote::QuoteDesc)" value='<%=""+quoteDesc%>' />	

<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
	<tr>
		<td>
			&nbsp; 
		</td>
	</tr>																		
	<tr>
		<td>
			<table WIDTH="760px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
				<tr>
					<td >
						<table WIDTH="760px" ALIGN="left" border="0" CELLSPACING="0" CELLPADDING="0">
							<tr>
								<td>
									<jsp:include page="../common/CustomerAgencyLinkspage.jsp" />
								</td>
							</tr>
							<tr>
								<td>
									<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
		
										<tr>
											<td >
												<table width="60%" align="Left" border="0">
													<jsp:include page="../common/QuoteHeader.jsp">
														<jsp:param name="parentQuoteId" value="<%=""+strParentQuoteId%>" />
														<jsp:param name="productVerId" value="<%=""+ProductVerId%>" />
														<jsp:param name="heading" value="<%="ISSUE BINDER"%>" />
													</jsp:include>
												</table>
											</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>										

										<tr>
											<td align="left">
	
												<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">
													<tr>
														<td>
															<html:hidden property="answer(ownerId)" value="<%=ownerId.toString()%>" />
														</td>
														
														<bean:define id="parentQuoteId" name="AddQuote" property="answer(Object::Quote::Id)"/>
														
															<%
															if(request.getParameter("answer(Object::Customer::CustomerId)")!=null)
															{
												             
															%>
															<td>
															<html:hidden name="AddQuote" property="answer(Object::Customer::CustomerId)" value="<%=customerId.toString()%>"/>
															</td>
		

																<%
																	}
																%>
															</tr><tr>										
														<td colspan="2" class="links">
															<a href="../GetUWQuoteSummaryAction.do?TabPanelName=Quote_Panel&answer(Object::Customer::CustomerId)=<%=customerId.toString()%>&answer(Object::Agency::AgencyId)=<%=agencyIdTemp.toString()%>&answer(QuoteId)=<%=strParentQuoteId.toString()%>&answer(parentQuoteId)=<%=strParentQuoteId.toString()%>">Quote Summary</a>
														</td>
													</tr>
													<tr>
														<td  colspan="8" align="center" class="sectionhead"></td>
													</tr>
													<tr>
														<td>
															&nbsp;
														</td>
													</tr>
													<tr>
														<td class="Error">
															<logic:present name="MESSAGE_LIST"> 
																<ul>
																	<logic:iterate id="message" name="MESSAGE_LIST">
																		<li><bean:write name="message"/></li>
																	</logic:iterate>
															 	</ul>		 
															 	<%strParetQuoteStatus="Bind Request"; %>			
															</logic:present>
														</td>
													</tr>
													<tr>
														<td>
															<table width="100%" border="0" align="left">

																<dmshtml:dms_isPresent property='<%=new String[]{"Bind Request"}%>' value="<%="Bind Request"%>" negated="true">
																	<dmshtml:isPolicyNumberGeneratedAvailableForProduct productId='<%=Long.parseLong(""+ProductId) %>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' negated="true">
																	    <tr>
																	    	<td align="left" class="TextMatter">
																	    		Policy Number <td class="sectionhead1"><html:text value="" property="answer(PolicyNumber)" size="30" maxlength="30" styleId="txtPolicyNumber" styleClass='txtbox'  /></td>																		
																	    	</td>
																	    </tr>
																	    <tr>
																	    	<td>&nbsp;
																	    	</td>
																	    </tr>
																	    <tr>
																	    	<td>&nbsp;
																	    	</td>
																	    </tr>
																	    	<html:hidden property="answer(PolicyNumber)"  />
																	   </dmshtml:isPolicyNumberGeneratedAvailableForProduct> 																		   	
																	
																	<tr>
																		<td align="left" class="TextMatter">
																		Effective Date
																		&nbsp;</td>
																		<td class="sectionhead1"><html:text value='<%=""+quoteStartDate%>' property="answer(Object::Quote::QuoteStartDate)" size="30" maxlength="30" styleId="txtDate" styleClass='txtbox' onchange="return productBrowse()" /></td>																		
																	</tr>																
																	
																	<tr>
																		<td class="TextMatter" align="right">
																			Enter notes to be included on binder
																		</td>

																		<td class="TextMatter1" align="left">
																			<dmshtml:dms_textarea styleClass="txtarea" name="AddQuote"  property="answer(Object::Quote::Notes)" rows="3" cols="60"/>
																		</td>
																	</tr>
																</dmshtml:dms_isPresent>

															</table>
														</td>
													</tr>
													<tr><td>
														<html:hidden property="answer(Object::Quote::QuoteStatus)" value="Bound" />
													</td></tr>
												</table>
											</td>
										</tr>
									</table>
									<table WIDTH="75%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td>
												&nbsp;
											</td>
										</tr>
										<%
											 boolean isPreview = false;
										%>
											
											
											
											<dmshtml:dms_isPresent property='<%=new String[]{"Bind Request"}%>' value="<%="Bind Request"%>" negated="true">
											<bean:parameter id="numberOfSubQuotes" name="answer(numberOfSubQuotes)" /> 
												
											<% long numberOfSubQuote = Long.parseLong(""+numberOfSubQuotes);
												if(numberOfSubQuote < 2 ) {%>						
											
											<td align="center" class="links" colspan="4">
											<% %>
											<dmshtml:GetParameterByOwnerId nameInSession="paramValue" ownerId="<%=ownerId.toString()%>" dbname='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' parameterName="PreviewBinder" />
											
											<logic:present name="paramValue">
										   		<logic:equal value="CLBinder" name="paramValue">
													<a id="gotch" href='../CLPreviewBinderPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=BINDER&answer(QuoteId)=<%= ""+strParentQuoteId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(subQuoteId)=<%= ""+SubQuoteId%>&answer(subQuoteVerId)=<%= ""+subQuoteVerId%>&answer(isPreview)=<%=true%>&answer(Object::Quote::ProductId)=<%= ""+ProductId %>' style="{visibility: hidden}" ></a>
										   		</logic:equal>
									   		</logic:present>	
									   		<logic:present name="paramValue">
										   		<logic:equal value="PCBinder" name="paramValue">	   		
													<a id="gotch" href='../PreviewBinderPdf.go?TabPanelName=<%=""+request.getParameter("TabPanelName")%>&answer(DocumentType)=BINDER&answer(QuoteId)=<%= ""+strParentQuoteId%>&answer(OwnerId)=<%=ownerId.toString()%>&answer(ProductVerId)=<%=""+ProductVerId%>&answer(Object::Customer::CustomerId)=<%=""+customerId%>&answer(customerId)=<%=""+customerId%>&answer(subQuoteId)=<%= ""+SubQuoteId%>&answer(subQuoteVerId)=<%= ""+subQuoteVerId%>&answer(isPreview)=<%=true%>' style="{visibility: hidden}" ></a>
												</logic:equal>
											</logic:present>
											<INPUT TYPE="Button" value="Preview Binder Document" class="sbttn1" onclick = "window.open(document.getElementById('gotch'))"/>
											
											</td>
											
											<% } %>
											</dmshtml:dms_isPresent>

											<dmshtml:dms_isPresent property='<%=new String[]{"Bind Request"}%>' value="<%="Bind Request"%>" negated="true">
											<div id = "IssueBinder">
												<td align="center" class="links" colspan="4">
													<INPUT TYPE="Submit" value="Issue Binder" class="sbttn" id="IssueBinderSubmit">
												</td>
											</div>	
											</dmshtml:dms_isPresent>

											<td>
												<dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
											</td>
											<td>
												&nbsp;
											</td>

										<tr>
											<td colspan="3">
												&nbsp;
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>

			<html:hidden name="AddQuote" property="formName" value="form::CREATEQUOTEVERSION"/>
			 <html:hidden name="AddQuote" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			 <html:hidden property="answer(Object::Agency::AgencyId)" value="<%=agencyIdTemp.toString()%>"/>
			<html:hidden property="page" value="7" />
			
			
			<!-- New hidder variables -->
			
			<html:hidden name="UWWorkSheet" property="answer(Object::Product::ProductState)" value="RELEASED"/>
			<html:hidden property="answer(QuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(parentQuoteId)" value="<%=""+strParentQuoteId%>" />
			<html:hidden property="answer(Quote::Page)" value="QUOTE SUMMURY" />
			<html:hidden property="answer(Object::Plan::CreatedBy)" value="<%=userId.toString()%>" styleId="usrIdfrmjsp"/>
			<html:hidden property="answer(Object::Plan::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::CreatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Quote::UpdatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(Object::Plan::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::dbName)" value="<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>"/>
			<html:hidden property="answer(Object::Quote::LockStatus)" value="Locked" />
			
			
			
			<html:hidden property="answer(Object::Quote::ProductId)" value="<%= ""+ProductId %>" />
			<html:hidden property="answer(ParentQuoteId)" value="<%= ""+QuoteId %>" styleId="ParentQuoteId" />
			<html:hidden property="answer(parentQuoteId)" value="<%= ""+QuoteId %>" />
			<html:hidden property="answer(Object::Quote::FirstSubQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(SubQuoteId)" value="<%= ""+SubQuoteId %>" styleId="SubQuoteId" />
			<html:hidden property="answer(subQuoteId)" value="<%= ""+SubQuoteId %>" />
			<html:hidden property="answer(Object::Quote::QuoteVerId)" value="<%= ""+SubQuoteVerId %>" />
			<html:hidden property="answer(Object::Quote::QuoteType)" value="<%= QuoteType %>" />
			<html:hidden property="answer(Object::Quote::ProductVerId)" value="<%= ""+ProductVerId %>"  styleId = "productVerId" />			
			<html:hidden property="answer(DocType)" value="ISSUANCE" />
			<html:hidden property="answer(DocumentType)" value="BINDER" />
			<html:hidden property="answer(OwnerId)" value="<%= ownerId.toString()%>" styleId="OwnerId" />
			<html:hidden property="answer(isPreview)" value="<%= ""+false%>" />	
			<html:hidden property="answer(PlaneState)" value="<%=""+planeState%>" />
			<html:hidden property="answer(Object::Quote::ResProperty::State)" value="<%=""+planeState%>" />
			<html:hidden property="answer(state)" value="<%=""+planeState%>" />
			<html:hidden property="answer(teritory)" value="<%=""+teritory%>" />
			<html:hidden property="answer(territoryName)" value="<%=""+territoryName%>" />
			<html:hidden property="answer(zone)" value="<%=""+zone%>" />
			<html:hidden property="tabNo" value="<%=""+tabNo%>" />
			<html:hidden property="Navigation" value="<%=""+Navigation%>" />			
			<html:hidden property="answer(numberOfSubQuotes)" value="<%=""+noOfSubQuotes%>" />
			<html:hidden property="answer(subQuoteVerId)" value="<%=""+subQuoteVerId%>" />
			
			<html:hidden property="answer(QuoteVerId)" value="<%=""+SubQuoteVerId%>" />
			<html:hidden property="answer(ownerId)" value="<%= ownerId.toString()%>" />
			<html:hidden property="answer(OwnerId)" value="<%= ownerId.toString()%>" />
			<html:hidden property="answer(createdBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(updatedBy)" value="<%=userId.toString()%>" />
			<html:hidden property="answer(IsIssueBinderAction)" value="YES" />
			<html:hidden property="TabPanelName" value="Policy_Panel" />
			<html:hidden property="answer(Object::Quote::PrevSubQuoteVerId)" value ="<%=""+prevSubQuoteVerId%>" />
			

			<html:hidden property="answer(RULE_OBJECT_ID)" value ='<%=ProductId+"" %>' />
			<html:hidden property="answer(RULE_OBJECT_VER_ID)" value ='<%=ProductVerId+"" %>' />
			<html:hidden property="answer(RULE_OBJECT_TYPE)" value ="PRODUCT" />
			<html:hidden property="answer(RULE_OBJECT_NAME)" value ="ISSUE_ELIGIBILITY_PRODUCT" />
			<html:hidden property="answer(ProductVerId)" value ='<%=ProductVerId+"" %>' />
			<html:hidden property="answer(ProductId)" value ='<%=ProductId+"" %>' />
			<html:hidden property="answer(RULE_CRITERIA_1)" value ="159" />
			<html:hidden property="answer(MERGE_BEFORE)" value ="YES" />
			<html:hidden property="answer(ASSERT_MAP_ENTRIES)" value ="YES" />
			<html:hidden property="answer(MERGE_AFTER)" value ="NO" />
			<html:hidden property="answer(MODIFIED_FACT_MAP)" value ="YES" />
			
			<input type="hidden" name="answer(MERGE_BEFORE)" value="YES"/>
			<input type="hidden" name="answer(MERGE_AFTER)" value="NO"/>
			<input type="hidden" name="answer(ASSERT_MAP_ENTRIES)" value="YES" />
			<input type="hidden" name="answer(MODIFIED_FACT_MAP)" value="YES" />
			<html:hidden property="answer(SUCCESS_F)" value="CL_SUCCESS" />
			<html:hidden property="answer(FAILURE_F)" value="CL_FAILURE" />
			<html:hidden property="answer(QUOTE_TRANSACTION_FAILURE_F)" value="QuoteTransactionFailure" />
			
			
			
			
			
			<% 
					session.removeAttribute("IsPolicyCreationAction");
			%>			
		</td>
	</tr>

</table>    



</html:form>
<bean:define id="ownerid" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/> 
<span id="messageHolder" style="{z-index: 5000; background:#FFCC33; color:#000000; font: bold 10px tahoma; position:absolute; left:100px; top:100px; width:400px; visibility:hidden}"></span>
<dmshtml:DisplyApplication nameInSession="Application"   ownerId='<%=ownerid.toString()%>' dbName='<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>' objectId="0"
objectVerId="0" objectName="BINDER" applicationType="BINDER" applicationSubType="" isSubApplicationCoveredByForm="Yes"  actionName="/saveBinderApplicationAction.go" isApplicationEnabled="Y"  showOneTabAtTime="N"/>
<logic:present name="Application" scope="request">

<bean:define id="htmlPage" name="Application"
		type="java.lang.StringBuffer" />
		<%out.println(htmlPage.toString());%>
</logic:present>

<script type="text/javascript">
function setDefault(frm){

  	/**
     * To set the User ID
     */
    if(document.getElementById("usrIdfrmjsp") !=null && document.getElementById("usrIdfrmjsp") !=undefined) {
 	var usrIdfrmjsp=document.getElementById("usrIdfrmjsp").value;
 	var createdByElements = frm.CreatedBy;
	 	if(createdByElements!=null && createdByElements!= undefined) {
	 		for(index=0;index<(createdByElements.length);index++) {
	 			createdByElements[index].value=usrIdfrmjsp;
	 		}		 	
			 
		}
 	}
 	
 	/**
     * To set the Created Date
     */
     var CreatedDateElement=frm.CreatedDate;
 	 if(CreatedDateElement!=null && CreatedDateElement!= undefined) {
	 	 var currentTime = new Date();
		 var month = currentTime.getMonth() + 1;
		 var day = currentTime.getDate();
		 var year = currentTime.getFullYear();
		 
		 for(index=0;index<(CreatedDateElement.length);index++) {
		 		CreatedDateElement[index].value=year+'/'+month+'/'+day;
		 		
		 }
	}
	return true;
 }
</script>
