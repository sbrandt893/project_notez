import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_notez/backend/models/app_state.dart';
import 'package:project_notez/logic/provider/app_state_notifier.dart';

final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>(
  (ref) => AppStateNotifier(),
);
