<%-- 
    Document   : users
    Created on : 21-Oct-2022, 3:05:21 PM
    Author     : Keith
--%>

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
                        <td></td>
                    </tr>
            </table>

            <div class="addUser">
                <h2>Add User</h2>

                <form>
                    <label>Email:</label>
                    <input type="text" name="email" value="${email}">
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
                    <select name="roles">
                        <option value="sysAdmin">system admin</option>
                        <option value="regUser">regular user</option>
                    </select>
                    <br>
                    <input type="submit" value="Add user">
                    <input type="hidden" name="action" value="add">
                </form>
            </div>

            <div class="editUser">
                <h2>Edit User</h2>

                <form>
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
                    <select name="roles">
                        <option value="sysAdmin">system admin</option>
                        <option value="regUser">regular user</option>
                    </select>
                    <br>
                    <input type="submit" value="Add user">
                    <input type="hidden" name="action" value="add">
                </form>
            </div>
        </main>

        <footer>

        </footer>
    </body>
</html>
