String customFirebaseGetError(String code) {
  switch (code) {
    case 'The email address is already in use by another account.':
      return 'Email já foi cadastrado';

    case 'The password is invalid or the user does not have a password.':
      return 'Sua senha está errada';

    case 'There is no user record corresponding to this identifier. The user may have been deleted.':
      return 'Usuario não foi criado';

    default:
      return 'Um erro indefinido ocorreu.';
  }
}


