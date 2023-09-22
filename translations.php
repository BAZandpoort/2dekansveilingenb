<?php

if (!isset($_SESSION["lang"])){
  $_SESSION["lang"] = 0;
}
$lng = $_SESSION["lang"];

$translate = [
  'services' => [
    0 => 'Services',
    1 => 'Diensten',
    2 => 'Service',
  ],
  'design' => [
    0 => 'Design',
    1 => 'Ontwerp',
    2 => 'Désign',
  ],
  'marketing' => [
    0 => 'Marketing',
    1 => 'Marketing',
    2 => 'Mercatique',
  ],
  'advertisement' => [
    0 => 'Advertisement',
    1 => 'Advertentie',
    2 => 'Publicité',
  ],
  'business' => [
    0 => 'Business',
    1 => 'Bedrijf',
    2 => 'Enterprise',
  ],
  'about us' => [
    0 => 'About us',
    1 => 'Over ons',
    2 => 'À propos de nous',
  ],
  'vacancies' => [
    0 => 'Vacancies',
    1 => 'Vacatures',
    2 => 'Postes vacants',
  ],
  'press kit' => [
    0 => 'Press kit',
    1 => 'Perskit',
    2 => 'Dossier de presse',
  ],
  'legal' => [
    0 => 'Legal',
    1 => 'Juridisch',
    2 => 'Juridique',
  ],
  'terms of use' => [
    0 => 'Terms of Use',
    1 => 'Gebruiksvoorwaarden',
    2 => "Conditions d'utilisation",
  ],
  'privacy policy' => [
    0 => 'Privacy Policy',
    1 => 'Privacybeleid',
    2 => 'Politique de confidentialité',
  ],
  'cookie policy' => [
    0 => 'Cookie Policy',
    1 => 'Cookiebeleid',
    2 => 'Politique de cookies',
  ],
  '2nd-chance auctions' => [
    0 => '2nd-chance auctions',
    1 => '2dekans veilingen',
    2 => '2ème-chance enchères',
  ],
  'reliable tech' => [
    0 => 'Reliable technology since 2023',
    1 => 'Betrouwbare technologie sinds 2023',
    2 => 'Technologie fiable depuis 2023',
  ],
  'products' => [
    0 => 'Products',
    1 => 'Producten',
    2 => 'Produits',
  ],
  'categories' => [
    0 => 'Categories',
    1 => 'Categorieën',
    2 => 'Catégories',
  ],
  'profile' => [
    0 => 'Profile',
    1 => 'Profiel',
    2 => 'Profil',
  ],
  'login' => [
    0 => 'Login',
    1 => 'Inloggen',
    2 => 'Login',
  ],
  'logout' => [
    0 => 'Logout',
    1 => 'Uitloggen',
    2 => 'Logout',
  ],
  'hello from index' => [
    0 => 'HELLO FROM INDEX',
    1 => 'HALLO VANUIT INDEX',
    2 => 'BONJOUR DEPUIS INDICE',
  ],
  'welcome' => [
    0 => "WELCOME",
    1 => "WELKOM",
    2 => "BIENVENUE"
  ],
  

  
];
