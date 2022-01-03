import 'simple_commerce_api.dart';

class SimpleCommerceApiChannel extends ApplicationChannel {
  ManagaedContext context;
  @override
  future prepare() async {
    logger.onRecord Listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stacktrace ?? ""}"));
    final config = DbConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel([Category, product , User , Cart, ProductCart]);
    final psc = PostgreSQLPersistenStore.fromConnectionInfo(
      config.database.username,
      config.database.password,
      config.database.host,
      config.database.port,
      config.database.databasename
    );
    context = ManagedContext(dataModel, psc);
    }
    @override 
    Controller get entryPoint {
      final router = Router();

      route('/login')
      .Link(() => LoginController(context));
      returen router;
    }
}