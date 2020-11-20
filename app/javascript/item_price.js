function count (){
const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const addTaxDom = document.getElementById("add-tax-price");
   const addProfitDom = document.getElementById("profit");
   addTaxDom.innerHTML = `${inputValue * 0.1}`;
   addProfitDom.innerHTML = `${inputValue * 0.9}`;
   console.log(Math.floor(inputValue));
  });
}

window.addEventListener('load', count)