// Copyright (c) 2015, Alejandro Sierra Duran. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:NoteDart/services/services.dart';
import 'package:redstone/server.dart' as app;
import 'package:redstone_mapper/plugin.dart';
import 'package:redstone_mapper_mongo/manager.dart';
import 'package:di/di.dart';

main() {

  var dbManager = new MongoDbManager("mongodb://localhost:27017/notas", poolSize: 3);

  app.addPlugin(getMapperPlugin(dbManager));

  app.addModule(new Module()
    ..bind(NotaService));

  app.setupConsoleLog();

  app.start();
}