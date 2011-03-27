<jsp:include page="head.jsp" />
  <h2>Quick Architecture</h2>
  <ul style="font-size: 16pt">
    <li>Webservice Layer 
      <ul>
        <li>Asynch Calls To Gilt Services</li> 
      </ul>
    </li>
    <li>Controller Layer
      <ul>
        <li>Mini Framework on top of Swift</li> 
        <li>Matches URLs to Actions (Dispatching)</li> 
        <li>Pulls Params out of Path</li> 
        <li>Handles Authentication and Redirects</li> 
        <li>Reconstructs URLs for JSP Pages</li> 
        <li>Sets up Context in Response Param</li> 
      </ul>
    </li>
    <li>Adapter Layer - Front End
      <ul>
        <li>Adapts Map for Display</li> 
        <li>"De-References" Asynch Call As Late As Possible</li> 
        <li>Does Some Formatting</li> 
        <li>Keeps JSP Super Tidy</li> 
      </ul>
    </li>
    <li>(Show Some Code Quickly)</li>
  </ul>
  <a style="float:left" href="/5">&lt;&lt; prev</a>
  <a style="float:right" href="/7">next &gt;&gt;</a>
<jsp:include page="foot.jsp" />
