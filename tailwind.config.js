/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.php'],
  theme: {
    extend: {},
  },
  plugins: [require('@prettier/plugin-php')],
};
