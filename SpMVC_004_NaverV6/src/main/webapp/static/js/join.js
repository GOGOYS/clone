document.addEventListener("DOMContentLoaded", () => {
  const username = document.querySelector("#username");
  const password = document.querySelector("#password");
  const re_password = document.querySelector("#re_password");
  const email = document.querySelector("#email");
  const name = document.querySelector("#name");
  const nickname = document.querySelector("#nickname");
  const btn_join = document.querySelector("#btn-join");

  const div_index = {
    username: 0,
    password: 1,
    re_password: 2,
    email: 3,
    name: 4,
    nicknamne: 5,
  };

  const error_divs = document.querySelectorAll("div.error");

  //화면이 모두 그려지면 usenrname input box를 포커싱하기
  username.focus();

  const error_msg = (div, message)=>{

    div.classList.remove("w3-text-blue");
    div.classList.add("w3-text-red");
    div.innerText = message;
  }

  const ok_msg = (div,message)=>{
    div.classList.remove("w3-text-red")
    div.classList.add("w3-text-blue")
    div.innerText = message;
  }

  /*
    input box에서 포커스가 벗어났을때 발샐하는 이벤트
    focusout은 이벤트 버블링이 심하게 발생하기때문에
    JS코드에서는 주로 blur를 사용한다

  */
  const username_div = error_divs[div_index.username];

  username?.addEventListener("blur", (e) => {
    const current = e.currentTarget;
    if (current.value === "") {
      const msg = " * USERNAME은 반드시 입력세요";

      error_msg(username_div,msg);

      current.focus();
      return false;
    }

    //중복검사 수행
  fetch(`${rootPath}/user/idcheck/${current.value}`)
  .then(res=>res.text())
  .then(result=>{

    if(result === "OK"){
      const msg = " * 사용가능한 USERNAME 입니다";
       ok_msg(username_div,msg);
    }else{
      const msg = " * 이미 가입된 USERNAME 입니다";
      error_msg(username_div,msg);
      username.focus();
    }
  });// end username 이벤트
  });



  //문자 숫자 특수문자가 포함된 8자리부터 ~ 15자리 까지의 문자열 검사 패턴
  const passRole2 =
      /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

  //숫자와 문자를 포함하는 6자리에서 12자리의 검사패턴
  const passRole = /^[A-Za-z0-9]{6,12}$/;

  //email @와 .이 들어가는지 확인하는 검사패턴
  const emailRole =
      /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;




      //"input"은 글자를 하나씩 입력할때마다 발생하는 이벤트
  password?.addEventListener("input", (e)=>{

    const current = e.currentTarget;
    const error = error_divs[div_index.password];
    if(!passRole2.test(current.value)){
      error_msg(error," * 비밀번호가 규칙에 맞지 않습니다(특수, 영문, 숫자 포함 8 ~ 15)");
    }else{
      ok_msg(error," 비밀번호 안전성이 보장되었습니다");
    }
  });

  re_password?.addEventListener("input",(e)=>{
    const current = e.currentTarget;
    const error = error_divs[div_index.re_password];
    const password_value=password?.value;

    if(current.value === password_value){

      ok_msg(error," * 비밀번호 값이 일치합니다");
    }else{

      error_msg(error," * 비밀번호 값이 일치하지 않습니다");
    }


  });// re_password end

  email?.addEventListener("input",(e)=>{

    const currnet = e.currentTarget;
    const error = error_divs[div_index.email];

    if(emailRole.test(current.value)){

      ok_msg(error," * email 양식 검사가 완료되었습니다");
    }else{
      error_msg(error," * email 양식을 확인해주세요");
      //email 양식 검사를 통과못하면 다음코드 실행 못하도록 false return
      return false;
    }

    fetch(`${rootPath}/user/emailcheck?emial=/${current.value}`)
    .then(res=>res.text())
    .then(result=>{
      if(result === "OK"){
        ok_msg(error," * 사용할 수 있는 emial 입니다");
      }else{
        
        error_msg(error," * 이미 등록된 emial 입니다");
      }
    });
  }); //email end





  btn_join?.addEventListener("click", () => {
    if (username.value === "") {
      alert("USER NAME은 반드시 입력하세요");
      username.focus();
      return false;
    }

    if (username.value.length > 20) {
      alert("USER NAME은 20자 이내로 입력하세요");
      username.focus();
      return false;
    }

    if (username.value.toUpperCase() === password.value.toUpperCase()) {
      alert("USERNAME과 PASSWORD는 같을 수 없습니다");
      password.focus();
      return false;
    }


    //password.value의 값이 패턴에 일치하지 않으면
    if (passRole.test(passRole.value) == false) {
      alert("비밀번호는 문자, 숫자 포함 6 ~12자리까지 입력하세요");
      password.focus();
      return false;
    }

    if (re_password.valus === "") {
      alert("비밀번호 확인을 입력해 주세요");
      re_password.focus();
      return false;
    }

    if (re_password.value !== password.value) {
      alert("비밀번호 확인값이 일치하지 않습니다");
      password.value = "";
      re_password.value = "";
      password.focus();
      return false;
    }


    if (!emailRole.test(email.value)) {
      alert("이메일 형식이 잘못되었습니다");
      email.focus();
      return false;
    }

    document.querySelector("form.join")?.submit();
  });
});
