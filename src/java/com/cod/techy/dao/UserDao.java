
package com.cod.techy.dao;
import com.cod.techy.entities.User;
import static java.lang.reflect.Array.set;
import java.sql.*;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    //method to insert user to database
    
    public boolean saveUser(User user)
    {
        boolean f=false;
        try
        {
            //user --> database
           
            String query="insert into users(name,email,password,gender,about) values(?,?,?,?,?)";
            PreparedStatement ps=this.con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            ps.executeUpdate();
            f=true;
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return f;
    }
    
    //get user by useremailand password
    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        
        try{
            
            
            String query="select *from users where email=? and password=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1,email);
            ps.setString(2, password);
            
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                user =new User();
                
                //data from database
                String name=rs.getString("name");
                
                //set to user object
                user.setName(name);
                
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    
    //Update User
    public boolean updateUser(User user)
    {
        boolean f=false;
        try
        {
            String query = "update users set name=?, email=?, password=?, about=?, profile=? where id=?";
            PreparedStatement ps=con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getAbout());
            ps.setString(5, user.getProfile());
            ps.setInt(6, user.getId());
            
            ps.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
         e.printStackTrace();
        }
        return f;
    }
    
    public User getUserByUserId(int userId)
    {
        User user=null;
        try
        {
            String query = "select *from users where id=?";
            PreparedStatement ps= this.con.prepareStatement(query);
            ps.setInt(1, userId);
            ResultSet rs=ps.executeQuery();
            if(rs.next())
            {
                 user =new User();
                
                //data from database
                String name=rs.getString("name");
                
                //set to user object
                user.setName(name);
                
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return user;
    }
}
