enum ProgressBarState {
  normal,
  success,
  danger,
}

enum UserRole {
  guest,
  member,
  coor,
  admin,
}

enum ApprovalStatus {
  pending,
  approved,
  rejected,
}

enum AuthStatus {
  loading,
  authenticated,
  unauthenticated,
}

extension UserRoleExtension
    on UserRole {

  static UserRole fromString(String role) {

    switch (
      role.toLowerCase()
    ) {

      case 'member':
        return UserRole.member;
      
      case 'user':
        return UserRole.member;

      case 'admin':
        return UserRole.admin;

      case 'coordinator':
        return UserRole.coor;

      default:
        return UserRole.guest;
    }
  }

  String get apiPostValue {
    switch (this) {
      case UserRole.member:
        return 'user';

      case UserRole.admin:
        return 'admin';

      case UserRole.coor:
        return 'coordinator';

      case UserRole.guest:
        return 'guest';
    }
  }

  String get label {
    switch (this) {
      case UserRole.member:
        return 'Anggota';

      case UserRole.admin:
        return 'admin';

      case UserRole.coor:
        return 'Wali';

      case UserRole.guest:
        return 'Guest';
    }
  }
}