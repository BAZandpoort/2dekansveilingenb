# 2dekans veilingen

Deze README geeft je een overzicht van het project en hoe je het lokaal kunt instellen.

## Project Overzicht
Het project maakt voornamelijk gebruik van de volgende technologieën:
* **PHP** Voor server-side logica en backend-functionaliteit.
* **HTML** Voor het structureren van webpagina's en gebruikersinterfaces.
* **CSS** Voor stijl en ontwerp, met de hulp van [DaisyUI](https://daisyui.com/) & [TailwindCSS](https://tailwindcss.com/) om het CSS-ontwikkelingsproces te vereenvoudigen.

## Vereisten
* Text Editor ([VS Code](https://code.visualstudio.com/Download))
* PHP Compiler ([XAMPP](https://sourceforge.net/projects/xampp/files/XAMPP))
* [NodeJS LTS](https://nodejs.org/en)

## Installatie
1. Clone de repository
2. Installeer al de depedencies: `npm i`
3. Als laatste kan je de server starten: `php -S localhost:8080`

## Veranderingen maken
1. Volg eerst de [installatie](#installatie)
2. Voor dat je aan iets nieuw begint te werken maak je eerst altijd een nieuwe branch aan
3. Daarna maak je de nodige wijzigingen
4. Stage je veranderingen en commit deze
5. Push je commit(s) naar jouw huidige branch
6. Maak hierna een pull request (PR) voor jouw branch
7. Als laatste voeg je [**@DisECtRy**](https://github.com/DisECtRy) & [**@CedricVerlinden**](https://github.com/CedricVerlinden) toe als reviewers

## Project Structuur
Deze structuur zal doorheen het project veranderen, hou dit zeker in de gaten!
```
2dekans-veilingen/
│
├── public/         # Public files zoals afbeeldingen
│
├── src/            # Folder voor alle php files
├──── components/   # Individuele 'components' die hergebruikt kunnen worden
├──── database/     # Files gerelateerd met het beheren van de database
├──── lib/          # Files dat gebruikt worden voor verschillende delen van de website
├──── public/       # Individuele paginas of 'view' dat de gebruiker ziet
│
├── config.php      # Config file voor database credentials & import aliases
│
├── index.php       # Entry point dat alle routes beheert
│
├── routes.php      # Elke route van de website
│
├── .gitignore      # Git ignore file
└── README.md       # Deze README
```

## Groep

* [**Ilias**](https://github.com/DisECtRy)
* [**Cédric**](https://github.com/CedricVerlinden)
* [Imad](https://github.com/Imad4747)
* [Samir](https://github.com/samirelma)
* [Abdullah](https://github.com/AbdullahafloefZP)
* [Valentina](https://github.com/ValenRemZP)
* [Xander](https://github.com/xandanman)
* [Alperen](https://github.com/alperenZP)
