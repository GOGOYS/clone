document.addEventListener("DOMContentLoaded",()=>{
    const detail_list = document.querySelector("ul.detail-view");

    detail_list?.addEventListener("click", (e)=>{
        const target = e.target;
        const choice = target?closest("ul.detail-view");
        const stnum = choice?dataset.stnum;
        if(stnum){
            document.location.href=`${rootPath}/student/detail/${stnum}`
        }
    })


})