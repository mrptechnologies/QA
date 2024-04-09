	<ul>		
		<li>Location List
			<ul>
				<li><a target="_new" href="HTTP://developer.yahoo.com/yui" title="go to YUI Home Page">Location1</a>
					<ul>
						<li><a href="javascript:showRisk('2014','1011')">Tank 1</a></li>
						<li>Tank 2</li>
					</ul>
				</li>
				<li><a target="_new" href="HTTP://developer.yahoo.com/yui" title="go to YUI Home Page">Location2</a>
					<ul>
					<%for(int i=0;i<=8;i++){ %>
						<li>Tank <%=""+i %></li>						
					<%} %>
					</ul>
				</li>				
			</ul>			
		</li>
	</ul>