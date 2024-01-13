import 'dart:io';

Future checkinternet() async {
  try {
    var ruslt = await InternetAddress.lookup("google.com");
    if (ruslt.isNotEmpty && ruslt[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException {
    return false;
  }
}
