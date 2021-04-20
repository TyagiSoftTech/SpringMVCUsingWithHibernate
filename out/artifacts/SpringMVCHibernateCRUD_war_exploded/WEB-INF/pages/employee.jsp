<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
<html>
<head>
    <title>Employee Page</title>
    <style type="text/css">
        .empTable  {border-collapse:collapse;border-spacing:0;border-color: #cccccc;}
        .empTable td{font-family:Arial, sans-serif;font-size:16px;padding:10px 5px;border-style:solid;border-width:2px;overflow:hidden;word-break:normal;border-color: #cccccc;color: #00ff00;background-color:#FF0000;}
        .empTable th{font-family:Arial, sans-serif;font-size:16px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:2px;overflow:hidden;word-break:normal;border-color:#ccc;color:#000000;background-color:#FF4500;}

    </style>
</head>
<body>


<c:if test="${empty employee.employeeId}">

</c:if>


<c:url var="addAction" value="/employee/add" ></c:url>

<form:form method="POST" action="${addAction}" modelAttribute="employee">

    <table >
                    <c:if test="${not empty employee.employeeId}">
                        <tr>
                            <td>
                                <form:label path="employeeId">
                                </form:label>
                            </td>
                            <td>
                                <form:hidden path="employeeId" />
                            </td>
                        </tr>
                    </c:if>
        <tr>
            <th colspan="2">Add New Employee</th>
        </tr>
        <tr>

            <td><form:label path="firstName">First Name:</form:label></td>
            <td><form:input path="firstName" size="30" maxlength="30"></form:input></td>
        </tr>
        <tr>

            <td><form:label path="lastName">Last Name:</form:label></td>
            <td><form:input path="lastName" size="30" maxlength="30"></form:input></td>
        </tr>
        <tr>

            <td><form:label path="age">Age:</form:label></td>
            <td><form:input path="age" size="30" maxlength="30"></form:input></td>
        </tr>
        <tr>

            <td><form:label path="education">Education:</form:label></td>
            <td><form:input path="education" size="30" maxlength="30"></form:input></td>
        </tr>
        <tr>

            <td><form:label path="salary">Salary:</form:label></td>
            <td><form:input path="salary" size="30" maxlength="30"></form:input></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" class="blue-button" /></td>
        </tr>
    </table>

</form:form>
<br>

<c:if test="${not empty employeeList}">
    <h3 colspan="2">View All Employee </h3>
    <table class="empTable">
        <tr>
            <th width="80">ID</th>
            <th width="120">First Name</th>
            <th width="120">Last Name</th>
            <th width="120">Age</th>
            <th width="120">Education</th>
            <th width="120">Salary</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${employeeList}" var="employee">
            <tr>
                <td>${employee.employeeId}</td>
                <td>${employee.firstName}</td>
                <td>${employee.lastName}</td>
                <td>${employee.age}</td>
                <td>${employee.education}</td>
                <td>${employee.salary}</td>
                <td><a href="<c:url value='/employee/edit/${employee.employeeId}' />" >Edit</a></td>
                <td><a href="<c:url value='employee/remove/${employee.employeeId}' />" >Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>
</body>
</html>