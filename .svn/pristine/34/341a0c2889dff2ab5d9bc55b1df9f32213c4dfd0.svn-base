function validateFields(){
	var formElement=document.forms[0];

	if (formElement.elements[2].selectedIndex == 0)
	{
		alert("Please select a User type");
	    return false;
	} 

	if(formElement.elements[4].value=="")
	{
		alert("	Please enter your Last Name.");
		return false;
	}
	if(formElement.elements[6].value=="")
	{
		alert("	Please enter your e-mail address.");
		return false;
	}

	if(formElement.elements[7].value=="")
	{
		alert("	Please enter your Username.");
		return false;
	}
		if((formElement.elements[7].value).length < 6)
	{
		alert("Username should be atleast 6 characters.");
		return false;
	}


	if(formElement.elements[8].value=="")
	{
		alert("	Please enter your password.");
		return false;
	}
	if(formElement.elements[9].value=="")
	{
		alert("	Please re-confirm your password.");
		return false;
	}
	
	else{
		return true;
		}

}

function validateAddUser(frm)
{
	if (frm.roleName!=null && frm.roleName.value=="")
	{
		alert("Please select a User Type.");
		frm.roleName.focus();
		return false;
	}
	if (frm.FirstName!=null && frm.FirstName.value=="")
	{
		alert("First Name cannot be empty");
		frm.FirstName.focus();
		return false;
	}
	if (frm.LastName!=null && frm.LastName.value=="")
	{
		alert("Last Name cannot be empty");
		frm.LastName.focus();
		return false;
	}
	if (frm.NameCode!=null && frm.NameCode.value=="")
	{
		alert("Name Code cannot be empty");
		frm.NameCode.focus();
		return false;
	}
	if (frm.gAgentName!=null && frm.gAgentName.value=="")
	{
		alert("General Agent Name cannot be empty");
		return false;
	}
	if (frm.agentName!=null && frm.agentName.value=="")
	{
		alert("Agent Name cannot be empty");
		return false;
	}
	if (frm.email!=null && frm.email.value=="")
	{
		alert("E Mail cannot be empty");
		frm.email.focus();
		return false;
	}
	// checkMail function to check for the validity of email address is there in Common.js
	if (frm.email!=null && checkMail(frm.email.value))
	{
		alert("Please verify your email address.");
		frm.email.select();
		return false;
	}
	
	if (frm.userName!=null && frm.userName.value.length<6)
	{
		alert("The Username should be at least 6 characters.");
		frm.userName.focus();
		return false;
	}
	if (frm.userName!=null)
	{
		var ValidUsername= /^([a-zA-Z0-9 _.@-]+)$/;
		
			 if(!(ValidUsername.match(frm.userName.value)))
				 {
				 alert("Please Enter A Valid Username");
				 return false;
				 }
		
	}
	if (frm.passWord!=null && frm.passWord.value=="")
	{
		alert("Password cannot be left blank.");
		frm.passWord.focus();
		return false;
	}
	if (frm.passWordConfirm!=null && frm.passWordConfirm.value!= frm.passWord.value)
	{
		alert("Password and Confirm password should be same.");
		frm.passWordConfirm.select();
		return false;
	}
	
}

