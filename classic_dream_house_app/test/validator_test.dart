
import 'package:classic_cream_couse/shared_widgets/inputField.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('test for empty input function', ()  {
    var res = InputFieldValidator.validate("");
    expect(res, "Feltet må ikke være tomt");

  });

  test('test for non empty input', ()  {
    var res = InputFieldValidator.validate("not empty");
    expect(res, null);

  });
}