# Session-Management-System

Security authentication and session management system for a servlet/JSP application created from scratch without using exisiting frameworks.<br>
Session management system sets cookies. Cookie timeouts are also set. Ideally there should be a complex logic to set cookie values for the session tracking so it won't collide with any other request. There is no method to remove the cookie so maximum age was set to 0 so that it will be removed from the client browser immediately.<br>
Session ID in this application is set so we can see that it not descriptive in any way, it is long enough to prevent brute force attacks, it is entirely unpredictable and it's value is entirely meaningless.<br>
The LoginServlet servlet will create the session and set the attributes that we can use in other resources or in future requests. When a JSP resource is used, a container automatically creates a  session for it. Therefore, we can't check if the session is null to make sure if the user has come through the login page. So in order to validate this request we are using the session attribute. <br>

<b>Logging in as Admin</b><br>

Password and username are predifined (for the sake of the project) to “password123” and “adminCE4208” respectively. If this application needed the user to create accounts the password would have to be securely choosen. There should be at least one lower case (a-z), upper case (A-Z) and numeric (0-9) character.  The password should also be greater than 10 characters and smaller that 128 charters in size.<br>

