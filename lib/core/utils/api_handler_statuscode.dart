// utils/api_status_handler.dart
// utils/api_status_handler.dart
void handleResponseStatusCode(int statusCode) {
  switch (statusCode) {
    case 200:
      return; // OK - Request successful

    case 201:
      return; // Created - New resource successfully created

    case 202:
      return; // Accepted - Request accepted but processing later

    case 204:
      return; // No Content - Request successful but no content to return

    case 301:
      throw Exception("Moved Permanently: Resource has moved to a new URL");

    case 302:
      throw Exception("Found: Resource is temporarily located at another URL");

    case 304:
      throw Exception("Not Modified: Cached version of the resource can be used");

    case 400:
      throw Exception("Bad Request: Invalid request sent to the server");

    case 401:
      throw Exception("Unauthorized: Authentication required");

    case 403:
      throw Exception("Forbidden: Access to this resource is denied");

    case 404:
      throw Exception("Not Found: The requested resource was not found");

    case 405:
      throw Exception("Method Not Allowed: The HTTP method is not supported");

    case 408:
      throw Exception("Request Timeout: Server took too long to respond");

    case 409:
      throw Exception("Conflict: Request could not be completed due to a conflict");

    case 410:
      throw Exception("Gone: The requested resource is no longer available");

    case 415:
      throw Exception("Unsupported Media Type: Server does not support this format");

    case 429:
      throw Exception("Too Many Requests: Rate limit exceeded, try again later");

    case 500:
      throw Exception("Internal Server Error: Please try again later");

    case 501:
      throw Exception("Not Implemented: Server does not support the request");

    case 502:
      throw Exception("Bad Gateway: Invalid response from the upstream server");

    case 503:
      throw Exception("Service Unavailable: Server is temporarily unavailable");

    case 504:
      throw Exception("Gateway Timeout: The server did not receive a response in time");

    default:
      throw Exception("Unexpected Error: Status Code $statusCode");
  }
}
