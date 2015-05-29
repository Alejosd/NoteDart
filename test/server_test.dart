import 'package:unittest/unittest.dart';

import 'package:redstone/server.dart' as app;
import 'package:redstone/mocks.dart';



main() {

  //load handlers in 'services' library
 setUp(() => app.setUp([#servicesNotes]));

  //remove all loaded handlers
  tearDown(() => app.tearDown());

  test("Test service GET /notas/sd", () {
    //create a mock request
    var req = new MockRequest("/notas/sd");
    //dispatch the request
    return app.dispatch(req).then((resp) {
      //verify the response
      expect(resp.statusCode, equals(200));
      expect(resp.mockContent, equals("Rock And Roll Dart"));
    });
  });


}