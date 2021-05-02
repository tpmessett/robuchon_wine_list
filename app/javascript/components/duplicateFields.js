const duplicateProductInfo = () => {
  const field = document.getElementsByName("wine[product_information][]")[0]
  const button = document.getElementById("product-info-button")
  const div = document.getElementById("product-info-div")

  button.addEventListener("click", () => {
    console.log('click')
    let fieldTwo = field.cloneNode(true);
    div.appendChild(fieldTwo)
  })
}

const duplicateFoodPairingsInfo = () => {
  const field = document.getElementsByName("wine[food_pairings][]")[0]
  const button = document.getElementById("food-pairings-info-button")
  const div = document.getElementById("food-pairings-info-div")

  button.addEventListener("click", () => {
    console.log('click')
    let fieldTwo = field.cloneNode(true);
    div.appendChild(fieldTwo)
  })
}

const tastingNotesInfo = () => {
  const field = document.getElementsByName("wine[tasting_notes][]")[0]
  const button = document.getElementById("tasting-notes-info-button")
  const div = document.getElementById("tasting-notes-info-div")

  button.addEventListener("click", () => {
    console.log('click')
    let fieldTwo = field.cloneNode(true);
    div.appendChild(fieldTwo)
  })
}

const allergensInfo = () => {
  const field = document.getElementsByName("wine[allergens][]")[0]
  const button = document.getElementById("allergens-info-button")
  const div = document.getElementById("allergens-info-div")

  button.addEventListener("click", () => {
    console.log('click')
    let fieldTwo = field.cloneNode(true);
    div.appendChild(fieldTwo)
  })
}

export { duplicateProductInfo };
export { duplicateFoodPairingsInfo };
export { tastingNotesInfo };
export { allergensInfo };
