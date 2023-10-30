import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'location.dart';

class Invitation extends Equatable {
	final int? id;
	final int? userId;
	final dynamic eventId;
	final String? code;
	final String? randomKey;
	final String? invitationType;
	final String? invitationName;
	final String? textMen;
	final String? imgMen;
	final String? textWomen;
	final String? imgWomen;
	final int? withBarcode;
	final Location? location;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Invitation({
		this.id, 
		this.userId, 
		this.eventId, 
		this.code, 
		this.randomKey, 
		this.invitationType, 
		this.invitationName, 
		this.textMen, 
		this.imgMen, 
		this.textWomen, 
		this.imgWomen, 
		this.withBarcode, 
		this.location, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Invitation.fromMap(Map<String, dynamic> data) => Invitation(
				id: data['id'] as int?,
				userId: data['user_id'] as int?,
				eventId: data['event_id'] as dynamic,
				code: data['code'] as String?,
				randomKey: data['random_key'] as String?,
				invitationType: data['invitation_type'] as String?,
				invitationName: data['invitation_name'] as String?,
				textMen: data['text_men'] as String?,
				imgMen: data['img_men'] as String?,
				textWomen: data['text_women'] as String?,
				imgWomen: data['img_women'] as String?,
				withBarcode: data['with_barcode'] as int?,
				location: data['location'] == null
						? null
						: Location.fromMap(data['location'] as Map<String, dynamic>),
				createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
				updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'user_id': userId,
				'event_id': eventId,
				'code': code,
				'random_key': randomKey,
				'invitation_type': invitationType,
				'invitation_name': invitationName,
				'text_men': textMen,
				'img_men': imgMen,
				'text_women': textWomen,
				'img_women': imgWomen,
				'with_barcode': withBarcode,
				'location': location?.toMap(),
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Invitation].
	factory Invitation.fromJson(String data) {
		return Invitation.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Invitation] to a JSON string.
	String toJson() => json.encode(toMap());

	Invitation copyWith({
		int? id,
		int? userId,
		dynamic eventId,
		String? code,
		String? randomKey,
		String? invitationType,
		String? invitationName,
		String? textMen,
		String? imgMen,
		String? textWomen,
		String? imgWomen,
		int? withBarcode,
		Location? location,
		DateTime? createdAt,
		DateTime? updatedAt,
	}) {
		return Invitation(
			id: id ?? this.id,
			userId: userId ?? this.userId,
			eventId: eventId ?? this.eventId,
			code: code ?? this.code,
			randomKey: randomKey ?? this.randomKey,
			invitationType: invitationType ?? this.invitationType,
			invitationName: invitationName ?? this.invitationName,
			textMen: textMen ?? this.textMen,
			imgMen: imgMen ?? this.imgMen,
			textWomen: textWomen ?? this.textWomen,
			imgWomen: imgWomen ?? this.imgWomen,
			withBarcode: withBarcode ?? this.withBarcode,
			location: location ?? this.location,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				id,
				userId,
				eventId,
				code,
				randomKey,
				invitationType,
				invitationName,
				textMen,
				imgMen,
				textWomen,
				imgWomen,
				withBarcode,
				location,
				createdAt,
				updatedAt,
		];
	}
}
