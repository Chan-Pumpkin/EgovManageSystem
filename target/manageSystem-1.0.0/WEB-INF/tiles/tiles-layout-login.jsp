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
	<tiles:insertAttribute name="tiles_content"/>
	<tiles:insertAttribute name="tiles_script"/>
</body>
</html>