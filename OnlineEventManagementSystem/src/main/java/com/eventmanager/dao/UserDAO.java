package com.eventmanager.dao;
import com.eventmanager.model.User; import com.eventmanager.util.*; import java.sql.*; import java.util.*;
public class UserDAO {
 public User login(String email,String password)throws SQLException{String q="SELECT id,name,email,role FROM users WHERE email=? AND password_hash=?";try(Connection c=DB.getConnection();PreparedStatement p=c.prepareStatement(q)){p.setString(1,email);p.setString(2,PasswordUtil.sha256(password));ResultSet r=p.executeQuery();if(r.next())return new User(r.getInt(1),r.getString(2),r.getString(3),r.getString(4));}return null;}
 public List<User> all()throws SQLException{List<User> l=new ArrayList<>();try(Connection c=DB.getConnection();PreparedStatement p=c.prepareStatement("SELECT id,name,email,role FROM users ORDER BY id DESC")){ResultSet r=p.executeQuery();while(r.next())l.add(new User(r.getInt(1),r.getString(2),r.getString(3),r.getString(4)));}return l;}
 public void create(String n,String e,String pass,String role)throws SQLException{try(Connection c=DB.getConnection();PreparedStatement p=c.prepareStatement("INSERT INTO users(name,email,password_hash,role) VALUES(?,?,?,?)")){p.setString(1,n);p.setString(2,e);p.setString(3,PasswordUtil.sha256(pass));p.setString(4,role);p.executeUpdate();}}
 public void delete(int id)throws SQLException{try(Connection c=DB.getConnection();PreparedStatement p=c.prepareStatement("DELETE FROM users WHERE id=?")){p.setInt(1,id);p.executeUpdate();}}
}
