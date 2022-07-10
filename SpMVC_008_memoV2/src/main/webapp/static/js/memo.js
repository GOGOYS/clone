document.addEventListener("DOMContentLoaded", () => {
  const memo_list = document.querySelector("div.memo-list-view");

  memo_list?.addEventListener("click", (e) => {
    //table에 클릭 이벤트를 적용하면 가장 안쪽의 td가 타겟으로 작동한다.
    const target = e.target;
    //가장 안쪽의 TD가 클릭되면
    //TD를 감싸고 있는 tr을 찾아라
    const choice = target?.closest("div.choice");

    const seq = choice?.dataset.seq;


    /*
      JS에서 변수값이 
      0, undefined, null, NaN, ""등은 if에서 모두 false로 인식한다.

      seq 값이 정상적인 범위 값일때만 detail로 점프하기
    */
    if(seq){
      document.location.href = `${rootPath}/memo/map/detail/${seq}`;
    }
  });
});
