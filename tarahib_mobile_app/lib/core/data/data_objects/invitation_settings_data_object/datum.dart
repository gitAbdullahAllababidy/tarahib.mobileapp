import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
	final num? lat;
	final num? lang;

	const Datum({this.lat, this.lang});

	factory Datum.fromMap(Map<String, dynamic> data) => Datum(
				lat: data['lat'] as num?,
				lang: data['lang'] as num?,
			);

	Map<String, dynamic> toMap() => {
				'lat': lat,
				'lang': lang,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMap());

	Datum copyWith({
		int? lat,
		int? lang,
	}) {
		return Datum(
			lat: lat ?? this.lat,
			lang: lang ?? this.lang,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [lat, lang];
}
