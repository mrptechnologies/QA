

<!--##########################NEW QUOTE HEADER START #########################################-->
<form action="../cvstarr/PolicySummaryEIL.jsp">
<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0">

	<tr><td>
 	<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0">
	<tr>
		<td align="left" valign="top">
			<div class="frame3border">
			<div class="formhead"><h2 class="left">Quote</h2></div>
				<div class="frlabel3 left">
					Status:<br/>
					Effective Date:<br/>
					Company Paper:<br/>
					Last Updated:<br/>&nbsp;
				</div>
				<div class="frinfo3 left" style="width:200px;">
					Offered<br/>
					April 22 2010 <br/>
					Starr Indemnity & Liability Company<br/>
					April 22 2010 <br/>&nbsp;
				</div>
			</div>
		</td >
		<td align="left"  valign="top">
			<div class="frame11border">
			<div class="formhead"><h2 class="left">Insured</h2><div align=right style=" margin-top: 5px; margin-right: 5px;"><a href="../Servlet?dms_id=168b74b2e47e135bb1cc7f701f7c0542" >Insured Details</a></div></div>
				<div class="frlabel3 left">
					Name:<br/>
					Address:<br/>
					City:<br/>
					State:<br/>
					Zip:<br/>&nbsp;
					Agency Name:<br/>
					Agent Name:<br/>
				</div>
				<div class="frinfo11 left" >
					<a href="../Servlet?dms_id=168b74b2e47e135bb1cc7f701f7c0542" >test</a><br />
					<br/>
					Marion<br/>
					OH<br/>
					43301<br/>
					<a href="../Servlet?dms_id=43d929f05501503e256e76e921d3634f">Solartis Agency</a><br/>
					<a href="../Servlet?dms_id=e070e7b482c0deda1e0832c64d5e729f">Solartis Agent</a>
				</div>
			</div>
		</td>
	</tr>
	</table>
	</tr></td>


<!--##########################NEW QUOTE HEADER END #########################################-->	

		<tr><td>
		<table border="0" width="100%" id="table1" cellspacing="0" cellpadding="0">							
			<tr>
				<td align="left">
				<table WIDTH="100%" ALIGN="left" border="0" CELLSPACING="2" CELLPADDING="0">																									
					<tr>
					<td>
					<input type="hidden" name="answer(ownerId)" value="12">
					</td>
					<td>
					<input type="hidden" name="answer(Object::Customer::CustomerId)" value="7406">
					</td>
					</tr>
					
					<tr>										
					<td colspan="2" class="links">
						<a onclick="javascript:history.go(-1);" style="cursor:hand;">Quote Summary</a>
					</td>
					</tr>
					
					<tr><td>&nbsp;</td></tr>	
													
					<tr><td>&nbsp;</td></tr>
																							
					<tr>
					<td class="Error">
					</td>
					</tr>
					
					<tr>
					<td>
						<table width="100%" border="0" align="left">
						<tr>
						<td align="left" class="TextMatter">
						Effective Date
						&nbsp;</td>
						<td class="sectionhead1"><input type="text" name="answer(Object::Quote::QuoteStartDate)" maxlength="30" size="30" value="04/22/2010" onchange="return productBrowse()" class="txtbox" id="txtDate"></td>																		
						</tr>	
				
						<tr><td>&nbsp;</td></tr>															
						
						<!--<tr>
						<td align="left" class="TextMatter">
								TRIA Coverage Required 
								&nbsp;</td>
								<td class="sectionhead1">
								<select name="answer(Object::Plan::TRIACoverage)" class="txtbox" id="TRIA"><option value="N" selected="selected">No</option>
								     <option value="Y">Yes</option></select>																		
						</td>																		
						</tr>-->
								
						
						<tr>
						<td class="TextMatter" align="right">
						Enter notes to be included on binder
						</td>
						<td class="TextMatter1" align="left">
						<textarea name="answer(Object::Quote::Notes)" cols="60" rows="3" class="txtarea"></textarea>
						</td>
						</tr>
		</table>
		</tr></td>		

		<tr><td>			
		<table WIDTH="75%" ALIGN="center" BORDER="0" CELLSPACING="0" CELLPADDING="0">
			<tr><td>&nbsp;</td>
			<tr><td>&nbsp;</td>
			<tr><td>&nbsp;</td>
			<tr><td>&nbsp;</td>
					
			<td align="center" class="links" colspan="4">
			<INPUT TYPE="Button" style="width:200px;" value="Preview Binder Document" class="covbutton" onclick ='savePreviewBinder()'/>
			</td>

			<td align="left" class="links" colspan="4">
			<div id = "IssueBinder">
			<INPUT TYPE="Submit" value="Issue Binder" class="covbutton" id="IssueBinderSubmit">
			</div>
			</td>
					
			<td>
			<input type="button" name="answer(back)" value="Back" onclick="javascript:history.go(-1);" class="covbutton">
			</td>
					
			<td>&nbsp;</td></tr>
			
			<tr><td colspan="3">&nbsp;</td></tr>
		</table>
		</tr></td>
</table>		
</form>







