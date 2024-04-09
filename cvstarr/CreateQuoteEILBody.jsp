<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<link rel="stylesheet" type="text/css" href="../Scripts/ext-3.2.1/resources/css/ext-all.css">
<script type="text/javascript" src="../Scripts/ext-3.2.1/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="../Scripts/ext-3.2.1/ext-all.js"></script>

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
					<input type='text' id="dateField"  maxlength='100' class='txtbox' size='25'/>
					</span></td></tr>
					<!-- <tr><td class='field' width='40%' align='Right'>
					<span>Policy Effective Date (MM/DD/YYYY)</span></td>
					<td>
					<span>
					<input type='text' id="dateField"  maxlength='100' class='txtbox' size='25'/>
					<IMG id="openCalendar" SRC="../Images/Icons-mini-calendar.gif" BORDER="0" ALT="Choose the date"></a>
					<div style=" position: absolute; z-index: 500;" id="calendar" name="calendar">
					</span></td></tr> -->
					
					
					
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
					<input type='text' id="dateField2" maxlength='100' class='txtbox' size='25'/>
					</span></td></tr>


					<tr><td class='field' width='40%' align='Right'>
					<span>Policy Expiration Date (MM/DD/YYYY)</span></td>
					<td width='40%'>
					<span>
					<input type='text' id="dateField1"  maxlength='100' class='txtbox' size='25'/>
					</span></td></tr>
					
		<!--
					<tr id="PolicyAnniversaryDateRow"><td class='field' width='40%' align='Right'>
					<span>Policy Anniversary Date (MM/DD/YYYY)</span></td>
					<td>
					<span>
					<input type='text' id="dateField2" maxlength='100' class='txtbox' size='25'/>
					<IMG id="openCalendar2" SRC="../Images/Icons-mini-calendar.gif" BORDER="0" ALT="Choose the date"></a>
					<form on><div style=" position: absolute; z-index: 500;" id="calendar2" name="calendar2" ></div>
					</span></td></tr>


					<tr><td class='field' width='40%' align='Right'>
					<span>Policy Expiration Date (MM/DD/YYYY)</span></td>
					<td width='40%'>
					<span>
					<input type='text' id="dateField1"  maxlength='100' class='txtbox' size='25'/>
					<IMG id="openCalendar1" SRC="../Images/Icons-mini-calendar.gif" BORDER="0" ALT="Choose the date"></a>
					<div style=" position: absolute; z-index: 500;" id="calendar1" name="calendar1" ></div>
					</span></td></tr>

-->
	
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
					<input class="radiobutton" type='radio' name='answer(Under::Multiple::Classes)' id="multipleInsuredY" onClick="displayMultipleInsuredChild()" value='Y' >Yes&nbsp;&nbsp;
					<input class="radiobutton" type='radio' name='answer(Under::Multiple::Classes)' id="multipleInsuredN" onClick="displayMultipleInsuredChild()" value='N' CHECKED>No&nbsp;&nbsp;
					</span></td></tr>
	
					<tr style="display:none;" id="multipleInsuredChild"><td class='field' width='40%' colspan='$COLSPAN' align='Right'>
					<span>Person can be insured as a Dependent and Insured at the same time?</span>
					</td><td class='' width='40%'>
					<span>
					<input class="radiobutton" type='radio' name='answer(Insured::Dependent)' $DISABLED id='RequestCoverageExpiring'  value='Y' >Yes&nbsp;&nbsp;
					<input class="radiobutton" type='radio' name='answer(Insured::Dependent)' $DISABLED id='RequestCoverageExpiring'  value='N' CHECKED>No&nbsp;&nbsp;
					</span></td></tr>
	
					<tr><td>&nbsp;</td></tr>
		
					<td>
					<table width="100%">
						<tr>
						<td width="27%">&nbsp;</td>
						<td width="15%">Class No</td>
						<td width="27%"width="50%">Class Description</td>
						<td width="9%">&nbsp;</td>
						</tr>
						
						<tr>
						<td width="27%">&nbsp;</td>
						<td width="15%">1.</td>
						<td width="50%">Class1</td>
						<td width="9%"><input type="checkbox" CHECKED/></td>
						</tr>
						
						
						<tr>
						<td width="27%">&nbsp;</td>
						<td width="15%">2.</td>
						<td width="50%">Class2</td>
						<td width="9%">
						<input type="checkbox" CHECKED/></td>
						</tr>
						
						
						<tr>
						<td width="27%">&nbsp;</td>
						<td width="15%">3.</td>
						<td width="50%">Class3</td>
						<td width="9%"><input type="checkbox" CHECKED/></td>
						</tr>
						
						
						<tr>
						<td width="27%">&nbsp;</td>
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
</table><!-- 
<script type="text/javascript">
Ext.onReady(function() {
	var selectHandler = function(myDP, date) {
		var field = document.getElementById('dateField');
		field.value = date.format('m/d/Y');
		datePickerWin.hide();
		var maxDate=new Date();
		var minDate=new Date();
		maxDate.setDate(date.getDate()+30);
		minDate.setDate(date.getDate());
		myDP2.setMaxDate(maxDate);
		myDP1.setMaxDate(maxDate);
		myDP2.setMinDate(minDate);
		myDP1.setMinDate(minDate);
	};
	
	var today=new Date();
	var myDP = new Ext.DatePicker(
		{startDay: 1,listeners: {'select':selectHandler}, minDate: new Date(today.add(Date.DAY,-30).clearTime()) , maxDate:(today.add(Date.DAY,30).clearTime())}
		);
	myDP.render('calendar');
	myDP.hide();
	
	var datePickerWin = new Ext.Window({
       closeAction: 'hide',
       width:190,
       height:230,
       layout    : 'fit',
       hideBorders    : true,
       items: new Ext.DatePicker({startDay: 1,listeners: {'select':selectHandler}, minDate: new Date(today.add(Date.DAY,-30).clearTime()) , maxDate:(today.add(Date.DAY,30).clearTime())})
   });
   
	var clickHandler = function() {
		datePickerWin.show();
	};
	
	var blurHandler = function() {
		datePickerWin.hide();
	};
	
	Ext.EventManager.on('openCalendar', 'click', clickHandler);
	Ext.EventManager.on('openCalendar', 'blur', blurHandler);

	var selectHandler2 = function(myDP2, date2) {
		var field2 = document.getElementById('dateField2');
		field2.value = date2.format('m/d/Y');
		myDP2.hide();
		field2.focus();
	};

	var myDP2 = new Ext.DatePicker(
		{startDay: 1,listeners: {'select':selectHandler2}}
		);
	myDP2.render('calendar2');
	myDP2.hide();

	var clickHandler2 = function() {
		myDP2.show();
	};

	Ext.EventManager.on('openCalendar2', 'click', clickHandler2);

	var selectHandler1 = function(myDP1, date1) {
		var field1 = document.getElementById('dateField1');
		field1.value = date1.format('m/d/Y');
		myDP1.hide();
		field1.focus();
	};
	
	var myDP1 = new Ext.DatePicker({startDay: 1,listeners: {'select':selectHandler1}});
	myDP1.render('calendar1');
	myDP1.hide();

	var clickHandler1 = function() {
		myDP1.show();
	};

	Ext.EventManager.on('openCalendar1', 'click', clickHandler1);
});
</script>			
			
-->
</form>
</div>
<br class="clear" />
</html>



