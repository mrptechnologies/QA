<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<h3 style="margin:20px 0 0px 0px;">Schedule Of Aircraft</h3>


<%response.setHeader("Cache-Control", "no-store");%>
<%System.out.println("Entered"); %>
<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<bean:define id="AircraftRiskId" property="answer(Object::Quote::AircraftRiskId)" name="LoginPage" scope="session" />
<bean:define id="parentQuoteId" name="QuoteDetail" property="answer(parentQuoteId)" scope="request" />
<bean:define id="customerId" name="QuoteDetail" property="answer(Object::Customer::CustomerId)" scope="request" />
<bean:define id="paretQuoteVerId" name="QuoteDetail" property="answer(quoteVerId)"/>
<html:hidden property="answer(Object::UserDetail::ownerId)" styleId="ownerId1" value= '<%=""+ownerId %>'/>
<bean:define id="paretQuoteStatus" name="QuoteDetail" property="answer(Object::Quote::QuoteStatus)" />
<bean:define id="policyNumber" name="QuoteDetail" property="answer(policyNumber)" />
<bean:define id="parentPolicyId" name="QuoteDetail" property="answer(Object::Policy::ParentPolicyId)" />
<bean:define id="parentPolicyVerId" name="QuoteDetail" property="answer(Object::Policy::ParentPolicyVerId)" />
<script type="text/javascript" src="../Scripts/JScripts/AddOrEditAircraft.js"></script>
<style type="text/css">
  .tableData{line-height:17px;text-align:left;margin:0;padding:0;font-weight:bold;}
  .yui-skin-sam .yui-dt-mask{position:absolute;z-index:9500;}.yui-dt-tmp{position:absolute;left:-9000px;}.yui-dt-scrollable .yui-dt-bd{overflow:auto;}.yui-dt-scrollable .yui-dt-hd{overflow:hidden;position:relative;}.yui-dt-scrollable .yui-dt-bd thead tr,.yui-dt-scrollable .yui-dt-bd thead th{position:absolute;left:-1500px;}.yui-dt-scrollable tbody{-moz-outline:none;}.yui-dt-draggable{cursor:move;}.yui-dt-coltarget{position:absolute;z-index:999;}.yui-dt-hd{zoom:1;}th.yui-dt-resizeable .yui-dt-resizerliner{position:relative;}.yui-dt-resizer{position:absolute;right:0;bottom:0;height:100%;cursor:e-resize;cursor:col-resize;background-color:#CCC;opacity:0;filter:alpha(opacity=0);}.yui-dt-resizerproxy{visibility:hidden;position:absolute;z-index:9000;}th.yui-dt-hidden .yui-dt-liner,td.yui-dt-hidden .yui-dt-liner,th.yui-dt-hidden .yui-dt-resizer{display:none;}.yui-dt-editor{position:absolute;z-index:9000;}.yui-skin-sam .yui-dt table{margin:0;padding:0;font-family:arial;font-size:inherit;border-collapse:separate;*border-collapse:collapse;border-spacing:0;border:1px solid #7F7F7F;}.yui-skin-sam .yui-dt thead{border-spacing:0;}.yui-skin-sam .yui-dt caption{color:#000000;font-size:85%;font-weight:normal;font-style:italic;line-height:1;padding:1em 0pt;text-align:center;}.yui-skin-sam .yui-dt th{background:#D8D8DA url(sprite.png) repeat-x 0 0;}.yui-skin-sam .yui-dt th,.yui-skin-sam .yui-dt th a{font-weight:normal;text-decoration:none;color:#000;vertical-align:bottom;}.yui-skin-sam .yui-dt th{margin:0;padding:0;border:none;border-right:1px solid #CBCBCB;}.yui-skin-sam .yui-dt tr.yui-dt-first td{border-top:1px solid #7F7F7F;}.yui-skin-sam .yui-dt th .yui-dt-liner{white-space:nowrap;}.yui-skin-sam .yui-dt-liner{margin:0;padding:0;padding:4px 10px 4px 10px;}.yui-skin-sam .yui-dt-coltarget{width:5px;background-color:red;}.yui-skin-sam .yui-dt td{margin:0;padding:0;border:none;border-right:1px solid #CBCBCB;text-align:left;}.yui-skin-sam .yui-dt-list td{border-right:none;}.yui-skin-sam .yui-dt-resizer{width:6px;}.yui-skin-sam .yui-dt-mask{background-color:#000;opacity:.25;*filter:alpha(opacity=25);}.yui-skin-sam .yui-dt-message{background-color:#FFF;}.yui-skin-sam .yui-dt-scrollable table{border:none;}.yui-skin-sam .yui-dt-scrollable .yui-dt-hd{border-left:1px solid #7F7F7F;border-top:1px solid #7F7F7F;border-right:1px solid #7F7F7F;}.yui-skin-sam .yui-dt-scrollable .yui-dt-bd{border-left:1px solid #7F7F7F;border-bottom:1px solid #7F7F7F;border-right:1px solid #7F7F7F;background-color:#FFF;}.yui-skin-sam .yui-dt-scrollable .yui-dt-data tr.yui-dt-last td{border-bottom:1px solid #7F7F7F;}.yui-skin-sam thead .yui-dt-sortable{cursor:pointer;}.yui-skin-sam th.yui-dt-asc,.yui-skin-sam th.yui-dt-desc{background:url(sprite.png) repeat-x 0 -100px;}.yui-skin-sam th.yui-dt-sortable .yui-dt-label{margin-right:10px;}.yui-skin-sam th.yui-dt-asc .yui-dt-liner{background:url(dt-arrow-up.png) no-repeat right;}.yui-skin-sam th.yui-dt-desc .yui-dt-liner{background:url(dt-arrow-dn.png) no-repeat right;}tbody .yui-dt-editable{cursor:pointer;}.yui-dt-editor{text-align:left;background-color:#F2F2F2;border:1px solid #808080;padding:6px;}.yui-dt-editor label{padding-left:4px;padding-right:6px;}.yui-dt-editor .yui-dt-button{padding-top:6px;text-align:right;}.yui-dt-editor .yui-dt-button button{background:url(sprite.png) repeat-x 0 0;border:1px solid #999;width:4em;height:1.8em;margin-left:6px;}.yui-dt-editor .yui-dt-button button.yui-dt-default{background:url(sprite.png) repeat-x 0 -1400px;background-color:#5584E0;border:1px solid #304369;color:#FFF}.yui-dt-editor .yui-dt-button button:hover{background:url(sprite.png) repeat-x 0 -1300px;color:#000;}.yui-dt-editor .yui-dt-button button:active{background:url(sprite.png) repeat-x 0 -1700px;color:#000;}.yui-skin-sam tr.yui-dt-even{background-color:#FFF;}.yui-skin-sam tr.yui-dt-odd{background-color:#EDF5FF;}.yui-skin-sam tr.yui-dt-even td.yui-dt-asc,.yui-skin-sam tr.yui-dt-even td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam tr.yui-dt-odd td.yui-dt-asc,.yui-skin-sam tr.yui-dt-odd td.yui-dt-desc{background-color:#DBEAFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even{background-color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-odd{background-color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-desc{background-color:#EDF5FF;}.yui-skin-sam th.yui-dt-highlighted,.yui-skin-sam th.yui-dt-highlighted a{background-color:#B2D2FF;}.yui-skin-sam tr.yui-dt-highlighted,.yui-skin-sam tr.yui-dt-highlighted td.yui-dt-asc,.yui-skin-sam tr.yui-dt-highlighted td.yui-dt-desc,.yui-skin-sam tr.yui-dt-even td.yui-dt-highlighted,.yui-skin-sam tr.yui-dt-odd td.yui-dt-highlighted{cursor:pointer;background-color:#B2D2FF;}.yui-skin-sam .yui-dt-list th.yui-dt-highlighted,.yui-skin-sam .yui-dt-list th.yui-dt-highlighted a{background-color:#B2D2FF;}.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted,.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-highlighted td.yui-dt-desc,.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-highlighted,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-highlighted{cursor:pointer;background-color:#B2D2FF;}.yui-skin-sam th.yui-dt-selected,.yui-skin-sam th.yui-dt-selected a{background-color:#446CD7;}.yui-skin-sam tr.yui-dt-selected td,.yui-skin-sam tr.yui-dt-selected td.yui-dt-asc,.yui-skin-sam tr.yui-dt-selected td.yui-dt-desc{background-color:#426FD9;color:#FFF;}.yui-skin-sam tr.yui-dt-even td.yui-dt-selected,.yui-skin-sam tr.yui-dt-odd td.yui-dt-selected{background-color:#446CD7;color:#FFF;}.yui-skin-sam .yui-dt-list th.yui-dt-selected,.yui-skin-sam .yui-dt-list th.yui-dt-selected a{background-color:#446CD7;}.yui-skin-sam .yui-dt-list tr.yui-dt-selected td,.yui-skin-sam .yui-dt-list tr.yui-dt-selected td.yui-dt-asc,.yui-skin-sam .yui-dt-list tr.yui-dt-selected td.yui-dt-desc{background-color:#426FD9;color:#FFF;}.yui-skin-sam .yui-dt-list tr.yui-dt-even td.yui-dt-selected,.yui-skin-sam .yui-dt-list tr.yui-dt-odd td.yui-dt-selected{background-color:#446CD7;color:#FFF;}.yui-skin-sam .yui-dt-paginator{display:block;margin:6px 0;white-space:nowrap;}.yui-skin-sam .yui-dt-paginator .yui-dt-first,.yui-skin-sam .yui-dt-paginator .yui-dt-last,.yui-skin-sam .yui-dt-paginator .yui-dt-selected{padding:2px 6px;}.yui-skin-sam .yui-dt-paginator a.yui-dt-first,.yui-skin-sam .yui-dt-paginator a.yui-dt-last{text-decoration:none;}.yui-skin-sam .yui-dt-paginator .yui-dt-previous,.yui-skin-sam .yui-dt-paginator .yui-dt-next{display:none;}.yui-skin-sam a.yui-dt-page{border:1px solid #CBCBCB;padding:2px 6px;text-decoration:none;background-color:#fff}.yui-skin-sam .yui-dt-selected{border:1px solid #fff;background-color:#fff;}
</style>
<%				 
	 String Year="";
     String AircraftSize="";
     String quoteId1="";
     if(request.getAttribute("AircraftListSize")!=null){                
    	 AircraftSize = ""+request.getAttribute("AircraftListSize");
     }
     int Number = 1;
 %>
<% String TabId= ""+request.getParameter("answer(activateTabId)");%>

         		
 <html:form action="/DeleteAircraft.do?answer(activateTabId)=AircraftSchedule&answer(DeleteAircraft)=Y" scope="request">
  	<div class="classformpage" style="padding:4px;border:0px solid #000;background:inherit;">
		<div class="locformbox1">        
		  <table class="yui-dt-table" cellspacing="0" cellpadding="0" width="100%">
        	<tr class="yui-dt">
        		<th  height="30" VALIGN='top' width="10%"><div class="yui-dt-liner"><p class="tableData">Number</p></div></th>
        		<th  height="30" VALIGN='top' width="10%"><div class="yui-dt-liner"><p class="tableData">Year</p></div></th>
        		<th  height="30" VALIGN='top' width="10%"><div class="yui-dt-liner"><p class="tableData">Make</p></div></th>    		
    		    <th  height="30" VALIGN='top' width="10%"><div class="yui-dt-liner"><p class="tableData">Model</p></div></th>    		
    		    <th  height="30" VALIGN='top' width="20%"><div class="yui-dt-liner"><p class="tableData">Serial Number</p></div></th>
    		    <th  height="30" VALIGN='top' width="10%"><div class="yui-dt-liner"><p class="tableData">Crew Seats</p></div></th>
    		    <th  height="30" VALIGN='top' width="20%"><div class="yui-dt-liner"><p class="tableData">Passenger Seats</p></div></th>
    		    <th  height="30" VALIGN='top' width="10%"><div class="yui-dt-liner"><p class="tableData">Select</p></div></th>
        	</tr>
        	<logic:present name='AircraftListArray'>
        	<logic:iterate id="AircraftListArray" name="AircraftListArray" >
        	   <bean:define id="newYear1"  property="Object::Quote::Year" name="AircraftListArray" />
        	   <%  Year=""+newYear1; %>
        	   <bean:define id="Make" name="AircraftListArray" property="Object::Quote::Make" />
        	   <%String strMake =""+Make; %>
        	   <bean:define id="Model" name="AircraftListArray" property="Object::Quote::Model" />
        	   <%String strModel =""+Model; %>
        	   <bean:define id="SerialNumber" name="AircraftListArray" property="Object::Quote::SerialNumber" />
        	   <%String strSerialNumber =""+SerialNumber; %>
        	   <bean:define id="CrewSeats" name="AircraftListArray" property="Object::Quote::CrewSeats" />
        	    <bean:define id="AircraftRiskId" name="AircraftListArray" property="Object::Quote::AircraftRiskId" />
        	   <%String strCrewSeats =""+CrewSeats; %>
        	   <bean:define id="PassengerSeats" name="AircraftListArray" property="Object::Quote::PassengerSeats" />
        	   <%String strPassengerSeats =""+PassengerSeats; %>
        	   <bean:define id="NewQuoteId"  property="Object::Quote::QuoteId" name="AircraftListArray" />
        	   
        	   <div id="RiskPopUp1" style="display:none;">
					<div class="hd" id="containerheading"></div>
					<div class="Applicationpage2">
					<div class="bd" id="RiskPopUpBody1"></div>
					</div>
					<a class="container-close" href="javascript:void(0);" id="closeIcon2"></a>
				</div>
				
        	   <%quoteId1=""+NewQuoteId; %>
 	           	    <tr class="yui-dt-even">
              	   	<td><div class="yui-dt-liner"><p class="tableData"><a href="javascript:void(0);" onclick="getEditAircraftWindow('<%=""+AircraftRiskId%>')"><%=Number %></a></p></div></td>
               		<td><div class="yui-dt-liner"><p class="tableData"><a href="javascript:void(0);" onclick="getEditAircraftWindow('<%=""+AircraftRiskId%>')"><%=Year %></a></p></div></td>
        	   	   	<td><div class="yui-dt-liner"><p class="tableData"><%=strMake %></p></div></td>
        	   	   	<td><div class="yui-dt-liner"><p class="tableData"><%=strModel %></p></div></td>
        	   	   	<td><div class="yui-dt-liner"><p class="tableData"><%=strSerialNumber %></p></div></td>
        	   	   	<td><div class="yui-dt-liner"><p class="tableData"><%=strCrewSeats %></p></div></td>
        	   	   	<td><div class="yui-dt-liner"><p class="tableData"><%=strPassengerSeats %></p></div></td>
        	   	   	<td>
        	   	   	<div class="yui-dt-liner">
        	   	   	<p class="tableData">
        	   	   	<html:checkbox property="answer(Object::Quote::Check)" name="QuoteDetail" value="<%=""+AircraftRiskId %>"/>
        	   	   	</p>
        	   	   	</div>
        	   	   	</td>	
        	   	</tr>
        	   	<% Number = Number +1; %>      	   
        		</logic:iterate>
        		</logic:present>
      		   	<tr><td>&nbsp;</td></tr>
         	</tr>
         </table>
      </div>
      
<%
if(paretQuoteStatus!=null){
if(paretQuoteStatus.equals("In Progress"))
{
%>
	<table> 
		<tr>
     		<td align="right">						
     		<div style="width:900px;">
     			<html:submit value="Delete" style="float:right;" styleClass="covbutton" onclick="return confirmDelete(this.form);"/>     			
     			<input type="button" style="float:right;" class="covbutton" value="Add" onclick="LoadNewQuoteAddEditAircraft('<%=TabId%>')"/>
     		</div>
     		</td>
     	</tr>
</table>
<%}}%>
</div>

		<logic:present name='AircraftListArray'>
		<html:hidden property="answer(Year)" value='<%=""+Year%>' styleId="year" />
		</logic:present>

		<logic:present name='AircraftListSize'>
		<html:hidden property="answer(aircraftSize)" value='<%=""+AircraftSize%>' styleId="aircraftSizeUpdated" />
		</logic:present>
		<html:hidden property="answer(customerId)" value='<%=""+customerId%>' styleId="customerId" />
		
		<html:hidden property="answer(QuoteId)" value='<%=""+parentQuoteId%>' />
		<html:hidden property="answer(parentQuoteId)" value='<%=""+parentQuoteId%>' />	
		<html:hidden property="answer(Object::UserDetail::OwnerId)" value="<%=ownerId.toString()%>" /> 
		<html:hidden property="answer(parentQuoteVerId)" value="<%=paretQuoteVerId.toString()%>" />   
		<html:hidden property="answer(Object::Quote::AircraftRiskId)" value="<%=AircraftRiskId.toString()%>" />	
		<html:hidden property="answer(DeleteAircraft)" value="Y" />	
		<html:hidden property="answer(policyNumber)" value="<%=""+policyNumber%>" />
		<html:hidden property="answer(Object::Policy::ParentPolicyId)" value="<%=""+parentPolicyId%>" />
		<html:hidden property="answer(Object::Policy::ParentPolicyVerId)" value="<%=""+parentPolicyVerId%>" />	
		<html:hidden property="answer(openTabAPolicyInfo)" value="openTabAircraftScheduleY" />				
		</html:form>

		
		
		
		