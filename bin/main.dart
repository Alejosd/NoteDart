// Copyright (c) 2015, Alejandro Sierra Duran. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:NoteDart/NoteDart.dart' as NoteDart;
import 'package:redstone/server.dart' as app;

@app.Route("/")
helloWorld() => "Hello, World!";

main() {
  app.setupConsoleLog();
  app.start();
}