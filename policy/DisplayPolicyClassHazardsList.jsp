<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/assets/skins/sam/menu.css">
<link rel="stylesheet" type="text/css" href="../styles/yahoo/2.4.1/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css"	href="../styles/yahoo/2.4.1/build/button/assets/skins/sam/button.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/YUI/2.4.1/build/datatable1/paginator.css" />
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/container.css">
<link rel="stylesheet" type="text/css" href="../Scripts/datatable/datatable.css" />
<%response.setHeader("Cache-Control", "no-store");%>
<%System.out.println("Entered"); %>

<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)" styleId="ownerId1" value= '<%=""+ownerId %>'/>

<style type="text/css">
  .locformpages{border:1px #f0aa39 solid;width:900px;margin:0 0 0 0;padding:9px;background:url(D:/jboss/jboss-4.0.5.GA/server/default/deploy/ins.war/styles/ui3.0/i/bodybg1.gif)repeat-x;}
  .locformpage{width:900px;margin:0 0 0 0;}
  .tableData{line-height:17px;text-align:left;margin:0;padding:0;font-weight:bold;}
  .yui-skin-sam .yui-dt-mask{position:absolute;z-index:9500;}.yui-dt-tmp{position:absolute;left:-9000px;}.yui-dt-scrollable .yui-dt-bd{overflow:auto;}.yui-dt-scrollable .yui-dt-hd{overflow:hidden;position:relative;}.yui-dt-scrollable .yui-dt-bd thead tr,.yui-dt-scrollable .yui-dt-bd thead th{position:absolute;left:-1500px;}.yui-dt-scrollable tbody{-moz-outline:none;}.yui-dt-draggable{cursor:move;}.yui-dt-coltarget{position:absolute;z-index:999;}.yui-dt-hd{zoom:1;}th.yui-dt-resizeable .yui-dt-resizerliner{position:relative;}.yui-dt-resizer{position:absolute;right:0;bottom:0;height:100%;cursor:e-resize;cursor:col-resize;background-color:#CCC;opacity:0;filter:alpha(opacity=0);}.yui-dt-resizerproxy{visibility:hidden;position:absolute;z-index:9000;}th.yui-dt-hidden .yui-dt-liner,td.yui-dt-hidden .yui-dt-liner,th.yui-dt-hidden .yui-dt-resizer{display:none;}.yui-dt-editor{position:absolute;z-index:9000;}.yui-skin-sam .yui-dt table{margin:0;padding:0;font-family:arial;font-size:inherit;border-collapse:separate;*border-collapse:collapse;border-spacing:0;border:1px solid #7F7F7F;}.yui-skin-sam .yui-dt thead{border-spacing:0;}.yui-skin-sam .yui-dt caption{color:#000000;font-size:85%;font-weight:normal;font-style:italic;line-height:1;padding:1em 0pt;text-align:center;}.yui-skin-sam .yui-dt th{background:#D8D8DA url(sprite.png) repeat-x 0 0;}.yui-skin-sam .yui-dt th,.yui-skin-sam .yui-dt th a{font-weight:normal;text-decoration:none;color:#000;vertical-align:bottom;}.yui-skin-sam .yui-dt th{margin:0;padding:0;border:none;border-right:1px solid #CBCBCB;}.yui-skin-sam .yui-dt tr.yui-dt-first td{border-top:1px solid #7F7F7F;}.yui-skin-sam .yui-dt th .yui-dt-liner{white-space:nowrap;}.yui-skin-sam .yui-dt-liner{margin:0;padding:0;padding:4px 10px 4px 10px;}.yui-skin-sam .yui-dt-coltarget{width:5px;background-color:red;}.yui-skin-sam .yui-dt td{margin:0;padding:0;border:none;border-right:1px solid #CBCBCB;text-align:left;}.yui-skin-sam .yui-dt-list td{border-right:none;}.yui-skin-sam .yui-dt-resizer{width:6px;}.yui-skin-sam .yui-dt-mask{background-color:#000;opacity:.25;*filter:alpha(opacity=25);}.yui-skin-sam .yui-dt-message{background-color:#FFF;}.yui-skin-sam .yui-dt-scrollable table{border:none;}.yui-skin-sam .yui-dt-scrollable .yui-dt-hd{border-left:1px solid #7F7F7F;border-top:1px solid #7F7F7F;border-right:1px solid #7F7F7F;}.yui-skin-sam .yui-dt-scrollable .yui-dt-bd{border-left:1px solid #7F7F7F;border-bottom:1px solid #7F7F7F;border-right:1px solid #7F7F7F;background-color:#FFF;}.yui-skin-sam .yui-dt-scrollable .yui-dt-data tr.yui-dt-last td{border-bottom:1px solid #7F7F7F;}.yui-skin-sam thead .yui-dt-sortable{cursor:pointer;}.yui-skin-sam th.yui-dt-asc,.yui-skin-sam th.yui-dt-desc{background:url(sprite.png) repeat-x 0 -100px;}.yui-skin-sam th.yui-dt-sortable .yui-dt-label{margin-right:10px;}.yui-skin-sam th.yui-dt-asc .yui-dt-liner{background:url(dt-arrow-up.png) no-repeat right;}.yui-skin-sam th.yui-dt-desc .yui-dt-liner{background:url(dt-arrow-dn.png) no-repeat right;}tbody .yui-dt-editable{cursor:pointer;}.yui-dt-editor{text-align:left;background-color:#F2F2F2;border:1px solid #808080;padding:6px;}.yui-dt-editor label{padding-left:4px;padding-right:6px;}.yui-dt-editor .yui-dt-button{padding-top:6px;text-align:right;}.yui-dt-editor .yui-dt-button button{background:url(sprite.png) repeat-x 0 0;border:1px solid #999;width:4em;height:1.8em;margin-left:6px;}.yui-dt-editor .yui-dt-button button.yui-dt-default{background:url(sprite.png) repeat-x 0 -1400px;background-color:#5584E0;border:1px solid #304369;color:#FFF}.yui-dt-editor .yui-dt-button button:hover{background:url(sprite.png) repeat-x 0 -1300px;color:#000;}.yui-dt-editor .yui-dt-button button:active{background:url(sprite.png) repeat-x 0 -1700px;color:#000;}.yui-skin-sam tr.yui-dt-even{background-color:#FFF;}.yui-skin-sam tr.yui-dt-odd{background-color:#EDF5FF;}.yui-skin-sam tr.yui-dt-even td.yui-dt-asc,.yui-skin-sam tr.yui-dt-even td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam tr.yui-dt-odd td.yui-dt-asc,.yui-skin-sam tr.yui-dt-odd td.yui-dt-desc{background-color:#DBEAFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even{background-color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-odd{background-color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam th.yui-dt-highlighted,.yui-skin-sam th.yui-dt-highlighted a{background-color:#B2D2FF;}.yui-skin-sam tr.yui-dt-highlighted,.yui-skin-sam tr.yui-dt-highlighted td.yui-dt-asc,.yui-skin-sam tr.yui-dt-highlighted td.yui-dt-desc,.yui-skin-sam tr.yui-dt-even td.yui-dt-highlighted,.yui-skin-sam tr.yui-dt-odd td.yui-dt-highlighted{cursor:pointer;background-color:#B2D2FF;}.yui-skin-sam .yui-dt-list th.yui-dt-highlighted,.yui-skin-sam .yui-dt-list th.yui-dt-highlighted a{background-color:#B2D2FF;}.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted,.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted td.yui-dt-desc,.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-highlighted,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-highlighted{cursor:pointer;background-color:#B2D2FF;}.yui-skin-sam th.yui-dt-selected,.yui-skin-sam th.yui-dt-selected a{background-color:#446CD7;}.yui-skin-sam tr.yui-dt-selected td,.yui-skin-sam tr.yui-dt-selected td.yui-dt-asc,.yui-skin-sam tr.yui-dt-selected td.yui-dt-desc{background-color:#426FD9;color:#FFF;}.yui-skin-sam tr.yui-dt-even td.yui-dt-selected,.yui-skin-sam tr.yui-dt-odd td.yui-dt-selected{background-color:#446CD7;color:#FFF;}.yui-skin-sam .yui-dt-list th.yui-dt-selected,.yui-skin-sam .yui-dt-list th.yui-dt-selected a{background-color:#446CD7;}.yui-skin-sam .yui-dt-list tr.yui-dt-selected td,.yui-skin-sam .yui-dt-list tr.yui-dt-selected td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-selected td.yui-dt-desc{background-color:#426FD9;color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-selected,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-selected{background-color:#446CD7;color:#FFF;}.yui-skin-sam .yui-dt-paginator{display:block;margin:6px 0;white-space:nowrap;}.yui-skin-sam .yui-dt-paginator .yui-dt-first,.yui-skin-sam .yui-dt-paginator .yui-dt-last,.yui-skin-sam .yui-dt-paginator .yui-dt-selected{padding:2px 6px;}.yui-skin-sam .yui-dt-paginator a.yui-dt-first,.yui-skin-sam .yui-dt-paginator a.yui-dt-last{text-decoration:none;}.yui-skin-sam .yui-dt-paginator .yui-dt-previous,.yui-skin-sam .yui-dt-paginator .yui-dt-next{display:none;}.yui-skin-sam a.yui-dt-page{border:1px solid #CBCBCB;padding:2px 6px;text-decoration:none;background-color:#fff}.yui-skin-sam .yui-dt-selected{border:1px solid #fff;background-color:#fff;}
</style>

<%				 
				 String newClassName="";
                 String classSize="";
                 String classHazardsId = "";
                 int ClassIndex =1;
                 String className = "yui-dt-even";
                 if(request.getAttribute("ClassListSize")!=null){                
                	 classSize = ""+request.getAttribute("ClassListSize");
                 }
 %>
 	<div>&nbsp;</div>
 	<div id="divideTabPolicy">
		<a href="javascript:void(0);" id="ClassSchedule" onclick="showClassList(this.id);" class="loctab_active left">	
		<div id="ClassListSize">Class List</div></a>
	</div>	
	
	<div  id="Loc3TableDataInPolicySide">
		<table border="0" width="100%" class="locformpages" cellspacing="0" cellpadding="0" class="" align="left">
			<tr><td width="100%" align="left">
		         <div id="ClassList1" class="locformbox1">
		         	<table class="yui-dt-table" cellspacing="0" cellpadding="0" width="100%">
        	<tr class="yui-dt">        	
        		<th  height="30" VALIGN='top' width="30%"><div class="yui-dt-liner"><p class="tableData">Class Name</p></div></th>
        		<th  height="30" VALIGN='top' width="60%"><div class="yui-dt-liner"><p class="tableData">Class Description</p></div></th>    		
        	</tr>
        	
        	<logic:present name='ClassListArray'>
        	<logic:iterate id="ClassListArray" name="ClassListArray" >
        		
        	   <bean:define id="newClassName1"  property="Object::Risk::Class::ClassName" name="ClassListArray" />
        	   <%  newClassName=""+newClassName1; %>
        	   <bean:define id="ClassDescription" name="ClassListArray" property="Object::Risk::Class::ClassDescription" />
        	   <bean:define id="ClassHazardsId"  property="Object::Risk::RiskId" name="ClassListArray" />
        	   <%classHazardsId=""+ClassHazardsId; %>
        	   <%String strClassDescription =""+ClassDescription; %>
        	   <tr class=<%=className%>>        	 
        	   		<td><div class="yui-dt-liner"><p class="tableData"><a href="javascript:void(0);" onclick="getClassInPolicySide('<%=ClassHazardsId%>','<%=newClassName %>')"><%=""+newClassName %></a></p></div></td>
        	   	   	<td><div class="yui-dt-liner"><p class="tableData"><%=strClassDescription %></p></div></td>
        	   </tr>
         	   <tr><td> <html:hidden property="answer(ClassHazardsId)" value='<%=classHazardsId %>' styleId="RiskIdForPopUp"/></td></tr>        	   
         	   <% if  (ClassIndex%2==0){
         		   	className = "yui-dt-even";
         	  	  }else{
         	  		  className ="yui-dt-odd";
         	  	  }
         	   %>
         	   <% ClassIndex = ClassIndex + 1; %>
         	   
        	</logic:iterate>
        	</logic:present>
         	<tr><td>&nbsp;</td></tr>
        </table>
	</div>
	</td></tr>
	</table>
	</div>	

	 <div id="AddClassDivInPolicySide" class="locformpages" style="clear:both;display:none;width:900px;">
		<div class="formpage4">
			<div class="content">
				<div class="formhead4"><h2 class="left">Class Hazards</h2></div>      
				<div id="AddClassDiv1"></div>
			</div>
		</div>		
	</div>
	<div id="benefitContent" class="todotab_yellowbox2" style="background-color:#fff;width:860px;both;border-top: #F0AA3A 1px solid;display:none;"></div>
			
	<logic:present name='ClassListArray'>
		<html:hidden property="answer(NewClassName)" value='<%=""+newClassName%>' styleId="newClassNameAssigned" />
	</logic:present>

	<logic:present name='ClassListSize'>
		<html:hidden property="answer(classSize)" value='<%=""+classSize%>' styleId="classSizeUpdated" />
		<html:hidden property="answer(classHazardsId)" value='<%=""+classHazardsId%>' styleId="riskIdUpdated" />		
	</logic:present>

		
	<script>

	</script>
	