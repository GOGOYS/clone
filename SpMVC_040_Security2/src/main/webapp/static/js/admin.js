document.addEventListener("DOMContentLoaded", () => {
  const username = document.querySelector("table.username");

  username?.addEventListener("click", (e) => {
    const target = e.target;
    const tr = target.closest("TR");
    const user = tr?.dataset.user;
    if (user) {
      document.location.href = `${rootPath}/admin/userupdate?username=${user}`;
    }
  });
});
