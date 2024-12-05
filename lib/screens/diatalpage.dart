import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/qouets.dart';


class QuoteDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch data from ModalRoute arguments as a Quote object
    final Quote quote = ModalRoute.of(context)?.settings.arguments as Quote;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Quote Details',
          style: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quote.content,
              style: GoogleFonts.lora(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              '- ${quote.author}',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Liked at: ${quote}',
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.grey.shade500,
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Back',
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
