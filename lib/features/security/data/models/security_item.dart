class SecurityItem {
  final dynamic value;
  final String label;

  const SecurityItem({
    required this.value,
    required this.label,
  });

  factory SecurityItem.fromJson(
    Map<String, dynamic> json,
  ) {
    return SecurityItem(
      value: json['value'],
      label: json['label']?.toString() ?? '',
    );
  }

  @override
  String toString() {
    return 'SecurityItem(value: $value, label: $label)';
  }
}