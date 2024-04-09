<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<% String productStateTaxId = "";
   String productStateTaxVerId="";	%>
<% productStateTaxId = String.valueOf(request.getAttribute("productStateTaxId")); %>
<% productStateTaxVerId = String.valueOf(request.getAttribute("productStateTaxVerId")); %>

<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>
<bean:define id="RevisionStartDate" property="answer(Object::Product::Tax::RevisionStartDate)" name="GetStateTaxVersion" />
<bean:define id="RevisionEndDate" property="answer(Object::Product::Tax::RevisionEndDate)" name="GetStateTaxVersion" />

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

<html:form action="/StateTaxVersionForwardControlAction.do" onsubmit="return validateCoverages(this);">

	<table WIDTH="95%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
		 	<tr>
				<td>				
					<jsp:include page="../common/StateTaxHeader.jsp">
					<jsp:param name="ProductStateTaxId" value="<%=productStateTaxId%>" />
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
									<td class="NewSectionHead" colspan="4" align="center">ADD/EDIT STATE TAX VERSION DETAILS</td>
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
									<td class="sectionhead" align="center">STATE FEE VERSION DETAIL</td>							
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
									<td class="links">&nbsp;<html:text  name="GetStateTaxVersion" property="answer(Object::Product::Tax::VersionNum)" styleId="DocType"  styleClass="txtbox"></html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">Version Description</td>
									<td class="TextMatter" align="left"><html:textarea name="GetStateTaxVersion" property="answer(Object::Product::Tax::VersionDesc)" cols="20" rows="3" styleClass="txtarea" ></html:textarea>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Tax Calc Type</td>
									<td class="TextMatter">&nbsp;
										<html:select name="GetStateTaxVersion" property="answer(Object::Product::Tax::TaxCalcType)">
										<html:option value="AMT">Amount</html:option>
										<html:option value="PERCENT">Percentage</html:option>
										<html:option value="FORMULA">Formula</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Attribute Name</td>
									<td class="links">&nbsp;<html:text  name="GetStateTaxVersion" property="answer(Object::Product::Tax::AttributeName)"></html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Rule Group Name</td>
									<td class="links">&nbsp;<html:text name="GetStateTaxVersion" property="answer(Object::Product::Tax::RuleGroupName)"></html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Default Tax</td>
									<td class="links">&nbsp;<html:text name="GetStateTaxVersion" property="answer(Object::Product::Tax::DefaultTax)"> </html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Minimum Tax</td>
									<td class="links">&nbsp;<html:text name="GetStateTaxVersion" property="answer(Object::Product::Tax::MinimumTax)"></html:text></td>
								</tr>	
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Maximum Tax</td>
									<td class="links">&nbsp;<html:text name="GetStateTaxVersion" property="answer(Object::Product::Tax::MaximumTax)"></html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align=Left">&nbsp;&nbsp;Calculation Sequence</td>
									<td class="links">&nbsp;<html:text name="GetStateTaxVersion" property="answer(Object::Product::Tax::CalculationSeq)"></html:text></td>
								</tr>	
								<tr>
									<td class="FormLabels" align="Left">&nbsp;&nbsp;Display Sequence</td>
									<td class="links">&nbsp;<html:text name="GetStateTaxVersion" property="answer(Object::Product::Tax::DisplaySeq)"></html:text></td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;TaxAppliedTo</td>
									<td class="TextMatter">&nbsp;
										<html:select name="GetStateTaxVersion" property="answer(Object::Product::Tax::TaxAppliedTo)">
											<html:option value="NET">NET</html:option>
											<html:option value="GROSS">GROSS</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;VerActive</td>
									<td class=TextMatter">&nbsp;
										<html:select name="GetStateTaxVersion" property ="answer(Object::Product::Tax::VerActive)">
											<html:option value="Y">Yes</html:option>
											<html:option value="D">No</html:option>
										</html:select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align=Left">&nbsp;&nbsp;Prorata Tax Cancelation Factor</td>
									<td class="links">&nbsp;<html:text name="GetStateTaxVersion" property="answer(Object::Product::Tax::ProrataTaxCancelationFactor)" styleId="DocType"  styleClass="txtbox"></html:text></td>
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
			
				<input type='submit' value='Create Version' class='sbttn' id="CreateVersionTop" onclick="return goSubmit(document.TaxVersionForwardControl.CreateVersionTop,'CreateVersion')" name='answer(form::ForwordControl1)'onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';">
				<input type='submit' value='Save' class='sbttn' id="SaveTop" onclick="return goSubmit(document.TaxVersionForwardControl.SaveTop,'Save')" name='answer(form::ForwordControl1)' onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';">
				<input type="reset" value="Reset" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" class="sbttn">
				<dmshtml:dms_button value="Back" property="answer(back)" styleClass="sbttn" onclick="javascript:history.go(-1);"/>
			</td>
		</tr>		<tr>
			<td>
				<html:hidden property="answer(Object::Product::Tax::ProductStateTaxId)" value="<%=productStateTaxId.toString()%>" />
				<html:hidden property="answer(Object::Product::Tax::ProductTaxIdVer)" value="<%=productStateTaxVerId.toString()%>" />
				<html:hidden property="answer(Object::Product::Tax::VerCreatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="answer(Object::Product::Tax::VerUpdatedBy)" value="<%=userName.toString()%>" />
				<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
			</td>
		</tr>
	</table>
</html:form>