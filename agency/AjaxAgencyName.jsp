<%if(request.getAttribute("searchresultnewDisplay")!=null){
	
	java.util.ArrayList classcodeList = (java.util.ArrayList)request.getAttribute("searchresultnewDisplay");
	%>
<%="["%>
<%for(int i=0;i<classcodeList.size();i++){
com.dms.ejb.data.QuestionHashMap classCodeResultMap = (com.dms.ejb.data.QuestionHashMap)classcodeList.get(i);
java.lang.String agencyName = classCodeResultMap.getString("Object::AGENCY::BUSINESSNAME");
java.lang.String agencyId = classCodeResultMap.getString("Object::AGENCY::AGENCYID");
%>
<%="{\"AgencyName\":\""+agencyName+"\",\"AgencyIdRes\":\""+agencyId+"\"}"%>
<%if(i!=(classcodeList.size()-1)){%>,<%}%>
<%}
%>
<%="]"%>
<%}%>