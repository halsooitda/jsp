//1
//댓글 등록시 bno, writer, content
document.getElementById("cmtAddBtn").addEventListener('click', ()=>{
    //객체는 const로
    const cmtText = document.getElementById("cmtText").value;

    if(cmtText == null || cmtText == "") { //댓글을 안 적었을 때
        alert("댓글을 입력해주세요.");
		return false; //메서드 종료

    }else{
        let cmtData = {
            bno : bnoVal, //jsp에서 보내준 값
            writer : document.getElementById("cmtWriter").value,
            content : cmtText
        };

        //3 
        //전송 function 호출
        postCommentToServer(cmtData).then(result => {
            if(result > 0) { //1성공
                alert("댓글 등록 성공");
            }else {
                alert("댓글 등록 실패");
            }
            //7
            printCommentList(cmtData.bno);
        })


    }//if문 끝
    
})

//2
//댓글 데이터 전송 메서드
async function postCommentToServer(cmtData){
    try{
        const url = "/cmt/post"; //데이터를 전송할 때 보낼 곳의 경로
        const config = { //보낼 내용의 정보 
            method : 'post', //전송 방식
            Headers : { //전송 데이터의 타입, 인코딩
                'Content-Type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify(cmtData) //전송내용, 객체를 JSON의 힘을 빌려 String 형태로 만들어줌
            //컨트롤러는 Strin형태만 인식 가능하기 때문에 변
        };
        //fetch : 해당 url, config로 데이터 보냄
        //resp.text(); 결과로 text 파일 받음.
        //resp.json() : 결과로 json 파일 받음.
        const resp = await fetch(url, config); 
        /* fetch가 컨트롤러로 데이터를 보내서 컨트롤러에서 isOk를 보내면 resp에 받아서
         * result가 0, 1만 걸러서 받아와서
         * 이 메서드를 호출하면 값을 줌
         * fetch -> controller -> resp -> result -> 호출
         */
        const result = await resp.text(); //0 또는 1 (isOk)
        //필요한 body에 대한 정보만 text로 걸러서
        return result;

    }catch(error){
        console.log(error);
    }
}

//4
function spreadCommentList(result) { //result 댓글 list
    let div = document.getElementById("accordionExample"); //댓글 영역을 감싸는 div
    div.innerHTML = ""; //jsp에 임시로 넣어둔 댓글 표시영역을 지우고, 비어있는 값으로 바꿔버리기
    // {[], [], []} 형태로 데이터가 들어옴 
    for(let i=0; i<result.length; i++){
        let str = `<div class="accordion-item">`;
        //header
        str += `<h2 class="accordion-header" id="heading${i}>`;
        str += `<button class="accordion-button" type="button" `;
        str += `data-bs-toggle="collapse" data-bs-target="#collapse${i}"`; //아코디언1,2,3구분
        str += `aria-expanded="true" aria-controls="collapse${i}" class="commentBtn">`;
        str += `${result[i].writer}, ${result[i].regdate}`;
        str += `</button></h2>`;
        //content
        str += `<div id="collapse${i}" class="accordion-collapse collapse show" `;
        str += `data-bs-parent="#accordionExample">`;
        str += `<div class="accordion-body">`;
        str += `<input type="text" class="form-control" id="cmtText" value="${result[i].content}" >`; //수정할 수 있게 내용을 받기
        if(result[i].writer == id){
			str += `<button type="button" data-cno="${result[i].cno}" data-writer="${result[i].writer}" class="btn btn-success cmtModBtn">수정</button>`;
	        str += `<button type="button" data-cno="${result[i].cno}" class="btn btn-danger cmtDelBtn">삭제</button>`;
		}
        str += `</div></div></div>`;
        div.innerHTML += str; //누적해서 담기
    }
}

//5
//서버에 댓글 리스트를 달라고 요청
async function getCommentListFromServer(bno) {
    try{
        const resp = await fetch('/cmt/list/'+bno); //ex) /cmt/list/182
        const result = await resp.json(); //따옴표 떼서 JSON객체로 만들어줌
        return result; //object  [{…}, {…}, {…}, {…}]

    }catch(error){
        console.log(error);
    }
}

//6
//호출하는 function => jsp에서 호출해서 bno주기
function printCommentList(bno) {
    getCommentListFromServer(bno).then(result => {
        if(result.length > 0){ //댓글이 있으면
            spreadCommentList(result);
        }else{
            let div = document.getElementById("accordionExample");
            div.innerHTML = `comment가 없습니다.`;
        }
    })
}

//9
//수정, 삭제 버튼 확인
document.addEventListener('click', (e)=>{ //클릭된 객체를 매개변수 e로 받음
    console.log(e.target); //버튼 객체 출력

    //10
    //수정
    if(e.target.classList.contains('cmtModBtn')) {
        let cno = e.target.dataset.cno; // =data-cno, 몇번 댓글을 수정할 것인가
        
        //수정할 데이터를 객체로 생성 -> 컨트롤러에서 수정 요청
        let div = e.target.closest('div'); //타겟을 기준으로 가장 가까운 div 찾기
        //자기 자신의 댓글을 가져올 수 있겠끔 버튼과 가장 가까이 붙어있는 div를 찾음
        let cmtText = div.querySelector('#cmtText').value; //아이디가 다 같으므로 쿼리셀렉터로 디브에서 찾아와야 함. 
        let writer = e.target.dataset.writer; //dataset은 짧은 글만! 긴글은 다 가져오려면 느려짐
        //dataset 대문자 인식X 소문자로만

        //12
        //비동기통신 함수 호출 -> 처리
        updateCommentFromServer(cno, writer, cmtText).then(result => {
            if(result > 0){
                alert("댓글 수정 성공");
                printCommentList(bnoVal); //수정이 성공했을 때만 뿌리기
            }else{
                alert("댓글 수정 실패");
            }
        })
    }   

    //13
    //삭제
    if(e.target.classList.contains('cmtDelBtn')) {
        let cno = e.target.dataset.cno;

        //15
        removeCommentFromServer(cno).then(result => {
            if(result > 0){
                alert("댓글 삭제 성공");
                printCommentList(bnoVal); 
            }else{
                alert("댓글 삭제 실패");
            }
        })


    }


})

//11
async function updateCommentFromServer(cnoVal, cmtWriter, cmtText) {
    try{
        const url = '/cmt/modify';
        const config = {
            method : 'post',
            headers : {
                'Content-Type' : 'application/json; charset=utf-8'
            },
            body : JSON.stringify({cno:cnoVal, writer:cmtWriter, content:cmtText})
        };

        const resp = await fetch(url, config);
        const result = await resp.text(); // 0or1
        return result;

    }catch(error){
        console.log(error);
    }
}

//14
async function removeCommentFromServer(cno){
    try{
        const url = '/cmt/remove?cno='+cno; //쿼리스트링으로 달고가면 getParameter로 받을 수 있다.
        const resp = await fetch(url);
        const result = resp.text();
        return result; //0 or 1
    }catch(error){
        console.log(error);
    }
}