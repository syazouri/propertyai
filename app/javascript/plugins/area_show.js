const areaToolTip = document.querySelector(".area-tooltip");
if (areaToolTip) {
  $(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
  });
}

export {areaToolTip}
