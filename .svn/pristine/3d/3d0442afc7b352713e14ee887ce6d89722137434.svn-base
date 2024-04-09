<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<bean:parameter id="dateField" name="inputDateField" />
<bean:parameter id="divCalId" name="divCalId" />
<bean:parameter id="imageClicker" name="imageClicker" />
<bean:parameter id="minDate" name="minimumDate" />
<bean:parameter id="maxDate" name="maximumDate" />
<script type="text/javascript">
//set local blank image
Ext.onReady(function() {
	var selectHandler = function(myDP, date) {
		var field = document.getElementById('<%=dateField%>');
		field.value = date.format('m/d/Y');
		myDP.hide();
		field.focus();
	};
	
	var myDP = new Ext.DatePicker({startDay: 1,listeners: {'select':selectHandler}, minDate: new Date('<%=minDate%>'), maxDate: new Date('<%=maxDate%>')});
	myDP.render('<%=divCalId%>');
	myDP.hide();
	var clickHandler = function() {
		myDP.show();
	};
	
	var clickHandlerext = function() {
		myDP.hide();
	};

	Ext.EventManager.on('<%=imageClicker%>', 'click', clickHandler);
	Ext.EventManager.on('<%=imageClicker%>', 'dblclick', clickHandlerext);
});
</script>