<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<html:form action="/ReSubmission.do" >
<html:hidden property="answer(dbname)" value='<%=org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DMS.dbname",null)%>'/>



									<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td align="center" class="Error">	
											<bean:define id="SubmitQuoteId" property="answer(Object::Submission::QuoteId)" name="Submission"> </bean:define>
											<%
											String subDetails[]=(""+SubmitQuoteId).split("::");
							       			long quoteId=Long.parseLong(subDetails[0]);
							       			long infSubmissionId=Long.parseLong(subDetails[1]);
											%>											
													<tr><td class="sectionhead">QuoteId:<%=""+quoteId%>&nbsp;</td>
													</tr>
													<tr><td>
													<html:hidden property="answer(Object::Submission::QuoteId)" value='<%=""+quoteId%>'/> 
													<html:hidden property="answer(Object::Submission::SubmissionId)" value='<%=""+infSubmissionId%>'/> 
													&nbsp;</td>
													</tr>									
													<tr>
														<td class="TextMatter" align="center">															
															Are you Sure, Confirm Re Submit ?
														</td>														
													
																												
															<td class="TextMatter" align="center">															
													
														</td>														
													
													</tr>
													<tr><td>&nbsp;</td>
													</tr>
													<tr>
														<td class="TextMatter" align="right">																	
															<input type="radio" name="answer(Object::Submission::ConfirmYes)" value="Yes" id="confirmYES"  onclick="ReSubmitYes(this.form,this.document)">&nbsp;Yes 
															<input type="radio" name="answer(Object::Submission::ConfirmYes)" value="No" checked="checked" id="confirmNO" onclick="ReSubmitNo(this.form,this.document)">&nbsp;No 
														</td>												
													<tr>	
											
											
											<tr>
											<td align="center">
												<input TYPE="Submit" value="RE SUBMIT" class="sbttn" id="ReSubmit" disabled="true">
												<input TYPE="Button" value="BACK" class="sbttn" id="Back" onclick="window.history.go(-1)" >
											</td>
												
											</tr>
									</table>
								
<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />									
</html:form>
<script type="text/javascript">
	ReSubmitYes(frm,document);	
	function ReSubmitYes(frm,document) {	
		document.getElementById("ReSubmit").disabled = false;	
		}
		function ReSubmitNo(frm,document) {	
		document.getElementById("ReSubmit").disabled = true;	
		}
	
		function Back(){
		window.history.go(-1);
		}
		
</script>