import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raidereats_riders_app/global/global.dart';


separateOrdersItemIDs(orderIDs)
{

  List<String> separateItemIDsList=[], defaultItemList=[];
  int i=0;


  defaultItemList = List<String>.from(orderIDs);

  for(i; i<defaultItemList.length; i++)
  {

    String item = defaultItemList[i].toString();
    var pos = item.lastIndexOf(":");


    String getItemId = (pos != -1) ? item.substring(0,pos): item;

    print("\nThis is itemID now = " + getItemId);
    separateItemIDsList.add(getItemId);
  }

  print("\nThis is Items List now = ");
  print(separateItemIDsList);

  return separateItemIDsList;
}



separateItemIDs()
{

  List<String> separateItemIDsList=[], defaultItemList=[];
  int i=0;
  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for(i; i<defaultItemList.length; i++)
    {

      String item = defaultItemList[i].toString();
      var pos = item.lastIndexOf(":");


      String getItemId = (pos != -1) ? item.substring(0,pos): item;

      print("\nThis is itemID now = " + getItemId);
      separateItemIDsList.add(getItemId);
    }

      print("\nThis is Items List now = ");
      print(separateItemIDsList);

  return separateItemIDsList;
}




separateOrderItemQuantities(orderIDs)
{

  List<String> separateItemQuantityList=[];
  List<String> defaultItemList=[];
  int i=1;

  defaultItemList = List<String>.from(orderIDs);

  for(i; i<defaultItemList.length; i++)
  {

    //56557657:7
    String item = defaultItemList[i].toString();

    //7
    List<String> ListItemCharacters = item.split(":").toList();

    var quanNumber = int.parse(ListItemCharacters[1].toString());

    print("\nThis is a Quantity Number = " + quanNumber.toString());

    separateItemQuantityList.add(quanNumber.toString());
  }

  print("\nThis is a Quantity List now = ");

  print("\nThis is Items List now = ");
  print(separateItemQuantityList);

  return separateItemQuantityList;
}



separateItemQuantities()
{

  List<int> separateItemQuantityList=[];
  List<String> defaultItemList=[];
  int i=1;

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for(i; i<defaultItemList.length; i++)
  {

    //56557657:7
    String item = defaultItemList[i].toString();

    //7
    List<String> ListItemCharacters = item.split(":").toList();

    var quanNumber = int.parse(ListItemCharacters[1].toString());

    print("\nThis is a Quantity Number = " + quanNumber.toString());

   separateItemQuantityList.add(quanNumber);
  }

  print("\nThis is a Quantity List now = ");

  print("\nThis is Items List now = ");
  print(separateItemQuantityList);

  return separateItemQuantityList;
}


clearCartNow(context)
{
  sharedPreferences!.setStringList("userCart",['garbageValue']);
  List<String>? emptyList = sharedPreferences!.getStringList("userCart");

  FirebaseFirestore.instance
      .collection("users")
      .doc(firebaseAuth.currentUser!.uid)
      .update({"userCart": emptyList}).then((value)
    {
        sharedPreferences!.setStringList("userCart", emptyList!);

    });
}