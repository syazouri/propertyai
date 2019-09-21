const areaPopOver = document.querySelector(".area-popover");
if (areaPopOver) {
  $(document).ready(function(){
    $('[data-toggle="popover"]').popover();
  });
}

const areaToolTip = document.querySelector(".area-tooltip");
if (areaToolTip) {
  $(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();
  });
// }
