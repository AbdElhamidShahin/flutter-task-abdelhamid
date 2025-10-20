import 'package:flutter/material.dart';

IconData getIconForFeature(String feature) {
  if (feature.contains("صلاحية الاعلان")) return Icons.schedule;
  if (feature.contains("رفع لأعلى")) return Icons.rocket_outlined;
  if (feature.contains("تثبيت في مقترحات")) return Icons.push_pin_outlined;
  if (feature.contains("ظهور في كل محافظات")) return Icons.public;
  if (feature.contains("اعلان مميز")) return Icons.workspace_premium;
  return Icons.check_circle_outline;
}