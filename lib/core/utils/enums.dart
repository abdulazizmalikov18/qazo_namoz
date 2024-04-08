// ignore_for_file: constant_identifier_names

enum SearchesTypeEnum {
  magazine('magazine'),
  vacancy('vacancy'),
  announcement('announcement');

  const SearchesTypeEnum(this.value);

  final String value;
}

enum ComplainEnum {
  lies_and_deception('lies_and_deception'),
  illegal_actions('illegal_actions'),
  violent_and_gruesome_content('violent_and_gruesome_content'),
  dangerous_actions('dangerous_actions'),
  delete('delete');

  const ComplainEnum(this.value);

  final String value;
}

enum ModerationStatusEnum {
  //pending, approved, rejected
  pending('pending'),
  approved('approved'),
  rejected('rejected');

  const ModerationStatusEnum(this.value);

  final String value;
}
