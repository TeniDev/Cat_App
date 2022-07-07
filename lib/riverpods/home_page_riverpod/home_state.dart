import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cat_app/models/cat_model.dart';
import 'package:cat_app/services/services.dart';

part 'home_events.dart';
part 'home_model_state.dart';

final homeState = StateNotifierProvider<_HomeState, HomeModelState>(
  (ref) {
    return _HomeState(ref);
  },
);
