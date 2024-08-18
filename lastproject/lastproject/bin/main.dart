import 'dart:io';
import 'custmor.dart';  
void main(List<String> args) {
  print("Welcome to our Boutique");
  runAsCustomer();
}

void menu() {
  List<String> menuList = [
    "View Item",
    "Add To Shopping Cart",
    "removeFromShoppingCart",
    "viewShoppingCart",
    "Exit"
  ];
  for (int i = 0; i < menuList.length; i++) {
    print("${i + 1} - ${menuList[i]}");
  }
}

Customer createUserAccount() {  // Ensure consistency in class names
  stdout.write("Please enter your name: ");
  String name = stdin.readLineSync()!;
  stdout.write("Please enter your phone number: ");
  String phNo = stdin.readLineSync()!;
  stdout.write("Please enter your address: ");
  String address = stdin.readLineSync()!;
  Customer customer = Customer(name, phNo, address);  // Corrected class name
  return customer;
}

void userChoice(Customer c) {
  menu();
  int choice = int.parse(stdin.readLineSync()!);
  switch (choice) {
    case 1:
      c.viewItem();
      break;
    case 2:
      int n;
      do {
        stdout.write("Enter ID for item to add it, if you want to exit enter 0: ");
        n = int.parse(stdin.readLineSync()!);
        if (n != 0) {
          c.addToShoppingCart(n);
        }
      } while (n != 0);
      c.viewItem();
      break;
    case 3:
      int n;
      do {
        stdout.write("Enter ID for item to delete it, if you want to exit enter 0: ");
        n = int.parse(stdin.readLineSync()!);
        if (n != 0) {
          c.removeFromShoppingCart(n);
        }
      } while (n != 0);
      c.viewShoppingCart();
      break;
    case 4:
      c.viewShoppingCart();
      break;
    case 5:
      exit(0);
    default:
      print("Invalid choice, please try again.");
      // Optionally, call menu() or loop back to userChoice()
  }
}

void runAsCustomer() {
  print("If you want to register please enter 'yes'");
  String choice = stdin.readLineSync()!;
  if (choice.toLowerCase() == "yes") {
    Customer c = createUserAccount();  // Ensure class name consistency
    while (true) {
      userChoice(c);
    }
  } else {
    print("You chose not to register.");
  }
}
