import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/appstate.dart';
import 'package:project_notez/logic/provider/appstate_notifier.dart';

final appstateProvider = StateNotifierProvider<AppstateNotifier, Appstate>(
  (ref) => AppstateNotifier(),
);
