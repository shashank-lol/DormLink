import 'package:dorm_link/src/features/utilities/color_legend.dart';
import 'package:dorm_link/src/features/utilities/time_slot.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DaySlot extends StatelessWidget {
  const DaySlot({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String formattedDateToday = DateFormat('dd MMMM').format(today);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Colors.black.withOpacity(0.1))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   formattedDateToday,
                //   style: GoogleFonts.poppins(
                //       color: Theme.of(context).colorScheme.onBackground,
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold),
                // ),
                // const Spacer(),
                Text(
                  "2 slots available",
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 16),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Divider(
                thickness: 1,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 2,
                children: List.generate(
                    24,
                    (index) => TimeSlot(
                          hour: index,
                          isFree: index % 2 == 0 ? true : false,
                        ))),
            Padding(
              padding: EdgeInsets.only(top: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ColorLegend(color: Colors.white, legend: "Available",),
                  const SizedBox(width: 16,),
                  ColorLegend(color: Colors.yellow.withOpacity(0.4), legend: "Not Available")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
