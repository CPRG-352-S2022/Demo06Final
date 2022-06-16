<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Accounts</title>
    </head>
    <body>
        <h1>Accounts</h1>
        
        <h3>Page ${page}</h3>
        
        <!-- display a table of all of the accounts -->
        <table cellpadding="5" border="1">
            <tr>
                <th>Name</th>
                <th>Link</th>
            </tr>
            <c:forEach items="${accounts}" var="person">
                <tr>
                    <td>${person.name}</td>
                    <td>
                        <a href="<c:url value="/account">
                               <c:param name="username" value="${person.username}" />
                        </c:url>">Account</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        
        <!-- handle paging: forward/back -->
        <div>
            <c:if test="${page > 1}">
            <a href="accounts?page=${page - 1}">&lt; Back</a> |
            </c:if>
            <a href="accounts?page=${page + 1}">Next &gt;</a>
        </div>
        <br><br>
        <div>
            <c:forTokens items="-5,-4,-3,-2,-1,0,1,2,3,4,5" delims="," var="i">
                <c:choose>
                    <c:when test="${i == 0}">
                        <b>${page}</b>
                    </c:when>
                    <c:when test="${ (page+i) > 0 }">
                        <a href="accounts?page=${page+i}">${page+i}</a>
                    </c:when>
                </c:choose>
            </c:forTokens>
        </div>
        
    </body>
</html>
