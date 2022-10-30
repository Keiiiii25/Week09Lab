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
                        <td>${user.role}</td>
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

            <c:if test="${user == null}">
                <div class="addUser">
                    <h2>Add User</h2>

                    <form>
                        <label>Email:</label>
                        <input type="hidden" name="action" value="add">
                        <input type="email" name="emailNew" value="" required>
                        <br>
                        <label>First name:</label>
                        <input type="text" name="firstNameNew" value="" required>
                        <br>
                        <label>Last name:</label>
                        <input type="text" name="lastNameNew" value="" required>
                        <br>
                        <label>Password:</label>
                        <input type="password" name="passwordNew" value="" required>
                        <br>
                        <label>Role:</label>
                        <select name="addRole">
                            <c:forEach items="${roles}" var="role">
                                <option value="${role.roleID}">
                                    ${role.roleName}
                                </option>
                            </c:forEach>
                        </select>

                        <br>
                        <input type="submit" value="Add user">
                        <input type="hidden" name="action" value="add">
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
                        <input type="text" name="firstName" value="">
                        <br>
                        <label>Last name:</label>
                        <input type="text" name="firstName" value="">
                        <br>
                        <label>Password:</label>
                        <input type="password" name="password" value="">
                        <br>
                        <label>Role:</label>
                        <select name="roleNew">
                            <c:forEach items="${roles}" var="role">
                                <option value="${role.roleID}">
                                    ${role.roleName}
                                </option>
                            </c:forEach>
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
