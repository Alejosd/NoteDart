library servicesNotes;

import 'package:redstone/server.dart';
import 'package:redstone/server.dart' as app;
import 'package:redstone_mapper_mongo/manager.dart';
import 'package:mongo_dart_query/mongo_dart_query.dart';
import 'package:async/async.dart';

@Group("/notas")
class NotaService {

  MongoDb get mongoDb => app.request.attributes.dbConn;

  @app.Route("/crearNotas",methods: const [app.POST])
  crearNota(@app.Body(app.JSON) Map nota) =>  mongoDb.collection("notas").insert(nota);

  @app.Route("/obtenerNotas",methods: const [app.GET])
  obtenerListadoNota()=> mongoDb.collection("notas").find().toList();

  @app.Route("/obtenerNotas/:tipo",methods: const [app.GET])
  obtenerNota(String tipo)=> mongoDb.collection("notas").find(where.eq("tipo", tipo)).toList();

  @app.Route("/actualizarNotas/:tipo",methods: const [app.PUT])
  actualizarNota(@app.Body(app.JSON) Map nota, String tipo)=> mongoDb.collection("notas").update(where.eq("tipo",tipo), nota);

  @app.Route("/eliminarNotas/:tipo",methods: const [app.DELETE])
  eliminarNota(String tipo)=> mongoDb.collection("notas").remove(where.eq("tipo",tipo));

  @app.Route("/sd")
  helloWorld() => "Rock And Roll Dart";
}