import 'dart:convert';

import 'package:equatable/equatable.dart';

class ContactSendInvitationDataObject extends Equatable {
	final String? type;
	final List<int>? contacts;
	final int? invitationSettingId;
	final String? invitationType;
	final int? specialSchedule;
	final String? scheduleDate;
	final String? scheduleTime;

	const ContactSendInvitationDataObject({
		this.type, 
		this.contacts, 
		this.invitationSettingId, 
		this.invitationType, 
		this.specialSchedule, 
		this.scheduleDate, 
		this.scheduleTime, 
	});

	factory ContactSendInvitationDataObject.fromMap(Map<String, dynamic> data) {
		return ContactSendInvitationDataObject(
			type: data['type'] as String?,
			contacts: data['contacts'] as List<int>?,
			invitationSettingId: data['invitation_setting_id'] as int?,
			invitationType: data['invitation_type'] as String?,
			specialSchedule: data['special_schedule'] as int?,
			scheduleDate: data['schedule_date'] as String?,
			scheduleTime: data['schedule_time'] as String?,
		);
	}



	Map<String, dynamic> toMap() => {
				'type': type,
				'contacts': contacts,
				'invitation_setting_id': invitationSettingId,
				'invitation_type': invitationType,
				'special_schedule': specialSchedule,
				'schedule_date': scheduleDate,
				'schedule_time': scheduleTime,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ContactSendInvitationDataObject].
	factory ContactSendInvitationDataObject.fromJson(String data) {
		return ContactSendInvitationDataObject.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [ContactSendInvitationDataObject] to a JSON string.
	String toJson() => json.encode(toMap());

	ContactSendInvitationDataObject copyWith({
		String? type,
		List<int>? contacts,
		int? invitationSettingId,
		String? invitationType,
		int? specialSchedule,
		String? scheduleDate,
		String? scheduleTime,
	}) {
		return ContactSendInvitationDataObject(
			type: type ?? this.type,
			contacts: contacts ?? this.contacts,
			invitationSettingId: invitationSettingId ?? this.invitationSettingId,
			invitationType: invitationType ?? this.invitationType,
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
				contacts,
				invitationSettingId,
				invitationType,
				specialSchedule,
				scheduleDate,
				scheduleTime,
		];
	}
}
