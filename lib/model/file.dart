
enum Mode {
 chekIn,
 chekOut,
}
class file {
  final String id;
  final String name;
  final String Url;
  final Mode mode;

  file({required this.id,required this.name,required this.Url, required this.mode});
}
