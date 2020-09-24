<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
  $(function() {
    $( "#submenu" ).accordion({
    	
    	collapsible : true,      // 클릭시 모두 닫게 한다.

    	active : true            // Boolean or Integer : true - 페이지 로딩시 모두 닫혀 있는 상태, 0일경우 첫번째 메뉴가 열려 있는 상태로 로딩
    	
    });//id accordion 값에 아코디언 속성을 부여
  });
</script>


  
<div id="submenu">
  <h3 class="submenuTitle">선수정보</h3>
  <div class="submenuList">
  <a href="#">선수리스트</a>
  <a href="#">선수목록</a>
  </div>
  <h3 class="submenuTitle">선수정보</h3>
  <div class="submenuList">
  <a href="#">선수리스트</a>
  <a href="#">선수목록</a>
  </div>
  <h3 class="submenuTitle">선수정보</h3>
  <div class="submenuList">
  <a href="#">선수리스트</a>
  <a href="#">선수목록</a>
  </div>
  <h3 class="submenuTitle">선수정보</h3>
  <div class="submenuList">
  <a href="#">선수리스트</a>
  <a href="#">선수목록</a>
  </div>
  <h3 class="submenuTitle">선수정보</h3>
  <div class="submenuList">
  <a href="#">선수리스트</a>
  <a href="#">선수목록</a>
  </div>
  
</div>