<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	//nav 선택
	$("#sample").addClass('active');
	
    // 그리드 설정 
	selectMachineList();
	
});

function selectMachineList(){
	$.ajax({
	    url: "/app/machine/selectMachineList", //request 보낼 서버의 경로
	    type:'post', // 메소드(get, post)
	    success: function(data) {
	        //서버로부터 정상적으로 응답이 왔을 때 실행
			console.log(data);
			if(data.result == "200"){
				var machine = JSON.parse(data.machine);
				console.log(machine);
			    const createdGrid = initGrid();
			    // 그리드에 데이터 넣기(출력)
			    createdGrid.resetData(machine);

			}
	    },
	    error: function(err) {
	        //서버로부터 응답이 정상적으로 처리되지 못햇을 때 실행
			common.alert("서버 응답 실패. 재시도 바랍니다.");
			return false;
	    }
	});
}

const initGrid = () => {
    // 그리드 객체
    const Grid = tui.Grid;

    /**
     * Grid 테마 커스텀
     * Grid.applyTheme('striped', {...}) : 
     * @param {String} default : 프리셋 (기본)
     * @param {String} striped : 프리셋 (줄무늬)
     * @param {String} clean : 프리셋 (클린)
     *      - preset theme name. Available values are 'default', 'striped' and 'clean'.
     *      - https://nhn.github.io/tui.grid/latest/Grid#applyTheme
     */
    Grid.applyTheme('defualt',  {
        cell: {
            normal: {
                border: 'white'
            },
            header: {
                background: '#ffbf00',
                text: 'black',
                
            },
            evenRow: {
                background: 'white'
            }
        }
    });

    /**
     * 그리드 설정
     * @variable {Dom} el : 그리드 element(DOM)
     * @variable {boolean} scrollX : X 스크롤 사용여부
     * @variable {boolean} scrollY : Y 스크롤 사용여부
     * @variable {boolean} draggable : 드레그 사용 여부
     * @variable {Object} header
     *      - @variable {Number} height : 헤더 높이
     * @variable {Number} bodyHeight : 그리드 바디 높이
     * @variable {*} contextMenu : 마우스 우클릭 옵션
     * @variable {Array} columns :
     *      - @variable {String} header : 컬럼명(헤더)
     *      - @variable {String} name : 컬럼 name (input data와 이름이 일치해야함)
     *      - @variable {String} align : 정렬
     *      - @variable {Number} width : 너비
     *      - @variable {String} whiteSpace : 줄바꿈 설정
     *      - @variable {Function} formatter : 출력 포멧
     * 기타 옵션은 공식 document를 참조하자.
     */
    
    const sampleGrid = new Grid({
        el: document.getElementById('gridDiv'),
        scrollX: false,
        scrollY: true,
        draggable: false,
        header: { height: 30 },
        bodyHeight: 400,
        contextMenu: null,
        columns: [
            {
                header: '번호',
                name: 'mnum',
                align: "center",
                width: 128,
                whiteSpace: 'normal',
                formatter: function (e) {
                    return e.value
                },
            },
            {
                header: '이름',
                name: 'mname',
                align: "center",
                width: 256,
                whiteSpace: 'normal',
                formatter: function (e) {
                    return e.value
                },
            },
            {
                header: '설명',
                name: 'mcomment',
                align: "left",
                width: 768,
                whiteSpace: 'normal',
                formatter: function (e) { 
                    return e.value
                },
            },
            {
                header: '등록일자',
                name: 'mmakeDate',
                align: "center",
                width: 128,
                whiteSpace: 'normal',
                formatter: function (e) {
                    return e.value
                },
            },
        ]
    });
     
    /*  sampleGrid.applyTheme('custom', { 
    	row: { 
    		hover: { 
				background: '#00eeff' 
    	    }
    	}
    }); */
     
     sampleGrid.on('dblclick', ev => {
   		// 클릭한 Row의 정보를 dataRow에 저장
   	    let dataRow = sampleGrid.getRow(ev.rowKey);
   		
   		// 클릭한 Row의 색을 변경 (강조 효과, 클릭 했다는 효과를 줄 때)
   		//sampleGrid.addSelectionOnly(ev.rowKey);
   		
   		// 클릭한 컬럼 이름이 "..." 인 경우
   		//if(ev.columnName == "_checked"){
   			
   		//}
   		location.href="/app/machine/updateMachineForm?mnum="+dataRow.mnum;
   		
   		// 그리드 내용 초기화(Clear)
   		//ridObject.dataClear();
   	});	
     
    return sampleGrid;
}
 
</script>

<style>
#btnList{
	float: right;
	padding-right: 220px;
    padding-bottom: 10px;
}

</style>
<main>
    <h1 id="subHeader">기구 목록</h1>
    <div id="btnList">
	    <input type="button" class="btn120" onclick="location.href='/app/machine/insertMachineForm';" value="등록">
    </div>
	<div id="gridDiv"></div>
	
	<div class="gridPaging"> <!-- 보류 -->
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>
</main>
<jsp:include page="/WEB-INF/views/trainer/common/footer.jsp"></jsp:include>