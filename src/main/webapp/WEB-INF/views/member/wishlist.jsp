<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div align="right" style="margin-bottom: 50px;">
	<h4>위시리스트</h4>
</div>
<div class="mbf clearfix">
	<ul class="tt-toggle">
		<li class="sub-toggle">
			<div class="toggle-head">
				<div align="right">
					<i onclick="delWishFnc()" class="icon-remove"></i>
				</div>
				<h5>위시리스트 이름</h5>
			</div>
			<div class="toggle-content" style="height: auto; display: none;">

					<table class="table">
						<thead>
							<tr style="border-top: 1px solid white;">
								<th scope="col">TITLE</th>
								<th scope="col">ARTIST</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>곡제목1</td>
								<td>아티스트</td>
								<td><i class="icon-remove"></i></td>
							</tr>
							<tr>
								<td>곡제목1</td>
								<td>아티스트</td>
								<td><i class="icon-remove"></i></td>
							</tr>
						</tbody>
					</table>
			</div>
		</li>
	</ul>
</div>

<script>
	function delWishFnc() {
		if (!confirm('(위시리스트이름) 삭제하시겠습니까?')) {
			window.event.stopPropagation();
		}
	}
</script>