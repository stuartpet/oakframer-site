// app/javascript/coming_soon.js
document.addEventListener("DOMContentLoaded", () => {
  const el = document.getElementById("type-text");
  const message = "Coming Soon...";
  let i = 0;
  function typeWriter() {
    if (i < message.length) {
      el.textContent += message.charAt(i);
      i++;
      setTimeout(typeWriter, 120);
    } else {
      el.style.borderRight = "none";
    }
  }
  if (el) {
    el.style.width = message.length + "ch";
    typeWriter();
  }
});

