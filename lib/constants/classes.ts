const classesPerRaid = {
  Prêtre: 4,
  Mage: 5,
  Démoniste: 3,
  Voleur: 5,
  Druide: 3,
  Chasseur: 4,
  Chaman: 5,
  "Guerrier Tank": 4,
  "Guerrier DPS": 5,
  // Paladin: 4,
  "Prêtre Ombre": 1,
  "Druide Feral": 1,
  "Chaman Amélio": 0,
  "Chaman Elementaire": 0
};

const wowClasses = [
  { id: 0, name: "-- Classe --", icon: "" },
  { id: 1, name: "Prêtre", icon: "https://i.imgur.com/jzdbh7x.jpg" },
  { id: 2, name: "Mage", icon: "https://i.imgur.com/gGqRnTG.jpg" },
  { id: 3, name: "Démoniste", icon: "https://i.imgur.com/dQQEbVF.jpg" },
  { id: 4, name: "Voleur", icon: "https://i.imgur.com/XQXIauj.jpg" },
  { id: 5, name: "Druide", icon: "https://i.imgur.com/9Tbuzod.jpg" },
  { id: 6, name: "Chasseur", icon: "https://i.imgur.com/ZN9MWW8.jpg" },
  { id: 7, name: "Chaman", icon: "https://i.imgur.com/Pzt7jF3.jpg" },
  { id: 8, name: "Guerrier Tank", icon: "https://i.imgur.com/ZESKCnu.jpg" },
  { id: 9, name: "Guerrier DPS", icon: "https://i.imgur.com/3d2GCGF.jpg" },
  { id: 11, name: "Prêtre Ombre", icon: "https://i.imgur.com/ZTGeN3S.jpg" },
  { id: 12, name: "Druide Feral", icon: "https://i.imgur.com/x4tc57M.jpg" },
  { id: 13, name: "Chaman Amélio", icon: "https://i.imgur.com/n1DjsUN.jpg" },
  {
    id: 14,
    name: "Chaman Elementaire",
    icon: "https://i.imgur.com/M2UCg2s.jpg"
  }
];

export { classesPerRaid, wowClasses };
