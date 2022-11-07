/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import dataaccess.UserDB;
import java.util.List;
import models.Role;
import models.User;
import static models.User_.role;

/**
 *
 * @author Keith
 */
public class UserService {
    
    
    public User getUser(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        return user;
    }
    
    public List<User> getAll() throws Exception {
        UserDB userDB = new UserDB();
        List<User> users = userDB.getAll();
        return users;
    }
    
    public void insert(String email, String first_name, String last_name, String password, Role role) throws Exception {
        User user = new User(email, first_name, last_name, password);
        user.setRole(role);
        UserDB userDB = new UserDB();
        userDB.insert(user);
    }
    
    public void update(String email, String first_name, String last_name, String password, Role role) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        Role nRole = user.getRole();
        user.setPassword(password);
        user.setFirstName(first_name);
        user.setLastName(last_name);
        user.setRole(role);
        userDB.update(user, nRole);
    }
    
        public void delete(String email) throws Exception {
        UserDB userDB = new UserDB();
        User user = userDB.get(email);
        userDB.delete(user);
    }
}
