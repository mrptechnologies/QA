<style>
.formpage01{float:left;background:none;width:900px;border:none;}
.formpage01 .field{ width:300px;}
.formpage01 .field p{float:left;margin:0;padding:0;}
</style>

	
<SCRIPT SRC="scripts/invoice.js" type="text/javascript"> </SCRIPT>
<div class="formpage01">
	<h3 class="left" style="margin:20px 0 0 20px;">Invoices/Debit Notes</h3><br><br>
	<div class="field"><p>From (MM/DD/YYYY):</p><input type="text" name="answer(Agency::Like::AgencyCode)" value="" size="15" maxLength="10" id="AgencyCode"></div>
	<div class="field"><p>To (MM/DD/YYYY):</p><input stye="float:right;" type="text" name="answer(Agency::Like::BusinessName)" value="" size="15" maxLength="10" id="BusinessName"></div>
	<div class="field"><p>Status:</p>
		<select name="answer(Address::Equals::State)" style="width:105px;" id="status">
			<option value="" selected="selected">Select</option>
			<option value="">Open</option>
			<option value="">Due</option>
			<option value="">Paid</option>
		</select>
	</div>		
	<div class="field"><p>Amount Due:</p><input stye="float:right;" type="text" name="answer(Agency::Like::BusinessName)" value="" size="15" maxLength="10" id="amountDue"></div>

	<div>
		<input type="button" value="Search" style="margin:0;padding:0;"  class="covbutton" onclick="listInvoice()">	
	</div>

	<div class="formcontentRightAlign" id="divSelectButton">
		<input type="button" style="float:left;margin:0;" class="covbutton" onclick="addInvoiceDebit();" value="Add">
	</div>

	<div id="AgencyCount"></div>
	<table>
	<td align="left">
		<div id="AGENCY_LIST" style="margin:0 0 0 25px;" class="yui-skin-sam"></div>
	</td>
	</tr>
	</table>
	<div style="display:none;float:right;margin:0;" id="voidInvoiceButton">
		<input type="button" style="width:100px;" class="covbutton"  value="Void">
	</div>
	<div style="display:none;float:right;margin:0;" id="deleteInvoiceButton">
		<input type="button" style="width:100px;" class="covbutton"  value="Delete">
	</div>
	<br><br>
</div>



