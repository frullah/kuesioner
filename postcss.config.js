module.exports = {
  plugins: [
    require('tailwindcss'),
    require('autoprefixer'),
    require('postcss-flexbugs-fixes'),
    require('postcss-preset-env')({
      autoprefixer: {
        flexbox: 'no-2009'
      },
      stage: 3
    })
  ]
}

if (process.env.RAILS_ENV === 'production') {
  module.exports.plugins.push(
    require('@fullhuman/postcss-purgecss')({
      content: [
        './app/views/**/*.html.erb',
        './app/helpers/**/*.rb',
        './app/javascript/**/*.js'
      ],
      whitelistPatterns: [/^form-/, /^btn-/, /^custom-file/, /^sidebar/],
      whitelist: ['img', 'input', 'button', 'collapse', 'collapsing'],
      defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || []
    })
  )
}
