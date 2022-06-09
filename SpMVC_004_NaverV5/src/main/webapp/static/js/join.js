document.addEventListener("DOMContentLoaded", () => {
  const username = document.querySelector("#username");
  const password = document.querySelector("#password");
  const re_password = document.querySelector("#re_password");
  const email = document.querySelector("#email");
  const name = document.querySelector("#name");
  const nickname = document.querySelector("#nickname");
  const btn_join = document.querySelector("#btn-join");

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

    //문자 숫자 특수문자가 포함된 8자리부터 ~ 15자리 까지의 문자열 검사 패턴
    const passRole2 =
      /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;

    //숫자와 문자를 포함하는 6자리에서 12자리의 검사패턴
    const passRole = /^[A-Za-z0-9]{6,12}$/;

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
      alert("비밀번호 확인값이 일치하지 않습니다.");
      password.value = "";
      re_password.value = "";
      password.focus();
      return false;
    }

    const emailRole =
      /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

    if (!emailRole.test(email.value)) {
      alert("이메일 형식이 잘못되었습니다");
      email.focus();
      return false;
    }

    document.querySelector("form.join")?.submit();
  });
});
