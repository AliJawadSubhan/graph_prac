import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graph_store/main.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';

class Home extends StatelessWidget {
  Home({super.key});

  // String? httpRequestMethod = HttpRequestMethod('sa').thisSpecialUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE10098),
        title: Text('Graph QL'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(stringGraphQl),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading');
          }

          final List productList = result.data?['products']['edges'];

          if (productList == null) {
            return const Text('No found');
          }
          if (kDebugMode) {
            print(productList);
          }
          return ListView.builder(
            itemCount: productList.length,
            itemBuilder: (context, index) {
              DateTime parseDataOfDate =
                  DateTime.parse(productList[index]['node']['created']);
              String formattedDate =
                  DateFormat('MMM yyyy').format(parseDataOfDate);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          productList[index]['node']['thumbnail']['url'],
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          productList[index]['node']['name'],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Created At: ' + formattedDate,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(
                        color: Colors.grey.withOpacity(0.5),
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
