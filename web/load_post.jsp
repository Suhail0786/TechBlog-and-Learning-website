<%@page import="com.cod.techy.entities.User"%>
<%@page import="com.cod.techy.dao.LikeDao"%>
<%@page import="com.cod.techy.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.cod.techy.dao.PostDao"%>
<%@page import="com.cod.techy.helper.ConnectionProvider"%>

<div class="row">
<%
    User uuu=(User)session.getAttribute("currentUser");
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    
    int cid=Integer.parseInt(request.getParameter("cid"));
     List<Post> post = null;
    if(cid==0)
    {
         post=dao.getAllPosts();
    }
    else
    {
        post=dao.getPostByCatId(cid);
    }
    
    if(post.size()==0)
    {
        out.println("<h3 class='display-3 text-center'>No Post in this category</h3>");
        return;
    }
    for(Post p: post)
    {
%>
        
<div class="col-md-6 mt-2">
    <div class="card">
        <img class="card-img-top" src="post_pics/<%= p.getpPic()%>" alt="default.png">
        <div class="card-body">
            <b><%=p.getpTitle()%></b>
            <p><%=p.getpContent()%></p>
          
        </div>
            <div class="card-footer text-center">
                <%
                LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
                %>
                <a href="show_post_page.jsp?post_id=<%= p.getPid()%>" class="btn btn-outline-primary btn-sm">Read More..</a>
                <a href=""  onclick="doLike(<%= p.getPid() %>,<%= uuu.getId()%>)" class="btn btn-outline-primary btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%=ldao.countLikeOnPost(p.getPid())%></span></a>
                <a href="" class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting"></i> <span></span></a>
            </div>
    </div>
</div>        
        
 <%
    }



%>
</div>