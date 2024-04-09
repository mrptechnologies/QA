<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>

<style>
	.productbrowse .field{float:left;width:405px;height:5px;padding:5px 0 0 140px;margin:3px 0 3px 10px;font-size:12px;text-align:left;}
	.productbrowse .radiobutton {BORDER-RIGHT: cccccc 1px solid;BORDER-TOP: 999999 1px solid;FONT-WEIGHT:400;FONT-SIZE: 11px;BORDER-LEFT: 999999 1px solid;COLOR: 000000;BORDER-BOTTOM: cccccc 1px solid;FONT-FAMILY: Verdana,Arial;HEIGHT: 15px;BACKGROUND-COLOR: ffffff;TEXT-DECORATION: none;vertical-align: bottom;}
</style>

<SCRIPT type="text/javascript" SRC="scripts/CreateQuote.js"> </SCRIPT>

<div class="productbrowse"  style="width:960px;">
<div class="content" style="width:100%;">
<form name="AddParentQuote" method="post" action="../cvstarr/NewQuote.jsp">

<table WIDTH="100%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="2">
	<tr>
		<td >
			<table WIDTH="100%" ALIGN="c" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr>
				<td  colspan="5"><div class="formhead"><h2>CREATE NEW QUOTE</h2></div></td>
			</tr>

			<tr><td height="5"></td></tr>
			<tr><td>&nbsp;</td></tr>
			<tr><td  align="center" colspan="5"><h3>Select Product</h3></td></tr>
			<tr><td colspan="2">
				<table width="80%" border="0"  align="left">
					<tr>
					<td class='field' width='40%' colspan='$COLSPAN' align='Right'>
						<span>Product</span></td>
						<td>
							<span>
							<select class='txtbox'>
								<option value=''>Select</option>
								<option value='BlanketBusinessTravel'>Blanket Business Travel</option>
							</select></span>
						</td>
					</tr>
					
					<tr>
					<td class='field' width='40%' align='Right'>
						<span>State of Delivery</span>
					</td>
	
					<td>
						<span>
						<dmshtml:get_type nameInSession="arStates" dcdObjectType="USSTATES" ownerId="14" dbname="<%=com.dms.web.util.DbUtils.getReadDS(pageContext)%>"/>
						<select class="txtbox" name="answer(Address::Equals::State)" id="State">
							<option value ="">Select</option>
							<option value='DETrust'>DE Trust</option>
		        					<logic:present name="arStates" scope="request">
		          					<logic:iterate id="details" name="arStates" scope="request" >
				 	   			<bean:define id='test' name="details"  property="typeDesc" />
				  				<option value ='<%=test.toString()%>'>
				       				<bean:write name="details" property="dmsType" />
				   			</option>
							</logic:iterate>
							</logic:present>
						</select>
						</span>
					</td>
					</tr>
					
					<tr><td class='field' width='40%' align='Right'>
					<span>Policy Effective Date (MM/DD/YYYY)</span></td>
					<td>
					<span>
					<input type='text'   maxlength='100' class='txtbox' size='25'/>
					</span></td></tr>
	
					<tr><td class='field' width='40%' align='Right'>
					<span>Is Policy Anniversary Date required on Policy?</span>
					</td><td class='' width='40%' align='$ALIGN'>
					<span>
					<input class="radiobutton" onclick="displayAnniversaryDate()" type='radio' id="IsPolicyAnniversaryDateRequiredY" name='answer(Policy::Anniversary::Date)'  value='Y' CHECKED>Yes&nbsp;&nbsp;
					<input class="radiobutton" onclick="displayAnniversaryDate()" type='radio' id="IsPolicyAnniversaryDateRequiredN" name='answer(Policy::Anniversary::Date)'  value='N'>No&nbsp;&nbsp;
					</span>
					</td></tr>
	
					<tr id="PolicyAnniversaryDateRow"><td class='field' width='40%' align='Right'>
					<span>Policy Anniversary Date (MM/DD/YYYY)</span></td>
					<td>
					<span>
					<input type='text' maxlength='100' class='txtbox' size='25'/>
					</span></td></tr>
	
					<tr><td class='field' width='40%' align='Right'>
					<span>Policy Expiration Date (MM/DD/YYYY)</span></td>
					<td width='40%'>
					<span>
					<input type='text' maxlength='100' class='txtbox' size='25' />
					</span></td></tr>
	
					<tr><td class='field' width='40%' align='Right'>
					<span>Deferred Effective Date applies?</span>
					</td>
					<td width='40%'>
					<span>
					<input class="radiobutton" type='radio' name='answer(Deferred::Effective::Date)'  value='Y'>Yes&nbsp;&nbsp;
					<input class="radiobutton" type='radio' name='answer(Deferred::Effective::Date)'  value='N' CHECKED >No&nbsp;&nbsp;
					</span></td></tr>
					
					<tr><td>&nbsp;</td></tr>
					<tr><td class='field'>
					<span><h3 style="margin:0px 0 0 0;padding:0;font-size:13px;color:#000;">Classes of Eligible Persons</h3>
					</span></td></tr>
	
					<tr><td class='field' width='40%'  align='Right'>
					<span>Person can be insured under multiple classes?</span>
					</td><td class='' width='40%' colspan='$COLSPAN' align='$ALIGN'>
					<span>
					<input class="radiobutton" type='radio' name='answer(Under::Multiple::Classes)'  value='Y'>Yes&nbsp;&nbsp;
					<input class="radiobutton" type='radio' name='answer(Under::Multiple::Classes)'  value='N' CHECKED>No&nbsp;&nbsp;
					</span></td></tr>
	
					<tr><td class='field' width='40%' colspan='$COLSPAN' align='Right'>
					<span>Person can be insured as a Dependent and Insured at the same time?</span>
					</td><td class='' width='40%'>
					<span>
					<input class="radiobutton" type='radio' name='answer(Insured::Dependent)' $DISABLED id='RequestCoverageExpiring'  value='Y'>Yes&nbsp;&nbsp;
					<input class="radiobutton" type='radio' name='answer(Insured::Dependent)' $DISABLED id='RequestCoverageExpiring'  value='N' CHECKED>No&nbsp;&nbsp;
					</span></td></tr>
	
					<tr><td>&nbsp;</td></tr>
	
					<td class='field' width='40%' colspan='$COLSPAN' align='Right'>
					<table width="100%">
						<tr>					
						<td width="22%">Class No</td>
						<td width="27%"width="50%">Class Description</td>
						<td width="9%">&nbsp;</td>
						</tr>
						
						<tr>					
						<td width="15%">1.</td>
						<td width="50%">Class1</td>
						<td width="9%"><input type="checkbox" CHECKED/></td>
						</tr>
						
						
						<tr>					
						<td width="15%">2.</td>
						<td width="50%">Class2</td>
						<td width="9%">
						<input type="checkbox" CHECKED/></td>
						</tr>
						
						
						<tr>	
						<td width="15%">3.</td>
						<td width="50%">Class3</td>
						<td width="9%"><input type="checkbox" CHECKED/></td>
						</tr>
						
						
						<tr>	
						<td width="15%">4.</td>
						<td width="50%">Class4</td>
						<td width="9%"><input type="checkbox" CHECKED/></td>
						</tr>
					</table>
					</td>
				</table>
			</td></tr>
					
			<TR>
				<td colspan="2" align="Center">&nbsp;&nbsp;&nbsp;
					<div id="submitButton">
						<input type="submit" value="Next" class="covbutton" id="CreateQuoteSubmit" >&nbsp;
					</div>
				</td>

			</TR>
			</table>
		</td>
	</tr>
</table>
			
			

</form>
</div>
<br class="clear" />
</html>



