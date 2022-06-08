//create Login:
//validate email
//validate

//go to Home

void main() {
  final isValid = validate(username: "abner", password: "abner123");

  if (stringIsNullOrEmpty(isValid)) {
    login(username: "abner", password: "abner123");
  }
}

void login({
  required String username, 
  required String password
}) {
  final response = validateLogin(username: username, password: password);
  if (response) {
    print("Open HomePage");
  }
}

String? validate({
  required String username, 
  required String password
}) {
  final usernameIsValid = validateUsername(username);
  final passwordIsValid = validatePassword(password);

  if (!passwordIsValid) {
    return "password must be 6 characters";
  } 
  
  if (!usernameIsValid) {
    return "username can't be null";
  }

  return null;
}

bool validateUsername(String? username) => username != null && username.length > 0;

bool validatePassword(String? password)  => password != null && password.length > 6;

bool validateLogin(
  {
  required String username, 
  required String password
}) {
  print("Connecting to the server");
  print("welcome $username");
  return true;
}

bool stringIsNullOrEmpty(String? value) {
  if (value == null || value.isEmpty)
  {
    return true;
  }
  return false;
}