const advancedSearch = () => {
  const button = document.getElementById('show-search')
  button.addEventListener("click", () => {
    marginControl();
  })
}

const searchParams = () => {
  const reset =  document.getElementsByClassName('reset-search')[0];
  const navSearch =  document.getElementsByClassName('nav-search')[0];

  paramInsert();
  marginControl();

  reset.style.display = "block"
  navSearch.style.display = "none"

}

const marginControl = () => {
  const width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;
  const search = document.getElementsByClassName('search-form')[0]
  const basicSearch = document.getElementById('basic-search')
  const indexHeader = document.getElementById('index-header')

  basicSearch.style.display = "none"
  search.style.display = "flex"
  if (width < 400) {
    indexHeader.style.marginBottom = "240px"
  } else if (width > 400 && width < 568) {
    indexHeader.style.marginBottom = "200px"
  }
  else {
  indexHeader.style.marginBottom = "80px"
  }
}

const paramInsert = () => {
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  const minPrice = document.getElementById('min-price');
  const maxPrice = document.getElementById('max-price');
  const keyword = document.getElementById('keyword');
  const type = document.getElementById('select-wine');
  const minPriceParam = urlParams.get('min');
  const maxPriceParam = urlParams.get('max');
  const keywordParam = urlParams.get('keyword');
  const typeParam = urlParams.get('Wines')

  minPrice.value += minPriceParam
  maxPrice.value += maxPriceParam
  keyword.value += keywordParam
  type.value += typeParam
}

export { advancedSearch };
export { searchParams };
