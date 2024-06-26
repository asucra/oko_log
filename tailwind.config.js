module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    'node_modules/preline/dist/*.js'
  ],
  plugins: [
    require('daisyui'),
    require('preline/plugin')
  ],
  theme: {
    extend: {
      colors: {
        'green': '#4C7671',
        'light-green': '#D2DFDB',
        'dark-green': '#274e4a',
        'white': '#FFFFFF',
        'yellow': '#FBC607',
      }
    },
    container: {
      center: ture,
    },
  },
}
