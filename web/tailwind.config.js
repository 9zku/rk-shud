/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx,vue}",
  ],
  theme: {
    extend: {
      screens: {
        '2k': '2560px',
        '4k': '3840px',
      },
      spacing: {
        'minimap-border-w': '328px',
        'minimap-border-h': '200px',
        'minimap-border-w-2k': '437px',
        'minimap-border-h-2k': '267px',
        'minimap-border-w-4k': '656px',
        'minimap-border-h-4k': '400px',
        'hud-left-vehicle': '22rem',
        'hud-left-vehicle-2k': '30rem',
        'hud-left-vehicle-4k': '36rem',
        'hud-left': '1rem',
        'hud-left-2k': '1.5rem',
        'hud-left-4k': '2rem',
        'carhud-white-box-left': '0',
        'carhud-white-box-left-2k': '0.75rem',
        'carhud-white-box-left-4k': '1.25rem',
        'carhud-white-box-bottom': '15.1rem',
        'carhud-white-box-bottom-2k': '20rem',
        'carhud-white-box-bottom-4k': '25rem',
        'carhud-text-left': '0',
        'carhud-text-left-2k': '0.75rem',
        'carhud-text-left-4k': '1.25rem',
        'carhud-direction-left': '19.5rem',
        'carhud-direction-left-2k': '24rem',
        'carhud-direction-left-4k': '28rem',
        'carhud-direction-bottom': '15.1rem',
        'carhud-direction-bottom-2k': '20rem',
        'carhud-direction-bottom-4k': '25rem',
      },
      fontFamily: {
        'poppins': ['Poppins', 'sans-serif'],
      }
    },
  },
  plugins: [],
}

