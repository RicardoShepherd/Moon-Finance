import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'doughnutchart_model.dart';
export 'doughnutchart_model.dart';

class DoughnutchartWidget extends StatefulWidget {
  const DoughnutchartWidget({super.key});

  @override
  State<DoughnutchartWidget> createState() => _DoughnutchartWidgetState();
}

class _DoughnutchartWidgetState extends State<DoughnutchartWidget> {
  late DoughnutchartModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DoughnutchartModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chartPieChartColorsList = [
      Color(0xFF48E946),
      Color(0xFFCBBC28),
      Color(0xFFC24D09),
      Color(0xFF091685)
    ];
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 370.0,
        height: 230.0,
        child: FlutterFlowPieChart(
          data: FFPieChartData(
            values: List.generate(random_data.randomInteger(1, 10),
                (index) => random_data.randomInteger(0, 10)),
            colors: chartPieChartColorsList,
            radius: [56.0],
          ),
          donutHoleRadius: 55.0,
          donutHoleColor: Colors.transparent,
          sectionLabelType: PieChartSectionLabelType.percent,
          sectionLabelStyle: FlutterFlowTheme.of(context)
              .headlineSmall
              .override(
                font: GoogleFonts.openSans(
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                ),
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 15.0,
                letterSpacing: 0.0,
                fontWeight:
                    FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
              ),
        ),
      ),
    );
  }
}
