enum CharachterGender { male, female, genderless, unknown }

CharachterGender genderFromJson(String gender) {
  switch (gender) {
    case 'Male':
      return CharachterGender.male;
    case 'Female':
      return CharachterGender.female;
    case 'Genderless':
      return CharachterGender.genderless;
    default:
      return CharachterGender.unknown;
  }
}

enum CharachterStatus { alive, dead, unknown }

CharachterStatus statusFromJson(String status) {
  switch (status) {
    case 'Alive':
      return CharachterStatus.alive;
    case 'Dead':
      return CharachterStatus.dead;
    default:
      return CharachterStatus.unknown;
  }
}
