# db/seeds.rb

# 1. Création d'utilisateurs
admin = User.create!(
  username: 'admin',
  password: 'password',
  full_name: 'Administrateur',
  email: 'admin@nancy.fr',
  role: 'admin'
)

official1 = User.create!(
  username: 'pierre',
  password: 'password',
  full_name: 'Pierre Dupont',
  email: 'pierre.dupont@nancy.fr',
  role: 'official'
)

official2 = User.create!(
  username: 'marie',
  password: 'password',
  full_name: 'Marie Durand',
  email: 'marie.durand@nancy.fr',
  role: 'official'
)

school_user1 = User.create!(
  username: 'ecole.braconnot',
  password: 'password',
  full_name: 'Direction École Braconnot',
  email: 'direction@braconnot.edu',
  role: 'school'
)

school_user2 = User.create!(
  username: 'ecole.didion',
  password: 'password',
  full_name: 'Direction École Didion',
  email: 'direction@didion.edu',
  role: 'school'
)

# 2. Création d'écoles
school1 = School.create!(
  name: 'École Élémentaire Braconnot',
  address: '2 Rue Braconnot, 54000 Nancy',
  phone: '03 83 85 51 85',
  email: 'ce.0541699@ac-nancy-metz.fr'
)

school2 = School.create!(
  name: 'École Élémentaire Didion',
  address: '17 Rue Didion, 54000 Nancy',
  phone: '03 83 85 51 90',
  email: 'ce.0541700@ac-nancy-metz.fr'
)

# 3. Création des associations
Association.create!(
  school: school1,
  user: official1,
  active: true,
  assigned_at: Date.today - 6.months
)

Association.create!(
  school: school2,
  user: official2,
  active: true,
  assigned_at: Date.today - 6.months
)

Association.create!(
  school: school1,
  user: school_user1,
  active: true,
  assigned_at: Date.today - 12.months
)

Association.create!(
  school: school2,
  user: school_user2,
  active: true,
  assigned_at: Date.today - 12.months
)

# Partie 4. Création de conseils dans votre fichier seeds.rb
council1 = Council.create!(
  school: school1,
  title: 'Conseil du 1er trimestre',
  date: Date.today + 2.weeks,
  location: 'Salle de réunion - École Braconnot'
  # Ne pas inclure status ou d'autres attributs qui n'existent pas
)

council2 = Council.create!(
  school: school1,
  title: 'Conseil du 2ème trimestre',
  date: Date.today + 3.months,
  location: 'Salle de réunion - École Braconnot'
  # Ne pas inclure status ou d'autres attributs qui n'existent pas
)

council3 = Council.create!(
  school: school2,
  title: 'Conseil du 1er trimestre',
  date: Date.today + 1.week,
  location: 'Salle de réunion - École Didion'
  # Ne pas inclure status ou d'autres attributs qui n'existent pas
)

# Même chose pour le conseil passé créé plus tard
past_council = Council.create!(
  school: school1,
  title: 'Conseil du 3ème trimestre 2024',
  date: Date.today - 2.months,
  location: 'Salle de réunion - École Braconnot'
  # Ne pas inclure status ou d'autres attributs qui n'existent pas
)

# 5. Création d'informations
Information.create!(
  school: school1,
  title: 'Travaux prévus durant les vacances de février',
  content: 'Des travaux de rénovation de la cour seront effectués pendant les vacances de février. L\'accès à l\'école sera limité.',
  tags: 'travaux,cour,vacances'
)

Information.create!(
  school: school2,
  title: 'Fête de l\'école',
  content: 'La fête de l\'école aura lieu le 20 juin 2025. Nous vous attendons nombreux pour cet événement.',
  tags: 'fête,événement'
)

# 6. Création des présences
Attendance.create!(
  council: council1,
  user: official1,
  status: 'attending'
)

Attendance.create!(
  council: council3,
  user: official2,
  status: 'pending'
)

# 7. Création d'un rapport pour un conseil passé
past_council = Council.create!(
  school: school1,
  title: 'Conseil du 3ème trimestre 2024',
  date: Date.today - 2.months,
  location: 'Salle de réunion - École Braconnot'
  # N'incluez que les attributs qui existent réellement dans la table
)

Report.create!(
  council: past_council,
  user: official1,
  summary: 'Bilan de l\'année scolaire 2024-2025 très positif. Les résultats des élèves sont en progression.',
  issues: 'Quelques problèmes de chauffage ont été signalés dans l\'aile nord du bâtiment.',
  follow_up: 'Une demande d\'intervention a été faite auprès des services techniques de la ville.',
  submitted: true
)

