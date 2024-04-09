<div class="bd" style="padding:0 0 0 100px;">
<table>
	<tr>
		<td>
			<table>
				<tr>
					<td class="FormLabels" align="left">Class Name</td>
					<td><input type="textbox" size="40" id="tankname" /></td>
				</tr>
				<tr>
					<td class="FormLabels" align="left"> Description</td>
					<td><TEXTAREA rows="6" cols="50"></TEXTAREA></td>
				</tr>
			</table>
		</td>
	</tr>	
	
	<tr>
		<td class="FormLabels" align="left">Total Number of days travel to US per year</td>
		<td><input type="textbox" size="9" maxLenght="9"/></td>
	</tr>
	
	<tr>
		<td class="FormLabels" align="left">Total number of days travel to non-US locations per year</td>
		<td><input type="textbox" size="9" maxLenght="9"/></td>
	</tr>
	
	<tr>
		<td class="FormLabels" align="left"> 
		   Are Dependents included as Covered Persons in this Class?
		</td>
		<td>
		  <input onclick="displayCoveredPersonsInThisClass(this)" type="radio" name="answer(Object::Class::Like::Dependents)" value="Yes" align="right"/> Yes
		  <input onclick="displayCoveredPersonsInThisClass(this)" type="radio" name="answer(Object::Class::Like::Dependents)" value="No" CHECKED/> No
		</td>		
	</tr>
	 
	<tr style="display:none;" id="DependentsUnder70">
		<td class="FormLabels" align="left"> 
		  <p style="margin:0 0 0 20px;padding:0;"> Do Spouse Dependants have to be under 70?</p>
		</td>
		<td>
		<input type="radio" name="answer(Object::Class::Like::SpouseDependents)" value="Yes" align="right"/> Yes
		<input type="radio" name="answer(Object::Class::Like::SpouseDependents)" value="No" CHECKED/> No
		</td>			
   </tr>	
	 
	<tr style="display:none;" id="DomesticPartnersIncludedAsDependents">
		<td class="FormLabels" align="left"> 
		   <p style="margin:0 0 0 20px;padding:0;">Are Domestic Partners included as Dependents?</p>
		</td>
		<td>
		 <input type="radio" name="answer(Object::Class::Like::DomesticDependents)" value="Yes" align="right" /> Yes
		 <input type="radio" name="answer(Object::Class::Like::DomesticDependents)" value="No" CHECKED/> No
		</td>				
    </tr>	
	<tr style="display:none;" id="DependentsAllowedByIRS">
		<td class="FormLabels" align="left"> 
		   <p style="margin:0 0 0 20px;padding:0;">Are Dependents allowed by the IRS included as Covered Persons in this Class?</p>
		</td>
		<td>
		  <input type="radio" name="answer(Object::Class::Like::IRSDependents)" value="Yes" align="right" CHECKED/> Yes
		  <input type="radio" name="answer(Object::Class::Like::IRSDependents)" value="No" /> No
		</td>					
       </tr>       
       <tr>
       		<td>&nbsp;&nbsp; </td>
       </tr>
	<tr>			
			<td align="right">
			      <input type="button" value="Continue" onclick="addRow('dataTable');saveClassInformation();" class="covbutton"/> 
			</td>					
       </tr>	
       <tr><td>&nbsp;</td></tr>
</table>
</div>
