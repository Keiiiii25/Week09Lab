/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dataaccess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import models.Role;

/**
 *
 * @author Keith
 */
public class RoleDB {
    
    public List<Role> getAll() throws Exception {
        List<Role> roles = new ArrayList<>();
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        String sql = "SELECT * FROM role";
        
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while(rs.next()) {
                int roleID = rs.getInt(1);
                String roleName = rs.getString(2);
                Role role = new Role(roleID, roleName);
                roles.add(role);
            }
        } finally {
            DBUtil.closePreparedStatement(ps);
            DBUtil.closeResultSet(rs);
            cp.freeConnection(con);
        }
        
        return roles;
    }
    
    public Role getRole(int roleID) throws Exception {
        ConnectionPool cp = ConnectionPool.getInstance();
        Connection con = cp.getConnection();
        PreparedStatement ps = null;
        ResultSet rs = null;
        Role role = null;
        
        String sql = "SELECT * FROM role WHERE role_id=?";
        
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, roleID);
            rs = ps.executeQuery();
            
            rs.next();
            
            int rID = rs.getInt(1);
            String rName = rs.getString(2);
            
            role = new Role(rID, rName);
            
        } finally {
            DBUtil.closePreparedStatement(ps);
            DBUtil.closeResultSet(rs);
            cp.freeConnection(con);
        }
        
        return role;
    }
}
