<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 8/31/2022
  Time: 10:52 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>



<sec:ifLoggedIn>
    Logged in as <sec:username/>
</sec:ifLoggedIn>

<sec:ifSwitched>
    <form action='${request.contextPath}/logout/impersonate' method='POST'>
        <input type='submit' value="Resume as ${grails.plugin.springsecurity.SpringSecurityUtils.switchedUserOriginalUsername}"/>
    </form>
</sec:ifSwitched>

<sec:ifNotSwitched>
    <sec:ifAllGranted roles='ROLE_ADMIN'>
    <form action='${request.contextPath}/login/impersonate' method='POST'>
        Switch to user: <input type='text' name='username'/><br/>
        <input type='submit' value='Switch'/>
    </form>
    </sec:ifAllGranted>

</sec:ifNotSwitched>



</body>
</html>