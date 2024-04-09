
<style>
  .tableHeader{	border:1px solid #4E4E50;}
  .tableData{line-height:17px;text-align:left;margin:0;padding:0;}
  .yui-dt th {border-color:-moz-use-text-color #CBCBCB -moz-use-text-color -moz-use-text-color;border-style:none solid none none;border-width:medium 1px medium medium;margin:0;	padding:0;color:#000000;font-weight:normal;text-decoration:none;vertical-align:bottom;background:#D8D8DA;border-collapse:separate;border-spacing:0;font-family:arial;font-size:inherit;}
  .yui-dt-table {border:1px solid #7F7F7F;border-collapse:separate;border-spacing:0;font-family:arial;font-size:inherit;margin:0;padding:0;}
</style>

<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgencySummary.js"></SCRIPT>
<SCRIPT type="text/JavaScript" SRC="../Scripts/JScripts/AgentSummary.js"></SCRIPT>

<Script>
	var class1=true;
	var class2=true;
	var class3=true;
	var classForm =true;
	function saveClassInformation(){
		AddLocationAvailable=false;
		classForm = false;
		ShowAddLocationDiv("addLocation"+index);
		var classId="addLocation"+index;
		document.getElementById(classId).lastChild.data="Test Class";
		document.getElementById("LocationListSize").innerHTML="Class("+index+")";	
		document.getElementById("classList").style.display="none";
	}
	
	function displayCoveredPersonsInThisClass(obj){
		if(obj.value=="Yes"){
			document.getElementById("DependentsUnder70").style.display="";
			document.getElementById("DomesticPartnersIncludedAsDependents").style.display="";
			document.getElementById("DependentsAllowedByIRS").style.display="";
		}else if(obj.value=="No"){
			document.getElementById("DependentsUnder70").style.display="none";
			document.getElementById("DomesticPartnersIncludedAsDependents").style.display="none";
			document.getElementById("DependentsAllowedByIRS").style.display="none";
		}
		
	}
</Script>
<style type="text/css">
	BODY{FONT-WEIGHT: normal; FONT-SIZE: 0px; MARGIN: 0px; WORD-SPACING: normal; TEXT-TRANSFORM: none; COLOR: #000000; FONT-FAMILY: Verdana, Helvetica, sans-serif;LETTER-SPACING: normal; BACKGROUND-COLOR: white}
	#yui-dt0-bodytable, #yui-dt1-bodytable, #yui-dt2-bodytable {Width:100%;
</style>

<script type="text/javascript" src="../Scripts/prototype.js"></script>
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/datatable1/paginator.css" />    
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/button/button-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container_core-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/container/container-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/connection/connection-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/LocationTank/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/YUI/2.4.1/build/datatable1/paginator-min.js"></script>  
<script type="text/javascript" src="../Scripts/JScripts/Common.js"></script>
<script type="text/javascript" src="../cvstarr/scripts/LocationRisk.js"></script>


<body  topmargin=0 bottommargin=0 leftmargin=0 rightmargin=0 bgcolor="E4E4E4">
<table><tr><td>&nbsp;</td></tr></table>
<table >
<tr>
<td><a href="../cvstarr/SubmissionSummary.jsp" class="locbutton3" >Go to Submission Summary</a></td>
<td><a href="javascript:void(0);" onclick="appendtable();" class="locbutton2 center">Add a Class</a></td>
</tr>
</table>

<a href="../cvstarr/SubmitCompleteApplication.jsp" class="locbutton3 right" style="margin:0 10px 10px 0;">Complete Registration</a>
<br class="clear"/>

<div id="divide1">
<a href="javascript:void(0);" id="LocationSchedule" onclick="javascript:showLocationList(this.id);" class="loctab_active left">	
<div id="LocationListSize">Class (0)</div></a>
</div>	
			
<div class="locformpage" id="Loc3TableData">
		<div class="locformhead"><span class="step">1</span><span class="stepHd">Class Information</span></div>
			 <table border="0" width="100%" cellspacing="0" cellpadding="0" class="todotab_yellowbox">
						<tr>
							<td width="100%" align="center">
								<table id="dataTable" class="yui-dt-table" WIDTH="100%" ALIGN="center" border="0" CELLSPACING="0" CELLPADDING="2">
									<tr class="yui-dt">
										<th  height="20" VALIGN='top' width="10%"><div class="yui-dt-liner"><p class="tableData">No</p></div></th>
										<th  height="20" width="10%"><div class="yui-dt-liner"><p class="tableData">Class Name</p></div></th>    		
										<th  height="20" width="80%"><div class="yui-dt-liner"><p class="tableData">Description</p></div></th>    		
							        	</tr>
							        	
							        	<tr class="yui-dt-odd" id="classList">
										<td VALIGN='top'><div class="yui-dt-liner"><p class="tableData">&nbsp;</p></div></td>
										<td><div class="yui-dt-liner"><p class="tableData">&nbsp;</p></div></td>
										<td><div class="yui-dt-liner"><p class="tableData">No Classes Found.</p></div></td>
									</tr>								
								</table>
							</td>
						 </tr>
						</table>

		</div>


          	<div id="AddLocationDiv" style="display:none">
			<div class="formpage2">
				<div class="content">
					<div class="formhead2"><h2 class="left">Add a Class</h2></div>      
					<h3>Class Information</h3>
					<div id="AddLocationDiv1"></div>
				</div>
			</div>
		</div>


		<div id="LocationAndTanksList" style="display:none"></div>
		
		<div id="dialog3" style="display:none;">
		<div class="hd">View/Edit Class Information</div>
		<div class="bd">
		<table>
			<tr>
				<td>
					<table>
						<tr>
						<td width="30%" class="FormLabels" align="left">Class Name</td>
						<td>&nbsp;&nbsp;</td>
						<td><input type="textbox" name="answer(Object::Class::Classname)" size="40" id="tankname" value="Test Class"/></td>
						</tr>
					
						<tr>
						<td class="FormLabels" align="left"> Description</td>
						<td>&nbsp;&nbsp;</td>
						<td><TEXTAREA Name="description" rows="6" cols="50">All employees of Carleton College who are in active service and are traveling on the business of Carleton College outside of their country of residence or permanent assignment.</TEXTAREA></td>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td class="FormLabels" align="left">Total Number of days travel to US per year</td>
				<td>
				  <input type="textbox" size="9" maxLenght="9"/>
				</td>
			</tr>
			
			<tr>
				<td class="FormLabels" align="left">Total number of days travel to non-US locations per year</td>
				<td>
				  <input type="textbox" size="9" maxLenght="9"/>
				</td>
			</tr>
			
			<tr>
					<td class="FormLabels" align="left"> 
					   Are Dependents included as Covered Persons in this Class
					</td>
					<td>
					  <input type="radio" name="answer(Object::Class::Like::Dependent)" value="Yes" align="right"/> Yes
					  <input type="radio" name="answer(Object::Class::Like::Dependent)" value="No" CHECKED/> No
					</td>
			</tr>
			<tr>
					<td class="FormLabels" align="left"> 
					  Do Spouse Dependants have to be under 70
					</td>
					<td>
					<input type="radio" name="answer(Object::Class::Like::SpouseDependent)" value="Yes" align="right"/> Yes
					<input type="radio" name="answer(Object::Class::Like::SpouseDependent)" value="No" CHECKED/> No
					</td>
		    </tr>
			<tr>
					<td class="FormLabels" align="left"> 
					   Are Domestic Partners included as Dependents
					</td>
					<td>
					 <input type="radio" name="answer(Object::Class::Like::DomesticDependent)" value="Yes" align="right" /> Yes
					 <input type="radio" name="answer(Object::Class::Like::DomesticDependent)" value="No" CHECKED/> No
					</td>					
		    </tr>
				
			<tr>
					<td class="FormLabels" align="left"> 
					   Are Dependents allowed by the IRS included as Covered Persons in this Class
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
				<td align="center">
				      <input type="button" name="answer()" value="Edit Class" Id="SubmitRisk"/> 
				  <input type="button" name="answer()" value="Cancel" Id="CancelClass3"/>
				</td>		

	       </tr>
			
			
		</table>
		</div>
		<a class="container-close" href="javascript:void(0);" id="closeIcon2"></a>
		</div>

		<tr><td>&nbsp;</td></tr>
		<tr><td>&nbsp;</td></tr>

		<tr><td><a href="../cvstarr/SubmitCompleteApplication.jsp" class="locbutton3 right" style="margin:0 10px 10px 0;">Complete Registration</a></td>
		</tr>
		</table>
		
<script>
	document.getElementById("LocationListSize").innerHTML ="Class (0)";
      //editclass dialog 1
        document.getElementById("dialog3").style.display = "block";	
	// Instantiate the Dialog
	 YAHOO.example.container.dialog3 = new YAHOO.widget.Dialog("dialog3", 
							{ width : "50em",
							  fixedcenter : true,
							  visible : false,
							  constraintoviewport : true
							});
	// Render the Dialog
 	YAHOO.example.container.dialog3.render();
	//YAHOO.example.container.dialog3.show();

	 //Event for Cancel risk
	 YAHOO.util.Event.on('CancelClass3', 'click', function(e) {
	 
	 	YAHOO.example.container.dialog3.cancel();
	 	document.getElementById("dialog3").style.display = "none";	
	 })
	YAHOO.util.Event.on('closeIcon2', 'click', function(e) {
	 
	 	YAHOO.example.container.dialog3.cancel();
	 	document.getElementById("dialog3").style.display = "none";	
	 })	
</script>
</body>
<script language="JavaScript1.2" src="../Scripts/ui3.0/coolmenus4.js"></script>
<script language="JavaScript1.2" src="../common/BuildMenu1.0.jsp"></script>



<SCRIPT language="javascript">
	function addRow(tableID) {
	    var table = document.getElementById(tableID);

	    var rowCount = table.rows.length;
	    var row = table.insertRow(rowCount);
	    if(index%2==0){
	    row.className="yui-dt-even";
	    }else{
	     row.className="yui-dt-odd";
	    }
	    row.height ="40";
	    

	    var cell1 = row.insertCell(0);    
	    var element1 = document.createTextNode(index);
	    cell1.appendChild(element1);

	    var cell2 = row.insertCell(1);
	    var element21 = document.createTextNode("Test Class");
	    cell2.appendChild(element21);
	   
	    var cell3 = row.insertCell(2);
	    var element2 = document.createTextNode("All employees of Carleton College who are in active service and are traveling on the business of Carleton College outside of their country of residence or permanent assignment.");
	    
	    cell3.appendChild(element2);
	    cell3.className="tableData";
	}
	
function deleteRow(tableID) {
    try {
    var table = document.getElementById(tableID);
    var rowCount = table.rows.length;

    for(var i=0; i<rowCount; i++) {
	var row = table.rows[i];
	var chkbox = row.cells[0].childNodes[0];
	if(null != chkbox && true == chkbox.checked) {
	    table.deleteRow(i);
	    rowCount--;
	    i--;
	}

    }
    }catch(e) {
	alert(e);
    }
}
</SCRIPT>





