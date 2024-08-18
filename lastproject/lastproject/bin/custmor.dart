import 'dart:js_interop';
import 'item1.dart';
import 'StaticItem.dart';
import 'Shoppingcart.dart';
var customerId = 0;
class Customer {
  late int _id;
  late String name;
  late String address;
  late Shoppingcart cart;

  Customer(this.name, this.address) {
    _id = ++customerId;
  }
  int get getId => _id;
  set id(int b) => _id =b;

  void updateAddress(String newAddress) {
    address = newAddress;
    print('Address for $name has been updated.');
  }

  void viewItem() {
    viewSysItem();
  }

  void addToShoppingCart(int b) {
    int index = StaticItemList.indexWhere((element) => element.getId == b);
    if (index != -1) {
      var a = StaticItemList[index].getName;
      cart.item1.add(a); 
      cart.numberofItem ++;
      cart.total +=StaticItemList[index].getPrice;
    } 
    else {print('Item not found.');}

    removeFromShoppingCart(int n){

    int index = cart.item1.indexWhere((element) => element.getId == n);
    double removedPrice = cart.item1[index].price;
    cart.item1.removeAt(index);
      
    cart.numberofItem --; //num - 1
    cart.total -= removedPrice;
  }
  }
  viewShoppingCart(){
  print("""________________________________________
No  |  Item name  |   Item Price
_______________________________________""");
for (int i = 0; i < cart.item1.length ; i++){
  print("${i+1}        ${cart.item1[i].name}            ${cart.item1[i].price}" );
}
print("your number of item = ${cart.numberofItem}\ntotal price = ${cart.total}");
  }

}
