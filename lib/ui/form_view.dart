import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:opp_forms/data/raw_data.dart';
import 'package:opp_forms/models/opp_data_model.dart';
import 'package:opp_forms/ui/widgets/expandable_widget.dart';
import 'package:opp_forms/ui/widgets/text_field_widget.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<StatefulWidget> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _isinList = <String>[];
  final _riskAssesmentPros = <String>[];
  final _riskAssesmentCons = <String>[];
  final _idealFinancialGoals = <String>[];
  final _recommendations = <String>[];
  final _investmentStrategy = <InvestmentStrategy>[];
  final _investmentFocus = <InvestmentFocus>[];
  late OppDataModel jsonModel;

  @override
  void initState() {
    super.initState();
    jsonModel = OppDataModel.fromMap(oppRawData);

    _isinList.add('');
    _riskAssesmentCons.add('');
    _riskAssesmentPros.add('');
    _idealFinancialGoals.add('');
    _recommendations.add('');
    _investmentStrategy
        .add(InvestmentStrategy(iconUrl: '', header: '', description: ''));
    _investmentFocus.add(InvestmentFocus(iconUrl: '', description: ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opportunity Forms Creation'),
      ),
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            margin: const EdgeInsets.symmetric(
              horizontal: 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 32,
                ),
                TextFieldWidget(
                  label: 'name',
                  onChanged: (value) {
                    jsonModel.name = value;
                  },
                ),
                TextFieldWidget(
                  label: 'risk level',
                  onChanged: (value) {
                    jsonModel.riskLevel = value;
                  },
                ),
                TextFieldWidget(
                  label: 'minimum initial',
                  onChanged: (value) {
                    jsonModel.minimumInitial = int.parse(value ?? '0');
                  },
                ),
                TextFieldWidget(
                  label: 'minimum SIP',
                  onChanged: (value) {
                    jsonModel.minimumSip = int.parse(value ?? '0');
                  },
                ),
                TextFieldWidget(
                  label: 'description',
                  onChanged: (value) {
                    jsonModel.description = value;
                  },
                ),
                TextFieldWidget(
                  label: 'recommended\nduration',
                  onChanged: (value) {
                    jsonModel.recommendedDuration = value;
                  },
                ),
                TextFieldWidget(
                  label: 'icon url',
                  onChanged: (value) {
                    jsonModel.icon = value;
                  },
                ),
                _addISINS(),
                _returns(),
                _benchMarks(),
                _stackHeaderExpandedWidget(),
                _stackPerfExpandedWidget(),
                _historicalReturnExpandedWidget(),
                _preferredInvestorWidget(),
                _addInvestmentFocus(),
                _addInvestmentStrategy(),
                _aboutOppStackExpandWidget(),
                _stackFeeStructure(),
                _amcFeeStructure(),
                _addIdealFinancialGoals(),
                _addRiskPros(),
                _addRiskCons(),
                _addRecomendations(),
                const SizedBox(
                  height: 100,
                ),
                _copyToClipBoardButton(),
                const SizedBox(
                  height: kToolbarHeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _addInvestmentStrategy() {
    return ExpandableWidget(
      title: 'add Investment Strategy',
      isExpandable: true,
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _investmentStrategy.removeLast();
                  });
                },
                icon: const Icon(
                  Icons.minimize,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _investmentStrategy.add(InvestmentStrategy(
                        iconUrl: '', header: '', description: ''));
                  });
                },
                icon: const Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: _investmentStrategy.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, idx) => Column(
              children: [
                Text(
                  'SET $idx',
                  style: TextStyle(fontSize: 32, color: Colors.blueGrey),
                ),
                TextFieldWidget(
                  label: 'icon Url $idx',
                  onChanged: (value) {
                    _investmentStrategy[idx].iconUrl = value ?? '';
                    jsonModel.content?.investmentStrategies =
                        _investmentStrategy;
                  },
                ),
                TextFieldWidget(
                  label: 'header $idx',
                  onChanged: (value) {
                    _investmentStrategy[idx].header = value ?? '';
                    jsonModel.content?.investmentStrategies =
                        _investmentStrategy;
                  },
                ),
                TextFieldWidget(
                  label: 'descriptin $idx',
                  onChanged: (value) {
                    _investmentStrategy[idx].description = value ?? '';
                    jsonModel.content?.investmentStrategies =
                        _investmentStrategy;
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _addInvestmentFocus() {
    return ExpandableWidget(
      title: 'add Investment Focus',
      isExpandable: true,
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _investmentFocus.removeLast();
                  });
                },
                icon: const Icon(
                  Icons.minimize,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _investmentFocus
                        .add(InvestmentFocus(iconUrl: '', description: ''));
                  });
                },
                icon: const Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: _investmentFocus.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, idx) => Column(
              children: [
                Text(
                  'SET $idx',
                  style: TextStyle(fontSize: 32, color: Colors.blueGrey),
                ),
                TextFieldWidget(
                  label: 'icon Url $idx',
                  onChanged: (value) {
                    _investmentFocus[idx].iconUrl = value ?? '';
                    jsonModel.content?.investmentFocus = _investmentFocus;
                  },
                ),
                TextFieldWidget(
                  label: 'description $idx',
                  onChanged: (value) {
                    _investmentFocus[idx].description = value ?? '';
                    jsonModel.content?.investmentFocus = _investmentFocus;
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _copyToClipBoardButton() {
    return GestureDetector(
      onTap: () {
        var stringJson = jsonEncode(jsonModel);
        var jsonData = stringJson.substring(1, stringJson.length - 1);
        Clipboard.setData(ClipboardData(text: jsonData)).then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("changes copied to clipboard"),
            ),
          );
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black,
        ),
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.copy,
              size: 48,
              color: Colors.white,
            ),
            SizedBox(
              width: 48,
            ),
            Text(
              'copy your changes to clipboard',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 24),
            )
          ],
        ),
      ),
    );
  }

  Widget _stackHeaderExpandedWidget() {
    return ExpandableWidget(
      title: 'stack header data',
      widget: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TextFieldWidget(
            label: 'title',
            onChanged: (value) {
              jsonModel.content?.header?.title = value;
            },
          ),
          TextFieldWidget(
            label: 'image url',
            onChanged: (value) {
              jsonModel.content?.header?.imageUrl = value;
            },
          ),
          TextFieldWidget(
            label: 'video url',
            onChanged: (value) {
              jsonModel.content?.header?.videoUrl = value;
            },
          ),
          TextFieldWidget(
            label: 'description',
            onChanged: (value) {
              jsonModel.content?.description = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _stackPerfExpandedWidget() {
    return ExpandableWidget(
      title: 'stack performance data',
      widget: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TextFieldWidget(
            label: 'performance graph',
            onChanged: (value) {
              jsonModel.content?.performance?.graphImageUrl = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _historicalReturnExpandedWidget() {
    return ExpandableWidget(
      title: 'historical return data',
      widget: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TextFieldWidget(
            label: 'historical return url ',
            onChanged: (value) {
              jsonModel.content?.historicalReturns?.graphImageUrl = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _preferredInvestorWidget() {
    return ExpandableWidget(
      title: 'preferred investor details',
      widget: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TextFieldWidget(
            label: 'description',
            onChanged: (value) {},
          ),
          TextFieldWidget(
            label: 'risk quadrant graph',
            onChanged: (value) {},
          ),
          TextFieldWidget(
            label: 'risk profile',
            onChanged: (value) {},
          ),
          TextFieldWidget(
            label: 'age',
            onChanged: (value) {},
          ),
          TextFieldWidget(
            label: 'investment horizon',
            onChanged: (value) {},
          ),
          TextFieldWidget(
            label: 'return expectation',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget _aboutOppStackExpandWidget() {
    return ExpandableWidget(
      title: 'about opportunity stack',
      widget: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TextFieldWidget(
            label: 'description',
            onChanged: (value) {
              jsonModel.content?.aboutOpportunityStack?.preferredInvestorDetails
                  ?.description = value;
            },
          ),
          TextFieldWidget(
            label: 'risk quad graph',
            onChanged: (value) {
              jsonModel.content?.aboutOpportunityStack?.preferredInvestorDetails
                  ?.riskQuadrantGraphUrl = value;
            },
          ),
          TextFieldWidget(
            label: 'risk profile',
            onChanged: (value) {
              jsonModel.content?.aboutOpportunityStack?.preferredInvestorDetails
                  ?.riskProfile = value;
            },
          ),
          TextFieldWidget(
            label: 'age',
            onChanged: (value) {
              jsonModel.content?.aboutOpportunityStack?.preferredInvestorDetails
                  ?.age = value;
            },
          ),
          TextFieldWidget(
            label: 'investment horizon',
            onChanged: (value) {
              jsonModel.content?.aboutOpportunityStack?.preferredInvestorDetails
                  ?.investmentHorizon = value;
            },
          ),
          TextFieldWidget(
            label: 'investment horizon',
            onChanged: (value) {
              jsonModel.content?.aboutOpportunityStack?.preferredInvestorDetails
                  ?.returnExpectation = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _addISINS() {
    return ExpandableWidget(
      title: 'add ISINS',
      isExpandable: true,
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isinList.removeLast();
                  });
                },
                icon: const Icon(
                  Icons.minimize,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isinList.add('');
                  });
                },
                icon: const Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: _isinList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, idx) => TextFieldWidget(
              label: 'ISINS $idx',
              onChanged: (value) {
                _isinList[idx] = value ?? '';
                jsonModel.isins = _isinList;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _addIdealFinancialGoals() {
    return ExpandableWidget(
      title: 'add ideal financial goals',
      isExpandable: true,
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _idealFinancialGoals.removeLast();
                  });
                },
                icon: const Icon(
                  Icons.minimize,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _idealFinancialGoals.add('');
                  });
                },
                icon: const Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: _idealFinancialGoals.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, idx) => TextFieldWidget(
              label: 'Goal $idx',
              onChanged: (value) {
                _idealFinancialGoals[idx] = value ?? '';
                jsonModel
                    .content
                    ?.aboutOpportunityStack
                    ?.preferredInvestorDetails
                    ?.idealFinancialGoals = _idealFinancialGoals;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _addRiskPros() {
    return ExpandableWidget(
      title: 'add risk PROS',
      isExpandable: true,
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _riskAssesmentPros.removeLast();
                  });
                },
                icon: const Icon(
                  Icons.minimize,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _riskAssesmentPros.add('');
                  });
                },
                icon: const Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: _riskAssesmentPros.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, idx) => TextFieldWidget(
              label: 'Pros $idx',
              onChanged: (value) {
                _riskAssesmentPros[idx] = value ?? '';
                jsonModel.content?.aboutOpportunityStack?.riskAssessmentDetails
                    ?.pros = _riskAssesmentPros;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _addRiskCons() {
    return ExpandableWidget(
      title: 'add risk CONS',
      isExpandable: true,
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _riskAssesmentCons.removeLast();
                  });
                },
                icon: const Icon(
                  Icons.minimize,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _riskAssesmentCons.add('');
                  });
                },
                icon: const Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: _riskAssesmentCons.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, idx) => TextFieldWidget(
              label: 'Cons $idx',
              onChanged: (value) {
                _riskAssesmentCons[idx] = value ?? '';
                jsonModel.content?.aboutOpportunityStack?.riskAssessmentDetails
                    ?.cons = _riskAssesmentCons;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _addRecomendations() {
    return ExpandableWidget(
      title: 'add recomendations',
      isExpandable: true,
      widget: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _recommendations.removeLast();
                  });
                },
                icon: const Icon(
                  Icons.minimize,
                  color: Colors.black,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _recommendations.add('');
                  });
                },
                icon: const Icon(
                  Icons.add_rounded,
                  color: Colors.black,
                  size: 32,
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: _recommendations.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, idx) => TextFieldWidget(
              label: 'recomendation $idx',
              onChanged: (value) {
                _recommendations[idx] = value ?? '';
                jsonModel.recommendations = _recommendations;
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _stackFeeStructure() {
    return ExpandableWidget(
      title: 'stack fee structure',
      widget: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TextFieldWidget(
            label: 'upper bound',
            onChanged: (value) {
              jsonModel.content?.aboutOpportunityStack?.keyDetails?.feeStructure
                  ?.stack?.upperBound = double.parse(value ?? '0');
            },
          ),
          TextFieldWidget(
            label: 'lower bound',
            onChanged: (value) {
              jsonModel.content?.aboutOpportunityStack?.keyDetails?.feeStructure
                  ?.stack?.lowerBound = double.parse(value ?? '0');
              ;
            },
          ),
        ],
      ),
    );
  }

  Widget _amcFeeStructure() {
    return ExpandableWidget(
      title: 'amc fee structure',
      widget: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TextFieldWidget(
            label: 'upper bound',
            onChanged: (value) {
              jsonModel.content?.aboutOpportunityStack?.keyDetails?.feeStructure
                  ?.amc?.upperBound = double.parse(value ?? '0');
            },
          ),
          TextFieldWidget(
            label: 'lower bound',
            onChanged: (value) {
              jsonModel.content?.aboutOpportunityStack?.keyDetails?.feeStructure
                  ?.amc?.lowerBound = double.parse(value ?? '0');
              ;
            },
          ),
        ],
      ),
    );
  }

  Widget _benchMarks() {
    return ExpandableWidget(
      title: 'stack benchmarks',
      widget: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TextFieldWidget(
            label: '1Y',
            onChanged: (value) {
              jsonModel.benchmark?.the1Y = double.tryParse(value ?? '0');
            },
          ),
          TextFieldWidget(
            label: '3Y',
            onChanged: (value) {
              jsonModel.benchmark?.the3Y = double.tryParse(value ?? '0');
            },
          ),
          TextFieldWidget(
            label: '5Y',
            onChanged: (value) {
              jsonModel.benchmark?.the5Y = double.tryParse(value ?? '0');
            },
          ),
          TextFieldWidget(
            label: '7Y',
            onChanged: (value) {
              jsonModel.benchmark?.the7Y = double.tryParse(value ?? '0');
            },
          ),
          TextFieldWidget(
            label: '10Y',
            onChanged: (value) {
              jsonModel.benchmark?.the10Y = double.tryParse(value ?? '0');
            },
          ),
        ],
      ),
    );
  }

  Widget _returns() {
    return ExpandableWidget(
      title: 'stack returns',
      widget: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TextFieldWidget(
            label: '1Y',
            onChanged: (value) {
              jsonModel.returns?.the1Y = double.tryParse(value ?? '0');
            },
          ),
          TextFieldWidget(
            label: '3Y',
            onChanged: (value) {
              jsonModel.returns?.the3Y = double.tryParse(value ?? '0');
            },
          ),
          TextFieldWidget(
            label: '5Y',
            onChanged: (value) {
              jsonModel.returns?.the5Y = double.tryParse(value ?? '0');
            },
          ),
          TextFieldWidget(
            label: '7Y',
            onChanged: (value) {
              jsonModel.returns?.the7Y = double.tryParse(value ?? '0');
            },
          ),
          TextFieldWidget(
            label: '10Y',
            onChanged: (value) {
              jsonModel.returns?.the10Y = double.tryParse(value ?? '0');
            },
          ),
        ],
      ),
    );
  }
}
