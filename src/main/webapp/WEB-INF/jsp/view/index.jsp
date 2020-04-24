<!DOCTYPE html>
<html>
    <head>
        <title>Course Discussion Forum</title>
    </head> 
    <body>
        <security:authorize access="isAuthenticated() ">              
            <c:url var="logoutUrl" value="/logout"/>
            <form action="${logoutUrl}" method="post">
                <input type="submit" value="Log out" />
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form><br />
            Welcome, <security:authentication property="principal.username" />!!<br /><br />            
        </security:authorize>
        <security:authorize access="isAnonymous()">
            <a href="<c:url value="/login" />">Login</a>   
            <a href="<c:url value="/register" />">Register</a><br /><br />
        </security:authorize>
        <security:authorize access="hasRole('ADMIN')">
            <a href="<c:url value="/user" />">Admin Management</a><br />
        </security:authorize>
            <h2>Current Poll</h2>
        
        <c:choose>
            <c:when test="${empty poll}">
                <p> There are no active poll yet </p>
            </c:when>
            <c:otherwise>
                Poll Topic: <c:out value="${poll.topic}"/> <br><br/>
                <form:form method="POST" modelAttribute="displayPoll">
                    <form:hidden path="pollid" value="${poll.id}"/>
                    <c:if test="${poll.optionone != ''}">
                        Option One : ${poll.optionone} 
                        Vote count :
                        <c:set var="count" value="0" scope="page" />
                        <c:forEach items="${voteset}" var="entry">
                            <c:if test="${entry.choice == 1}">
                                <c:set var="count" value="${count + 1}" scope="page"/>
                            </c:if>
                        </c:forEach>
                        ${count}
                        <form:radiobutton path="choice" value="1"/><br/><br/>
                    </c:if>
                    <c:if test="${poll.optiontwo != ''}">
                        Option Two : ${poll.optiontwo}
                        Vote count :
                        <c:set var="count" value="0" scope="page" />
                        <c:forEach items="${voteset}" var="entry">
                            <c:if test="${entry.choice == 2}">
                                <c:set var="count" value="${count + 1}" scope="page"/>
                            </c:if>
                        </c:forEach>
                        ${count}
                        <form:radiobutton path="choice" value="2"/><br/><br/>
                    </c:if>
                    <c:if test="${poll.optionthree != ''}">
                        Option Three : ${poll.optionthree} 
                        Vote count :
                        <c:set var="count" value="0" scope="page" />
                        <c:forEach items="${voteset}" var="entry">
                            <c:if test="${entry.choice == 3}">
                                <c:set var="count" value="${count + 1}" scope="page"/>
                            </c:if>
                        </c:forEach>
                        ${count}
                        <form:radiobutton path="choice" value="3"/><br/><br/>
                    </c:if>
                    <c:if test="${poll.optionfour != ''}">
                        Option Four : ${poll.optionfour}
                        Vote count :
                        <c:set var="count" value="0" scope="page" />
                        <c:forEach items="${voteset}" var="entry">
                            <c:if test="${entry.choice == 4}">
                                <c:set var="count" value="${count + 1}" scope="page"/>
                            </c:if>
                        </c:forEach>
                        ${count}
                        <form:radiobutton path="choice" value="4"/><br/><br/>
                    </c:if>
                    <security:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
                        <input type="submit" value="Vote"/>
                    </security:authorize>
                </form:form>
            </c:otherwise>
        </c:choose>
        <security:authorize access="isAuthenticated() ">
            <a href="<c:url value="/ticket/create" />">Create a Ticket</a><br /><br />
        </security:authorize>
        <a href="<c:url value="/lecture" />">Lecture</a><br>
        <a href="<c:url value="/lab" />">Lab</a><br>
        <a href="<c:url value="/other" />">Other</a><br>
        
    </body>
</html>
