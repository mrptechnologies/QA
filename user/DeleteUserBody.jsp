<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<html:hidden property="answer(dbname)" value='<%=org.apache.struts.util.RequestUtils.message(pageContext,null,null,"DMS.dbname",null)%>'/>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session"/>
<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/> 
<html:form action='/UserDelete.do'>
<html:hidden property="answer(dbname)" value='<%=com.dms.web.util.DbUtils.getWriteDS(pageContext)%>'/>
<html:hidden property="answer(Object::DeleteUser::UserName)" value='<%=request.getParameter("answer(Object::UserDetail::userName)")%>'/> 


									<table WIDTH="760px" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="0">
										<tr>
											<td align="center" class="Error">	
											<bean:define id="UserName" property="answer(Object::UserDetail::userName)" name="DeleteUser"> </bean:define>
											<html:hidden property="answer(userId)" value="<%=userId.toString()%>" />
													<tr><td class="sectionhead">User:<%=request.getParameter("answer(Object::UserDetail::userName)")%>&nbsp;</td>
													</tr>
													<tr><td>
													
													&nbsp;</td>
													</tr>									
													<tr>
														<td class="TextMatter" align="center">															
															Do You Really want to delete the Above User Permanently?
														</td>											
													
													</tr>
													<tr><td>&nbsp;</td>
													</tr>
													<tr>
														<td class="TextMatter" align="right">																	
															<input type="radio" name="answer(Object::DeleteUser::DeleteYes)" value="Yes" id="confirmYES"  onclick="DeleteYes(this.form,this.document)">&nbsp;Yes 
															<input type="radio" name="answer(Object::DeleteUser::DeleteYes)" value="No" checked="checked" id="confirmNO" onclick="DeleteNo(this.form,this.document)">&nbsp;No 
														</td>												
													<tr>	
											
											
											<tr>
											<td align="center">
												<input TYPE="Submit" value="DELETE" class="sbttn" id="Delete" disabled="true">
												<input TYPE="Button" value="CANCEL" class="sbttn" id="Back" onclick="window.history.go(-1)" >
											</td>
												
											</tr>
									</table>
	<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName")%>" />								
</html:form>
<script type="text/javascript">
	DeleteYes(frm,document);	
	function DeleteYes(frm,document) {	
		document.getElementById("Delete").disabled = false;	
		}
		function ReSubmitNo(frm,document) {	
		document.getElementById("Delete").disabled = true;	
		}
	
		function Back(){
		window.history.go(-1);
		}
		
</script>