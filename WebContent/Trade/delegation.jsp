<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import = "java.util.Iterator" %>
<%@page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./js/j_category.js"></script>
</head>
<body>
	<div class="container">
<br /><br />
  <a class="waves-effect waves-light btn" onClick="expandAll();"><i class="material-icons left">fullscreen</i>Expand All</a>
  <a class="waves-effect waves-light btn" onClick="collapseAll();"><i class="material-icons left">fullscreen_exit</i>Collapse All</a>
<br /><br />
        <ul class="collapsible" data-collapsible="expandable">
            <li>
              <div class="collapsible-header"><i class="mdi-navigation-chevron-right"></i><a name="987"/>First</a></div>
              <div class="collapsible-body"><p>First Things First</p></div>
            </li>
            <li>
              <div class="collapsible-header"><i class="mdi-navigation-chevron-right"></i>Second</div>
              <div class="collapsible-body"><p>Give me a second ...</p></div>
            </li>
            <li>
              <div class="collapsible-header"><i class="mdi-navigation-chevron-right"></i>Third</div>
              <div class="collapsible-body"><p>I don't like being a third wheel</div>
            </li>
            <li>
              <div class="collapsible-header"><i class="mdi-navigation-chevron-right"></i>4</div>
              <div class="collapsible-body"><p>I don't asdsadasdasd being a third wheel</div>
            </li>
        </ul>

    </div>
</body>
</html>