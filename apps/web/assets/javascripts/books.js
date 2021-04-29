document.addEventListener('DOMContentLoaded', () => {
  const deleteBookButtons = document.querySelectorAll('button.book-delete-submit')

  deleteBookButtons.forEach(submitButton => {
    submitButton.addEventListener('click', e => confirmDeleteBook(e, submitButton))
  })
})

function confirmDeleteBook(e, submitButton) {
  e.preventDefault()

  answer = confirm('Are your sure to delete this book?')
  if (answer) {
    submitButton.closest('form').submit()
  }
}
