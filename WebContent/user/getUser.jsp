<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="/assets/js/jquery.js"></script>
<script>

	$(document).on('click', '#cancel', function() {
		window.location.href = '/main/main.jsp';
	});

	$(document).on('click', '#history_back', function() {
		window.history.back();
	});
	
	
</script>
</head>
<body>
	
	<div class="container">
		<div class="wrapper">
			<div class="box">
				<div class="row row-offcanvas row-offcanvas-left">
					<jsp:include page="/layout/left.jsp" />
				</div>
			</div>
			<div class="column col-sm-12 col-xs-11" id="main">
				<jsp:include page="/layout/top.jsp" />
			</div>
		</div>
		<div class="row" >
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
				<br><br>
					<h2>ȸ������ ��ȸ</h2>		
					<form action="#" method="post" name="userForm">
						<table class="table table-boardered">
							<tr>
								<th>������ ����</th>
								<td>
								<img src="https://item.kakaocdn.net/do/d84248170c2c52303db27306a00fb861f604e7b0e6900f9ac53a43965300eb9a"
			     						align="left"></img>
			     			<br><br><br>
			     			<input size="5pt" class="btn btn-primary"
								align="left" id="updateProfile" name="updateProfile" value="�����ϱ�" disabled="disabled">
							<br><br>
							<input size="5pt" class="btn btn-primary"
								align="left" id="deleteProfile" name="deleteProfile" value="����" disabled="disabled">
			     			</td></tr>
							<tr>
							<th>���̵�</th>
							<td><input type="text" class="form-control" id="userId"
								 name="userId" value=${user.userId} disabled="disabled" ></td>
							</tr>
							<tr>
								<th>�н�����</th>
								<td><input type="password" class="form-control"
									name="password" disabled="disabled"></td>
							</tr>

							<tr>
								<th>�н�����Ȯ��</th>
								<td><input type="password" class="form-control"
									name="password2" disabled="disabled"></td>
							</tr>

							<tr>
								<th>�̸�</th>
								<td><input type="name" class="form-control" value=${user.userName} name="userName" disabled="disabled"></td>
							</tr>

							<tr>
								<th>�̸���</th>
								<td><input type="email" class="form-control" name="email"
									id="email" disabled="disabled" value=${user.email} ></td>
							</tr>

							<tr>
								<th>��ȭ��ȣ</th>
								<td><input type="tel" class="form-control" name="phone" disabled="disabled" value=${user.phone}></td>
							</tr>
							<tr>
								<th>��� ����</th>
								<td><select name="addr" id="addr" class="form-control" disabled="disabled" >
										<option value=${user.addr} >${user.addr}</option>
								</select></td>
							</tr>
							<tr>
								<th>��Ÿ ����</th>
								<td><textarea rows="5" cols="40" name="info"
										class="form-control" disabled="disabled" ></textarea></td>
							</tr>
							<tr>
							&nbsp&nbsp&nbsp
								<td colspan="2" align="center"><input size="5pt" class="btn btn-primary"
								id="history_back" name="history_back" value="�ڷΰ���" ></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>