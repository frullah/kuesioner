import 'popper.js'
import 'jquery'
import 'admin-lte/build/js/Layout'
import 'admin-lte/build/js/PushMenu'
import 'admin-lte/build/js/Treeview'
import 'admin-lte/build/js/Toasts'
// import 'bootstrap.native'
import BSN from 'bootstrap.native'

require('@rails/ujs').start()

document.addEventListener('DOMContentLoaded', () => {
  const sidebarMenusElement = document.getElementById('sidebar-nav-items')
  let openedMenuElement = sidebarMenusElement.querySelector('.nav-link.active')
  if (openedMenuElement) {
    while (openedMenuElement !== sidebarMenusElement) {
      openedMenuElement = openedMenuElement.parentElement
  
      if (openedMenuElement.classList.contains('has-treeview')) {
        openedMenuElement.classList.add('menu-open')
        break
      }
    }
  }

  const appToast = document.getElementById('app-toast')
  if (appToast) {
    new BSN.Toast(appToast, {delay: 5000}).show()
  }
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
