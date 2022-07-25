document.addEventListener("DOMContentLoaded", () => {
  const detail_list = document.querySelector("div.detail-view");

  detail_list?.addEventListener("click", (e) => {
    console.log(1);
    const target = e.target;
    const choice = target?.closest("ul.detail-view");
    console.log(choice);
    const stnum = choice?.dataset.stnum;
    if (stnum) {
      document.location.href = `${rootPath}/student/detail/${stnum}`;
      console.log(aa);
    }
  });
});
