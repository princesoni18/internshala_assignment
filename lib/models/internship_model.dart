class InternshipModel{

final String title;
final int id;
final String stipend;
final String duration;

final String? company_name;
final bool? partTime;
final String employmentType;
final String? location;
final bool? ppo;
final String? postedDate;
final String profile;

  InternshipModel({required this.title, required this.id, required this.stipend, required this.duration, required this.company_name, required this.partTime, required this.employmentType, required this.location,required this.ppo,required this.postedDate,required this.profile});


factory InternshipModel.fromJson(Map<String, dynamic> json) {
    return InternshipModel(
      title: json['title'],
      id: json['id'],
      stipend: json['stipend']["salary"],
      duration: json['duration'],
      company_name: json['company_name'],
      partTime: json['part_time'],
      employmentType: json['employment_type'],
      location:(json["location_names"] != null && json["location_names"].isNotEmpty) ? json["location_names"][0] : null,
      ppo: json["is_ppo"],
      postedDate: json["posted_by_label"],
      profile: json["profile_name"],
          );
  }

 
  


}