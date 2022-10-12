import 'package:ecommerce/Api/api_client.dart';
import 'package:ecommerce/common/common_text.dart';
import 'package:ecommerce/common/global.dart';
import 'package:ecommerce/model/sweeppstakes_response.dart' as swl;
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../../common/Utils/api_util.dart';
import '../../common/widgets/form_field/text_form_field.dart';

class SweepsTakesPage extends StatefulWidget {
  const SweepsTakesPage({Key? key}) : super(key: key);

  @override
  State<SweepsTakesPage> createState() => _SweepsTakesPageState();
}

class _SweepsTakesPageState extends State<SweepsTakesPage> {
  Stream<List<swl.Datum>> get getList => _getList.stream;
  final _getList = BehaviorSubject<List<swl.Datum>>();
  @override
  void dispose() {
    super.dispose();
    _getList.close();
  }

  @override
  void initState() {
    super.initState();
    getSweepstakesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30),
          color: Colors.blue.shade800,
          child: Column(children: [
            const ListTile(
              leading: Icon(Icons.menu),
              title: Center(
                child: Text(
                  titile,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              trailing: Icon(Icons.search),
            ),
            CustomTextFormField(
              backgroundColor: Colors.grey.shade200,
              hintText: dateTimeText,
              keyboardType: TextInputType.datetime,
              onChanged: (val) {},
              prefixIcon: const Icon(Icons.date_range),
              suffixIcon: Icon(
                Icons.filter_1,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text("Destination Zip Code:"),
                  TextButton(onPressed: () {}, child: const Text("25949"))
                ],
              ),
              TextButton(onPressed: () {}, child: const Text("25949"))
            ],
          ),
        ),
        StreamBuilder<List<swl.Datum>>(
            stream: getList,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                List<swl.Datum> data = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return sweepStakesListCard(data[index]);
                    },
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            })
      ],
    ));
  }

  Widget sweepStakesListCard(swl.Datum data) {
    return Card(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.note),
                title: Text("Id :${data.id}"),
              ),
              ListTile(
                  title: Text(
                    data.name!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                      color: Colors.blue.shade700,
                      height: 50,
                      width: 50,
                      child: const Icon(Icons.phone)),
                  subtitle: Text(
                    "${data.address!}, ${data.state!}",
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  )),
              Container(
                color: Colors.grey.shade200,
                child: Row(
                  children: [
                    Chip(
                      backgroundColor: Colors.green.shade400,
                      label: Text("Status".toUpperCase()),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: const Text(
                          "Dispatched",
                          style: TextStyle(fontSize: 15),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void getSweepstakesList() async {
    ApiUtil api = ApiUtilWrapper();
    String token = "Bearer ${Global.getInstance().token}";
    final commonResponse = await api.getSweepstakesList(token);
    print(commonResponse);
    if (commonResponse != null) {
      _getList.sink.add(commonResponse.data!);
    }
  }
}
