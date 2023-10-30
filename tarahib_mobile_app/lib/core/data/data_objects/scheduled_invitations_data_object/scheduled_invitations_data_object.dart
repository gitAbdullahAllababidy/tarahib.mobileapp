import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'invitation.dart';

class ScheduledInvitationsDataObject extends Equatable {
	final int? id;
	final int? userId;
	final String? type;
	final String? surname;
	final String? firstName;
	final String? lastName;
	final String? email;
	final String? mobile;
	final String? sendTime;
	final int? isSend;
	final int? companionCount;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final Invitation? invitation;

	const ScheduledInvitationsDataObject({
		this.id, 
		this.userId, 
		this.type, 
		this.surname, 
		this.firstName, 
		this.lastName, 
		this.email, 
		this.mobile, 
		this.sendTime, 
		this.isSend, 
		this.companionCount, 
		this.createdAt, 
		this.updatedAt, 
		this.invitation, 
	});

	factory ScheduledInvitationsDataObject.fromMap(Map<String, dynamic> data) {
		return ScheduledInvitationsDataObject(
			id: data['id'] as int?,
			userId: data['user_id'] as int?,
			type: data['type'] as String?,
			surname: data['surname'] as String?,
			firstName: data['first_name'] as String?,
			lastName: data['last_name'] as String?,
			email: data['email'] as String?,
			mobile: data['mobile'] as String?,
			sendTime: data['send_time'] as String?,
			isSend: data['is_send'] as int?,
			companionCount: data['companion_count'] as int?,
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
			invitation: data['invitation'] == null
						? null
						: Invitation.fromMap(data['invitation'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toMap() => {
				'id': id,
				'user_id': userId,
				'type': type,
				'surname': surname,
				'first_name': firstName,
				'last_name': lastName,
				'email': email,
				'mobile': mobile,
				'send_time': sendTime,
				'is_send': isSend,
				'companion_count': companionCount,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'invitation': invitation?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ScheduledInvitationsDataObject].
	factory ScheduledInvitationsDataObject.fromJson(String data) {
		return ScheduledInvitationsDataObject.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [ScheduledInvitationsDataObject] to a JSON string.
	String toJson() => json.encode(toMap());

	ScheduledInvitationsDataObject copyWith({
		int? id,
		int? userId,
		String? type,
		String? surname,
		String? firstName,
		String? lastName,
		String? email,
		String? mobile,
		String? sendTime,
		int? isSend,
		int? companionCount,
		DateTime? createdAt,
		DateTime? updatedAt,
		Invitation? invitation,
	}) {
		return ScheduledInvitationsDataObject(
			id: id ?? this.id,
			userId: userId ?? this.userId,
			type: type ?? this.type,
			surname: surname ?? this.surname,
			firstName: firstName ?? this.firstName,
			lastName: lastName ?? this.lastName,
			email: email ?? this.email,
			mobile: mobile ?? this.mobile,
			sendTime: sendTime ?? this.sendTime,
			isSend: isSend ?? this.isSend,
			companionCount: companionCount ?? this.companionCount,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
			invitation: invitation ?? this.invitation,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				id,
				userId,
				type,
				surname,
				firstName,
				lastName,
				email,
				mobile,
				sendTime,
				isSend,
				companionCount,
				createdAt,
				updatedAt,
				invitation,
		];
	}
}
