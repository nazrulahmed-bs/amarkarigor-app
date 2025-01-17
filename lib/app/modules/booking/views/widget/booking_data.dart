import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/config/app_style.dart';
import 'package:amar_karigor/app/global/data/model/booking.dart';
import 'package:amar_karigor/app/global/widget/custom_image_dummy.dart'
    if (dart.library.html) 'package:amar_karigor/app/global/widget/custom_image.dart'
    as ci;
import 'package:amar_karigor/app/modules/booking/controllers/booking_controller.dart';
import 'package:amar_karigor/app/modules/home/controllers/home_controller.dart';
import 'package:amar_karigor/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget bookingData(BookingController bookingController, context, int status) {
  HomeController homeController = Get.find();
  int len = 0;
  String bookingType = 'Incomplete';
  if (status == 1) {
    len = bookingController.incompleteBookings.length;
  } else {
    len = bookingController.completeBookings.length;
    bookingType = 'completed';
  }

  return Container(
      child: len == 0
          ? Column(
              children: [
                Spacer(),
                Icon(
                  Icons.event_note_outlined,
                  size: 60,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text(
                      'You don\'t have any $bookingType booking.',
                      style: MyTextStyle.textBlackLargeBold,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                ElevatedButton(
                  onPressed: () => homeController.changePage(0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6.0,
                      horizontal: 12,
                    ),
                    child: Text(
                      'Book now',
                      style: MyTextStyle.textWhiteMedium,
                    ),
                  ),
                  style: MyButtonStyle.submitButton,
                ),
                Spacer(),
              ],
            )
          : ListView.builder(
              itemCount: len,
              itemBuilder: (context, index) {
                return item(bookingController, index, status);
              }));
}

Widget item(BookingController bookingController, int index, int status) {
  Booking bookingData;
  if (status == 1) {
    bookingData = bookingController.incompleteBookings[index];
  } else {
    bookingData = bookingController.completeBookings[index];
  }
  return InkWell(
    onTap: () => Get.toNamed(Routes.BOOKING_DETAILS,
        arguments: {'index': index, 'status': status}),
    child: Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red[400]),
      onDismissed: (DismissDirection direction) async {
        await bookingController.removeBooking(
            bookingData.id!,status);
      },
      direction: DismissDirection.endToStart,
      child: Container(
        child: Card(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kIsWeb
                          ? Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: ci.CustomImage(
                                  bookingData.icon!,
                                  '${Api.assets_url}${Api.services_icon}${bookingData.icon}',
                                  40,
                                  40),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Image.network(
                                '${Api.assets_url}${Api.services_icon}${bookingData.icon}',
                                height: 40,
                                width: 40,
                              ),
                            ),
                      SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '# ${bookingData.id}',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text(
                              bookingData.serviceName!,
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, right: 8),
                        child: Text(
                          '৳ ${bookingData.totalToPay}',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: MyColors.colorPrimary),
                        ),
                      ),
                    ]),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.calendar_today_rounded,
                        color: Colors.blueGrey[700]),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${bookingData.bookingDate}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[700]),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Icon(Icons.access_time, color: Colors.blueGrey[700]),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      '${bookingData.bookingTime}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[700]),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
