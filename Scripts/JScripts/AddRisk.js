function validate(formElement)
	{
		   
		
		var type = formElement.RiskType.value
		
		if(type=="Residential Property") {
			formElement.action="/AddResPropertyPage.do";
			
			formElement.submit();
       	
       	 }else if(type=="Personal Auto") {
			
			formElement.action="/GetList.do";
			
			formElement.submit();
		
		}else if(type=="Watercraft") {
			
			formElement.action="/GetList.do";
			
			formElement.submit();
		
		}else if(type=="Aviation") {
			
			formElement.action="/GetList.do";
			
			formElement.submit();
		
		}else if(type=="Collections") {
			
			formElement.action="/GetList.do";
			
			formElement.submit();
		
		}else if(type=="Workers Compensation")  {
			
			formElement.action="/GetList.do";
			
			formElement.submit();
		
		}else if(type=="Contents in Storage"){
			
			formElement.action="/GetList.do";
			
			formElement.submit();

		}
		
	}