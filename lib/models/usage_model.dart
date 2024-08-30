class UsageModel {
  final double cpuUsage;
  final double ramUsage;

  UsageModel({required this.cpuUsage, required this.ramUsage});

  // Factory method to create UsageModel from JSON
  factory UsageModel.fromJson(Map<String, dynamic> json) {
    return UsageModel(
      cpuUsage: json['cpu_usage'],
      ramUsage: json['ram_usage'],
    );
  }
}
