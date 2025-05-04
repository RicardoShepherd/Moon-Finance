import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'sharemoon_affiliate_model.dart';
export 'sharemoon_affiliate_model.dart';

class SharemoonAffiliateWidget extends StatefulWidget {
  const SharemoonAffiliateWidget({super.key});

  @override
  State<SharemoonAffiliateWidget> createState() =>
      _SharemoonAffiliateWidgetState();
}

class _SharemoonAffiliateWidgetState extends State<SharemoonAffiliateWidget> {
  late SharemoonAffiliateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SharemoonAffiliateModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 79.0,
      decoration: BoxDecoration(
        color: Color(0xFF18181A),
      ),
      child: Padding(
        padding: EdgeInsets.all(14.0),
        child: FFButtonWidget(
          onPressed: () {
            print('Button pressed ...');
          },
          text: FFLocalizations.of(context).getText(
            '7d40zz08' /* Share Moon */,
          ),
          options: FFButtonOptions(
            height: 10.0,
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
            color: FlutterFlowTheme.of(context).primaryText,
            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                  font: FlutterFlowTheme.of(context).titleSmall,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  letterSpacing: 0.0,
                ),
            elevation: 0.0,
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
