import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/data/model/my_booking_data.dart';
import 'package:amar_karigor/app/global/widget/custom_shimmer.dart';
import 'package:amar_karigor/app/modules/checkout/controllers/checkout_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:amar_karigor/app/global/widget/custom_image_dummy.dart'
    if (dart.library.html) 'package:amar_karigor/app/global/widget/custom_image.dart'
    as ci;

Widget bookingData(CheckoutController checkoutController, context) {
  CustomShimmer customShimmer = CustomShimmer();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      
      Container(
          child: checkoutController.bookings.length == 0
              ? ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return customShimmer.multiShimmerContainer([
                      customShimmer.getShimmerFromColor(width: 60, height: 60),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customShimmer.getShimmerFromColor(
                              width: MediaQuery.of(context).size.width * .7,
                              height: 10,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                          customShimmer.getShimmerFromColor(
                              width: MediaQuery.of(context).size.width * .65,
                              height: 8,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                          customShimmer.getShimmerFromColor(
                              width: MediaQuery.of(context).size.width * .6,
                              height: 8,
                              margin: EdgeInsets.only(bottom: 4, left: 8)),
                        ],
                      ),
                    ]);
                  })
              : ListView.builder(
                  itemCount: checkoutController.bookings.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return service(checkoutController, index);
                  })),
    ],
  );
}

Widget service(CheckoutController checkoutController, int index) {
  MyBookingData bookingData = checkoutController.bookings[index];
  return InkWell(
    onTap: () => checkoutController.removeBooking(index),
    child: Container(
      child: Card(
        child: Column(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   color: Colors.green[50],
                  //   child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: kIsWeb
                  //           ? ci.CustomImage(
                  //               service.name,
                  //               '${Api.assets_url}${Api.services_icon}${service.icon}',
                  //               40,
                  //               40)
                  //           : Image.network(
                  //               '${Api.assets_url}${Api.services_icon}${service.icon}',
                  //               height: 40,
                  //             )),
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: kIsWeb
                            ? ci.CustomImage(
                                bookingData.service.name,
                                '${Api.assets_url}${Api.services_icon}${bookingData.service.icon}',
                                40,
                                40)
                            : Image.network(
                                '${Api.assets_url}${Api.services_icon}${bookingData.service.icon}',
                                height: 40,
                              )),
                            Text(
                              bookingData.service.name,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          '৳ ${bookingData.totalPrice}',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                
                
                
                ]),
          ],
        ),
      ),
    ),
  );
}