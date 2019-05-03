<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>员工列表</title>
<% pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
<script type="text/javascript"src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
   <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
		<!-- 搭建显示界面 -->
	<div class="container">
		<!-- 标题 -->
		<div class="row	">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row	">
			<div class="col-md-4 col-md-offset-8">
				<button type="button" class="btn btn-primary">新增</button>
				<button type="button" class="btn btn-danger">删除</button>
			</div>
		</div>
		<div class="row	">
			<div class="col-md-12">
				<table class=" table table-hover">
					<tr>
					<th>#</th>
					<th>empName</th>
					<th>gender</th>
					<th>email</th>
					<th>deptName</th>
					<th>操作</th>
					</tr>
					<c:forEach items="${PageInfo.list }" var="emp">
					<tr>
						<td>${emp.empId }</td>
						<td>${emp.empName }</td>
						<td>${emp.gender=="M"?"男":"女" }</td>
						<td>${emp.department.deptName}</td>
						<td>department</td>
						<td>
							<button class="btn btn-primary btn-sm">
					  	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑
							</button>
							<button class="btn btn-danger btn-sm">
					 	<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>							
							删除
							</button>
						</td>
					</tr>
					</c:forEach>
					
				</table>
			</div>
		</div>
		<div class="row	">
			<div class="col-md-6">
				当前第${PageInfo.pageNum }页,共${PageInfo.pages }页,共${PageInfo.total }记录
			</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
  <ul class="pagination">
  <li>
  	<a href="#">首页</a>
  </li>
  <c:if test="${PageInfo.hasPreviousPage }">
  	<li>
      <a href="${APP_PATH }/emps?pn=${PageInfo.pageNum-1}" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>
  </c:if>
    
    <c:forEach items="${PageInfo.navigatepageNums }" var="page_Num">
    	<c:if test="${page_Num==PageInfo.pageNum }">
    	 <li class="active"><a href="#" >${page_Num}</a></li>
    	</c:if>
    	<c:if test="${page_Num != PageInfo.pageNum }">
    	 <li><a href="${APP_PATH}/emps?pn=${page_Num}" >${page_Num}</a></li>
    	</c:if>
    	
    </c:forEach>
   <c:if test="${PageInfo.hasNextPage }">
   	<li>
      <a href="${APP_PATH }/emps?pn=${PageInfo.pageNum+1}" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
   </c:if>
       <li>
  	<a href="#">末页</a>
  </li>
  </ul>
</nav>
			</div>
		</div>
	</div>

</body>
</html>