import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 68,
              width: 68,
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).previousFocus();
                  }
                },
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(174, 88, 47, 254)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 68,
              width: 68,
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).previousFocus();
                  }
                },
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(174, 88, 47, 254)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 68,
              width: 68,
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).previousFocus();
                  }
                },
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(174, 88, 47, 254)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 68,
              width: 68,
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  } else {
                    FocusScope.of(context).previousFocus();
                  }
                },
                textAlign: TextAlign.center,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(174, 88, 47, 254)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
