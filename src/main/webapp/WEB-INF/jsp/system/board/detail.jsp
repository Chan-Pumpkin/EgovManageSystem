<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
<style>
	html, body {
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
	}

	.board-container {
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
</style>
</head>

<body>
	<div class="board-container">
		<div class="col-sm-6">
			<div class="mb-3">

				<label for="id" class="form-label">boardId</label> <input
					type="text" class="form-control" id="id" name="id"
					value="${board.id}" readonly> <label for="title"
					class="form-label">boardTitle</label> <input type="text"
					class="form-control" id="title" name="title" value="${board.title}"
					readonly>

			</div>
			<div class="d-grid">
				<a href="<c:url value="/board/list.do"/>" class="btn btn-primary">목록</a>
			</div>
		</div>
	</div>
</body>


</html>
