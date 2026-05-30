enum ProgressBarState {
  normal,
  success,
  danger,
}

enum UserRole {
  guest,
  member,
  rep,
  admin,
}

extension UserRoleLabel on UserRole {
  String get label {
    switch (this) {
      case UserRole.admin:
        return "Admin";
      case UserRole.member:
        return "Anggota";
      case UserRole.guest:
        return "Guest";
      case UserRole.rep:
        return "Wali";
    }
  }
}