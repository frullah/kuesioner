const { environment } = require('@rails/webpacker')

const path = require('path')
const webpack = require('webpack')

environment.config.merge({
  resolve: {
    alias: {
      'bootstrap.native$': 'bootstrap.native/dist/bootstrap-native.esm.min.js',
      '@': path.resolve(__dirname, '../../app/javascript')
    }
  }
})

environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
