<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Charm Profile</title>
</head>
<body>
<%@ include file="header.jsp" %>

<div>
    <form method="post" action="/profile">
        <c:if test="${requestScope.profile.id == null}">
            <h1>Hello new user</h1>
        </c:if>

        <table>
            <input type="text" name="id" hidden value="${requestScope.profile.id}">
            <tr>
                <td><h3>Email</h3></td>
                <td><input type="email" name="email" value="${requestScope.profile.email}"></td>
            </tr>
            <tr>
                <td><h3>Name</h3></td>
                <td><input type="text" name="name" value="${requestScope.profile.name}"></td>
            </tr>
            <tr>
                <td><h3>Surname</h3></td>
                <td><input type="text" name="surname" value="${requestScope.profile.surname}"></td>
            </tr>
            <tr>
                <td><h3>About</h3></td>
                <td><input type="text" name="about" value="${requestScope.profile.about}"></td>
            </tr>
            <tr>
                <td><h3>Gender</h3></td>
                <td>
                    <select name="gender">
                        <option value="${requestScope.profile.gender}" selected hidden>${requestScope.profile.gender}</option>
                        <c:forEach var="gender" items="${applicationScope.genders}">
                            <option value="${gender}">${gender}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
        </table>
        <button type="submit">Save</button>
    </form>

</div>
<%@ include file="footer.html" %>

</body>
</html>