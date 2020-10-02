<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<Style>

#leftSideBox {
	border: 2px solid black;
	width: 490px;
}

#rightSideBox {
	border: 2px solid black;
	width: 350px;
}

.box {
	float: left;
}

.content::after {
	content: "";
	display: inline-box;
	clear: both;
}

#gameBoard {
	height: 570px;
	/* border: 2px solid black; */
	background-image: url("/spring/resources/images/field.png");
	background-position-x: -18px;
	background-size: 520px 580px;
	background-repeat: no-repeat;
	position: relative;
}

.player {
	border: 2px solid gold;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	font-size: 0.7rem;
	vertical-align: center;
	display: inline-block;
	position: absolute;
}

.position {
	border: 2px solid blue;
	height: 120px;
	position: relative;
	top: 120px;
}

#gk {
	height: 70px;
	width: 198px;
	left: 145px;
	top: 122px;
}

.innerRight {
	border: 2px solid red;
	float: left;
	width:50%;
}
</style>
<!-- formation -->
<div class="content">
	<!-- left ->#headLine, #gameBoard -->
	<div id="leftSideBox" class="box">
		<div id="headLine">
			<button class="btn btn-success" id="btnChange">전략 작성</button>

			<div id="formationBox" style="display: inline-block">
				<select class="formation" id="stNum">
					<optgroup label="공격수">
						<c:forEach var="i" begin="0" end="10">
							<option value="${i }">${i }</option>
						</c:forEach>
					</optgroup>
				</select>
				<select class="formation" id="mfNum" disabled>
					<optgroup label="미드필더"></optgroup>
				</select>
				<select class="formation" id="dfNum" disabled>
					<optgroup label="수비수"></optgroup>
				</select>
				<button class="btn btn-info" id="btnMove" disabled>배치시작</button>
			</div>
		</div>

		<div id="formationSelector"
			style="display: none; position: relative; top: 0px; left: 100px">
			<select class="formation" id="teamFormation">
				<optgroup label="팀전략"></optgroup>
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
	<div id="rightSideBox" class="box">
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
					<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.backnumber}</td>
							<td>${list.name }</td>
							<td>${list.position }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div id="commentOuter" class="innerRight">
			<table>
				<tr>
					<td><img src="" /></td>
				</tr>
				<tr>
					<td>이름 :</td>
				</tr>
				<tr>
					<td>생년월일 :</td>
				</tr>
				<tr>
					<td>키/몸무게 :</td>
				</tr>
				<tr id="comment">
					<td><textarea style="resize: none" disabled></textarea></td>
				</tr>
			</table>
		</div>
	</div>
</div>
<script>
            var stNum = 0;
            var mfNum = 0;
            var dfNum = 0;
            //공격수 수 정하기
            $("#stNum").on("change", function () {
                stNum = $(this).val();
                var temp = "";
                for (var i = 0; i < 10 - stNum + 1; i++) {
                    temp += "<option value='" + i + "'>" + i + "</option>";
                }

                $("#mfNum").html("");
                $("#mfNum").append(temp);
                $("#mfNum").prop("disabled", false);
                //숫자 정하면 빈칸이 나옴
                $("#st").html("");
                for (var i = 0; i < stNum; i++) {
                    $("#st").append("<div class='player' id='st" + i + "' style='left : " + i * 44 + "px';> <div>");
                }
            });
            // 미드필더 수 정하기
            $("#mfNum").on("change", function () {
                mfNum = $(this).val();
                dfNum = 10 - stNum - mfNum;
                // for (var i = 0; i < 10 - stNum - mfNum + 1; i++) {
                //     temp += "<option value='" + i + "'>" + i + "</option>";
                // }
                var temp = "<option value='" + dfNum + "'>" + dfNum + "</option>";
                $("#dfNum").html("");
                $("#dfNum").append(temp);
                $("#dfNum").prop("disabled", false);

                //숫자 정하면 빈칸이 나옴
                $("#mf").html("");
                for (var i = 0; i < mfNum; i++) {
                    $("#mf").append("<div class='player' id='mf" + i + "' style='left : " + i * 44 + "px';> <div>");
                }
                //숫자 정하면 빈칸이 나옴
                $("#df").html("");
                for (var i = 0; i < dfNum; i++) {
                    $("#df").append("<div class='player' id='df" + i + "' style='left : " + i * 44 + "px';> <div>");
                }
            });
            // 미드필더를 정하면 수비수가 계산되어 나온다. 그리고 배치버튼 선택 가능.
            $("#mfNum").on("change", function () {
                $("#btnMove").val("배치시작");
                $("#btnMove").prop("disabled", false);
                $("#gk").append("<div class='player' id='gk0' style='left:76px'> <div>");
            });

            //선수들 움직일 수 있게하는 메소드
            $(document).on("click", "#btnMove", function (e) {
                $(".player").draggable({ containment: "parent" });
                $("#btnMove").removeClass('btn-info');
                $("#btnMove").addClass('btn-warning');
                $("#btnMove").text("저장하기");
                $("#btnMove").on("click", function () {
                    var list = $(".player").eq(1).css("top");
                    var arr = new Array();
                    for (var i = 0; i < 11; i++) {
                        var identity = $(".player").eq(i).attr("id");
                        var top = $(".player").eq(i).css("top");
                        var left = $(".player").eq(i).css("left");
                        var position = identity.substr(0, 2);
                        var strategy = stNum + "" + mfNum + "" + dfNum + "";
                        var player = $(".player").eq(i).attr("value");
                        arr[i] = { strategy: strategy, position: position, top: top, left: left, identity: identity, player: player };
                        console.log(strategy);
                    }

                    //ajax를 통해 현재 내용을 저장
                    console.log(arr);
                    // $.ajax({
                    //     type: "post",
                    //     url: "/spring/WEB-INf/views/Jai/formationok.action",
                    //     //data: {"arr":arr}, // 팀번호, 선수정보, 좌표값을 넘겨야 한다.....
                    //     dataType: "json",
                    // });
                });
            });

            //움직인 선수의 위치 파악 -> ajax로 보낼 예정
            $(".player").on({
                mouseup: function () {
                    console.log($(this).position());
                },
            });

            //전략작성 토글
            var flag = true;
            $("#btnChange").on("click", function () {
                if (flag) {
                    console.log("true");
                    // $("#formationBox").attr("display", "none");
                    // $("#formationSelector").attr("display", "inline-block");
                    $("#formationBox").hide();
                    $("#formationSelector").show();
                    $(this).text("전략 보기");
                    flag = false;
                } else {
                    console.log("false");
                    // $("#formationBox").attr("display", "inline-block");
                    // $("#formationSelector").attr("display", "none");
                    $("#formationBox").show();
                    $("#formationSelector").hide();
                    $(this).text("전략 생성");
                    flag = true;
                }
            });
            //코멘트 클릭해서 내용 수정
            $("#comment").on("dblclick", function () {
                $("#comment textarea").attr("disabled", false);

                //Ctrl + Enter 누르면 작성 완료 및 전송
                $("#comment textarea").on("keypress", function (e) {
                    if (e.which == 10) {
                        var text = $(this).val();
                        console.log(text);
                        $("#comment textarea").attr("disabled", true);
                        $.ajax({
                            type: "post",
                            url: "/spring/WEB-INf/views/Jai/comment.action",
                            //data: {"text":text,"seq":seq} // 팀번호, 선수정보, 좌표값을 넘겨야 한다.....
                            contentType: "application/json",
                            dataType: "json",
                        })
                            .done(function (data, textStatus, xhr) {
                                console.log(data, textStatus, xhr);
                            })
                            .fail(function (data, textStatus, error) {
                                console.log(data, textStatus, error);
                            });
                    }
                });
            });
            var player_seq = "";
            $("#entry tbody tr").on("click", function () {});
        </script>