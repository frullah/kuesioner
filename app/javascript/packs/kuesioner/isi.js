import Swal from 'sweetalert2'

const swal = Swal.mixin({
  customClass: {
    confirmButton: 'btn btn-primary',
    cancelButton: 'btn btn-danger'
  },
  buttonsStyling: false
})

document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('form')
  form.addEventListener('ajax:success', async ({detail: [data]}) => {
    if (data.success) {
      await swal.fire({
        text: 'Berhasil mengirimkan kuesioner',
        icon: 'success'
      })

      window.location.href = data.redirect_url
    }
  })

  form.addEventListener('ajax:error', ({ detail: [data] }) => {
    swal.fire({
      text: data.error,
      icon: 'error'
    })
  })
})
