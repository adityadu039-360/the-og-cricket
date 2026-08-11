class SponsorConfig {
  final String companyName;
  final String? logoPath;
  final bool enabled;

  const SponsorConfig({
    required this.companyName,
    this.logoPath,
    this.enabled = false,
  });

  static const SponsorConfig empty = SponsorConfig(
    companyName: 'Sponsored by',
    enabled: false,
  );

  SponsorConfig copyWith({
    String? companyName,
    String? logoPath,
    bool? enabled,
  }) {
    return SponsorConfig(
      companyName: companyName ?? this.companyName,
      logoPath: logoPath ?? this.logoPath,
      enabled: enabled ?? this.enabled,
    );
  }
}