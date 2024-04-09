
<form name="counter">
<div class="formheadnewautologout" ><h2 class="left">Logout Notification</h2></div>
<div class="textboxnomargin">
<table border="0"  align="left" width="100%" >
	<tr>
		<td align="center" colspan="2" > 
			<input type="text" class="textboxnomargin" size="55"  readonly="true" name="DisplayText"><br/>
			<input type="text" class="textboxnomargin" size="55" readonly="true" name="DisplayText2">
		</td>
	</tr>
	<tr><td> <br/></td></tr>
	<tr>
		<td  align="right" width="45%">
			<input type="button" value="Logout" class="covbutton" onclick="logOut()">
			
		</td>
		<td align="left">
			<input type="button" value="Continue browser Session" class="covbutton2" onclick="resetTimer()">
		</td>
	</tr>
</table>
</div>
</form> 

<script> 
function resetTimer(){
	window.opener.autologout();
	window.opener.resetTimerRequest();
	window.close();
}

function logOut(){
window.opener.document.location="/LoginOutAction.do";
window.close();
}

var second=59
function display(){ 
 if (second<=0){ 
    window.close();
 } 
 else {
    second-=1 
  } 
    document.counter.DisplayText.value="Your browser session is about to expire in "+second+" seconds."; 
    document.counter.DisplayText2.value="This will log you out of the system."
    setTimeout("display()",1000) 
} 
display() 
</script> 
