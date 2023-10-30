import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'invitation.dart';

class User extends Equatable {
	final int? id;
	final int? userId;
	final String? randomCode;
	final String? qrcode;
	final String? type;
	final String? surname;
	final String? firstName;
	final String? lastName;
	final String? email;
	final String? mobile;
	final String? answer;
	final String? wId;
	final dynamic companionFor;
	final int? companionCount;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final int? countOfSending;
	final dynamic mainGuest;
	final Invitation? invitation;

	const User({
		this.id, 
		this.userId, 
		this.randomCode, 
		this.qrcode, 
		this.type, 
		this.surname, 
		this.firstName, 
		this.lastName, 
		this.email, 
		this.mobile, 
		this.answer, 
		this.wId, 
		this.companionFor, 
		this.companionCount, 
		this.createdAt, 
		this.updatedAt, 
		this.countOfSending, 
		this.mainGuest, 
		this.invitation, 
	});

	factory User.fromMap(Map<String, dynamic> data) => User(
				id: data['id'] as int?,
				userId: data['user_id'] as int?,
				randomCode: data['random_code'] as String?,
				qrcode: data['qrcode'] as String?,
				type: data['type'] as String?,
				surname: data['surname'] as String?,
				firstName: data['first_name'] as String?,
				lastName: data['last_name'] as String?,
				email: data['email'] as String?,
				mobile: data['mobile'] as String?,
				answer: data['answer'] as String?,
				wId: data['w_id'] as String?,
				companionFor: data['companion_for'] as dynamic,
				companionCount: data['companion_count'] as int?,
				createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
				updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
				countOfSending: data['count_of_sending'] as int?,
				mainGuest: data['main_guest'] as dynamic,
				invitation: data['invitation'] == null
						? null
						: Invitation.fromMap(data['invitation'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'user_id': userId,
				'random_code': randomCode,
				'qrcode': qrcode,
				'type': type,
				'surname': surname,
				'first_name': firstName,
				'last_name': lastName,
				'email': email,
				'mobile': mobile,
				'answer': answer,
				'w_id': wId,
				'companion_for': companionFor,
				'companion_count': companionCount,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'count_of_sending': countOfSending,
				'main_guest': mainGuest,
				'invitation': invitation?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
	factory User.fromJson(String data) {
		return User.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
	String toJson() => json.encode(toMap());

	User copyWith({
		int? id,
		int? userId,
		String? randomCode,
		String? qrcode,
		String? type,
		String? surname,
		String? firstName,
		String? lastName,
		String? email,
		String? mobile,
		String? answer,
		String? wId,
		dynamic companionFor,
		int? companionCount,
		DateTime? createdAt,
		DateTime? updatedAt,
		int? countOfSending,
		dynamic mainGuest,
		Invitation? invitation,
	}) {
		return User(
			id: id ?? this.id,
			userId: userId ?? this.userId,
			randomCode: randomCode ?? this.randomCode,
			qrcode: qrcode ?? this.qrcode,
			type: type ?? this.type,
			surname: surname ?? this.surname,
			firstName: firstName ?? this.firstName,
			lastName: lastName ?? this.lastName,
			email: email ?? this.email,
			mobile: mobile ?? this.mobile,
			answer: answer ?? this.answer,
			wId: wId ?? this.wId,
			companionFor: companionFor ?? this.companionFor,
			companionCount: companionCount ?? this.companionCount,
			createdAt: createdAt ?? this.createdAt,
			updatedAt: updatedAt ?? this.updatedAt,
			countOfSending: countOfSending ?? this.countOfSending,
			mainGuest: mainGuest ?? this.mainGuest,
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
				randomCode,
				qrcode,
				type,
				surname,
				firstName,
				lastName,
				email,
				mobile,
				answer,
				wId,
				companionFor,
				companionCount,
				createdAt,
				updatedAt,
				countOfSending,
				mainGuest,
				invitation,
		];
	}
}
