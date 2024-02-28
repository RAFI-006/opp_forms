import 'dart:convert';

class OppDataModel {
  AtedAt? createdAt;
  String? status;
  String? type;
  String? riskLevel;
  String? name;
  AtedAt? updatedAt;
  Portfolio? portfolio;
  List<String>? isins;
  Benchmark? returns;
  Benchmark? benchmark;
  String? icon;
  int? minimumInitial;
  int? minimumSip;
  String? description;
  String? recommendedDuration;
  Content? content;
  List<String>? recommendations;

  OppDataModel({
    this.createdAt,
    this.status,
    this.type,
    this.riskLevel,
    this.name,
    this.updatedAt,
    this.portfolio,
    this.isins,
    this.returns,
    this.benchmark,
    this.icon,
    this.minimumInitial,
    this.minimumSip,
    this.description,
    this.recommendedDuration,
    this.content,
    this.recommendations,
  });

  factory OppDataModel.fromJson(String str) =>
      OppDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OppDataModel.fromMap(Map<String, dynamic> json) => OppDataModel(
        createdAt: json["createdAt"] == null
            ? null
            : AtedAt.fromMap(json["createdAt"]),
        status: json["status"],
        type: json["type"],
        riskLevel: json["riskLevel"],
        name: json["name"],
        updatedAt: json["updatedAt"] == null
            ? null
            : AtedAt.fromMap(json["updatedAt"]),
        portfolio: json["portfolio"] == null
            ? null
            : Portfolio.fromMap(json["portfolio"]),
        isins: json["isins"] == null
            ? []
            : List<String>.from(json["isins"]!.map((x) => x)),
        returns:
            json["returns"] == null ? null : Benchmark.fromMap(json["returns"]),
        benchmark: json["benchmark"] == null
            ? null
            : Benchmark.fromMap(json["benchmark"]),
        icon: json["icon"],
        minimumInitial: json["minimumInitial"],
        minimumSip: json["minimumSIP"],
        description: json["description"],
        recommendedDuration: json["recommendedDuration"],
        content:
            json["content"] == null ? null : Content.fromMap(json["content"]),
        recommendations: json["recommendations"] == null
            ? []
            : List<String>.from(json["recommendations"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "createdAt": createdAt?.toMap(),
        "status": status,
        "type": type,
        "riskLevel": riskLevel,
        "name": name,
        "updatedAt": updatedAt?.toMap(),
        "portfolio": portfolio?.toMap(),
        "isins": isins == null ? [] : List<dynamic>.from(isins!.map((x) => x)),
        "returns": returns?.toMap(),
        "benchmark": benchmark?.toMap(),
        "icon": icon,
        "minimumInitial": minimumInitial,
        "minimumSIP": minimumSip,
        "description": description,
        "recommendedDuration": recommendedDuration,
        "content": content?.toMap(),
        "recommendations": recommendations == null
            ? []
            : List<dynamic>.from(recommendations!.map((x) => x)),
      };
}

class Benchmark {
  double? the1Y;
  double? the3Y;
  double? the5Y;
  dynamic the7Y;
  dynamic the10Y;

  Benchmark({
    this.the1Y,
    this.the3Y,
    this.the5Y,
    this.the7Y,
    this.the10Y,
  });

  factory Benchmark.fromJson(String str) => Benchmark.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Benchmark.fromMap(Map<String, dynamic> json) => Benchmark(
        the1Y: json["1Y"]?.toDouble(),
        the3Y: json["3Y"]?.toDouble(),
        the5Y: json["5Y"]?.toDouble(),
        the7Y: json["7Y"],
        the10Y: json["10Y"],
      );

  Map<String, dynamic> toMap() => {
        "1Y": the1Y,
        "3Y": the3Y,
        "5Y": the5Y,
        "7Y": the7Y,
        "10Y": the10Y,
      };
}

class Content {
  Header? header;
  String? description;
  List<InvestmentStrategy>? investmentStrategies;
  HistoricalReturns? performance;
  List<InvestmentFocus>? investmentFocus;
  HistoricalReturns? historicalReturns;
  AboutOpportunityStack? aboutOpportunityStack;

  Content({
    this.header,
    this.description,
    this.investmentStrategies,
    this.performance,
    this.investmentFocus,
    this.historicalReturns,
    this.aboutOpportunityStack,
  });

  factory Content.fromJson(String str) => Content.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Content.fromMap(Map<String, dynamic> json) => Content(
        header: json["header"] == null ? null : Header.fromMap(json["header"]),
        description: json["description"],
        investmentStrategies: json["investmentStrategies"] == null
            ? []
            : List<InvestmentStrategy>.from(json["investmentStrategies"]!
                .map((x) => InvestmentStrategy.fromMap(x))),
        performance: json["performance"] == null
            ? null
            : HistoricalReturns.fromMap(json["performance"]),
        investmentFocus: json["investmentFocus"] == null
            ? []
            : List<InvestmentFocus>.from(json["investmentFocus"]!
                .map((x) => InvestmentFocus.fromMap(x))),
        historicalReturns: json["historicalReturns"] == null
            ? null
            : HistoricalReturns.fromMap(json["historicalReturns"]),
        aboutOpportunityStack: json["aboutOpportunityStack"] == null
            ? null
            : AboutOpportunityStack.fromMap(json["aboutOpportunityStack"]),
      );

  Map<String, dynamic> toMap() => {
        "header": header?.toMap(),
        "description": description,
        "investmentStrategies": investmentStrategies == null
            ? []
            : List<dynamic>.from(investmentStrategies!.map((x) => x.toMap())),
        "performance": performance?.toMap(),
        "investmentFocus": investmentFocus == null
            ? []
            : List<dynamic>.from(investmentFocus!.map((x) => x.toMap())),
        "historicalReturns": historicalReturns?.toMap(),
        "aboutOpportunityStack": aboutOpportunityStack?.toMap(),
      };
}

class AboutOpportunityStack {
  PreferredInvestorDetails? preferredInvestorDetails;
  RiskAssessmentDetails? riskAssessmentDetails;
  KeyDetails? keyDetails;

  AboutOpportunityStack({
    this.preferredInvestorDetails,
    this.riskAssessmentDetails,
    this.keyDetails,
  });

  factory AboutOpportunityStack.fromJson(String str) =>
      AboutOpportunityStack.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AboutOpportunityStack.fromMap(Map<String, dynamic> json) =>
      AboutOpportunityStack(
        preferredInvestorDetails: json["preferredInvestorDetails"] == null
            ? null
            : PreferredInvestorDetails.fromMap(
                json["preferredInvestorDetails"]),
        riskAssessmentDetails: json["riskAssessmentDetails"] == null
            ? null
            : RiskAssessmentDetails.fromMap(json["riskAssessmentDetails"]),
        keyDetails: json["keyDetails"] == null
            ? null
            : KeyDetails.fromMap(json["keyDetails"]),
      );

  Map<String, dynamic> toMap() => {
        "preferredInvestorDetails": preferredInvestorDetails?.toMap(),
        "riskAssessmentDetails": riskAssessmentDetails?.toMap(),
        "keyDetails": keyDetails?.toMap(),
      };
}

class KeyDetails {
  FeeStructure? feeStructure;

  KeyDetails({
    this.feeStructure,
  });

  factory KeyDetails.fromJson(String str) =>
      KeyDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KeyDetails.fromMap(Map<String, dynamic> json) => KeyDetails(
        feeStructure: json["feeStructure"] == null
            ? null
            : FeeStructure.fromMap(json["feeStructure"]),
      );

  Map<String, dynamic> toMap() => {
        "feeStructure": feeStructure?.toMap(),
      };
}

class FeeStructure {
  Amc? stack;
  Amc? amc;

  FeeStructure({
    this.stack,
    this.amc,
  });

  factory FeeStructure.fromJson(String str) =>
      FeeStructure.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeeStructure.fromMap(Map<String, dynamic> json) => FeeStructure(
        stack: json["stack"] == null ? null : Amc.fromMap(json["stack"]),
        amc: json["amc"] == null ? null : Amc.fromMap(json["amc"]),
      );

  Map<String, dynamic> toMap() => {
        "stack": stack?.toMap(),
        "amc": amc?.toMap(),
      };
}

class Amc {
  double? upperBound;
  double? lowerBound;

  Amc({
    this.upperBound,
    this.lowerBound,
  });

  factory Amc.fromJson(String str) => Amc.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Amc.fromMap(Map<String, dynamic> json) => Amc(
        upperBound: json["upperBound"]?.toDouble(),
        lowerBound: json["lowerBound"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "upperBound": upperBound,
        "lowerBound": lowerBound,
      };
}

class PreferredInvestorDetails {
  String? description;
  String? riskQuadrantGraphUrl;
  String? riskProfile;
  String? age;
  String? investmentHorizon;
  String? returnExpectation;
  List<String>? idealFinancialGoals;

  PreferredInvestorDetails({
    this.description,
    this.riskQuadrantGraphUrl,
    this.riskProfile,
    this.age,
    this.investmentHorizon,
    this.returnExpectation,
    this.idealFinancialGoals,
  });

  factory PreferredInvestorDetails.fromJson(String str) =>
      PreferredInvestorDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PreferredInvestorDetails.fromMap(Map<String, dynamic> json) =>
      PreferredInvestorDetails(
        description: json["description"],
        riskQuadrantGraphUrl: json["riskQuadrantGraphUrl"],
        riskProfile: json["riskProfile"],
        age: json["age"],
        investmentHorizon: json["investmentHorizon"],
        returnExpectation: json["returnExpectation"],
        idealFinancialGoals: json["idealFinancialGoals"] == null
            ? []
            : List<String>.from(json["idealFinancialGoals"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "description": description,
        "riskQuadrantGraphUrl": riskQuadrantGraphUrl,
        "riskProfile": riskProfile,
        "age": age,
        "investmentHorizon": investmentHorizon,
        "returnExpectation": returnExpectation,
        "idealFinancialGoals": idealFinancialGoals == null
            ? []
            : List<dynamic>.from(idealFinancialGoals!.map((x) => x)),
      };
}

class RiskAssessmentDetails {
  List<String>? pros;
  List<String>? cons;

  RiskAssessmentDetails({
    this.pros,
    this.cons,
  });

  factory RiskAssessmentDetails.fromJson(String str) =>
      RiskAssessmentDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RiskAssessmentDetails.fromMap(Map<String, dynamic> json) =>
      RiskAssessmentDetails(
        pros: json["pros"] == null
            ? []
            : List<String>.from(json["pros"]!.map((x) => x)),
        cons: json["cons"] == null
            ? []
            : List<String>.from(json["cons"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "pros": pros == null ? [] : List<dynamic>.from(pros!.map((x) => x)),
        "cons": cons == null ? [] : List<dynamic>.from(cons!.map((x) => x)),
      };
}

class Header {
  String? title;
  String? imageUrl;
  String? videoUrl;

  Header({
    this.title,
    this.imageUrl,
    this.videoUrl,
  });

  factory Header.fromJson(String str) => Header.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Header.fromMap(Map<String, dynamic> json) => Header(
        title: json["title"],
        imageUrl: json["imageUrl"],
        videoUrl: json["videoUrl"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "imageUrl": imageUrl,
        "videoUrl": videoUrl,
      };
}

class HistoricalReturns {
  String? graphImageUrl;

  HistoricalReturns({
    this.graphImageUrl,
  });

  factory HistoricalReturns.fromJson(String str) =>
      HistoricalReturns.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HistoricalReturns.fromMap(Map<String, dynamic> json) =>
      HistoricalReturns(
        graphImageUrl: json["graphImageUrl"],
      );

  Map<String, dynamic> toMap() => {
        "graphImageUrl": graphImageUrl,
      };
}

class InvestmentFocus {
  String? iconUrl;
  String? description;

  InvestmentFocus({
    this.iconUrl,
    this.description,
  });

  factory InvestmentFocus.fromJson(String str) =>
      InvestmentFocus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InvestmentFocus.fromMap(Map<String, dynamic> json) => InvestmentFocus(
        iconUrl: json["iconUrl"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "iconUrl": iconUrl,
        "description": description,
      };
}

class InvestmentStrategy {
  String? iconUrl;
  String? header;
  String? description;

  InvestmentStrategy({
    this.iconUrl,
    this.header,
    this.description,
  });

  factory InvestmentStrategy.fromJson(String str) =>
      InvestmentStrategy.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InvestmentStrategy.fromMap(Map<String, dynamic> json) =>
      InvestmentStrategy(
        iconUrl: json["iconUrl"],
        header: json["header"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "iconUrl": iconUrl,
        "header": header,
        "description": description,
      };
}

class AtedAt {
  DateTime? date;

  AtedAt({
    this.date,
  });

  factory AtedAt.fromJson(String str) => AtedAt.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AtedAt.fromMap(Map<String, dynamic> json) => AtedAt(
        date: json["\u0024date"] == null
            ? null
            : DateTime.parse(json["\u0024date"]),
      );

  Map<String, dynamic> toMap() => {
        "\u0024date": date?.toIso8601String(),
      };
}

class Portfolio {
  Others? others;

  Portfolio({
    this.others,
  });

  factory Portfolio.fromJson(String str) => Portfolio.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Portfolio.fromMap(Map<String, dynamic> json) => Portfolio(
        others: json["others"] == null ? null : Others.fromMap(json["others"]),
      );

  Map<String, dynamic> toMap() => {
        "others": others?.toMap(),
      };
}

class Others {
  int? total;
  List<Fund>? funds;

  Others({
    this.total,
    this.funds,
  });

  factory Others.fromJson(String str) => Others.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Others.fromMap(Map<String, dynamic> json) => Others(
        total: json["total"],
        funds: json["funds"] == null
            ? []
            : List<Fund>.from(json["funds"]!.map((x) => Fund.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "funds": funds == null
            ? []
            : List<dynamic>.from(funds!.map((x) => x.toMap())),
      };
}

class Fund {
  String? isin;
  String? name;
  String? type;
  String? customCategory;
  String? rating;
  int? allocation;
  String? icon;
  String? returns;
  String? duration;

  Fund({
    this.isin,
    this.name,
    this.type,
    this.customCategory,
    this.rating,
    this.allocation,
    this.icon,
    this.returns,
    this.duration,
  });

  factory Fund.fromJson(String str) => Fund.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Fund.fromMap(Map<String, dynamic> json) => Fund(
        isin: json["isin"],
        name: json["name"],
        type: json["type"],
        customCategory: json["customCategory"],
        rating: json["rating"],
        allocation: json["allocation"],
        icon: json["icon"],
        returns: json["returns"],
        duration: json["duration"],
      );

  Map<String, dynamic> toMap() => {
        "isin": isin,
        "name": name,
        "type": type,
        "customCategory": customCategory,
        "rating": rating,
        "allocation": allocation,
        "icon": icon,
        "returns": returns,
        "duration": duration,
      };
}
