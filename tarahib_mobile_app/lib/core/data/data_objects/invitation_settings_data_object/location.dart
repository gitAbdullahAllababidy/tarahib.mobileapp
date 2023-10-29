import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'datum.dart';

class Location extends Equatable {
	final List<Datum>? data;

	const Location({this.data});

	factory Location.fromMap(Map<String, dynamic> data) => Location(
				data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toMap() => {
				'data': data?.map((e) => e.toMap()).toList(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Location].
	factory Location.fromJson(String data) {
		return Location.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Location] to a JSON string.
	String toJson() => json.encode(toMap());

	Location copyWith({
		List<Datum>? data,
	}) {
		return Location(
			data: data ?? this.data,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [data];
}
