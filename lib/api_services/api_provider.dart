import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiProvider extends ChangeNotifier {
  final String baseUrl;
  final http.Client httpClient;
  late Future<String?> authToken;

  ApiProvider({
    required this.baseUrl,
    required this.httpClient,
  }) {
    // initializeAuthToken();
  }

  // Future<void> initializeAuthToken() async {
  //   authToken = ApiUtils.getAuthToken();
  // }

  Future<http.Response> getRequest(String endpoint,
      {Map<String, String>? headers}) async {
    // final String? token = await ApiUtils.getAuthToken();
    final Uri uri = Uri.parse('$baseUrl$endpoint');
    final Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json'
      // 'Authorization': 'Bearer $token',
    };

    print("$baseUrl$endpoint");
    // print(token);

    final Map<String, String> finalHeaders =
        headers != null ? {...defaultHeaders, ...headers} : defaultHeaders;

    final response = await httpClient.get(uri, headers: finalHeaders);

    print(response.body);

    return response;
  }

  Future<http.Response> postRequest(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool includeBearerToken = false,
  }) async {
    final Uri uri = Uri.parse('$baseUrl$endpoint');
    final Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json',
    };

    print("$baseUrl$endpoint");
    Map<String, String> finalHeaders =
        headers != null ? {...defaultHeaders, ...headers} : defaultHeaders;

    // if (includeBearerToken) {
    //   final String? token = await ApiUtils.getAuthToken();

    //   print("coming to includeBearerToken $token");
    //   if (token != null) {
    //     finalHeaders['Authorization'] = 'Bearer $token';
    //   }
    // }

    final String jsonBody = body != null ? json.encode(body) : '';

    final response =
        await httpClient.post(uri, headers: finalHeaders, body: jsonBody);
    log("requesttt ${response.headers.toString()}");

    return response;
  }

  Future<http.Response> putRequest(
    String endpoint, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    bool includeBearerToken = false,
  }) async {
    final Uri uri = Uri.parse('$baseUrl$endpoint');
    final Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json',
    };

    print("$baseUrl$endpoint");
    Map<String, String> finalHeaders =
        headers != null ? {...defaultHeaders, ...headers} : defaultHeaders;

    // if (includeBearerToken) {
    //   final String? token = await ApiUtils.getAuthToken();

    //   print("coming to includeBearerToken $token");
    //   if (token != null) {
    //     finalHeaders['Authorization'] = 'Bearer $token';
    //   }
    // }

    final String jsonBody = body != null ? json.encode(body) : '';

    final response =
        await httpClient.put(uri, headers: finalHeaders, body: jsonBody);
    log("requesttt ${response.headers.toString()}");

    return response;
  }

  Future<http.Response> deleteRequest(
    String endpoint, {
    Map<String, String>? headers,
    bool includeBearerToken = false,
  }) async {
    final Uri uri = Uri.parse('$baseUrl$endpoint');
    final Map<String, String> defaultHeaders = {
      'Content-Type': 'application/json',
    };

    Map<String, String> finalHeaders =
        headers != null ? {...defaultHeaders, ...headers} : defaultHeaders;

    // if (includeBearerToken) {
    //   final String? token = await ApiUtils.getAuthToken();
    //   print("coming to includeBearerToken $token");
    //   if (token != null) {
    //     finalHeaders['Authorization'] = 'Bearer $token';
    //   }
    // }

    final response = await httpClient.delete(uri, headers: finalHeaders);

    print(response.body);

    return response;
  }

  // Future<http.Response> postMultiPartRequest(
  //   String endpoint, {
  //   Map<String, String>? headers,
  //   File? eventFile,
  //   List<File>? videos,
  //   File? profilePhoto,
  //   List<int>? pdfBytes,
  //   List<File>? photos,
  //   required Map<String, String> body,
  //   bool includeBearerToken = true,
  // }) async {
  //   final Uri uri = Uri.parse('$baseUrl$endpoint');
  //   final Map<String, String> defaultHeaders = {
  //     'Content-Type': 'application/json',
  //   };

  //   Map<String, String> finalHeaders =
  //       headers != null ? {...defaultHeaders, ...headers} : defaultHeaders;

  //   if (includeBearerToken) {
  //     final String? token = await ApiUtils.getAuthToken();
  //     print("coming to includeBearerToken $token");
  //     if (token != null) {
  //       finalHeaders['Authorization'] = 'Bearer $token';
  //       print("uri is $uri");
  //     }
  //   }
  //   print("finalHeaders: $finalHeaders");
  //   print("Body : $body");

  //   final request = http.MultipartRequest('POST', uri)
  //     ..headers.addAll(finalHeaders)
  //     ..fields.addAll(body);

  //   if (eventFile != null) {
  //     final file =
  //         await http.MultipartFile.fromPath('event_file', eventFile.path);
  //     request.files.add(file);
  //     print("file is $file");
  //   }

  //   if (pdfBytes != null) {
  //     final pdfFile = http.MultipartFile.fromBytes(
  //       'files',
  //       pdfBytes,
  //       filename: 'document.pdf',
  //     );
  //     request.files.add(pdfFile);
  //   }
  //   if (profilePhoto != null) {
  //     final file =
  //         await http.MultipartFile.fromPath('photo', profilePhoto.path);
  //     request.files.add(file);
  //     print("file is $file");
  //   }
  //   if (photos != null) {
  //     for (var i = 0; i < photos.length; i++) {
  //       final file =
  //           await http.MultipartFile.fromPath('photos', photos[i].path);
  //       request.files.add(file);
  //     }
  //   }
  //   if (videos != null) {
  //     for (var i = 0; i < videos.length; i++) {
  //       final file =
  //           await http.MultipartFile.fromPath('vedios', videos[i].path);
  //       request.files.add(file);
  //       print("video file is $file");
  //     }
  //   }

  //   print('${request.fields}' '${request.files}' "Heelo");

  //   final response = await request.send();

  //   if (response.statusCode == 401) {
  //     final completer = Completer<http.Response>();
  //     _requestQueue.add(completer);

  //     // Ensure that _refreshTokenAndRetryRequests handles resolving/rejecting the completer.

  //     _isRefreshingToken = true;
  //     await _refreshTokenAndRetryRequests(); // Await for token refresh.

  //     return completer.future;
  //   } else {
  //     final dataResponse = await response.stream.bytesToString();
  //     return http.Response(dataResponse, response.statusCode);
  //   }
  // }
}
