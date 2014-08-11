<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新闻管理</title>
	<link href="css/common.css" rel="stylesheet" type="text/css" />
	<link href="css/news.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" charset="utf-8" src="ueditor/editor_config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor/editor_all.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/news.js"></script>
</head>
<body>
	<div id="content_t">新闻管理</div>
	<div id="content">
		<span class="font_red"><s:actionmessage/></span>
		<table class="tb_top">
		<tr><th width="150px">新闻标题(点击查看)</th><th>类别</th><th>阅读量</th><th>是否置顶</th><th>编辑</th><th>发布时间</th><th>置顶</th><th>修改</th><th>删除</th></tr>
		<s:iterator value="newslist" var="news">
			<tr><td width="150px">
				<s:if test="#news.islink==1">
					<a href="${news.link }" target="_blank"><div class="break">${news.title}</div></a></td><td>${news.subItem.item.itemName}/${news.subItem.subItemName}</td><td>${news.hasread}</td><td><s:if test="#news.settop==1">是</s:if><s:else>否</s:else></td><td>${news.editor.adminName}</td><td>${news.createtime}</td><td><span class="font_gray"><s:if test="#news.settop==1"><a href="news_setTop?newsID=${newsID }&settop=0">取消置顶</a></s:if><s:else><a href="news_setTop?newsID=${newsID }&settop=1">置顶</a></s:else></span></td><td><a href="news_find?newsID=${news.newsID}&currentPage=${currentPage}&itemID=${news.subItem.item.itemID}&subItemID=${news.subItem.subItemID}">修改</a></td><td><a href="news_delete?newsID=${news.newsID}&currentPage=${currentPage}" onClick="if(confirm('删除不可恢复，真的要删除吗？'))return true;return false;">删除</a>
				</s:if>
				<s:else>
					<a href="<%=basePath%>html/news/<fmt:formatDate value="${news.createtime}" pattern="yyyy"/>/<fmt:formatDate value="${news.createtime}" pattern="MM"/>/<fmt:formatDate value="${news.createtime}" pattern="dd"/>/news-${news.newsID}.html" target="_blank"><div class="break">${news.title}</div></a></td><td>${news.subItem.item.itemName}/${news.subItem.subItemName}</td><td>${news.hasread}</td><td><s:if test="#news.settop==1">是</s:if><s:else>否</s:else></td><td>${news.editor.adminName}</td><td>${news.createtime}</td><td><span class="font_gray"><s:if test="#news.settop==1"><a href="news_setTop?newsID=${newsID }&settop=0">取消置顶</a></s:if><s:else><a href="news_setTop?newsID=${newsID }&settop=1">置顶</a></s:else></span></td><td><a href="news_find?newsID=${news.newsID}&currentPage=${currentPage}&itemID=${news.subItem.item.itemID}&subItemID=${news.subItem.subItemID}">修改</a></td><td><a href="news_delete?newsID=${news.newsID}&currentPage=${currentPage}" onClick="if(confirm('删除不可恢复，真的要删除吗？'))return true;return false;">删除</a>
				</s:else>
			</td></tr>	
		</s:iterator>
		</table>
		<!-- 分页 -->
		<div class="fenye" style="float:left;margin-right:5px">
			&nbsp;共<s:property value="page.totalPage"/>页  第${currentPage}页
				<s:if test="page.hasPrePage">
					<a href="news_findAll?currentPage=1" class="font_b">首页</a>
					<a href="news_findAll?currentPage=${currentPage - 1}" class="font_b">上一页</a>
				</s:if>
				<s:else>
					首页
					上一页
		  </s:else>
				<s:if test="page.hasNextPage">
					<a href="news_findAll?currentPage=${currentPage + 1}" class="font_b">下一页</a>
					<a href="news_findAll?currentPage=${page.totalPage}" class="font_b">尾页</a>
				</s:if>
				<s:else>
					下一页
					尾页
				</s:else>
		</div>
		<form class="fenye" action="news_findAll" method="get" ">
					<input name="currentPage" id="currentPage" type="text" style="width:25px" />
					<input type="submit"  value="Go"/>
				</form>
		<!-- 分页  end-->
		<div id="div_detail">
         <span id="shouqi"><a href="javascript:shouqi();">点击此处收起新闻</a> <a href="news_find?newsID=${news.newsID}">修改新闻</a></span>
			<span id="n_title"></span>
			<div id="n_attr"><span class="font_red">所属类别:</span><span id="n_newsType"></span>&nbsp;&nbsp;<span class="font_red">发布人:</span><span id="n_atrname"></span>&nbsp;&nbsp;<span class="font_red">阅读/回复:</span><span id="n_hasread"></span>&nbsp;&nbsp;<span class="font_red">置热:</span><span id="n_sethot"></span>&nbsp;&nbsp;<span class="font_red">置顶:</span><span id="n_settop"></span>&nbsp;&nbsp;<span class="font_red">发布时:</span><span id="n_createtime"></span></div>
			<div id="n_content">
			</div>
		</div>
		
	</div>
	<s:debug></s:debug>
</body>
</html>