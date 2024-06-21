import 'package:campmart/features/auth/domain/entity/auth_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_current_user_dto.g.dart';

@JsonSerializable()
class GetCurrentUserDto {
  @JsonKey(name:"_id")
  final String id;
  final String name;
  final String username;

  final String email;
  final String password;




  GetCurrentUserDto({
    required this.id,
    required this.name,
    required this.username,

    required this.email,
    required this.password,
    
  });

  AuthEntity toEntity() {
    return AuthEntity(
        id: id,
        name: name,
        email: email,
        // lname: lname,
        // image: image,
        // phone: phone,
        // batch: BatchEntity(batchId: id, batchName: ''),
        // courses:  course.map((course) {
        //   return CourseEntity( courseId: course, courseName: '');
        // }).toList() ,
        username: username,
        password: '');
  }

  factory GetCurrentUserDto.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentUserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GetCurrentUserDtoToJson(this);
}
