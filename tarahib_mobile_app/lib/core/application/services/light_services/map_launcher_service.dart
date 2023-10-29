import 'package:map_launcher/map_launcher.dart';

final class MapLauncherService {
  static run({
    required Coords coords,
    required String title,
    String? description,
    int? zoom,
    Map<String, String>? extraParams,
  }) async {
    if (await MapLauncher.isMapAvailable(MapType.google) ?? false) {
      return await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: coords,
        title: title,
        zoom: zoom,
        description: description,
      );
    }

    if (await MapLauncher.isMapAvailable(MapType.apple) ?? false) {
      return await MapLauncher.showMarker(
        mapType: MapType.apple,
        coords: coords,
        title: title,
        description: description,
      );
    }
  }
}
