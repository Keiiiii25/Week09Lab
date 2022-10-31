<%-- 
    Document   : users
    Created on : 21-Oct-2022, 3:05:21 PM
    Author     : Keith
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Users</title>
    </head>
    <body>
        <header>
            <h1>Manage Users</h1>
        </header>

        <main>
            <c:choose>
                <c:when test="${users eq null}">
                    ${message}
                </c:when>
                <c:when test="${users ne null}">
                    <table cellpadding="4" border="1">
                        <tr>
                            <th>Email</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Role</th>
                            <th></th>
                            <th></th>
                        </tr>
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td>${user.email}</td>
                                <td>${user.firstName}</td>
                                <td>${user.lastName}</td>
                                <td>${user.role.roleName}</td>
                                <td>
                                    <c:url value="/users" var="editURL">
                                        <c:param name="action" value="edit"/>
                                        <c:param name="emailSelected" value="${user.email}"/>
                                    </c:url>
                                    <a href="${editURL}">Edit</a>
                                </td>
                                <td>
                                    <c:url value="/users" var="deleteURL">
                                        <c:param name="action" value="delete"/>
                                        <c:param name="emailSelected" value="${user.email}"/>                                
                                    </c:url>
                                    <a href="${deleteURL}">Delete</a>       
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:when>
            </c:choose>

            <c:if test="${user == null}">
                <div class="addUser">
                    <h2>Add User</h2>

                    <form action="" method="POST">
                        <label>Email:</label>
                        <input type="email" name="emailNew" value="${emailNew}" required>
                        <br>
                        <label>First name:</label>
                        <input type="text" name="firstNameNew" value="${firstNameNew}" required>
                        <br>
                        <label>Last name:</label>
                        <input type="text" name="lastNameNew" value="${lastNameNew}" required>
                        <br>
                        <label>Password:</label>
                        <input type="password" name="passwordNew" value="${passwordNew}" required>
                        <br>
                        <label>Role:</label>
                        <select name="roleNew">
                            <option value="system admin">system admin</option>
                            <option value="regular user">regular user</option>
                        </select>

                        <br>
                        <input type="hidden" name="action" value="add">
                        <input type="submit" value="Add user">
                    </form>
                </div>
            </c:if>


            <c:if test="${user != null}">
                <div class="editUser">
                    <h2>Edit User</h2>

                    <form action="" method="POST">
                        <label>Email ${user.email}</label>
                        <br>
                        <label>First name:</label>
                        <input type="text" name="firstNameEdit" value="">
                        <br>
                        <label>Last name:</label>
                        <input type="text" name="lastNameEdit" value="">
                        <br>
                        <label>Password:</label>
                        <input type="password" name="passwordEdit" value="">
                        <br>
                        <label>Role:</label>
                        <select name="roleEdit">
                            <option value="system admin">system admin</option>
                            <option value="regular user">regular user</option>
                        </select>
                        <br>
                        <input type="submit" name="action" value="Update">
                        <input type="submit" name="action" value="Cancel">
                    </form>
                </div>
            </c:if>
        </main>

        <footer>

        </footer>
    </body>
</html>
