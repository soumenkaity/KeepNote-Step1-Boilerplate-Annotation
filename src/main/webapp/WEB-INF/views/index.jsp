<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KeepNote</title>
</head>
<body>
    <!-- Create a form which will have text boxes for Note ID, title, content and status along with a Send
         button. Handle errors like empty fields -->
    <form action="saveNote" method="post" name="noteForm">
        Note Id:<br><input name="noteId" type="number">
        <c:if test="${not empty errorID}">
            <p style="color:red;display: inline-block;"><c:out value="${errorID}"/></p>
        </c:if>
        <br>
        Note Title:<br><input name="noteTitle" type="text">
        <c:if test="${not empty errorTitle}">
            <p style="color:red;display: inline-block;"><c:out value="${errorTitle}"/></p>
        </c:if>
        <br>
        Note Content:<br><input name="noteContent" type="text">
        <c:if test="${not empty errorContent}">
            <p style="color:red;display: inline-block;"><c:out value="${errorContent}"/></p>
        </c:if>
        <br>
        Note Status:<br>
        <select id="noteStatus" name= "noteStatus">
            <option value="complete">Completed</option>
            <option value="incomplete">Draft</option>
        </select>
        <c:if test="${not empty errorStatus}">
            <p style="color:red;display: inline-block;"><c:out value="${errorStatus}"/></p>
        </c:if>
        <br>
        <br>
        <input name="submitBtn" type="submit">
    </form>
    <br>
    <c:if test="${not empty error}">
        <p style="color:red;"><c:out value="${error}"/></p>
    </c:if>

    <!-- display all existing notes in a tabular structure with Id, Title,Content,Status, Created Date and Action -->
    <table border="1">

        <tr>
            <th>Note ID</th>
            <th>Title</th>
            <th>Content</th>
            <th>Status</th>
            <th>Created Date and Action</th>
        </tr>


        <c:forEach var="note" items="${notes}" varStatus="status">
            <tr>
                <td>${note.noteId}</td>
                <td>${note.noteTitle}</td>
                <td>${note.noteContent}</td>
                <td>${note.noteStatus}</td>
                <td>${note.createdAt}</td>
                <td><form action="deleteNote" method="get"><input type="hidden" name="noteId" value="${note.noteId }"><input type="submit" value="Delete"></form>
                <!-- <a href="deleteNote/${note.noteId}">Delete</a> -->
                </td>
            </tr>

        </c:forEach>

    </table>
</body>
</html>