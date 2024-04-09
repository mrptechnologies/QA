<%if(request.getAttribute("searchresultSICCode")!=null){java.util.ArrayList sicList = (java.util.ArrayList)request.getAttribute("searchresultSICCode");%>
<%="["%><%for(int i=0;i<sicList.size();i++){
com.dms.ejb.data.QuestionHashMap sicResultMap = (com.dms.ejb.data.QuestionHashMap)sicList.get(i);
java.lang.String sicCode = sicResultMap.getString("Object::CustomerAdditional::SicCode");
java.lang.String sicDivision = sicResultMap.getString("Object::CustomerAdditional::SicDivision");
java.lang.String sicGroup = sicResultMap.getString("Object::CustomerAdditional::SicGroup");
java.lang.String sicIndustry = sicResultMap.getString("Object::CustomerAdditional::SicIndustry");%>
<%="{\"Siccode\":\""+sicCode+"\",\"SicDivision\":\""+sicDivision+"\",\"SicGroup\":\""+sicGroup+"\",\"SicIndustry\":\""+sicIndustry+"\"}"%>
<%if(i!=(sicList.size()-1)){%>,<%}%>
<%}%><%="]"%><%}%>
