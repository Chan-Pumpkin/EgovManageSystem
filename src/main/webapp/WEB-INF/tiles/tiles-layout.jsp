<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<tiles:insertAttribute name="tiles_head" />
</head>
<body>
	<div id="wrapper">
	<tiles:insertAttribute name="tiles_sidebar" />
		<div id="content-wrapper" class="d-flex flex-column">
			<div id="navbar">
			<tiles:insertAttribute name="tiles_navbar"/>
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<tiles:insertAttribute name="tiles_content"/>
							<tiles:insertAttribute name="tiles_footer" />
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<tiles:insertAttribute name="tiles_script"/>
</body>
</html>