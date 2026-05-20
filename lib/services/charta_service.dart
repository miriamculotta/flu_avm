// ignore: unused_import
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChartaService {
  IO.Socket? _socket;

  void conectare() {
    _socket = IO.io(
      'http://158.42.169.115:3200',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .build(),
    );
    _socket!.onConnect((_) {
      _socket!.on('CLIENT JOINED', (payload) {
        // TODO: Al usuario que haya llegado lo meteré en el almacén para verlo en pantalla
      });

      _socket!.on('CLIENT LEFT', (payload) {
        // TODO: Borraré ese usuario del almacén y desaparecerá de la pantalla
      });

      _socket!.on('CLIENT MOVED', (payload) {
        // TODO: Actualizar la posición del usuario en el almacén
      });

      _socket!.on('GET_CLIENTS', (payload) {
        // TODO: Le llega la lista de clientes
      });
    });

    _socket!.connect();
  }

  void finire() {
    _socket!.disconnect();
    _socket?.dispose();
    _socket = null;
  }
}
