class ApiConfig {
  ApiConfig._();

  static const String baseUrl =
      'https://rhhrrmqaptiacdkipsvx.supabase.co/rest/v1/';

  static const Duration receiveTimeout = Duration(milliseconds: 15000);

  static const Duration connectionTimeout = Duration(milliseconds: 15000);

  static const String baseUrlAuth =
      'https://rhhrrmqaptiacdkipsvx.supabase.co/auth/v1/token?grant_type=password';

  static const String users = "users";
  static const String orders = "orders";
  static const String orderItems = "order_items";
  static const String products = "products";
  static const String favorites = "favorites";
  static const String categories = "categories";
  static const String favInfo = "fav_info";
  static const String basketInfo = "basket_info";
  static const headers = {
    //'Authorization': 'Bearer $token',
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'apikey':
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJoaHJybXFhcHRpYWNka2lwc3Z4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTI2NDU3MzgsImV4cCI6MjA2ODIyMTczOH0.nvxJ6zuF6zxw7I3O9bzBYqpIXg8Z3yV9SOrDqrDwrM0',
  };
}
