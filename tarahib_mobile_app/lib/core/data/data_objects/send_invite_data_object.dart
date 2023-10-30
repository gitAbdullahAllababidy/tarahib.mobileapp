import 'dart:convert';

import 'package:equatable/equatable.dart';

class SendInviteDataObject extends Equatable {
	final String? type;
	final int? invitationSettingId;
	final String? invitationType;
	final String? surname;
	final String? firstName;
	final String? lastName;
	final String? email;
	final String? mobile;
	final int? addToContacts;
	final int? companionCount;
	final int? specialSchedule;
	final String? scheduleDate;
	final String? scheduleTime;

	const SendInviteDataObject({
		this.type, 
		this.invitationSettingId, 
		this.invitationType, 
		this.surname, 
		this.firstName, 
		this.lastName, 
		this.email, 
		this.mobile, 
		this.addToContacts, 
		this.companionCount, 
		this.specialSchedule, 
		this.scheduleDate, 
		this.scheduleTime, 
	});

	factory SendInviteDataObject.fromMap(Map<String, dynamic> data) {
		return SendInviteDataObject(
			type: data['type'] as String?,
			invitationSettingId: data['invitation_setting_id'] as int?,
			invitationType: data['invitation_type'] as String?,
			surname: data['surname'] as String?,
			firstName: data['first_name'] as String?,
			lastName: data['last_name'] as String?,
			email: data['email'] as String?,
			mobile: data['mobile'] as String?,
			addToContacts: data['add_to_contacts'] as int?,
			companionCount: data['companion_count'] as int?,
			specialSchedule: data['special_schedule'] as int?,
			scheduleDate: data['schedule_date'] as String?,
			scheduleTime: data['schedule_time'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'type': type,
				'invitation_setting_id': invitationSettingId,
				'invitation_type': invitationType,
				'surname': surname,
				'first_name': firstName,
				'last_name': lastName,
				'email': email,
				'mobile': mobile,
				'add_to_contacts': addToContacts,
				'companion_count': companionCount,
				'special_schedule': specialSchedule,
				'schedule_date': scheduleDate,
				'schedule_time': scheduleTime,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SendInviteDataObject].
	factory SendInviteDataObject.fromJson(String data) {
		return SendInviteDataObject.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [SendInviteDataObject] to a JSON string.
	String toJson() => json.encode(toMap());

	SendInviteDataObject copyWith({
		String? type,
		int? invitationSettingId,
		String? invitationType,
		String? surname,
		String? firstName,
		String? lastName,
		String? email,
		String? mobile,
		int? addToContacts,
		int? companionCount,
		int? specialSchedule,
		String? scheduleDate,
		String? scheduleTime,
	}) {
		return SendInviteDataObject(
			type: type ?? this.type,
			invitationSettingId: invitationSettingId ?? this.invitationSettingId,
			invitationType: invitationType ?? this.invitationType,
			surname: surname ?? this.surname,
			firstName: firstName ?? this.firstName,
			lastName: lastName ?? this.lastName,
			email: email ?? this.email,
			mobile: mobile ?? this.mobile,
			addToContacts: addToContacts ?? this.addToContacts,
			companionCount: companionCount ?? this.companionCount,
			specialSchedule: specialSchedule ?? this.specialSchedule,
			scheduleDate: scheduleDate ?? this.scheduleDate,
			scheduleTime: scheduleTime ?? this.scheduleTime,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				type,
				invitationSettingId,
				invitationType,
				surname,
				firstName,
				lastName,
				email,
				mobile,
				addToContacts,
				companionCount,
				specialSchedule,
				scheduleDate,
				scheduleTime,
		];
	}
}
