// Compteur de vues du portfolio.
// Utilise CountAPI (gratuit, sans backend) pour un affichage immédiat.
// Pour remplacer par ton propre backend (Lambda + DynamoDB + API Gateway,
// comme dans le Cloud Resume Challenge) : change simplement COUNTER_URL
// pour l'URL de ton API Gateway, et adapte la lecture de la réponse
// (ex: data.count au lieu de data.value) si besoin.

const COUNTER_NAMESPACE = "dgthian-portfolio";
const COUNTER_KEY = "views";
const COUNTER_URL = `https://api.countapi.xyz/hit/${COUNTER_NAMESPACE}/${COUNTER_KEY}`;

async function updateVisitorCount() {
  const el = document.getElementById("visitor-count");
  if (!el) return;

  try {
    const res = await fetch(COUNTER_URL);
    if (!res.ok) throw new Error("réponse invalide");
    const data = await res.json();
    el.textContent = data.value ?? "—";
  } catch (err) {
    el.textContent = "—";
  }
}

document.getElementById("year").textContent = new Date().getFullYear();
updateVisitorCount();
