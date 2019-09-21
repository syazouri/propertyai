import Typed from 'typed.js';

const loadDynamicMarkerText = () => {
  new Typed('#marker-typed-text', {
    strings: ["Click on a marker to view school details"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicMarkerText };
