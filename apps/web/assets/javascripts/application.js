document.addEventListener('DOMContentLoaded', () => {
  const elem = document.getElementById('go-back')
  if (elem) {
    elem.onclick = e => {
      e.preventDefault()
      window.history.back()
    }
  }
})
