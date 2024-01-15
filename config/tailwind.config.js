/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*',
  ],
  theme: {
    extend: {
      backgroundImage: {
        'clouds-pattern': "url('circuit-pattern.svg')"
      },
      colors: {
        'cw-purple': {
          100: '#f4e2ff',
          200: '#e3b5ff',
          300: '#d085ff',
          400: '#b643ff',
          500: '#9c00ff',
          600: '#7d00cc',
          700: '#5a0093',
          800: '#3b0060',
          900: '#180026',
        }
      }
    },
  },
  plugins: [],
}