// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'about_us_why_us_bloc.dart';

class AboutUsWhyUsEvent {}

// About Us Event
class GetAboutUsEvent extends AboutUsWhyUsEvent {}

class CreateAboutUsEvent extends AboutUsWhyUsEvent {
  final String workTime;
  final String site;
  CreateAboutUsEvent({required this.workTime, required this.site});
}

class UpdateAboutUsEvent extends AboutUsWhyUsEvent {
  AboutUsEntity aboutUsEntity;
  UpdateAboutUsEvent({required this.aboutUsEntity});
}

// Why Us Events

class GetWhyUsEvent extends AboutUsWhyUsEvent {}

class CreateWhyUsEvent extends AboutUsWhyUsEvent {
  String whyUs;
  CreateWhyUsEvent({required this.whyUs});
}

class UpdateWhyUsEvent extends AboutUsWhyUsEvent {
  int whyUsId;
  String whyUs;
  UpdateWhyUsEvent({required this.whyUsId, required this.whyUs});
}

class DeleteWhyUsEvent extends AboutUsWhyUsEvent {
  int whyUsId;
  DeleteWhyUsEvent({required this.whyUsId});
}
