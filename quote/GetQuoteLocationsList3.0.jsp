<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%String locationListSize="0"; 
String parentQuoteStatus = "";
String bgcolor = "";
String parentQuoteId = "";
String parentQuoteVerId = "";
%>
<%if(request.getAttribute("locationListArraySize") !=null) {
locationListSize = ""+request.getAttribute("locationListArraySize");
} 
if(request.getAttribute("locationListSize") !=null) {
	locationListSize = ""+request.getAttribute("locationListSize");
} 
if(request.getParameter("answer(Object::Quote::QuoteStatus)") !=null ){
	parentQuoteStatus = ""+request.getParameter("answer(Object::Quote::QuoteStatus)");
}
if(request.getParameter("answer(bgcolor)") !=null){
	 bgcolor = ""+request.getParameter("answer(bgcolor)");
}
if(request.getParameter("answer(Object::Quote::QuoteVerId)") !=null){
	parentQuoteVerId = request.getParameter("answer(Object::Quote::QuoteVerId)");
}
if(request.getParameter("answer(quoteId)") !=null){
	parentQuoteId = request.getParameter("answer(quoteId)");
}
%>

<div align="right">
<table border="0"  width="99%" id="table11"  cellspacing="0" cellpadding="0">
	<tr>
		<td>
	     <table border="0" cellpadding="0" cellspacing="0" id="table12">
	     <dmshtml:dms_isPresent negated="true" property="<%=new String[]{"In Progress","Referred"}%>" value="<%=parentQuoteStatus.toString()%>">														
	       <tr id="divide11" align="right">
	        <a href="javascript:void(0);" class="button2" style="width:100px" onclick="javascript:appendtable();">Add Location</a>
			</tr>
		</dmshtml:dms_isPresent>
		</table>
	   </td>        
	</tr>
</table>
</div>
<div align="left">
	<table border="0"   width="99%"  id="table2" cellspacing="0" cellpadding="0">
		<tr>
			<td>
     <table border="0"  cellpadding="0" cellspacing="0" id="table6">
       <tr id="divide1" align="left">
         <td   border="0" width="150px" cellspacing="0" cellpadding="0" class="todotab_active" height=35 id="LocationSchedule" onclick="javascript:showLocationList(this.id);">Location Schedule 
					(<%=""+locationListSize%>)
		</td>
				</tr>
			</table>
         </td>
        
        
       </tr>
     </table>
 	<div id="LocList"  align="left">
		<table border="0" width="99%"  id="table2" cellspacing="0" cellpadding="0">
		<tr>
			<td class="todotab_yellowbox tab_yellowborder" >

<div>&nbsp;</div>
				<form name="locationListForm" id="locationListFormId">
					<table border="0" cellpadding="5" cellspacing="0"  width="98%" class="datadispborder" align=center id="Loc3TableData" >
		               <tr>
		                 
		                 <td>
		                 	<div id="LocationList1" class="locformbox1"></div>
		                 </td>   
		               </tr>
		               
		                 
			            <tr>
			               	<td align="right" style="display:none" id="deleteLocButton">
			               		<a href="javascript:void(0)" onclick="deleteQuoteLocations(document.getElementById('locationListFormId'));" class="button2" style="width:100px">Delete</a>
			               	</td>
			               </tr>
		           </table>    
               </form>
			<p>&nbsp;
			</div></td>
		</tr>
		</table>
		</div>
		
	<div id="AddLocationDiv" style="display:none;background-color:<%=bgcolor%>;">
	<table border="0"  width="99%" id="table2" cellspacing="0" cellpadding="0">
	<tr>
		
		<td>
			<div class="formpage2">
          	<div class="content">
				<div class="formhead2"><h2 class="left">Add Location</h2></div>      
  					<h3>Location Information</h3>

				<div id="AddLocationDiv1" style="background-color:<%=bgcolor%>;" ></div>
			</div>
			</div>
		</td>
	</tr>	
	</table>
	</div>

	<div id="LocationAndTanksList" style="display:none;background-color:<%=bgcolor%>;"></div>
</div>
	