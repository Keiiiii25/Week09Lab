package servlets;

import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Role;
import models.User;
import services.RoleService;
import services.UserService;

/**
 *
 * @author Keith
 */
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserService userService = new UserService();
        RoleService roleService = new RoleService();

        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        List<User> users;
        List<Role> roles;

        try {

            users = userService.getAll();

            roles = roleService.getAll();
            request.setAttribute("roles", roles);

            if (action != null) {

                if (action.equals("delete")) {
                    String email = request.getParameter("emailSelected");

                    userService.delete(email);

                    users = userService.getAll();
                    request.setAttribute("users", users);

                    response.sendRedirect("users");
                    session.setAttribute("message", null);

                    return;
                } else if (action.equals("edit")) {

                    String email = request.getParameter("emailSelected");

                    User user = userService.getUser(email);
                    request.setAttribute("user", user);
                }
            }

            if (users.isEmpty()) {
                request.setAttribute("message", "No users to be displayed");
            }
            request.setAttribute("users", users);
        } catch (Exception ex) {

            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
            request.setAttribute("message", "error");
        }

        getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);

        return;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        UserService userService = new UserService();
        RoleService roleService = new RoleService();

        String action = request.getParameter("action");
        request.setAttribute("action", action);

        try {

            if (action != null) {
                switch (action) {
                    case "add": {
                        String email = request.getParameter("emailNew");
                        String first_name = request.getParameter("firstNameNew");
                        String last_name = request.getParameter("lastNameNew");
                        String password = request.getParameter("passwordNew");
                        Role role = roleService.getRole(Integer.parseInt(request.getParameter("roleNew")));
                        userService.insert(email, first_name, last_name, password, role);
                        break;
                    }
                    case "edit": {
                        String email = request.getParameter("email");
                        String first_name = request.getParameter("firstNameEdit");
                        String last_name = request.getParameter("lastNameEdit");
                        String password = request.getParameter("passwordEdit");
                        Role role = roleService.getRole(Integer.parseInt(request.getParameter("roleEdit")));
                        userService.update(email, first_name, last_name, password, role);
                        break;
                    }
                    case "cancel":
                        response.sendRedirect("users");
                        break;
                }
            }
        } catch (Exception ex) {
            session.setAttribute("message", "There was an error: " + ex);
        }

        response.sendRedirect("users");
        return;
    }
}
