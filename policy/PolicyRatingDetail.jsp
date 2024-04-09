<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml"%>


<table cellspacing="4" cellpadding="4" border="0" align="left" width="100%">

	<tbody>
		<tr><td></td></tr>
		<tr>
			<td align="center" class="sectionhead">No</td>
			<td align="center" class="sectionhead">Location No</td>
			<td align="center" class="sectionhead">Tank No</td>
			<td align="center" class="sectionhead">Location Name</td>
			<td align="center" class="sectionhead">Tank Name/ID</td>
			<td align="center" class="sectionhead">Tank Type</td>
			<td align="center" class="sectionhead">Deductible</td>
			<td align="center" class="sectionhead">Retro Date</td>
			<td align="center" class="sectionhead">Anniversary Date</td>
			<td align="center" class="sectionhead">Calc Premium</td>
			<td align="center" class="sectionhead">Override?</td>
			<td align="center" class="sectionhead">Tank Premium</td>
			
		</tr>

<%java.util.ArrayList tanklist=(java.util.ArrayList)request.getAttribute("tankListArray") ;
for(int i=0; i<tanklist.size(); i++){
	com.dms.ejb.data.QuestionHashMap tankMap=(com.dms.ejb.data.QuestionHashMap)tanklist.get(i);
	String isOverride = tankMap.getString("Object::Policy::Location::Tank::IsOverride");
	String isOverrideValue = "";
	if(isOverride.equalsIgnoreCase("Y")){
		isOverrideValue="Yes";
	}
	else if(isOverride.equalsIgnoreCase("N")){
		isOverrideValue="No";
	}
		
	
	%>		
	<tr>
	<td align="center"><%= i+1%></td>
	<td align="center"><%= tankMap.getString("Object::Policy::Location::Tank::LocationNumber")%></td>		
	<td align="center"><%= tankMap.getString("Object::Policy::Location::Tank::RiskNum")%></td>	
	<td align="center"><%= tankMap.getEncodedString("Object::Policy::Location::Tank::LocationName")%></td>	
	<td align="center"><%= tankMap.getEncodedString("Object::Policy::Location::Tank::RiskName")%></td>
	<td align="center"><%= tankMap.getString("Object::Policy::Location::Tank::RiskType")%></td>
	<td align="center"><dmshtml:CurrencyFormatTag format="<%= tankMap.getString("Object::Policy::Location::Tank::Deductible")%>"/></td>
	<td align="center"><%= tankMap.getString("Object::Policy::Location::Tank::RequestedRetroDate")%></td>
	<td align="center"><%= tankMap.getString("Object::Policy::Location::Tank::AnniversaryDate")%></td>
	<td align="center"><dmshtml:CurrencyFormatTag format="<%= tankMap.getString("Object::Policy::Location::Tank::SubTotalPremium")%>"/></td>
	<td align="center"><%=""+isOverrideValue%></td>
	<td align="center"  style=<%if(isOverrideValue.toString().equalsIgnoreCase("Yes")){%>"color:red !important"<%} %>><dmshtml:CurrencyFormatTag format="<%= tankMap.getString("Object::Policy::Location::Tank::OverridedPremium")%>"/></td>							
	</tr>	
	

<%	
}
%>
