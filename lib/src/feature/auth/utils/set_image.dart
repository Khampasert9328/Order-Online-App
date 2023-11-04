import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  ImageSource source;

  AppImagePicker({this.source = ImageSource.camera}); // Provide a default value

  Future<void> pick({required Function(XFile?) onPick}) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: source);
    onPick(image != null ? XFile(image.path) : null);
  }
}
