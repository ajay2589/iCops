<%@page language="java" import="java.sql.*, usr.Profile "%>
<jsp:useBean id="lg" class="login.Login" scope="session"/>
<jsp:setProperty name="lg" property="*" />
<%
lg.init(request.getSession());
if(lg.checkSession()!=0)
{
    Profile p= new Profile(request);
    if(request.getParameter("fname")!=null)
        {
            p.setProfileInfo();
        }
    p.getProfileInfo();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="SHORTCUT ICON" href="images/icon.ico"/>
<title>icops</title>
<script type="text/javascript" src="chat.js"></script>
<script type="text/javascript">
    function maintainsession()
    {
        var d=new Date;
        var xmlhttp=new XMLHttpRequest();
        var time=d.getTime();
        url="blank.jsp?&time="+time;
        xmlhttp.open("GET",url,true);
        xmlhttp.send();
        setTimeout("maintainsession()", 30000);
    }
    function load()
    {
        document.getElementById("navHome").className='act';
        setTimeout("maintainsession()", 30000);
        initchat();
    }

</script>
<meta http-equiv="Content-Language" content="English" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css" href="style.css" media="screen" />
</head>
    <body onload="load()">
<div class="rightmost">
<i><a href="logout.jsp">logout</a></i>
</div>
<div id="wrap">
<div id="header">
<div class="headings">
<h1><a href="#">iCops</a></h1>
<br />
<h2><% out.print(lg.heading); %></h2>
</div>
<div class="nav">
<ul>
<% for(int i=0;i<lg.nav.length;i++)
{
%>
<li id="nav<%= lg.nav[i][0] %>"><a href="<%= lg.nav[i][1] %>"><%= lg.nav[i][0] %></a></li>
<% } %>
</ul>
</div>
</div>

<div id="left">

<h1><a href="#"><% out.print(lg.welcome); %></a></h1>
<div class="tab">
<ul>
<li class="act"><a href="#">Edit Profile</a></li>
</ul>
</div>
<div id="profedit">
    <form id="form1" method="post" action="">
    <table cellpadding="2">
    <tr>
    <td>
    <label>
    <div align="right">FirstName
      <input name="fname" type="text" class="inpu" value="<% out.print(p.fname); %>" />
        <br />
        <br />
      LastName
      <input name="lname" type="text" value="<% out.print(p.lname); %>" />
    </div>
    </label>
    <label><br />
    </label></td>
    <td>
    Designation/Occupation<br />
    <input name="designation" type="text" size="40" value="<% out.print(p.designation); %>" /></td>
    </tr>
    <tr>    </tr>
    <tr>
    <td colspan="2"><p>Address/Location</p>
    <label>
    <textarea name="address" cols="80" rows="10"><% out.print(p.address); %></textarea>
    </label>          <label></label></td>
    </tr>

    <tr>
    <td><label>
    <div align="center">email ID
    <input type="text" name="email" value="<% out.print(p.email); %>" />
    </div>
    </label>          <label>
    <div align="center"><br />
    Hospitals
    <input type="text" name="hospitals" value="<% out.print(p.hospitals); %>" />
    </div>
    </label></td>
    <td>
      <div align="right">
        <p>Phone Number
          <input type="text" name="phno" value="<% out.print(p.contactno); %>" />
        </p>
        <p>            <br />
          Highways included
          <input type="text" name="highways" value="<% out.print(p.highway); %>" />
        </p>
      </div></td>
    </tr>

    <tr>
    <td colspan="2"><label>
    Staff Info<br />
    <textarea name="staffinfo" cols="80" rows="10"><% out.print(p.staffinfo); %></textarea>
    </label>          <label></label></td>
    </tr>
    <tr>
    <td colspan="2"><label>
    <div align="center">
    <input type="submit" name="Submit" value="Change" />
    </div>
    </label></td>
    </tr>
    </table>
    </form>
</div>
</div>
<div id="right">

<div class="adleft">
<img id="propic" alt="icon" src="<% out.print(lg.imgurl);%>" />
</div>
<div class="proright">
<ul>
    <li><img src="images/p_profile.gif" alt=""/><a href="profile.jsp">Profile...</a></li>
    <li><img src="images/p_scrap.gif" alt=""/><a class="act" href="profile-edit.jsp">Edit Profile...</a></li>
    <li><img src="images/p_settings.png" alt=""/><a href="#">Settings...</a></li>
    <li><img src="images/p_chat.png" alt=""/><a href="#">Chats...</a></li>
    <li><img src="images/events_ico.png" alt=""/><a href="#">Schedules...</a></li>
</ul>
</div>

<div style="clear: both;"> </div>

<div class="latestarticles">
<h2>Latest Alerts</h2>
<ul>
<li><a href="alerts.jsp?box=1">Wanted...</a></li>
<li><a href="alerts.jsp?box=2">Missing Person...</a></li>
<li><a href="alerts.jsp?box=3">Road Accidents...</a></li>
<li><a href="alerts.jsp?box=4">Other Alerts...</a></li>
</ul>
</div>

<div class="menuleft">
<h2>Users :</h2>
<ul>
<li><a href="#">State</a></li>
<li><a href="#">Police Officers</a></li> 
<li><a href="#">Polce Stations</a></li> 
<li><a href="#">Citizens</a></li> 
<li><a href="#">Guests</a></li> 
</ul>

<h2>Updates</h2>
<ul>
<li><a href="#">January 2007</a></li> 
<li><a href="#">February 2007</a></li> 
<li><a href="#">March 2007</a></li> 
<li><a href="#">April 2007</a></li>
<li><a href="#">May 2007</a></li> 
<li><a href="#">June 2007</a></li> 
<li><a href="#">July 2007</a></li> 
<li><a href="#">August 2007</a></li> 
<li><a href="#">September 2007</a></li>
<li><a href="#">October 2007</a></li>
<li><a href="#">November 2007</a></li>
<li><a href="#">December 2007</a></li>
</ul>
</div>

<div class="menuright">
<img src="images/sidepic.jpg" alt="x" />
</div>
</div>
<div style="clear: both;"> </div>
<div id="footer">
Designed by <a href="#">Government Engineering College</a>, Thanks to <a href="#">Our Department</a>
</div>
</div>
<div id="onlinediv"></div>
<div id="chat"></div>
</body>
</html>
<%
}
else{
    response.sendRedirect("login.jsp");
}
%>