const advancedSearch = () => {
  const search = document.getElementsByClassName('search-form')[0]
  const button = document.getElementById('show-search')
  const indexHeader = document.getElementById('index-header')
  const basicSearch = document.getElementById('basic-search')
  const width = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

  button.addEventListener("click", () => {
    basicSearch.style.display = "none"
    search.style.display = "flex"
    if (width < 568) {
      indexHeader.style.marginBottom = "200px"
    } else {
    indexHeader.style.marginBottom = "80px"
  }
  })
}

export { advancedSearch };
