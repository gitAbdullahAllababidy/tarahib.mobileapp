import 'dart:convert';

import 'package:equatable/equatable.dart';

class Datum extends Equatable {
	final double? lat;
	final double? lang;

	const Datum({this.lat, this.lang});

	factory Datum.fromMap(Map<String, dynamic> data) => Datum(
				lat: (data['lat'] as num?)?.toDouble(),
				lang: (data['lang'] as num?)?.toDouble(),
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
		double? lat,
		double? lang,
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
