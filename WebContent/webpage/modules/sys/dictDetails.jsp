<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>字典管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  return true;
		  }
	
		  return false;
		}
		$(document).ready(function() {
			$("#value").focus();
			 validateForm = $("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<form:form id="inputForm" modelAttribute="dict" action="${ctx}/sys/dict/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
		      <tr>
		         <td  class="width-15 active">	<label class="pull-right">键值</label></td>
		         <td class="width-35" >
					 ${dict.value}
				 </td>
		         <td  class="width-15 active">	<label class="pull-right">标签</label></td>
		          <td  class="width-35" >
					  ${dict.label}
				  </td>
		      </tr>
		       <tr>
		         <td  class="width-15 active">	<label class="pull-right">类型</label></td>
		         <td class="width-35" >
					 ${dict.type}
				 </td>
		         <td  class="width-15 active">	<label class="pull-right">描述</label></td>
		          <td  class="width-35" >
					  ${dict.description}
				  </td>
		      </tr>
		       <tr>
		         <td  class="width-15 active">	<label class="pull-right">排序</label></td>
		         <td class="width-35" >
					 ${dict.sort}
				 </td>
		         <td  class="width-15 active">	<label class="pull-right">备注</label></td>
		          <td  class="width-35" >
					  ${dict.remarks}
				  </td>
		      </tr>
		   </tbody>
		   </table>   
	</form:form>
</body>
</html>