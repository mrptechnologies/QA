<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/Application.js"></script>
<script type="text/javascript" src="../Scripts/prototype.js"></script>

<% String productStateFeeId = "";
   String productStateFeeVerId="";	%>
<% productStateFeeId = String.valueOf(request.getAttribute("productStateFeeId")); %>
<% productStateFeeVerId = String.valueOf(request.getAttribute("productStateFeeVerId")); %>



<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="RevisionStartDate" property="answer(Object::Product::Fee::RevisionStartDate)" name="GetStateFeeVersion" />
<bean:define id="RevisionEndDate" property="answer(Object::Product::Fee::RevisionEndDate)" name="GetStateFeeVersion" />
<%
		String revisionStatus = ""+RevisionStartDate;
		String endStatus = ""+RevisionEndDate;
		String arrRevisionStatus[]= null;
		String arrEndStatus[] = null;
		String revisionMonth = "";
		String revisionDate = "";
		String revisionYear = "";
		
		String endMonth = "";
		String endDate = "";
		String endYear = "";
		
		
		if(!revisionStatus.equals("")){
			if(!endStatus.equals("")){
				arrRevisionStatus = revisionStatus.split("/");
				arrEndStatus = endStatus.split("/");
				
				revisionMonth = arrRevisionStatus[0];
				revisionDate = arrRevisionStatus[1];
				revisionYear = arrRevisionStatus[2];
				
				endMonth = arrEndStatus[0];
				endDate = arrEndStatus[1];
				endYear = arrEndStatus[2];
			}
		}
	%>
<html:form action="/StateFeeVersionForwardControlAction.do" onsubmit="return validateCoverages(this);">
	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		 	<tr>
				<td>				
					<jsp:include page="../common/StateFeeHeader.jsp">
					<jsp:param name="ProductStateFeeId" value="<%=productStateFeeId%>" />
					</jsp:include>
				 </td>
			</tr>
	</table> 

	<table WIDTH="100%" ALIGN="left" border="0"CELLSPACING="2" CELLPADDING="0">
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td valign="top" align="left">
				<table WIDTH="760px" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
					<tr>
						<td colspan="3">
							<table WIDTH="770px" ALIGN="left" BORDER="0" CELLSPACING="0" CELLPADDING="0">
								<tr>
									<td  class="FormLabels" align="left" colspan="4">&nbsp;</td>
								</tr>
								<tr>
									<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT STATE FEE VERSION DETAILS</td>
								</tr>
								<tr>
									<td  class="FormLabels" align="left" colspan="4">&nbsp; </td>
								</tr>
								<tr>
									<td class="links" width="20%">
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td align="left" colspan="2">
						</td>
					</tr>
					
					<tr>
						<td>
							<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
								<tr>
									<td class="sectionhead" align="center">STATE FEE VERSION DETAIL </td>							
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td> &nbsp;</td>
					</tr>
		
					<tr>
						<td>
							<table WIDTH="100%" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Version</td>
									<td class="links">&nbsp;<html:text  name="GetStateFeeVersion" property="answer(Object::Product::Fee::VersionNum)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">Version Description</td>
									<td class="TextMatter" align="left"><html:textarea name="GetStateFeeVersion" property="answer(Object::Product::Fee::VersionDesc)" cols="20" rows="3" styleClass="txtarea" ></html:textarea>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Fee Calc Type</td>
									<td class="TextMatter">&nbsp;
										<html:select name="GetStateFeeVersion" property="answer(Object::Product::Fee::FeeCalcType)" styleId="DocType"  styleClass="txtbox">
											<html:option value="AMT">Amount</html:option>
											<html:option value="PERCENT">Percentage</html:option>
											<html:option value="FORMULA">Formula</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Attribute Name</td>
									<td class="links">&nbsp;<html:text  name="GetStateFeeVersion" property="answer(Object::Product::Fee::AttributeName)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Rule Group Name</td>
									<td class="links">&nbsp;<html:text name="GetStateFeeVersion" property="answer(Object::Product::Fee::RuleGroupName)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Default Fee</td>
									<td class="links">&nbsp;<html:text name="GetStateFeeVersion" property="answer(Object::Product::Fee::DefaultFee)" styleId="DocType"  styleClass="txtbox"> </html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Minimum Fee</td>
									<td class="links">&nbsp;<html:text name="GetStateFeeVersion" property="answer(Object::Product::Fee::MinimumFee)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr>	
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Maximum Fee</td>
									<td class="links">&nbsp;<html:text name="GetStateFeeVersion" property="answer(Object::Product::Fee::MaximumFee)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align=Left">&nbsp;&nbsp;Calculation Sequence</td>
									<td class="links">&nbsp;<html:text name="GetStateFeeVersion" property="answer(Object::Product::Fee::CalculationSeq)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr>	
								<tr>
									<td class="FormLabels" align="Left">&nbsp;&nbsp;Display Sequence</td>
									<td class="links">&nbsp;<html:text name="GetStateFeeVersion" property="answer(Object::Product::Fee::DisplaySeq)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Taxable</td>
									<td class="TextMatter">&nbsp;
										<html:select name="GetStateFeeVersion" property="answer(Object::Product::Fee::Taxable)" styleId="DocType"  styleClass="txtbox">
											<html:option value="Y">Yes</html:option>
											<html:option value="D">No</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Mandatory</td>
									<td class=TextMatter">&nbsp;
										<html:select name="GetStateFeeVersion" property ="answer(Object::Product::Fee::Mandatory)" styleId="DocType"  styleClass="txtbox">
											<html:option value="Y">Yes</html:option>
											<html:option value="D">No</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align=Left">&nbsp;&nbsp;Prorata Fee Cancelation Factor</td>
									<td class="links">&nbsp;<html:text name="GetStateFeeVersion" property="answer(Object::Product::Fee::ProrataFeeCancelationFactor)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr>
								<tr>
									<td width="30%" class="FormLabels" align="left" height="25">&nbsp;&nbsp;Revision Start Date</td>
									<td class="links">
									<html:text property ="answer(Revision::Month)" value="<%= revisionMonth %>" size="2" maxlength="2" styleClass="txtbox" styleId="ReleaseMonth" onkeyup="if(this.value.length==2) {document.forms[0].ReleaseDate.focus()}" />&nbsp;
									<html:text property ="answer(Revision::Date)" value="<%= revisionDate %>" size="2" maxlength="2" styleClass="txtbox"  styleId="ReleaseDate" onkeyup="if(this.value.length==2) {document.forms[0].ReleaseYear.focus()}" />&nbsp;
									<html:text property ="answer(Revision::Year)" value="<%= revisionYear %>" size="4" maxlength="4" styleClass="txtbox" styleId="ReleaseYear" onkeyup="if(this.value.length==4) {document.forms[0].ExpirationMonth.focus()}" />&nbsp;(MM/DD/YYYY)</td>
								</tr>
								<tr>
									<td width="30%" class="FormLabels" align="left" height="25">&nbsp;&nbsp;Revision End Date</td>
									<td class="links">
									<html:text property ="answer(Revision::Month)" value="<%= endMonth %>" size="2" maxlength="2" styleClass="txtbox" styleId="ReleaseMonth" onkeyup="if(this.value.length==2) {document.forms[0].ReleaseDate.focus()}" />&nbsp;
									<html:text property ="answer(Revision::Date)" value="<%= endDate %>" size="2" maxlength="2" styleClass="txtbox"  styleId="ReleaseDate" onkeyup="if(this.value.length==2) {document.forms[0].ReleaseYear.focus()}" />&nbsp;
									<html:text property ="answer(Revision::Year)" value="<%= endYear %>" size="4" maxlength="4" styleClass="txtbox" styleId="ReleaseYear" onkeyup="if(this.value.length==4) {document.forms[0].ExpirationMonth.focus()}" />&nbsp;(MM/DD/YYYY)</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td>
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
				<input type='submit' value='Create Version' class='sbttn' id="CreateVersionTop" onclick="return goSubmit(document.FeeVersionForwardControl.CreateVersionTop,'CreateVersion')" name='answer(form::ForwordControl1)'onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';">
				<input type='submit' value='Save' class='sbttn' id="SaveTop" onclick="return goSubmit(document.FeeVersionForwardControl.SaveTop,'Save')" name='answer(form::ForwordControl1)' onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';">
				<input type="reset" value="Reset" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" class="sbttn">
				<dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
			</td>
		</tr>
		<tr>
			<td>
				<html:hidden property="answer(Object::Product::Fee::ProductStateFeeId)" value="<%=productStateFeeId.toString()%>" />
				<html:hidden property="answer(Object::Product::Fee::ProductFeeIdVer)" value="<%=productStateFeeVerId.toString()%>" />
				<html:hidden property="answer(Object::Product::Fee::VerCreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Fee::VerUpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			</td>
		</tr>
	</table>
</html:form>	