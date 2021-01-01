import $ from 'jquery'
import 'admin-lte/build/js/Layout'
import 'admin-lte/build/js/PushMenu'
import BSN from 'bootstrap.native'

require('@rails/ujs').start()
require('turbolinks').start()

document.addEventListener('turbolinks:load', () => {
  $(document.body).Layout('fixLayoutHeight')
  BSN.initCallback()
})

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
