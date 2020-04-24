<!DOCTYPE html>
<html>
    <head>
        <title>Customer Support</title>
    </head>
    <body>
        <c:url var="logoutUrl" value="/logout"/>
        <form action="${logoutUrl}" method="post">
            <input type="submit" value="Log out" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/><br /><br />
        </form>
        <a href="<c:url value="/lecture" />">Lecture</a><br>
        <a href="<c:url value="/lab" />">Lab</a><br>
        <a href="<c:url value="/other" />">Other</a><br>
        <h2>Tickets</h2>
        <security:authorize access="hasRole('ADMIN')">
            <a href="<c:url value="/user" />">Admin Management</a><br /><br />
        </security:authorize>
        <a href="<c:url value="/ticket/create" />">Create a Ticket</a><br /><br />
        <c:choose>
            <c:when test="${fn:length(ticketDatabase) == 0}">
                <i>There are no tickets in the system.</i>
            </c:when>
            <c:otherwise>
                <c:forEach items="${ticketDatabase}" var="ticket">
                    Ticket ${ticket.id}:
                    <a href="<c:url value="/ticket/view/${ticket.id}" />">
                        <c:out value="${ticket.subject}" /></a>
                    (customer: <c:out value="${ticket.customerName}" />)
                    <security:authorize access="hasRole('ADMIN') or
                                        principal.username=='${ticket.customerName}'">
                        [<a href="<c:url value="/ticket/edit/${ticket.id}" />">Edit</a>]
                    </security:authorize>
                    <security:authorize access="hasRole('ADMIN')">
                        [<a href="<c:url value="/ticket/delete/${ticket.id}" />">Delete</a>]
                    </security:authorize>
                    <br /><br />
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </body>
</html>
