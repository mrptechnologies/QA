	function navigate(nextOrPre)
	{
	 var formElement=document.forms[0];
	 formElement.action="../ListOfEmail.do?answer(ownerId)="+document.getElementById('ownerId').value +"&answer(Object::Notification::Email::PageNum)="+nextOrPre;
	    document.forms[0].submit();
	}
