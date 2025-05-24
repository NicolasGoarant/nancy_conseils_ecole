document.addEventListener('turbo:load', function() {
    const modal = document.getElementById('school-login-modal');
    const closeButton = document.querySelector('.close-button');
    const schoolNameElement = document.getElementById('school-name');
    const schoolIdInput = document.getElementById('modal-school-id');
    const usernameInput = document.getElementById('modal-username');
    const schoolCards = document.querySelectorAll('.school-card');
  
    if (!schoolCards.length) return; // Sécurité : si pas d'écoles
  
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
  
    closeButton.addEventListener('click', () => {
      modal.style.display = 'none';
    });
  
    window.addEventListener('click', (event) => {
      if (event.target === modal) {
        modal.style.display = 'none';
      }
    });
  
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
  });

  document.addEventListener('turbo:load', function() {
    const tabButtons = document.querySelectorAll('.tab-button');
    const tabContents = document.querySelectorAll('.tab-content');
  
    if (tabButtons.length && tabContents.length) {
      tabButtons.forEach(button => {
        button.addEventListener('click', () => {
          // Activer le bouton actif
          tabButtons.forEach(btn => btn.classList.remove('active'));
          button.classList.add('active');
  
          const targetTab = button.getAttribute('data-tab');
  
          // Masquer tous les contenus
          tabContents.forEach(content => {
            content.style.display = 'none';
          });
  
          // Afficher le contenu correspondant
          const activeContent = document.getElementById(`${targetTab}-tab`);
          if (activeContent) {
            activeContent.style.display = 'block';
          }
        });
      });
    }
  });
  
  