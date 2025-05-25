document.addEventListener('turbo:load', () => {
  console.log("⚡️ Tout script prêt (modal & onglets)");

  // Gestion du modal
  const modal = document.getElementById('school-login-modal');
  const closeButton = document.querySelector('.close-button');
  const schoolNameElement = document.getElementById('school-name');
  const schoolIdInput = document.getElementById('modal-school-id');
  const usernameInput = document.getElementById('modal-username');
  const schoolCards = document.querySelectorAll('.school-card');

  if (schoolCards.length) {
    schoolCards.forEach(card => {
      card.addEventListener('click', () => {
        const schoolId = card.getAttribute('data-id');
        const schoolName = card.getAttribute('data-name');

        modal.style.display = 'flex';
        schoolNameElement.textContent = schoolName;
        schoolIdInput.value = schoolId;
        usernameInput.value = 'ecole_' + schoolId;
      });
    });
  }

  if (closeButton) {
    closeButton.addEventListener('click', () => {
      modal.style.display = 'none';
    });
  }

  window.addEventListener('click', (event) => {
    if (event.target === modal) {
      modal.style.display = 'none';
    }
  });

  // Gestion des rôles dans le modal
  const userTypeButtons = document.querySelectorAll('.user-type-btn');
  userTypeButtons.forEach(button => {
    button.addEventListener('click', () => {
      userTypeButtons.forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');

      const role = button.getAttribute('data-role');
      const schoolId = schoolIdInput.value;
      usernameInput.value = role === 'school' ? 'ecole_' + schoolId : 'elu_' + schoolId;
    });
  });

  // Gestion des onglets
  const tabButtons = document.querySelectorAll('.tab-button');
  const tabContents = document.querySelectorAll('.tab-content');

  tabButtons.forEach(button => {
    button.addEventListener('click', () => {
      console.log("✅ Onglet cliqué :", button.getAttribute('data-tab'));

      // Retire active de tous les boutons
      tabButtons.forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');

      // Cache tous les contenus
      tabContents.forEach(tab => tab.style.display = 'none');

      // Affiche l'onglet choisi
      const tabToShow = button.getAttribute('data-tab');
      const targetTab = document.getElementById(tabToShow + '-tab');
      if (targetTab) {
        targetTab.style.display = 'block';
      } else {
        console.log("❌ Onglet non trouvé :", tabToShow + '-tab');
      }
    });
  });
});





  
  