import "bootstrap";
import "../plugins/area_show";


function multiplyBy()
{
        const num1 = document.getElementById("search_gross_annual").value;
        document.getElementById("result1").innerHTML = num1 * 3.25;
        document.getElementById("result2").innerHTML = num1 * 4.5;
}

document.getElementById("multiply").addEventListener('click', () => {
  multiplyBy();
})


