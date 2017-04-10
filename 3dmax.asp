<!--#include file="conn.asp"-->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>3D MAX精品课程</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<% set rs = server.createobject("adodb.recordset") %>
	<div class="topnav">
		<div class="menu-icon">
			<span class="glyphicon glyphicon-menu-hamburger"></span>
		</div>
		<span class="glyphicon glyphicon-file"></span>
		3D MAX精品课程
	</div>

	<ul class="menu">
			<li class="close-icon"><span class="glyphicon glyphicon-remove"></span></li>
			<% 	'sql = "select * from cpt"
				'rs.open sql,conn,1,1
				'do while not rs.eof
				for i=1 to 13 %>
			<li><a href="?cid=<%=i%>">第<%= i %>章</a></li>
			<%  next 
				'rs.movenext
				'loop
				'rs.close %>
	</ul>

	<div class="container">
		<div class="chapter-info">
			<% 	chapter_id=trim(request.querystring("cid"))
				'section_id=trim(request.querystring("sid"))
				'if section_id="" then section_id=1
				if chapter_id<>"" then
					'sql="select * from cpt where id=" & chapter_id
					'rs.open sql,conn,1,1
					'if not rs.eof then
			%>
			<h1>第 <%= chapter_id %> 章</h1>

		</div>

		<div class="teaching-nav">
			<div class="section-choice">
				<div class="dropdown">
				  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
				    选择小节
				    <span class="caret"></span>
				  </button>
				  
				</div>
			</div>
			<div class="material-download">
				<div class="btn-group">
				  <button type="button" class="btn btn-md dropdown-toggle" data-toggle="dropdown">
				    资源下载 <span class="caret"></span>
				  </button>
				  <ul class="dropdown-menu">
				    <li><a href="3dmax_pdf/<%=chapter_id%>.pdf" target="_blank">课件</a></li>
				    <li><a href="#">素材</a></li>
				  </ul>
				</div>
			</div>
		</div>

		<div class="teaching-content">
			<%	if chapter_id<10 then chapter_id_txt="0" & chapter_id
				chapter_dir_name = "Char" & chapter_id_txt
				video_path = "3dmax_video/" & chapter_dir_name & "/" & chapter_id & "-" & section_id
				Set fs = server.CreateObject("scripting.filesystemobject")
				for i=1 to 5
				video_full_path = server.mapPath(video_path & "-" & i & ".mp4")
				video_full_path_withoutSectionNo = server.mapPath(video_path & ".mp4")
				'response.write video_full_path & "<br>"
				if fs.fileExists(video_full_path) then
			%>
			<video src="<%= video_path & "-" & i %>.mp4" width="100%" controls >
				您的浏览器太古老,不能显示视频
			</video>
			<%	elseif i=1 and fs.fileExists(video_full_path_withoutSectionNo) then %>
			<video src="<%= video_path %>.mp4"  width="100%" controls >
				您的浏览器太古老,不能显示视频
			</video>
			<%	end if
				next  %>
		</div>

		<% 			'rs.close
					'end if	%>

	    <% 	else  %>
		<div class="teaching-content">
			课程介绍
		</div>

		<%	end if  %>
	</div>

	<% 	set rs=nothing
		call closeconn %>

	<script src="jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script>
		var speed = 200
		var cehuacaidan = function(){
			$('.menu-icon').click(function(){
				$('body').animate({left: '230px'}, speed);
				$('.menu').animate({left: '0px'}, speed);
			});

			$('.close-icon').click(function(){
				$('body').animate({left: '0px'}, speed);
				$('.menu').animate({left: '-230px'}, speed);
			});
		}

		$(document).ready(cehuacaidan);


		var dianzan = function(){
			$('.like').click(function(){
				$(this).toggleClass('liked');
			});
		}

		$(document).ready(dianzan);
	</script>
</body>
</html>
