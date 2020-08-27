
package com.cod.techy.dao;
import com.cod.techy.entities.Category;
import com.cod.techy.entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    Connection conn;

    public PostDao(Connection conn) {
        this.conn = conn;
    }
    
    public ArrayList<Category> getAllCategories()
    {
        ArrayList<Category> list=new ArrayList<>();
        
        try
        {
            String query="select *from categories";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(query);
            while(rs.next())
            {
                int cid=rs.getInt("cid");
                String name = rs.getString("name");
                String description = rs.getString("description");
                Category c = new Category(cid,name,description);
                list.add(c);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return list;
    }
    
    public boolean savePost(Post post){
        boolean f=false;
        try
        {
            String query = "insert into posts(pTitle, pContent, pCode, pPic, catid, userid) values(?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            
            ps.setString(1, post.getpTitle());
            ps.setString(2, post.getpContent());
            ps.setString(3, post.getpCode());
            ps.setString(4, post.getpPic());
            ps.setInt(5, post.getCatid());
            ps.setInt(6, post.getUserid());
            
            ps.executeUpdate();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
    
    //get all the post
    public List<Post> getAllPosts()
    {
        List<Post> list =  new ArrayList<>();
        //fetch all the post
        try
        {
            PreparedStatement ps = conn.prepareStatement("select *from posts order by pid desc");
            
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int catid = rs.getInt("catid");
                int userid = rs.getInt("userid");
                Post post = new Post(pid,pTitle,pContent,pCode,pPic,date,catid,userid);
                
                list.add(post);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> getPostByCatId(int catid)
    {
        List<Post> list =  new ArrayList<>();
        
        //fetch all the post by id
        try
        {
            PreparedStatement ps = conn.prepareStatement("select *from posts where catid=?");
            ps.setInt(1, catid);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next())
            {
                int pid = rs.getInt("pid");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String pPic = rs.getString("pPic");
                Timestamp date = rs.getTimestamp("pDate");
                int userid = rs.getInt("userid");
                Post post = new Post(pid,pTitle,pContent,pCode,pPic,date,catid,userid);
                
                list.add(post);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return list;
    }
    
    public Post getPostByPostId(int postId) throws SQLException
    {
        Post p = null;
        String query="select *from posts where pid=?";
        try
        {
        PreparedStatement ps = this.conn.prepareStatement(query);
        
        ps.setInt(1,postId);
        ResultSet rs = ps.executeQuery();
        
        if(rs.next())
        {
            int pid = rs.getInt("pid");
            String pTitle = rs.getString("pTitle");
            String pContent = rs.getString("pContent");
            String pCode = rs.getString("pCode");
            String pPic = rs.getString("pPic");
            Timestamp date = rs.getTimestamp("pDate");
            int cid = rs.getInt("catid");
            int userid = rs.getInt("userid");
             p = new Post(pid,pTitle,pContent,pCode,pPic,date,cid,userid);
            
        }
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return p;
    }
}
