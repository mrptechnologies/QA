<% 
/*
 * Copyright 2002-2004 of Solaris Inc, USA . All
 * Rights Reserved.
 * This software is confidential and proprietary information of Solaris,Inc, USA.
 * This should not use without proper agreement signed with Solaris Inc,USA.
*/
%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>
<table>
		<tr>
			<td>
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
								<%String viewPrivateNotes="N";%>
								<dmshtml:dms_static_with_connector ruleName='privilage' property='<%=new String[]{"VIEW_PRIVATE_NOTES"}%>' connector='or' negated="true">
									<%viewPrivateNotes="Y";%>
								</dmshtml:dms_static_with_connector>
								<%if(viewPrivateNotes.equals("Y")){ %>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Internal View Only 
									<input type = checkbox name="answer(Object::Notes::Private)" value="N"  id="mprivate" onclick="changevalue()"/>
								<%} else { %>
									<input type =hidden name="answer(Object::Notes::Private)" value="N"  id="mprivate"/>
								<%} %>
							</td>
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