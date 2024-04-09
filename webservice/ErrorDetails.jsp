<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<% 
	String submissionNo = "";
	String policyNo = "";
	String errorCode = "";
	String errorType = "";
	String errorDescription = "";
	int transactionNo = 0;
	
	if(request.getParameter("SubmissionNo") != null) {	
		submissionNo = request.getParameter("SubmissionNo");
	}
	if(request.getParameter("PolicyNo") != null) {	
		policyNo = request.getParameter("PolicyNo");
	}
	if(request.getParameter("TransactionNumber") != null) {	
		transactionNo = Integer.parseInt(request.getParameter("TransactionNumber"));
	}	
%>

<div id="displayErrorDetails" bgcolor="#ffffff" align="center">
	<table border=0 cellspacing=0 cellpadding=0 width=95%>
		<tr>
			<td>
				<div class="ErrorDetailPage">									
					<div class="content">							
						<div class="ErrorDetailformhead">
							<h2 class="left">Error Summary</h2>
						</div>						
						<table border=0 cellspacing=5 cellpadding=5 width=100% align="left">						
							<th width="4%" align="left">
								S.No
							</th>
							<th width="14%" align="left">
								Transaction #
							</th>							
							<th width="14%" align="left">
								Error Code
							</th>
							<th width="10%" align="left">
								Error Type
							</th>
							<th width="58%" align="left">
								Error Description
							</th>
							<logic:present name="errorDetailList">
								<%int sno = 1; %>
								<logic:iterate id="errorDetailMap" name="errorDetailList" type="com.dms.ejb.data.QuestionHashMap">
									<tr>
										<td align="left">
											<%=sno++ %>
										</td>
										<td align="left">
											<%=transactionNo %>
										</td>
										<td align="left">	
											<%errorCode=errorDetailMap.getString("Object::BatchLog::ErrorCode");%>
											<%=errorCode %>
										</td>
										<td align="left">	
											<%errorType=errorDetailMap.getString("Object::BatchLog::ErrorType");%>
											<%=errorType %>
										</td>
										<td align="left">	
											<%errorDescription=errorDetailMap.getString("Object::BatchLog::ErrorDescription");%>
											<%=errorDescription %>
										</td>
									</tr>
								</logic:iterate>
							</logic:present>
							<tr>
								<td colspan="5" align="center">
									<input type="button" class="subbutton" value="Close" onclick="document.getElementById('ERROR_CONT').innerHTML='';YAHOO.example.container.errorDetail.hide();"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</td>
		</tr>
	</table>
</div>