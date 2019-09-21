const schoolMap = document.querySelector("#map");
  schoolMap.addEventListener("click", (event) => {
    const schoolInfo = document.querySelector(".school-info");
    const schoolAreaInfo = document.querySelector(".area-school-info");
    schoolAreaInfo.innerHTML =  schoolInfo.innerHTML;
  });

