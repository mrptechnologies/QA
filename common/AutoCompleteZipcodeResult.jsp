<%if(request.getAttribute("searchresultZipCode")!=null){java.util.ArrayList zipList = (java.util.ArrayList)request.getAttribute("searchresultZipCode");%>
<%="["%><%for(int i=0;i<zipList.size();i++){
com.dms.ejb.data.QuestionHashMap zipMzp = (com.dms.ejb.data.QuestionHashMap)zipList.get(i);
java.lang.String zip = zipMzp.getString("Object::ZipCode::ZipCode");
java.lang.String city1 = zipMzp.getString("Object::ZipCode::CityName1");
java.lang.String county = zipMzp.getString("Object::ZipCode::County");
java.lang.String stCode = zipMzp.getString("Object::ZipCode::StateCode");%>
<%="{\"Zipcode\":\""+zip+"\",\"City\":\""+city1+"\",\"State\":\""+stCode+"\",\"County\":\""+county+"\",\"Country\":"+"\"USA\"}"%>
<%if(i!=(zipList.size()-1)){%>,<%}%>
<%}%><%="]"%><%}%>
