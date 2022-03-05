import 'package:assignment/core/base/model/base_api_model.dart';
import 'package:flutter/material.dart';

void showApiErrorDialog(BuildContext context, BaseApiModel model) {
  var message = model.message;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(message ?? 'İnternet bağlantınızı kontrol edin.'),
        content: getValidationErrorRows(model.validationErrors ?? []),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> showCustomErrorDialog(BuildContext context, String message, Function() onPressed) {
  String textButtonText = message.contains('permission') ? 'Telefon Ayarları' : 'Konum Ayarları';
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Hata"),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: const Text('İptal'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(child: Text(textButtonText), onPressed: onPressed),
        ],
      );
    },
  );
}

SingleChildScrollView getValidationErrorRows(List<ValidationError> validationErrors) {
  List<Row> rows = [];
  for (var validationError in validationErrors) {
    rows.add(Row(
      children: <Widget>[
        Text(validationError.key ?? ''),
        Text(validationError.value ?? ''),
      ],
    ));
  }
  return SingleChildScrollView(
    child: Column(
      children: [
        const Text('Hatalı girilen alanları kontrol edin:'),
        ...rows,
      ],
    ),
  );
}
