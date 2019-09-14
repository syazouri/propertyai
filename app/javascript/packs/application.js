import "bootstrap";
import "../plugins/area_show";

function calculateMortgage() {
  const calculateBtn = document.getElementById("multiply");
  if (calculateBtn) {
    calculateBtn.addEventListener('click', () => {
      const num1 = document.getElementById("search_gross_annual").value;
      if (!isNaN(num1)) {
        const result1 = num1 * 3.25;
        const result2 = num1 * 4.5;
        const btn = document.getElementById("multiply");
        const html = `<p>We estimate you can borrow £<span id = "result1">${result1}</span> - £<span id = "result2">${result2}</span><br>
        </p><div class="form-inputs"><input name="search[deposit]" type="text" placeholder="Enter your deposit amount" id="deposit-amount"></div>`;
        btn.insertAdjacentHTML("afterend", html);
        const maxMortgage = document.getElementById("max-mortgage");
        maxMortgage.value = result2;
      }
    });
  }
}
calculateMortgage();


