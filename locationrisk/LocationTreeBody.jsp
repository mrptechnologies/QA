<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<link rel="stylesheet" type="text/css" href="../Scripts/tree/treeview.css" />
<script type="text/javascript" src="../Scripts/tree/treeview-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/LocationTank/LocationListTree.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/LocationTank/LocationRisk.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<style type="text/css">
.whitebg {
	background-color:white;
}
</style>
<%
String cId="";
String submissionId="";
String submissionVerId = "";
if(request.getParameter("answer(Object::Customer::CustomerId)")!=null){
	cId = ""+request.getParameter("answer(Object::Customer::CustomerId)");
}
if(request.getParameter("answer(Object::Submisssion::SubmisssionId)")!=null){
	submissionId=""+request.getParameter("answer(Object::Submisssion::SubmisssionId)");
}

if(request.getParameter("answer(Object::Submisssion::SubmisssionVerId)")!=null){
	submissionVerId=""+request.getParameter("answer(Object::Submisssion::SubmisssionVerId)");
}
%>
<input type="hidden" id="customerId" value="<%=""+cId %>">
<input type="hidden" id="submissionId" value="<%=""+submissionId %>">
<input type="hidden" id="submissionVerId" value="<%=""+submissionVerId %>">

<table width="100%">
<tr>
	<td>
		&nbsp;
	</td>
</tr>
<tr><td>
<table width="100%" bordercolor="black" border="1">
	<tr>
		<td width="13%">
			<div class="whitebg" id="LOCATION_LIST_TREE">
				<ul>		
					<li>Location List
						<ul>
							<li><a target="_new" href="HTTP://developer.yahoo.com/yui" title="go to YUI Home Page">Location1</a>
								<ul>
									<li>Tank 1</li>
									<li>Tank 2</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</td>
		<td>
			<table width="100%" border="0">
				<tr>
					<td>
					 <div id="EDIT_RISK_CONTAINER"></div>
					<td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</td>
</tr>
<tr><td>
<table width="100%">
	<tr>
		<td>
			<a href="javascript:getLocationList()">Location</a>
		</td>
	</tr>
</table></td></tr></table>
<script type="text/javascript">
locationTree();
</script>