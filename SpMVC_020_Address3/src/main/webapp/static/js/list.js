document.addEventListener("DOMContentLoaded", () => {
  const list = document.querySelector("table.list-table");

  list?.addEventListener("click", (e) => {
    const target = e.target;

    const choice = target.closest("tr");
    const seq = choice.dataset.seq;

    if (seq) {
      document.location.href = `${rootPath}/detail/${seq}`;
    }
  });
});
