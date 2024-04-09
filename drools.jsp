<%@ page import="java.util.*, com.dms.rules.drools.*, com.util.*, java.sql.*, com.dms.ejb.data.*;" %>
<html>
<head>
	<title>WOWO</title>
</head>
<body>
<h1>Hi Drools</h1>
<%
	DroolsEngine drools = DroolsEngine.getInstance();
	Connection con = null;
	try {
	 dbCon dcon = new dbCon();
	 con = dcon.getConnection("java:/rules/drools");
	 drools.loadAllActiveRules(con);
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		if(con!= null) {
			con.close();
		}
	}

/*
	DroolsClient client = new DroolsClient();
	QuestionHashMap factListMap = new QuestionHashMap();
	ArrayList arr =  new ArrayList();
	arr.add("ONE");
	arr.add("TWO");

	ArrayList arrQhm = new ArrayList();
	QuestionHashMap intQMap = new QuestionHashMap();
	intQMap.put("TRY","Trial String");
	arrQhm.add(intQMap);

	factListMap.put("ArrA", arr);
	factListMap.put("ArrQ", arrQhm);

	QuestionHashMap outerMap = new QuestionHashMap();
	outerMap.put("DROOLS_FACTLIST_MAP", factListMap);
	String str = "";
	try {
		str = (client.executeRules(1, outerMap)).toString();
	} catch(Exception e) {
		out.println(e.getMessage());
	}
	*/
%>
<!--%=str%-->

</body>
</html>