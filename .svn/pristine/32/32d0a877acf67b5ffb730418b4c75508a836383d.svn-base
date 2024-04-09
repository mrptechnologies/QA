<link rel="stylesheet" type="text/css" href="../Scripts/datatable/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<script type="text/javascript" src="../Scripts/datatable/yahoo-dom-event.js"></script>
<script type="text/javascript" src="../Scripts/datatable/dragdrop-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/element-beta-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datasource-min.js"></script>
<script type="text/javascript" src="../Scripts/datatable/datatable-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/prototype.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/LocationTank/LocationRisk.js"></script>
<link rel="stylesheet" type="text/css" href="../Scripts/tree/treeview.css" />
<script type="text/javascript" src="../Scripts/tree/treeview-min.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/LocationTank/LocationListTree.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/LocationTank/RiskListTable.js"></script>
<script type="text/javascript" src="../Scripts/JScripts/common.js"></script>
<style type="text/css">
.yui-skin-sam .yui-dt-liner { white-space:nowrap; } 
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

<div id="LOCATION_LIST_TREE">
	<ul>
		<li>Location List
			<ul>
				<li><a href="javascript:alert('hi')">item 0-0-0</a></li>
				<li>item 0-0-1</li>
			</ul>
	</li>
</div>
<input type="button" value="Location List" onclick="getLocationList()">

<div id="RISK_LIST_TABLE"></div>

<div id="EDIT_RISK_CONTAINER"></div>

<script type="text/javascript">

refereshRiskList();
locationTree();
</script>