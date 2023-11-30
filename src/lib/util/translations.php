<?php 
function translate($language) {
  return fetch('SELECT id, ' . $language . ' FROM translations');
}
