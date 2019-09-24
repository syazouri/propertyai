const schoolMap = () => {
  const school = document.querySelector("#map");
  school.addEventListener("click", (event) => {
    const schoolInfo = document.querySelector(".school-info");
    const schoolAreaInfo = document.querySelector(".area-school-info");
    schoolAreaInfo.innerHTML =  schoolInfo.innerHTML;
    schoolAreaInfo.classList.add("area-back")
  });
}

export {schoolMap}

