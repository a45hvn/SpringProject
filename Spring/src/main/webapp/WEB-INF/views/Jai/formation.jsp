<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<Style>
	#leftSideBox{
		border:10px solid red;
	}
	#rightSideBox{
		border:10px solid yellow;
	}
</Style>
<!-- formation -->
<div class="content">
	<!-- left ->#headLine, #gameBoard -->
	<div id="leftSideBox">
	
		<div id="headLine">
			<span>축구 전략</span>
			<select id="formation">
				<optgroup label="전술">
					<c:forEach items="" var="">
						<option value=""></option>
					</c:forEach>
				</optgroup>
			</select>
		</div>
		
		<div id="gameBoard">
			<div class="position" id="st"></div>
			<div class="position" id="mf"></div>
			<div class="position" id="df"></div>
			<div class="position" id="gk"></div>
		</div>
		
	</div>
	
	<!-- right .tableOuter-->
	<div id="rightSideBox">
	
		<div id="tableOuter" class="innerRight">
			<table class="table table-hover" id="entry">
				<thead>
					<tr>
						<th>등번호</th>
						<th>이름</th>
						<th>포지션</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="" var="">
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div id="commentOuter" class="innerRight">
			
		</div>
	</div>
</div>
<script>

</script>