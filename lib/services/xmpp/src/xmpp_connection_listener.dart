import 'dart:async';

import 'package:kyc3/app/globals.dart';
import 'package:xmpp_stone/xmpp_stone.dart' as xmpp;

class PMOConnectionStateChangedListener implements xmpp.ConnectionStateChangedListener {
  late xmpp.Connection _connection;
  late xmpp.MessagesListener _messagesListener;
  late StreamSubscription<String> subscription;
  final Function(xmpp.XmppConnectionState)? onConnectionStateChange;

  PMOConnectionStateChangedListener(
    xmpp.Connection connection,
    xmpp.MessagesListener messagesListener, {
    this.onConnectionStateChange,
  }) {
    _connection = connection;
    _messagesListener = messagesListener;
    _connection.connectionStateStream.listen(onConnectionStateChanged);
  }

  @override
  void onConnectionStateChanged(xmpp.XmppConnectionState state) {
    switch (state) {
      case xmpp.XmppConnectionState.SocketOpened:
      case xmpp.XmppConnectionState.Authenticated:
      case xmpp.XmppConnectionState.AuthenticationFailure:
      case xmpp.XmppConnectionState.Closed:
        onConnectionStateChange?.call(state);
        break;
      case xmpp.XmppConnectionState.Ready:
        onConnectionStateChange?.call(state);
        final messageHandler = xmpp.MessageHandler.getInstance(_connection);
        messageHandler.messagesStream.listen(_messagesListener.onNewMessage);
        final presenceManager = xmpp.PresenceManager.getInstance(_connection);
        presenceManager.presenceStream.listen(onPresence);
        break;
    }
  }

  void onPresence(xmpp.PresenceData event) {
    showLogXmpp('presence Event from ' + event.jid!.fullJid! + ' PRESENCE: ' + event.showElement.toString());
  }
}
