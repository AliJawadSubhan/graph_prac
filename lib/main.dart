import 'package:flutter/material.dart';
import 'package:graph_store/home/home.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();

  runApp(MyApp());
}

const stringGraphQl = """{
  products(first: 10, channel: "default-channel") {
    edges {
      node {
        id
        name
        isAvailable
        thumbnail {
          url
        }
        created
      }
    }
  }
}""";

class MyApp extends StatelessWidget {
  MyApp({super.key});
  static final HttpLink httpLink = HttpLink("https://demo.saleor.io/graphql/");

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(
        store: HiveStore(),
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home(),
      ),
    );
  }
}
