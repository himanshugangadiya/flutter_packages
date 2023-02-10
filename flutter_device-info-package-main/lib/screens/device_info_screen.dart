import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({Key? key}) : super(key: key);

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  AndroidDeviceInfo? androidDeviceInfo;

  Future<AndroidDeviceInfo> getInfo() async {
    return await deviceInfoPlugin.androidInfo;
  }

  Widget showCard(String name, String value) {
    return Card(
      child: ListTile(
        title: Text(
          "$name :  $value",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Device info package"),
            centerTitle: true,
          ),
          body: FutureBuilder<AndroidDeviceInfo>(
            future: getInfo(),
            builder: (context, snapshot) {
              var data = snapshot.data;
              if (snapshot.hasError) {
                return const Text('error');
              } else if (snapshot.hasData) {
                return Column(
                  children: [
                    showCard('id', data!.id.toString()),
                    showCard('device', data.device.toString()),
                    showCard('brand', data.brand.toString()),
                    showCard('display', data.display.toString()),
                    showCard('product', data.product.toString()),
                    showCard('board', data.board.toString()),
                    showCard('bootloader', data.bootloader.toString()),
                    showCard('fingerprint', data.fingerprint.toString()),
                    showCard('version', data.version.toString()),
                    showCard('hardware', data.hardware.toString()),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
