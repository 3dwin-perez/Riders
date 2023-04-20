import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raidereats_riders_app/assistantMethods/get_current_location.dart';
import 'package:raidereats_riders_app/global/global.dart';
import 'package:raidereats_riders_app/mainScreens/parcel_picking_screen.dart';
import 'package:raidereats_riders_app/models/address.dart';
import 'package:raidereats_riders_app/splashScreen/splash_screen.dart';





class ShipmentAddressDesign extends StatelessWidget
{

  final Address? model;
  final String? orderStatus;
  final String? orderId;
  final String? sellerId;
  final String? orderByUser;

  ShipmentAddressDesign({this.model, this.orderStatus, this.orderId, this.sellerId, this.orderByUser});

  confirmedParcelShipment(BuildContext context, String getOrderID, String sellerId, String purchaseId)
  {
      FirebaseFirestore.instance
          .collection("orders")
          .doc(getOrderID)
          .update({
        "riderUID" : sharedPreferences!.getString("uid"),
        "riderName" : sharedPreferences!.getString("name"),
        "status" : "picking",
        "lat" : position!.latitude,
        "lng" : position!.longitude,
        "address": completeAddress,
      });

      //send rider to shipment screen
      Navigator.push(context, MaterialPageRoute(builder: (context) =>  ParcelPickingScreen(
          purchaserId: purchaseId,
          purchaserAddress: model!.fullAddress,
          purchaserLat: model!.lat,
          purchaserLng: model!.lng,
          sellerId: sellerId,
          getOrderId: getOrderID,
      )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:  EdgeInsets.all(10.0),
          child:  Text(
            "Shipping Details:",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Table(
            children: [
              TableRow(
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(model!.name!)
                ],
              ),
              TableRow(
                children: [
                  const Text(
                    "Phone Number",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(model!.phoneNumber!)
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
             model!.fullAddress!,
            textAlign: TextAlign.justify,
          ),
        ),

        orderStatus == "ended"
            ? Container()
            : Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: InkWell(
              onTap: ()
              {
                UserLocation uLocation = UserLocation();
                uLocation.getCurrentLocation();

                confirmedParcelShipment(context, orderId! ,sellerId! , orderByUser!);

              },
              child: Container(
                decoration:const  BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.black,
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                width: MediaQuery.of(context).size.width * 10,
                height: 50,
                child: const Center(
                  child: Text(
                    " Confirm - To Deliver this Parcel",
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: InkWell(
              onTap: ()
              {
                
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MySplashScreen()));

              },
              child: Container(
                decoration:const  BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.black,
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                width: MediaQuery.of(context).size.width * 10,
                height: 50,
                child: const Center(
                  child: Text(
                    "Go Back",
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20,),
      ],
    );
  }
}
