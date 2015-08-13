<%-- 
    Author     : 10126767
--%>
<%@page errorPage="error.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <img src="images/DataComms.jpg"><%-- header image --%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cross Site Request Forgery (CSRF)</title>
    </head>
    <body>
        
        <%
String userName = null;
//allow access only if session exists
if(session.getAttribute("user") == null){
	response.sendRedirect("login.html");
}else userName = (String) session.getAttribute("user");
String sessionID = null;
Cookie[] cookies = request.getCookies();
if(cookies !=null){
for(Cookie cookie : cookies){
	if(cookie.getName().equals("user")) userName = cookie.getValue();
}
}
%>
<h3>Hi <%=userName %></h3>
<br>
<form action="<%=response.encodeURL("LogoutServlet") %>" method="post">
<input type="submit" value="Logout" >
</form>
        
        
        <h1>OWASP Top 10 2010 - Cross Site Request Forgery (CSRF)</h1>
        <h2>General Description</h2>
        <p>
           A CSRF attack forces a logged-on victim’s browser to send a forged HTTP request, 
           including the victim’s session cookie and any other automatically included authentication 
           information, to a vulnerable web application. This allows the attacker to force the 
           victim’s browser to generate requests the vulnerable application thinks are legitimate 
           requests from the victim. 
        </p>
        
        <h2>Example Attacks</h2>
        <p>
            The application allows a user to submit a state changing request that does not include anything secret.<br><br>
          
          <img src="csrf1.png"><br><br>
          
          So, the attacker constructs a request that will transfer money from the victim’s account to their account,
          and then embeds this attack in an image request or iframe stored on various sites under the attacker’s control.<br><br>
          
          <img src="csrf2.png"><br><br>
          
          f the victim visits any of these sites while already authenticated to example.com, any forged requests will include
          the user’s session info, inadvertently authorizing the request.<br><br>
        </p>
        
        <h2>How To Prevent 'Cross-Site Request Forgery (CSRF)'</h2>
        
        <p>
            Preventing CSRF requires the inclusion of an unpredictable token in the body or URL of each HTTP request. 
            Such tokens should at a minimum be unique per user session, but can also be unique per request.<br> 
            1. The preferred option is to include the unique token in a hidden field. This causes the value to be sent in the 
            body of the HTTP request, avoiding its inclusion in the URL, which is subject to exposure.<br>
            2. The unique token can also be included in the URL itself, or a URL parameter. However, such placement runs the risk 
            that the URL will be exposed to an attacker, thus compromising the secret token.<br>
            OWASP’s CSRF Guard can be used to automatically include such tokens in your Java EE, .NET, or PHP application. 
            OWASP’s ESAPI includes token generators and validators that developers can use to protect their transactions.<br><br>
            
        </p>
        <%-- Link to web page for further information on this OWASP element --%>
        <h2>More Information</h2>
        <a href="https://www.owasp.org/index.php/Top_10_2010-A5">More information</a>
        
        
        <text>JSP expression element:<br></text>
        <%-- JSP Expression--%>
        Current time  : <%= new java.util.Date() %>
        
    </body>
</html>
