function FileUploadPopup(mylink, windowname) {
	if (! window.focus) {
		return true;
	}
	var mywin, href;
	if (typeof(mylink) == 'string') {
		href=mylink;
	} else {
		href=mylink.href;
	}
	mywin = window.open(href, windowname, 'width=700, height=300, left=300, top=100, scrollbars=yes, status=yes');
	mywin.focus();

	return false;
}
function isInteger(s)
{   var i;
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9")))
			return false;
			
    }
    // All characters are numbers.
    return true;
}


function validateDelete(form)
{
	var i=form.elements.length - 9;
	form.deleteAll.value="NO";
	var count = 0;
	for (;i>0;i--)
	{
		//alert(i+" is "+form.elements[i].checked);
		if (form.elements[i].checked)
		{
			count++;
		}
	}
	if(count==0)
	{
		alert("Please select the employee to delete.");
		form.elements[1].select();
		return false;
	}
/*	if (count > 1)
	{
		alert("You may delete only ONE employee at a time.");
		return false;
	}
*/
	return true;
}


function validateFields(){
	var formElement=document.forms[0];

	if (formElement.comboGender.value=="")
	{
		alert("Please select a gender.");
		formElement.comboGender.focus();
		return false;
	}

	if(formElement.elements[4].value=="" & formElement.elements[7].value=="")
	{
		alert("Please enter Date of Birth or age");
		return false;
	}
		
	var dmonth = parseInt(formElement.elements[5].value, 10);
	var dday = parseInt(formElement.elements[6].value, 10);
	var dyear = parseInt(formElement.elements[7].value, 10);

	if ((formElement.elements[5].value!=""||formElement.elements[6].value!=""||formElement.elements[7].value!=""))
	{
		if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear))
		{
			alert("Please enter date in 'MM/DD/YYYY' format");
			formElement.elements[5].select();
			return false;
		}

		var dob = dmonth+"/"+dday+"/"+dyear;
		//using function from Common.js
		if(!isDate(dob)){
			alert("Invalid Date")
			return false;
		}
	}

	if (formElement.elements[5].value!=""||formElement.elements[6].value!="")
	{
		//using function from Common.js
		var calcAge1 = calcAge(dday, dmonth, dyear);
		
		if ((calcAge1<20) || (calcAge1>99))
		{
			alert("Age should be between 20 and 99 years.");
			return false;
		}
	}


	if (formElement.comboHealth.value=="")
	{
		alert("Please select a Health Plan.");
		formElement.comboHealth.focus();
		return false;
	}

	var empElec = ((formElement.elements[8].value=="EEandChildren")|| (formElement.elements[8].value=="Family"));
	 if((formElement.elements[9].value=="")&& empElec)
	{
		alert("Please Enter No Of Children");
		formElement.elements[9].focus();
		return false;
	}

	var childno = formElement.elements[9].value;

	if ((!(childno=="") && (!(isInteger(childno)))))
	{
		alert("Number of children field should only have integer values.");
		formElement.elements[9].select();
		return false;
	}
	var intChildNo = parseInt(childno);

	if ((!(childno=="") && intChildNo<1)&& empElec)
	{
		alert("Number of children should be one or more");
		formElement.elements[9].select();
		return false;
	}
	if(formElement.elements[4].value!="") {
	if(!(isInteger(formElement.elements[4].value))){
	alert("Please enter a numeric value for age");
		return false;
		
	}
	

if((formElement.elements[4].value <20) || (formElement.elements[4].value>99))
	{
	alert("Age should be between 20 and 99 years");
	formElement.elements[4].value="";
	formElement.elements[4].focus();
	return false;
	}
	}

		if (formElement.elements[7].value=="")
		{
		
		var Age=formElement.elements[4].value;
		var dtNow = new Date();
		var yearNow = dtNow.getFullYear();
		var Yob=yearNow-Age;
		formElement.elements[5].value="01";
		formElement.elements[6].value="01";
		formElement.elements[7].value=Yob;
		}

	newchecksubmitcount();	
}

function checksubmitcountLS()
 {
 	submitcount++;
	alert("submitcount-->"+submitcount);
 	if (1 == submitcount )
 	{
 		document.forms[0].submit();
 	}else
	 {
		return false;
	 } 	
 }

function submitToSearch(){
	var form=document.forms[0];
	
	var monthVal = form.dobMonth.value;
	var dateVal = form.dobDate.value;
	var yearVal = form.dobYear.value;
	
	var dmonth = parseInt(monthVal, 10);
	var dday = parseInt(dateVal, 10);
	var dyear = parseInt(yearVal, 10);

	/* DOB if filled should be all correct*/
	// if filled any field
	if((monthVal+dateVal+yearVal) !=""){
	
		// fill out the year for sure
		if(yearVal =="") {
			alert("Please fill in Year field for DOB.");
			form.dobYear.select();
			return false;
		}

		// fill in date and month field to Jan 1, if just year is entered correctly
		if(yearVal.length==4 && !isNaN(dyear)){
			if(monthVal=="")
			{
				monthVal = "01";
			}
			if(dateVal=="")
			{
				dateVal = "01";
			}			
		}
		
		// force for correct numeric values
		if (isNaN(dmonth) || dmonth < 1 || dmonth > 12 || isNaN(dday) || dday < 1 || dday > 31 || isNaN(dyear))
		{
			alert("Please enter date in 'MM/DD/YYYY' format.");
			form.dobMonth.select();
			return false;
		}

		var dob = dmonth+"/"+dday+"/"+dyear;
		//using function from Common.js
		if(!isDate(dob)){
			alert("Invalid Date!")
			form.dobMonth.select();
			return false;
		}
	}
	
	// if age is entered
	if(form.styleAge.value!=""){
		if(!(isInteger(form.styleAge.value))){
			alert("Please enter a numeric value for age");
			form.styleAge.select();
			return false;		
		}

		if (yearVal=="")
		{
			var Age=form.styleAge.value;
			var dtNow = new Date();
			var yearNow = dtNow.getFullYear();
			var Yob=yearNow-Age;
			form.dobMonth.value="01";
			form.dobDate.value="01";
			form.dobYear.value=Yob;
		}		
	}
	
	// No of children if entered should be numeric
	var childno = form.noOfChild.value;

	if ((!(childno=="") && (!(isInteger(childno)))))
	{
		alert("Number of children field should only have integer values.");
		form.noOfChild.select();
		return false;
	}
	form.action="../SearchEmployees.do";
	form.submit();
}

function doDeleteAll(form) {
	form.deleteAll.value="YES";
	form.submit();
}

function checkChildren() {
	var frm = document.forms[0];
	var empElec = ((frm.elements[8].value=="EEandChildren")|| (frm.elements[8].value=="Family") || (frm.elements[8].value==""));
	if(!empElec) {
		frm.elements[9].value="";
		frm.elements[9].readOnly=true;
	} else {
		frm.elements[9].readOnly=false;
	}
}