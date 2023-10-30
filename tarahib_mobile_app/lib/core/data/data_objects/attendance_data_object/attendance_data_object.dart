import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'invitation.dart';
import 'user.dart';

class AttendanceDataObject extends Equatable {
	final int? id;
	final int? userId;
	final int? invitationSettingId;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final Invitation? invitation;
	final User? user;

	const AttendanceDataObject({
		this.id, 
		this.userId, 
		this.invitationSettingId, 
		this.createdAt, 
		this.updatedAt, 
		this.invitation, 
		this.user, 
	});

	factory AttendanceDataObject.fromMap(Map<String, dynamic> data) {
		return AttendanceDataObject(
			id: data['id'] as int?,
			userId: data['user_id'] as int?,
			invitationSettingId: data['invitation_setting_id'] as int?,
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
			invitation: data['invitation'] == null
						? null
						: Invitation.fromMap(data['invitation'] as Map<String, dynamic>),
			user: data['user'] == null
						? null
						: User.fromMap(data['user'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toMap() => {
				'id': id,
				'user_id': userId,
				'invitation_setting_id': invitationSettingId,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'invitation': invitation?.toMap(),
				'user': user?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AttendanceDataObject].
	factory AttendanceDataObject.fromJson(String data) {
		return AttendanceDataObject.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [AttendanceDataObject] to a JSON string.
	String toJson() => json.encode(toMap());

	AttendanceDataObject copyWith({
		int? id,
		int? userId,
		int? invitationSettingId,
		DateTime? createdAt,
		DateTime? updatedAt,
		Invitation? invitation,
		User? user,
	}) {
		return AttendanceDataObject(
			id: id ?? this.id,
			userId: userId ?? this.userId,
			invitationSettingId: invitationSettingId ?? this.invitationSettingId,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
			invitation: invitation ?? this.invitation,
			user: user ?? this.user,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				id,
				userId,
				invitationSettingId,
				createdAt,
				updatedAt,
				invitation,
				user,
		];
	}
}
