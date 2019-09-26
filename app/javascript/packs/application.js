import "bootstrap";
import { areaToolTip } from "../plugins/area_show";
import { schoolMap } from "../plugins/area_school";
import { loadDynamicMarkerText } from '../plugins/area_marker';
import 'mapbox-gl/dist/mapbox-gl.css';
import { talkingUser } from './contact';
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
const area = document.querySelector(".area-tooltip");
if (area) {
  areaToolTip();
}

const map = document.querySelector(".area-school-info");
if (map) {
  schoolMap();
}

const marker = document.querySelector(".area-school-info");
if (marker) {
loadDynamicMarkerText();
}

function calculateMortgage() {
  const calculateBtn = document.getElementById("multiply");
  if (calculateBtn) {
    calculateBtn.addEventListener('click', () => {
      const num1 = document.getElementById("search_gross_annual").value;
      if (!isNaN(num1)) {
        const result1 = num1 * 3.25;
        const result2 = num1 * 4.5;
        const btn = document.getElementById("after");
        const html = `<p><br>We estimate you can borrow £<span id = "result1">${result1}</span> - £<span id = "result2">${result2}</span><br>
        </p><div class="form-inputs"><input name="search[deposit]" type="text" placeholder="Enter your deposit amount" id="deposit-amount"></div>`;
        btn.insertAdjacentHTML("afterbegin", html);
        const maxMortgage = document.getElementById("max-mortgage");
        maxMortgage.value = result2;
      }
    });
  }
}
calculateMortgage();


talkingUser();

