class ImageConstants {
  
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._initialize();

  static final String svgPath = "assets/images/svg";

  final String emptyData = "$svgPath/empty_data.svg";

  ImageConstants._initialize();
}