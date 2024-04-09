<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/dms-html.tld" prefix="dmshtml" %>
<table  cellspacing="0" cellpadding="0"  border="0" width="100%">	
	<%int i=0; %>
	<logic:present name="searchresultnewDisplay" scope="request">
	
	<logic:iterate id="qmap" name="searchresultnewDisplay" scope="request" type="com.dms.ejb.data.QuestionHashMap">	
	
	
	<%i++;
	if((i%2)==0){%>		
		<tr bgcolor="#F6F2F6"> 
  			<td  class="FormLabels" style="width:1px;" id="rowNum"><%=i%></td>
  			<td class="FormLabels" style="width:25px"><%=qmap.getString("Object::Entity::FirstName")%></td>
  			<td class="FormLabels" style="width:25px"><%=qmap.getString("Object::Entity::LastName")%></td>
  			<td class="FormLabels" style="width:10px"><%=qmap.getString("Object::AGENCY::AGENCYID")%></td>
  			<td class="FormLabels" style="width:120px"><%=qmap.getString("Object::AGENCY::BUSINESSNAME")%></td>
  			<td class="FormLabels" style="width:5px"><%=qmap.getString("Object::AGENCY::AddressState")%></td>
  			<td class="FormLabels" style="width:5px"><%=qmap.getString("Object::AGENCY::Status")%></td>
  			<td class="FormLabels" style="width:5px"> <input type="radio" name="answer(Agency::AgencyId)" value="<%=qmap.getString("Object::AGENCY::AGENCYID")+"::"+qmap.getString("Object::Entity::EntityId")%>"/> </td>
  		</tr>
  		<%}else{%>
  		<tr bgcolor="#FFFFFF"> 
  			<td class="FormLabels" style="width:1px;"  id="rowNum"><%=i%></td>
  			<td class="FormLabels" style="width:25px"><%=qmap.getString("Object::Entity::FirstName")%></td>
  			<td class="FormLabels" style="width:25px"><%=qmap.getString("Object::Entity::LastName")%></td>
  			<td class="FormLabels" style="width:10px"><%=qmap.getString("Object::AGENCY::AGENCYID")%></td>
  			<td class="FormLabels" style="width:160px"><%=qmap.getString("Object::AGENCY::BUSINESSNAME")%></td>
  			<td class="FormLabels" style="width:5px"><%=qmap.getString("Object::AGENCY::AddressState")%></td>
  			<td class="FormLabels" style="width:5px"><%=qmap.getString("Object::AGENCY::Status")%></td>
  			<td class="FormLabels" style="width:5px"> <input type="radio" name="answer(Agency::AgencyId)" value="<%=qmap.getString("Object::AGENCY::AGENCYID")+"::"+qmap.getString("Object::Entity::EntityId")%>"/> </td>
  		</tr> 		
  		<%}		
  		session.setAttribute("newLimit",""+i);
  		%>
  		  	
  		</logic:iterate>
  		<%for(int j=0;j<=10;j++){%>
  			<tr bgcolor="#FFFFFF"> 
  			<td class="FormLabels" style="width:1px;"  id="rowNum"><%=""%>&nbsp;</td>
  			<td class="FormLabels" style="width:25px"><%=""%>&nbsp;</td>
  			<td class="FormLabels" style="width:25px"><%=""%>&nbsp;</td>
  			<td class="FormLabels" style="width:10px"><%=""%>&nbsp;</td>
  			<td class="FormLabels" style="width:160px"><%=""%>&nbsp;</td>
  			<td class="FormLabels" style="width:5px"><%=""%>&nbsp;</td>
  			<td class="FormLabels" style="width:5px"><%=""%>&nbsp;</td>
  		</tr> 
  		<%}%>
  		</logic:present>
  		<logic:notPresent name="searchresultnewDisplay" scope="request">
  		<tr> 
  			<td class="FormLabels" style="width:1px;"> Results Found 0.</td>  			
  		</tr>
  		</logic:notPresent>
 </table> 