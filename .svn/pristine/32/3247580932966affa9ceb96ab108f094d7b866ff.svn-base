<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>


<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/button/assets/skins/sam/button.css" />
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/yahoo/yahoo-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/event/event-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/dom/dom-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/element/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>

		<table>
<tr><td>
<div id="dialog1" style='display: none;'>

<div class="hd">Enter Your Notes Here</div>
<div class="bd">
<table cellpadding="1" cellspacing="0">
  	 <tr>
  	   <td> 
  	     <h6>Notes Description:</h6>
  	   </td>
       <td> 
         <input type = text name="answer(Object::Notes::Description)" id="notesDesc" size="50" maxlength="54" />
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal View Only 
        <input type = checkbox name="answer(Object::Notes::Private)" value="N"  id="mprivate" onclick="changevalue()"/> </td>
     </tr>
  	 <tr>
  	 <td>
  	   <h6>Notes:</h6>
  	 </td>
  	<td>
  	<div id="text">
  	 <textarea  name="answer(Object::Notes::Notes)" id="editor" rows="6" cols="80"> </textarea> 
  	</div> 
  	</td>
  </tr>
   <tr>
             <td width=50>&nbsp;</td>
             <td align=center>
              <html:button property="Save" value=" Save " styleClass="uibutton"  styleId="save" onmouseover="" />
              <html:button property="Cancel" value="Cancel" styleClass="uibutton" styleId="cancel" />
               </td>
              </tr>
</table>
</div>
</div>

</td>
</tr>


</table>

<bean:define id="userId" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session" />
		<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
		<%
		String quoteSubjId ="210";
		String customerId = "12";
		%>
									<table width="100%">
										
										<tr>
											<td width="40%" rowspan="1">
											<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"SENT_EMAIL"}%>' connector='or' negated="true">
										
													<jsp:include page="../email/DisplayEmailList.jsp">
														<jsp:param name="answer(Object::Notification::Email::ObjectId)" value="<%=""+quoteSubjId%>" />
														<jsp:param name="answer(Object::Notification::Email::ObjectVerId)" value="<%=""+0%>" />
														<jsp:param name="answer(Object::Notification::Email::UserName)" value="<%=""+userId%>" />
														<jsp:param name="answer(Object::Notification::Email::SubQuoteVerId)" value="<%=""+0%>" />
														<jsp:param name="answer(Object::Notification::Email::QuoteStatus)" value="<%="" %>" />
														<jsp:param name="answer(Object::Notification::Email::EndorsementStatusFlag)" value="NO" />
														<jsp:param name="answer(Object::Notification::UserDetail::Email)" value="<%=""+""%>" />
										  				<jsp:param name="answer(Object::Notification::UserDetail::RoleName)" value="<%=""%>" />
										  				<jsp:param name="answer(Object::Notification::Email::QuoteNumber)" value="<%=0%>" />
														<jsp:param name="answer(Object::Notification::Email::QuoteSubNumber)" value="<%=0%>" />
										  				<jsp:param name="answer(Object::Notification::Email::PolicyNumber)" value="<%=""+0%>" />
										   				<jsp:param name="answer(Object::Notification::Email::ObjectType)" value="QUOTE" />
										  				<jsp:param name="answer(Object::Notification::Email::InsuredName)" value="<%=""+0 %>" />
										  				
												    </jsp:include>
												</dmshtml:dms_static_with_connector>
												</td>
												 
											</tr>
										<tr>
											<td>											
										
									
												<jsp:include page="../notes/DairyNotes.jsp">
													<jsp:param name="answer(Object::Notes::ObjectId)" value="<%=""+quoteSubjId%>" />
													<jsp:param name="answer(Object::Notes::ObjectVerId)" value="<%=""+0%>" />
													<jsp:param name="answer(Object::Notes::ObjectType)" value="Subjectivity" />
													<jsp:param name="answer(Object::Notes::UserName)" value="<%=""+userId%>" />
													<jsp:param name="answer(Object::Notes::UserRole)" value="<%=""+customerId%>" />
													<jsp:param name="answer(APPROVAL_STATUS_NEEDED)" value="YES" />
													
												</jsp:include>
											
											</td>
										</tr>
										<tr>
											<td>
											&nbsp;
											</td>
										</tr>
									    <tr>
										    <td>
										    	
									
												  <jsp:include page="../attachment/Attachment.jsp">
												  <jsp:param name="answer(Object::Attachment::ObjectId)" value="<%=""+quoteSubjId%>" />
													<jsp:param name="answer(Object::Attachment::ObjectVerId)" value="<%=""+0%>" />
													<jsp:param name="answer(Object::AttachmentObjectLink::ObjectType)" value="Subjectivity" />
													<jsp:param name="answer(APPROVAL_STATUS_NEEDED)" value="YES" />
												  </jsp:include>
											
										  </td>
									  </tr>	
									</table>