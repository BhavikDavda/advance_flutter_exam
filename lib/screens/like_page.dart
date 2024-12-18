import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/apiprovider.dart';

class LikedQuotesPage extends StatefulWidget {
  @override
  _LikedQuotesPageState createState() => _LikedQuotesPageState();
}

class _LikedQuotesPageState extends State<LikedQuotesPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadQuotes();
  }

  Future<void> _loadQuotes() async {
    final provider = Provider.of<QuotesProvider>(context, listen: false);
    await provider.loadLikedQuotes(); // Load quotes
    setState(() {
      _isLoading = false; // Update UI when done
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuotesProvider>(context);
    final likedQuotes = provider.likedQuotes;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: Text(
          'Liked Quotes',
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
      body: _isLoading
          ? Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
        ),
      )
          : likedQuotes.isEmpty
          ? Center(
        child: Text(
          'No liked quotes yet!',
          style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade700,
          ),
        ),
      )
          : ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: likedQuotes.length,
        itemBuilder: (context, index) {
          final quote = likedQuotes[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5.0,
            shadowColor: Colors.purple.shade100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    quote['content'] ?? 'No Content',
                    style: GoogleFonts.lora(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    '- ${quote['author'] ?? 'Unknown'}',
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Liked at: ${quote['likedAt'] ?? 'Unknown'}',
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.redAccent,
                      ),
                      onPressed: () =>
                          provider.removeLikedQuote(quote['id'] ?? ''),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
