<%@page import="java.io.*, java.util.*, com.dms.rules.*, com.dms.rules.drools.*, com.util.*, java.sql.*, com.dms.ejb.data.*, com.dms.rules.util.*;"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
  "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Test Drools</title>
 
</head>
<body>
<h1>Test Drools</h1>
<div align="right"><a href="">Refresh Page</a></div>
<form method="get" action="">
	<table width="98%" style="{border-color: #3399FF; border-style: solid; border-width: 1px;}">
		<tr>
			<td width="10%">
				<input type="submit" name="reloadrulebase" value="Reload All Rulebases" onclick="javascript:this.disabled=true; document.forms[1].evaluate.disabled=true;">
			</td>
			<td width="40%">&nbsp;
			</td>
			<td width="50%" bgcolor="#99CCFF" nowrap align="right">
				<strong>Rulebase ID: </strong>
				<input id="rulebase_id" type="text" name="rulebase_id" size="3"/>&nbsp;&nbsp;
				<strong> Owner ID:</strong>
				<input id="owner_id" type="text" name="owner_id" size="3"/>&nbsp;&nbsp;
				<strong> Rule DataSource :</strong>
				<input id="ds_name" type="text" name="ds_name" size="20"/>&nbsp;&nbsp;
				
				<input type="submit" name="reloadthisrulebase" value="Reload this Rulebase"/>
			</td>
		</tr>
	</table>
	<%
		if(request.getParameter("reloadrulebase")!=null) {
			DroolsEngine drools = DroolsEngine.getInstance();
			String dsName = request.getParameter("ds_name");
			 
			 
			Connection con = null;
			try {
			 dbCon dcon = new dbCon();
			 con = dcon.getConnection("java:/rules/"+dsName);
			 drools.loadAllActiveRules(con);
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if(con!= null) {
					con.close();
				}
			}
		}
		boolean success = false;
		if(request.getParameter("reloadthisrulebase")!=null) {
			DroolsEngine drools = DroolsEngine.getInstance();
			Connection con = null;
			String dsName = request.getParameter("ds_name");
			long rulebaseId = 0;
			long ownerId=0;
			try {
			 dbCon dcon = new dbCon();
			 con = dcon.getConnection("java:/rules/"+dsName);
			 String strRulebaseId = request.getParameter("rulebase_id");
			 rulebaseId = Long.parseLong(strRulebaseId);
			 String strOwnerId = request.getParameter("owner_id");
			 ownerId = Long.parseLong(strOwnerId);
			 
			 success = drools.loadRule(rulebaseId,ownerId, con);
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if(con!= null) {
					con.close();
				}
			}
			if(success) { %>
			    <span id="messageHolder" style="{background:#FFCC33; color:#000000; font: bold 10px tahoma; width:400px;}">
			    	Rules were loaded successfully!
			    </span> <%
			} else { %>
			    <span id="messageHolder" style="{background:#FFCC33; color:#000000; font: bold 10px tahoma; width:400px;}">
			    	Rules could not be loaded.
			    </span><%
			}
		}

	%>
</form>
<form method="post" action="">
<table width="98%" bgcolor="#CCCCCC">
	<tr><th>Rule Group:</th><td><input type="text" name="ruleGroup"/></td></tr>
	<tr><th>Object ID</th><td><input type="text" name="objet_id" value="1"/></td></tr>
	<tr><th>Object Ver ID</th><td><input type="text" name="objet_ver_id" value="1"/></td></tr>
	<tr><th>Object Type</th><td><input type="text" name="objet_type"/></td></tr>
	<tr><th>Object Name</th><td><input type="text" name="objet_name"/></td></tr>

<tr>
	<th colspan="2">Please input your input facts as 'Key=Value' pairs, each pair on a new line</th>
</tr>
<tr>
	<td colspan="2" align="center"><textarea name="data" rows="10" cols="100"></textarea></td>
</tr>
<tr>
	<td  colspan="2" align="center"><input id="evaluate" type="submit" value="Evaluate"></td>
</tr>
</table>
</form>

<%
	if(request.getParameter("data")!=null && request.getParameter("data").length() > 0) {
		String inputString = request.getParameter("data");
		BufferedReader br = new BufferedReader(new StringReader(inputString));
		String line;
		QuestionHashMap factMap = new QuestionHashMap();
		%>
			<h3>Parameters Passes into FactMap before executing Rules</h3>
			<table width="50%" border="1">
			<tr><th bgcolor="#CCCCFF">Key</th><td bgcolor="#CCCCFF">Value</td></tr>
		<%
		while ( (line = br.readLine()) != null ) {
			if ( line.trim().length() == 0 || line.trim().startsWith( ";" ) ) {
				continue;
			}
			StringTokenizer st = new StringTokenizer(line, "=");
			String key = "";
			if(st.hasMoreTokens()) {
				key = st.nextToken().trim();
			}
			String value = "";
			if(st.hasMoreTokens()) {
				value = st.nextToken().trim();
			}
			if(key.length()>0) {
				factMap.put(key, value);
			}
			%>
			<tr><td><%=key%></td><td><%="&nbsp;"+value%></td></tr>
			<%
		}
		%>
		</table>
		<hr/>
		<%
		Connection con = null;
		try {
			dbCon dcon = new dbCon();
			con = dcon.getConnection("java:/rules/AllrisksRulesDS");
			String ruleGroup = request.getParameter("ruleGroup");
			long objet_id = Long.parseLong(request.getParameter("objet_id"));
			long objet_ver_id = Long.parseLong(request.getParameter("objet_ver_id"));
			String objet_type = request.getParameter("objet_type");
			String objet_name = request.getParameter("objet_name");
			if(ruleGroup.equals("")) {
			    ruleGroup = null;
			}
			System.out.println("RULE GROUP = "+ruleGroup);
			factMap = RuleUtilities.executeRules(factMap, ruleGroup, objet_id, objet_ver_id,
				objet_type, objet_name, 5, con);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(con!= null) {
				con.close();
			}
		}
		Object ruleStatusObj = factMap.get(IRulesEngineClient.RULE_STATUS);
		if(ruleStatusObj instanceof RuleStatus) { // Drools
		    RuleStatus ruleStatus = (RuleStatus)ruleStatusObj;
		    ArrayList messageList = ruleStatus.getMessageList();
			String tmpForward = ruleStatus.getStatus();
			%>
			<p>
			<b>STATUS</b> = <%=tmpForward%>
			<p>
			<b>Messages:</b><ol>
			<%
			for (Iterator it = messageList.iterator(); it.hasNext(); ) {
				%>
				<li><%=it.next()%></li>
				<%
			}
			%></ol>
			<hr/>
			<h3>FactMap Values after executing Rules:</h3>
			<table width="50%" border="1">
			<tr><th bgcolor="#CCCCFF">Key</th><td bgcolor="#CCCCFF">Value</td></tr>
			<%
		}
		Set keySet = factMap.keySet();
		for(Iterator qIt = keySet.iterator(); qIt.hasNext();) {
			String qKey = qIt.next().toString();
			String qValue = factMap.getString(qKey);
				%>
				<tr><td><%=qKey%></td><td><%="&nbsp;"+qValue%></td></tr>
				<%
		}
		%></table><%
	} else {
		%>
		NO PARAMS.
		<%
	}
%>
<br/><br/>
</body>
</html>