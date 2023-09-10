import 'package:http/http.dart' as http;
import 'dart:convert';

/*
Future<void> fetchClinicalRecords(AnimalInfo petInfo) async {
  // Retrieve the access token from your provider
  final accessTokenProvider = Provider.of<FetchUserData>(context, listen: false);
  final authToken = accessTokenProvider.accessToken;

  const apiUrl = 'http://domusbuddies.eu:8082/api/v1/clinicalInfo/list/';

  try {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(
      Uri.parse('$apiUrl${petInfo.uniqueId}'),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        clinicalRecords = jsonData;
        isLoading = false;
      });
    } else {
      print('Failed to fetch clinical records');
      setState(() {
        isLoading = false;
      });
    }
  } catch (e) {
    print('Error fetching clinical records: $e');
    setState(() {
      isLoading = false;
    });
  }
}*/