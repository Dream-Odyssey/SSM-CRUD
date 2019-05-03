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
<!--员工修改模态框 -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工修改</h4>
      </div>
      <div class="modal-body">
       <!-------------------------- 内联表单----------------------------------------- -->
       <form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">empName</label>
    <div class="col-sm-10">
       <p class="form-control-static" id="empName_update_static"></p>
    <span id="helpBlock2" class="help-block"></span>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">email</label>
    <div class="col-sm-10">
      <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@qq.com">
     	<span id="helpBlock2" class="help-block"></span>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">gender</label>
    <div class="col-sm-10">
      <label class="radio-inline">
  <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
</label>
<label class="radio-inline">
  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
</label>
    </div>
  </div>
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">deptName</label>
    <div class="col-sm-4">
	<select class="form-control" name="dId" id="dept_update_select">
	  
	</select>
    </div>
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="emp_close_btn">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
      </div>
    </div>
  </div>
</div>


<!--员工新增模态框 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
      </div>
      <div class="modal-body">
       <!-------------------------- 内联表单----------------------------------------- -->
       <form class="form-horizontal">
  <div class="form-group">
    <label for="inputEmail3" class="col-sm-2 control-label">empName</label>
    <div class="col-sm-10">
      <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
    <span id="helpBlock2" class="help-block"></span>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">email</label>
    <div class="col-sm-10">
      <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@qq.com">
     	<span id="helpBlock2" class="help-block"></span>
    </div>
  </div>
  <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">gender</label>
    <div class="col-sm-10">
      <label class="radio-inline">
  <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
</label>
<label class="radio-inline">
  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
</label>
    </div>
  </div>
   <div class="form-group">
    <label for="inputPassword3" class="col-sm-2 control-label">deptName</label>
    <div class="col-sm-4">
	<select class="form-control" name="dId" id="dept_add_select">
	  
	</select>
    </div>
  </div>
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" id="emp_close_btn">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
      </div>
    </div>
  </div>
</div>
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
				<button type="button" class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button type="button" class="btn btn-danger" id="emp_delete_modal_btn">删除</button>
			</div>
		</div>
		<div class="row	">
			<div class="col-md-12">
				<table class=" table table-hover" id="emps_table">
				<!-- 表头 -->
				<thead>
					<tr>
					<th><input type="checkbox" id="check_all"/></th>
					<th>#</th>
					<th>empName</th>
					<th>gender</th>
					<th>email</th>
					<th>deptName</th>
					<th>操作</th>
					</tr>
				</thead>
				<!-- 表格 -->
				<tbody>
					
				</tbody>
					
				</table>
			</div>
		</div>
		<div class="row	">
		<!-- 标签信息 -->
			<div class="col-md-6" id="page_info_area">
				
			</div>
		<!-- 导航栏信息 -->
			<div class="col-md-6" id="page_nav_area">
				
			</div>
		</div>
	</div>
<script type="text/javascript">
	var totalRecord;
	var currentPage;
	//发送一个ajax请求，获得分页数据
	$(function(){
		to_page(1);
	});
	function to_page(pn){
		$.ajax({
			url:"${APP_PATH}/emps",
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				//console.log(result);
				//1、在页面解析jason数据并且显示员工数据
				build_emps_table(result);
				//2、解析显示分页信息
				build_page_info(result);
				//3、解析显示分页条信息
				bulid_page_nav(result);
				
			}
		});
	};
	//------------------------------------------员工显示模块-----------------------------------------------------
	//显示员工数据	
	function build_emps_table(result){
		//构建一个新的表格之前需要清空之前的数据
		$("#emps_table tbody").empty();
		var emps=result.extend.pageInfo.list;//这是员工数据
		$.each(emps,function(index,item){
			var empIdTd = $("<td></td>").append(item.empId);
			var empNameTd= $("<td></td>").append(item.empName);
			var genderTd=$("<td></td>").append(item.gender=='M'?"男":"女");
			var emailTd=$("<td></td>").append(item.email);
			var deptName=$("<td></td>").append(item.department.deptName);
			/*
				<button class="btn btn-primary btn-sm">
					  	<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							编辑
							</button>
				<button class="btn btn-danger btn-sm">
			 	<span class="glyphicon glyphicon-trash" aria-hidden="true"></span>							
					删除
					</button>
			*/
			var checkBoxTd=$("<td></td>").append("<input type='checkbox' class='check_item'/>");
			var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
			.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
			//为编辑按钮自定义一个属性，用来保存对应员工的id
			editBtn.attr("edit-id",item.empId);
			var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
			.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
			//为删除按钮自定义一个属性，用来保存对应员工的id
			delBtn.attr("del-id",item.empId);
			var btnTd=$("<td></td>").append(editBtn).append(" ").append(delBtn);
			$("<tr></tr>").append(checkBoxTd)
			.append(empIdTd)
			.append(empNameTd)
			.append(genderTd)
			.append(emailTd)
			.append(deptName)
			.append(btnTd)
			.appendTo("#emps_table tbody");
		});
	}
	//解析显示分页信息
	function build_page_info(result){
		//清空之前的信息
		$("#page_info_area").empty();
		$("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+"页,共"+result.extend.pageInfo.pages+" 页,共"+result.extend.pageInfo.total+" 记录");
		totalRecord=result.extend.pageInfo.total;
		currentPage=result.extend.pageInfo.pageNum;
	}
	
	//解析显示分页条
	function bulid_page_nav(result){
		//清空之前的信息
		$("#page_nav_area").empty();
		//page_nav_area
		var ul=$("<ul></ul>").addClass("pagination");
		var firstPageLi= $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var prePageLi= $("<li></li>").append($("<a></a>").append("&laquo;"));
		if(result.extend.pageInfo.hasPreviousPage==false){
			//判断是否有前一页
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		} else{
			//为元素添加点击翻页的事件
			firstPageLi.click(function(){
				to_page(1);
			});
			prePageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum-1);
			});
		};
		
		ul.append(firstPageLi).append(prePageLi);
		var nextPageLi= $("<li></li>").append($("<a></a>").append("&raquo;"));
		var lastPageLi= $("<li></li>").append($("<a></a>").append("末页"));
		if(result.extend.pageInfo.hasNextPage==false){
			nextPageLi.addClass("disabled");
			lastPageLi.addClass("disabled");
		}
			//为末页和下一页添加点击跳转事件
			nextPageLi.click(function(){
				to_page(result.extend.pageInfo.pageNum+1);
			});
			lastPageLi.click(function(){
				to_page(result.extend.pageInfo.pages);
			});
		$.each(result.extend.pageInfo.navigatepageNums,function(index,item){			
			var numLi=$("<li></li>").append($("<a></a>").append(item));
			if(result.extend.pageInfo.pageNum==item){
				//判断是否是当前页，如果是就高亮显示
					numLi.addClass("active");		
						};
			numLi.click(function(){
				//调用ajax请求，跳转到指定页面
				to_page(item);
			});
			ul.append(numLi);
		});
		
		ul.append(nextPageLi).append(lastPageLi);
		var navEle=$("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	};
	//------------------------------------------员工新增模块-----------------------------------------------------
	//表单数据重置函数
	function reset_form(ele){
		$(ele)[0].reset();
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
		
	};
	//点击新增按钮，弹出模态框
	$("#emp_add_modal_btn").click(function(){
		//弹出之前，表单数据重置
		reset_form("#empAddModal form");
		//弹出之前，发送ajax请求，查出部门信息，显示在下拉列表里
		getDepts("#dept_add_select");
		$("#empAddModal").modal({
			backdrop:"static"
		});
	});
	//查出部门信息
	function getDepts(ele){
		$(ele).empty();
		$.ajax({
			url:"${APP_PATH}/depts",
			type:"GET",
			success:function(result){
				$.each(result.extend.depts,function(){
					var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
					optionEle.appendTo(ele);
				});
			}
		});

		
	};
	//校验表单数据格式是否规范的函数
	function validate_add_form(){
		//拿到要校验的数据，用正则表达式判断
		var empName =$("#empName_add_input").val();
		var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		//1、校验用户名
		if(!regName.test(empName)){
			//让输入框变色，添加has-error类
			//给输入框下的span元素添加错误信息
			//调用用户信息状态判断函数
			show_validate_msg("#empName_add_input","error","用户名可以是2-5位中文或6-16位英文和数字的组合");
			return false;
		}else{
			show_validate_msg("#empName_add_input","success","");
		};
		//2、校验邮箱信息
		var email=$("#email_add_input").val();
		var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!regEmail.test(email)){
			show_validate_msg("#email_add_input","error","邮箱格式不正确");
			return false;
		}else{
			show_validate_msg("#email_add_input","success","");
		};
		return true;
	};
	//提取一个用于校验用户信息状态的函数
	function show_validate_msg(ele,status,msg){
		//先清空之前的状态信息
		$(ele).parent().removeClass("has-error has-success");
		$(ele).next("span").text("");
		if(status=="success"){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		};
		if(status=="error"){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		};
		
	};
	//为保存按钮添加点击绑定，进行用户数据提交到数据库的操作
	$("#emp_save_btn").click(function(){
		//对要提交给服务器的数据进行校验工作，判断格式是否符合
	 	if(!validate_add_form()){
			return false;
		}
		//判断用户名是否已存在
		if($("#emp_save_btn").attr("ajax_va")=="error"){
			return false;
		}
		//发送ajax请求，保存员工	
		$.ajax({
			url:"${APP_PATH}/emp",
			type:"POST",
			data:$("#empAddModal form").serialize(),
			success:function(result){
				//后端判断用户信息是否规范
				if(result.code==100){
					$("#empAddModal").modal('hide');//点击保存以后关闭模块狂
					to_page(totalRecord);
				}else{
					if(result.extend.errorFields.email!=undefined){
						show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
					}
					if(result.extend.errorFields.empName!=undefined){
						show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
					}
				}
			
			}
		});
	});
	//判断用户名是否已经存在，当用户名改变时提交ajax请求查询数据库内是否有相同用户名
	$("#empName_add_input").change(function(){
		var empName=this.value;
		$.ajax({
			url:"${APP_PATH}/checkUser",
			data:"empName="+empName,
			type:"POST",
			success:function(result){
				if(result.code==100){
					show_validate_msg("#empName_add_input","success","用户名可用");
					$("#emp_save_btn").attr("ajax_va","success");
					
				}else{
					show_validate_msg("#empName_add_input","error",result.extend.va_msg);
					$("#emp_save_btn").attr("ajax_va","error");
				};
			}
		});
	});
	//------------------------------------------员工修改模块--------------------------------------------------------
	$(document).on("click",".edit_btn",function(){
		//显示模态框之前先查询部门信息
		getDepts("#dept_update_select");
		//查询员工信息显示在模态框里
		getEmp($(this).attr("edit-id"));
		//给更新按钮传递员工id
		$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
		//弹出模态框
		$("#empUpdateModal").modal({
			backdrop:"static"
		});
	});
	function getEmp(id){
		$.ajax({
			url:"${APP_PATH}/emp/"+id,
			type:"GET",
			success:function(result){
				var empData=result.extend.emp;
				$("#empName_update_static").text(empData.empName);
				$("#email_update_input").val(empData.email);
				$("#empUpdateModal input[name=gender]").val([empData.gender]);
				$("#empUpdateModal select").val([empData.dId]);
			}
		});
	};
	//为员工修改的更新按钮添加点击绑定事件
	$("#emp_update_btn").click(function(){
		//校验邮箱信息是否规范
		var email=$("#email_update_input").val();
		var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!regEmail.test(email)){
			show_validate_msg("#email_update_input","error","邮箱格式不正确");
			return false;
		}else{
			show_validate_msg("#email_update_input","success","");
		};
		$.ajax({
			url:"${APP_PATH}/emps/"+$(this).attr("edit-id"),
			type:"PUT",
			data:$("#empUpdateModal form").serialize(),
			success:function(result){
				//关闭模态框
				$("#empUpdateModal").modal("hide");
				//跳转到本页面
				to_page(currentPage);
			}
		});
		
	});
	//--------------------------------------------员工删除模块---------------------------------------------------------
	//单个删除功能
	$(document).on("click",".delete_btn",function(){
		var empName=$(this).parents("tr").find("td:eq(2)").text();
		if(confirm("确认删除【"+empName+"】吗")){
			$.ajax({
				url:"${APP_PATH}/emp/"+$(this).attr("del-id"),
				type:"DELETE",
				success:function(result){
					alert(result.msg);
					to_page(currentPage);
				}
			});
		}
	});
	// -------------------------------------------全选/全不选按钮------------------------------------------
	$("#check_all").click(function(){
		$(".check_item").prop("checked",$("#check_all").prop("checked"));
	});
	$(document).on("click",".check_item",function(){
		var flag=$(".check_item:checked").length==$(".check_item").length;
		$("#check_all").prop("checked",flag);
	});
	//批量删除
	$("#emp_delete_modal_btn").click(function(){
		var empNames="";
		var del_idstr="";
		$.each($(".check_item:checked"),function(){
			empNames+=$(this).parents("tr").find("td:eq(2)").text()+",";
			del_idstr+=$(this).parents("tr").find("td:eq(1)").text()+"-";
		});
		empNames=empNames.substring(0,empNames.length-1);
		del_idstr=del_idstr.substring(0,del_idstr.length-1);
		if(confirm("确认要删除【"+empNames+"】吗？")){
			$.ajax({
				url:"${APP_PATH}/emp/"+del_idstr,
				type:"DELETE",
				success:function(result){
					alert(result.msg);
					to_page(currentPage);
				}
			});
		}
	});
</script>
</body>
</html>