import 'package:haptic_feedback/haptic_feedback.dart';

class BeHaptic {
  static Future<void> onRefresh() async {
    final can = await Haptics.canVibrate();
    if (can) await Haptics.vibrate(HapticsType.selection);
  }

  static Future<void> onScan() async {
    final can = await Haptics.canVibrate();
    if (can) await Haptics.vibrate(HapticsType.heavy);
  }
}
