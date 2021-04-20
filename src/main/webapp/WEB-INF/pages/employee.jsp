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
        .empTable th{font-family:Arial, sans-serif;font-size:16px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:2px;overflow:hidden;word-break:normal;border-color:#ccc;color: #000000;background-color: #2da868;}

        .blue-button{
            background: #25A6E1;
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#25A6E1',endColorstr='#188BC0',GradientType=0);
            padding:3px 5px;
            color:#fff;
            font-family:'Helvetica Neue',sans-serif;
            font-size:12px;
            border-radius:2px;
            -moz-border-radius:2px;
            -webkit-border-radius:4px;
            border:1px solid #1A87B9
        }
        table {
            font-family: "Helvetica Neue", Helvetica, sans-serif;
            width: 50%;
        }
        th {
            background: SteelBlue;
            color: white;
        }
        td,th{
            border: 1px solid gray;
            width: 25%;
            text-align: left;
            padding: 5px 10px;
        }
    </style>
</head>
<body>


<c:if test="${empty employee.employeeId}">

</c:if>


<c:url var="addAction" value="/employee/add" ></c:url>

<form:form method="POST" action="${addAction}" modelAttribute="employee">

    <table >

        <tr>
            <th colspan="2">Add New Employee</th>
        </tr>
        <tr>
            <form:hidden path="employeeId" />
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

    <table class="empTable">
        <th style="background: SteelBlue; color: white;" colspan="8">View All Employee </th>
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