// uncomment to define custom colors
//const colors = require('tailwindcss/colors');

module.exports = {
  presets: [
    require('./themes/docs/tailwind.preset.js')
  ],
  content: [
    './layouts/**/*.html.twig',
    './themes/**/layouts/**/*.html.twig',
   './themes/**/includes/**/*.html.twig',
   './themes/**/partials/**/*.html.twig',
   './themes/**/assets/js/**/*.js',
   './themes/**/assets/css/**/*.css',
   

  ],
  // uncomment to define custom colors
  /*theme: {
    extend: {
      // https://tailwindcss.com/docs/customizing-colors
      colors: {
        primary: colors.blue,
        secondary: colors.slate,
      },
    },
  }*/
}
