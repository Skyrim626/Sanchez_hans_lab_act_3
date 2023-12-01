class Person {
  String? firstName;
  String? lastName;
  String? age;
  String? emailAddress;
  String? password;

  Person({this.firstName, this.lastName, this.age, this.emailAddress, this.password});

  String? get getFullName {
    return "$firstName $lastName";
  }

  String? get getEmailAddress {
    return emailAddress;
  }

  String? get getFirstName {
    return firstName;
  }

  String? get getAge {
    return age;
  }

  String? get getLastName {
    return lastName;
  }

  String? get getPassword {
    return password;
  }
}