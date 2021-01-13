<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Custom styles for this template 테이블템플릿-->
<style type="text/css">
img{
width: 20px;
height: 20px;
}

</style>
<link href="css/sb-admin.css" rel="stylesheet">

</head>
<body>
	<!-- DataTables Example -->
	<div class="card mb-3">
		<div class="card-header">
			<!-- <i class="fas fa-table"></i>  -->
			<img alt="" src="svg/table.svg">
			게시판
		</div>
		<div class="card-body" style="font-family: Garamond;">
			<!-- <div class="table-responsive"> -->
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>No</th>
							<th>Title</th>
							<th>Author</th>
							<th>Date</th>
							<th>Count</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td>165</td>
							<td>고장난 에어컨 팝니다</td>
							<td>이상아</td>
							<td>201216</td>
							<th>0</th>
						</tr>
						<tr>
							<td>166</td>
							<td>전자레인지 싸게 팔아요</td>
							<td>오지원</td>
							<td>201217</td>
							<th>0</th>
						</tr>
						<tr>
							<td>167</td>
							<td>컴퓨터 키보드 가져가세요 제발</td>
							<td>김태섭</td>
							<td>201218</td>
							<th>0</th>
						</tr>
					</tbody>
				</table>
			<!-- </div> -->
		</div>

		<nav aria-label="...">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled">
					<span class="page-link">Previous</span>
				</li>
				<li class="page-item active">
					<span class="page-link"> 1
						<span class="sr-only">(current)</span>
					</span>
				</li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#">Next</a></li>
			</ul>
		</nav>
		<div class="card-footer small text-muted">
			Updated yesterday at 11:59 PM
		</div>
	</div>
	<!-- Page level plugin JavaScript-->
  <script src="js/jquery.dataTables.js"></script>
  <script src="js/dataTables.bootstrap4.js"></script>
  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>
	
</body>
</html>