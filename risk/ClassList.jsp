<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>

<%response.setHeader("Cache-Control", "no-store");%>
<%System.out.println("Entered"); %>



<bean:define id="ownerId" property="answer(Object::UserDetail::ownerId)" name="LoginPage" scope="session" />
<html:hidden property="answer(Object::UserDetail::ownerId)" styleId="ownerId1" value= '<%=""+ownerId %>'/>
<bean:parameter name="answer(Object::Submission::SubmissionStatus)" id="SubmissionStatus" />

<style type="text/css">
  .tableHeader{	border:1px solid #4E4E50;}
  .tableData{line-height:17px;text-align:left;margin:0;padding:0;font-weight:bold;}
  .yui-dt th {border-color:-moz-use-text-color #CBCBCB -moz-use-text-color -moz-use-text-color;border-style:none solid none none;border-width:medium 1px medium medium;margin:0;	padding:0;color:#000000;font-weight:normal;text-decoration:none;vertical-align:bottom;background:#D8D8DA;border-collapse:separate;border-spacing:0;font-family:arial;font-size:inherit;}
  .yui-dt-table {border:1px solid #7F7F7F;border-collapse:separate;border-spacing:0;font-family:arial;font-size:inherit;margin:0;padding:0;}
</style>


<%String subStatus = ""+SubmissionStatus; %>
<%				 
				 String newClassName="";
                 String classSize="";
                 String riskId1 = "";
                 if(request.getAttribute("ClassListSize")!=null){                
                	 classSize = ""+request.getAttribute("ClassListSize");
                 }
 %>
 <br/><br/>
 	<logic:present name='ClassListArray'>
        	<logic:iterate id="ClassListArray1" name="ClassListArray" >
        	   <bean:define id="newClassName1"  property="Object::Risk::Class::ClassName" name="ClassListArray1" />
        	   <%  newClassName=""+newClassName1; %>
        	 
        	   <bean:define id="NewRiskId"  property="Object::Risk::RiskId" name="ClassListArray1" />
        	   <%riskId1=""+NewRiskId; %>
        	   
        	   	   
        	</logic:iterate>
        	</logic:present>
 	<table  style="border:0px solide #000;" cellspacing="0" cellpadding="0">
 	<tr><td width="95%" class="classformpage">
  	<div class="classformpage" style="border: medium none;">
  	<table cellspacing="0" style="border:0px solide #000;" cellpadding="0" width="100%">
  	<tr><td>
  	
  	<div id="divideTabs">
  	<a href="javascript:void(0);" id="classInformation" onclick="getEditClassPopUp('<%=riskId1%>');activateClassTabs(this.id);" class="loctab_active left">	
		<div id="classInformation">Class Information</div></a>
	
	
  	<a href="javascript:void(0);" onclick="document.getElementById('ActiveTab').value='ClassHazardsTab';showClassHazardTab('<%=riskId1%>',this.id)" class="loctab_inactive left" id="classHazardsQuestion" ><div id="classHazardQuestion1">Hazards Question</div></a>

	
  	<a href="javascript:void(0);" onclick="showDerivedHazardTab('<%=riskId1%>',this.id)" class="loctab_inactive left" id="classHazardsList" ><div id="classHazardList1">Hazards List</div></a>
</div>
	</td>
	
	</tr>
	<tr><td>
	
	<div id="classContent" class="locformbox1" style="border:none;display:none">        
	
	  <table class="yui-dt-table" cellspacing="0" cellpadding="0" width="100%">
        	<tr class="yui-dt">        		
        		<th  height="30" VALIGN='top' width="30%"><div class="yui-dt-liner"><p class="tableData">Class Name</p></div></th>
        		<th  height="30" VALIGN='top' width="70%"><div class="yui-dt-liner"><p class="tableData">Class Description</p></div></th>   		
        	</tr>
        	<logic:present name='ClassListArray'>
        	<logic:iterate id="ClassListArray" name="ClassListArray" >
        	   <bean:define id="newClassName1"  property="Object::Risk::Class::ClassName" name="ClassListArray" />
        	   <%  newClassName=""+newClassName1; %>
        	   <bean:define id="ClassDescription" name="ClassListArray" property="Object::Risk::Class::ClassDescription" />
        	   <bean:define id="NewRiskId"  property="Object::Risk::RiskId" name="ClassListArray" />
        	   <%riskId1=""+NewRiskId; %>
        	   <%String strClassDescription =""+ClassDescription; 
        	   strClassDescription = strClassDescription.replaceAll("\n","<BR>");
        	   %>
        	   <tr class="yui-dt-even">        	   		
        	   		<td><div class="yui-dt-liner"><p class="tableData"><a href="javascript:void(0);" onclick="getEditClassPopUp()"><%=""+newClassName %></a></p></div></td>
        	   	   	<td><div class="yui-dt-liner"><p class="tableData"><%=strClassDescription %></p></div></td>
        	   </tr>
         	   <tr><td> <html:hidden property="answer(RiskClassId)" value='<%=riskId1 %>' styleId="RiskIdForPopUp"/></td></tr>        	   
        	</logic:iterate>
        	</logic:present>
         	<tr><td>&nbsp;</td></tr>

     </table>
	</div>
	</td></tr>
	<tr><td>
	<div id="hazardContent" class="todotab_yellowbox2" style="background-color:#fff;border-top: #F0AA3A 1px solid;display:none;"></div>    
	</td></tr>
	<tr><td>
	<div id="submissionDialog" class="todotab_yellowbox2" style="background-color:#fff;border-top: #F0AA3A 1px solid;display:none;"></div>    
	</td></tr>
	<tr><td>
	<div id="benefitContent" class="todotab_yellowbox2" style="background-color:#fff;border-top: #F0AA3A 1px solid;display:none;"></div>    
	</td></tr>   
	</table>
    </div>
    </td></tr>
    </table>

		 <% if(request.getAttribute("SubmissionVerIdUpdated")!=null){

				String submissionVerId = ""+request.getAttribute("SubmissionVerIdUpdated"); %>
				<html:hidden property="answer(Object::Submission::SubmissionVerId)" value='<%=""+submissionVerId%>' styleId="newSubmissionVerId" />
		<% }%>
		
		<logic:present name='ClassListArray'>
		<html:hidden property="answer(NewClassName)" value='<%=""+newClassName%>' styleId="newClassNameAssigned" />
		</logic:present>

		<logic:present name='ClassListSize'>
		<html:hidden property="answer(classSize)" value='<%=""+classSize%>' styleId="classSizeUpdated" />
		<html:hidden property="answer(riskId)" value='<%=""+riskId1%>' styleId="riskIdUpdated" />		
		</logic:present>
		

		
		
		
		