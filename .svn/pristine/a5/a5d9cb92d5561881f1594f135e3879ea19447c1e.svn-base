
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<%@page  import="java.util.HashMap" %>

<%String productTaxStateId=request.getParameter("StateTaxId"); %>
<bean:define id="userName" property="answer(Object::UserDetail::userName)" name="LoginPage" scope="session"/>

<form name="AddCustomer" method="post" action="../SaveStateTaxAction.go" onsubmit="return GoTOSubmitButton()"><input type="hidden" name="org.apache.struts.taglib.html.TOKEN" value="5c80c0d11a56b6ffc89e1526d118e814"><input type="hidden" name="answer(dbname)" value="java:/jdbc/solartisds">
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
									<td class="NewSectionHead" colspan="4" align="center">ASSOCIATE STATE TAX INFORMATION</td>
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
									<td class="sectionhead" align="center">STATE TAX DETAILS</td>							
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
									<td colspan="2" align="right" class="links" >
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;State </td>
									<td class="links" style="Class:txtbox">&nbsp;
										<select name="answer(Object::Product::Tax::StateCode)" class="txtbox" id="State">
											<option value="" selected="selected" class="txtbox">Select A State</option>
											<option value="DE">Delaware</option>
											<option value="DC">District of Columbia</option>
											<option value="FL">Florida</option>
											<option value="GA">Georgia</option>
											<option value="MD">Maryland</option>
											<option value="NJ">New Jersey</option>
											<option value="NC">North Carolina</option>
											<option value="PA">Pennsylvania</option>
											<option value="SC">South Carolina</option>
											<option value="TX">Texas</option>
											<option value="VA">Virginia</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;Territory</td>
									<td class="links">&nbsp;
										<input type="text" name="answer(Object::Product::Tax::Territory)" maxlength="60" size="10" value="" class="txtbox" id="InsuredName">
									</td>
								</tr>
  	    						<tr>
									<td width="40%" class="FormLabels" align="left">&nbsp;&nbsp;County Code</td>
									<td class="links">&nbsp;
										<input type="text" name="answer(Object::Product::Tax::CountyCode)" maxlength="8" size="10" value="" class="txtbox" id="InsuredNumber">
									</td>
								</tr> 
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Tax Code</td>
									<td class="links">&nbsp;
										<input type="text" name="answer(Object::Product::Tax::TaxCode)" maxlength="10" size="10" value="" class="txtbox" id="StreetNumber"> 
									</td>
								</tr>	
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;User Editable</td>
									<td class="TextMatter">&nbsp;
										<select name="answer(Object::Product::Tax::UserEditable)" class="txtbox">
											<option value="Y">Yes</option>
											<option value="N">No</option>
										</select>
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
							<table WIDTH="760px" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
								<tr>
									<td class="sectionhead" align="center">STATE TAX VERSION DETAILS</td>							
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table WIDTH="760px" ALIGN="right" BORDER="0" CELLSPACING="0" CELLPADDING="2">
								<tr>
									<td colspan="2" align="right" class="links" >
									</td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
				
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Tax Calc Type</td>
									<td class="TextMatter">&nbsp;
										<select name="answer(Object::Product::Tax::TaxCalcType)" class="txtbox">
											<option value="AMT">Amount</option>
											<option value="PERCENT">Percentage</option>
											<option value="FORMULA">Formula</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Attribute Name</td>
									<td class="links">&nbsp;
										<input type="text" name="answer(Object::Product::Tax::AttributeName)" maxlength="40" size="20" value="" class="txtbox" id="City">
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Rule Group Name</td>
									<td class="links">&nbsp;
										<input type="text" name="answer(Object::Product::Tax::RuleGroupName)" maxlength="20" size="20" value="" class="txtbox" id="County">
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Default Tax</td>
									<td class="links">&nbsp;
										<input type="text" name="answer(Object::Product::Tax::DefaultTax)" maxlength="10" size="10" value="" onkeyup="if(this.value.length==5) {this.value=this.value+'-'}" class="txtbox" id="Zip">
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Minimum Tax</td>
									<td class="links">&nbsp;
										<input type="text" name="answer(Object::Product::Tax::MinimumTax)" maxlength="20" size="10" value="" class="txtbox" id="County">
									</td>
								</tr>	
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;Maximum Tax</td>
									<td class="links">&nbsp;
										<input type="text" name="answer(Object::Product::Tax::MaximumTax)" maxlength="20" size="10" value="" class="txtbox" id="County">
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align=Left">&nbsp;&nbsp;Calculation Sequence</td>
									<td class="links">&nbsp;
										<input type="text" name="answer(Object::Product::Tax::CalculationSeq)" mexlength="20" size="10" value="" class="txtbox" id="CalcSeq">
									</td>
								</tr>	
								<tr>
									<td class="FormLabels" align="Left">&nbsp;&nbsp;Display Sequence</td>
									<td class="links">&nbsp;
										<input type="text" name="answer(Object::Product::Tax::DisplaySeq)" maxlength="20" size="10" value="" class="txtbox" idvalue="DispSeq">
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;TaxAppliedTo</td>
									<td class="TextMatter">&nbsp;
										<select name="answer(Object::Product::Tax::TaxAppliedTo)" class="txtbox">
											<option value="NET">NET</option>
											<option value="GROSS">GROSS</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="FormLabels" align=Left">&nbsp;&nbsp;ProrataTaxCancelationFactor</td>
									<td class="links">&nbsp;
										<input type="text" name="answer(Object::Product::Tax::ProrataFeeCancelationFactor)" mexlength="20" size="10" value="" class="txtbox" id="Prorata">
									</td>
								</tr>	
								<tr>
									<td class="FormLabels" align="left">&nbsp;&nbsp;VerActive</td>
									<td class=TextMatter">&nbsp;
										<select name="answer(Object::Product::Tax::VerActive)" class="txtbox">
											<option value="Y">Yes</option>
											<option value="D">No</option>
										</select>
									</td>
								</tr>
								<tr>
									<td width="30%" class="FormLabels" align="left" height="25">&nbsp;&nbsp;Revision Start Date</td>
									<td class="links">
										<input type="text" name="answer(Release::Month)" maxlength="2" size="2" value="" onkeyup="if(this.value.length==2) {document.forms[0].ReleaseStartDate.focus()}" class="txtbox" id="ReleaseStartMonth">&nbsp;
										<input type="text" name="answer(Release::Date)" maxlength="2" size="2" value="" onkeyup="if(this.value.length==2) {document.forms[0].ReleaseStartYear.focus()}" class="txtbox" id="ReleaseStartDate">&nbsp;
										<input type="text" name="answer(Release::Year)" maxlength="4" size="4" value="" onkeyup="if(this.value.length==4) {document.forms[0].ReleaseEndMonth.focus()}" class="txtbox" id="ReleaseStartYear">&nbsp;(MM/DD/YYYY)
									</td>
								</tr>
								<tr>
									<td width="30%" class="FormLabels" align="left" height="25">&nbsp;&nbsp;Revision End Date</td>
									<td class="links">
										<input type="text" name="answer(Release::Month)" maxlength="2" size="2" value="" onkeyup="if(this.value.length==2) {document.forms[0].ReleaseEndDate.focus()}" class="txtbox" id="ReleaseEndMonth">&nbsp;
										<input type="text" name="answer(Release::Date)" maxlength="2" size="2" value="" onkeyup="if(this.value.length==2) {document.forms[0].ReleaseEndYear.focus()}" class="txtbox" id="ReleaseEndDate">&nbsp;
										<input type="text" name="answer(Release::Year)" maxlength="4" size="4" value="" class="txtbox" id="ReleaseEndYear">&nbsp;(MM/DD/YYYY)
									</td>
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
		<td align="left" >
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" name="amswer(button)" value="Save" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" class="sbttn">
			&nbsp;&nbsp;&nbsp;

			<input type="reset" value="Reset" onmouseover="this.style.color='#FF0D25';" onmouseout="this.style.color='#0042B0';" class="sbttn">
		</td>
	</tr>
	<tr>
		<td>
			<html:hidden property="answer(dbName)" value='<bean:message key="DMS.dbname" />' />
			<html:hidden property="answer(Object::Product::Tax::CreatedBy)" value="<%=userName.toString()%>" />
			<html:hidden property="answer(Object::Product::Tax::UpdatedBy)" value="<%=userName.toString()%>" />
			<html:hidden property="answer(Object::Product::Tax::VerCreatedBy)" value="<%=userName.toString()%>" />
			<html:hidden property="answer(Object::Product::Tax::VerUpdatedBy)" value="<%=userName.toString()%>" />
			<html:hidden property="answer(Object::Product::Tax::StateTaxId)" value="<%=productTaxStateId.toString()%>" />
			<html:hidden property="answer(Object::Product::Tax::RevisionStartDate)" value="" styleId="inpCreatedDateBegin"/>
			<html:hidden property="answer(Object::Product::Tax::RevisionEndDate)" value="" styleId="inpCreatedDateEnd"/>
			<html:hidden property="TabPanelName" value="<%=""+request.getParameter("TabPanelName") %>" />
		</td>
	</tr>										
</table>
</form>
 
<script type="text/javascript">
	function GoTOSubmitButton()
	{
		var formElement=document.forms[0];
		var uCrebeginMM=formElement.ReleaseStartMonth.value;
		var uCrebeginDD=formElement.ReleaseStartDate.value;
		var uCrebeginYY=formElement.ReleaseStartYear.value;
		var uCreendMM=formElement.ReleaseEndMonth.value;
		var uCreendDD=formElement.ReleaseEndDate.value;
		var uCreendYY=formElement.ReleaseEndYear.value;

		if((uCrebeginMM!="")&&(uCrebeginDD!="")&&(uCrebeginYY!="")) {
			formElement.inpCreatedDateBegin.value=uCrebeginMM+"/"+uCrebeginDD+"/"+uCrebeginYY;
		}
		
		if((uCreendMM!="")&&(uCreendDD!="")&&(uCreendYY!="")) {
			formElement.inpCreatedDateEnd.value=uCreendMM+"/"+uCreendDD+"/"+uCreendYY;
		}
	
		return true;
	}
</script>