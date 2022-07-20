document.addEventListener("DOMContentLoaded", () => {
  const submit_btn = document.querySelector("button.btn-submit");
  const input_form = document.querySelector("form.input-form");

  const texts = {
    name: 1,
    tel: 2,
    address: 3,
  };

  const inputList = document.querySelectorAll("form input");

  const name = inputList[texts.name];
  const tel = inputList[texts.tel];
  const address = inputList[texts.address];

  const name_msg = document.querySelector("div.name-msg");
  const tel_msg = document.querySelector("div.tel-msg");
  const address_msg = document.querySelector("div.address-msg");

  const name_blank = () => {
    name_msg.classList.remove("ok");
    name_msg.classList.add("no");

    name.focus();
    return false;
  };
  const tel_blank = () => {
    tel_msg.classList.remove("ok");
    tel_msg.classList.add("no");

    tel.focus();
    return false;
  };
  const address_blank = () => {
    address_msg.classList.remove("ok");
    address_msg.classList.add("no");

    address.focus();
    return false;
  };

  if (submit_btn) {
    submit_btn.addEventListener("click", () => {
      if (name.value === "") {
        name_blank();
        return false;
      }
      if (tel.value === "") {
        tel_blank();
        return false;
      }
      if (address.value === "") {
        address_blank();
        return false;
      }
      input_form.submit();
    });
  }
});
