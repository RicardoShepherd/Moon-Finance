import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:collection/collection.dart';

import 'confirmsecraterecoveryphrase_model.dart';
export 'confirmsecraterecoveryphrase_model.dart';

class ConfirmsecraterecoveryphraseWidget extends StatefulWidget {
  const ConfirmsecraterecoveryphraseWidget({super.key});

  static String routeName = 'confirmsecraterecoveryphrase';
  static String routePath = '/confirmsecraterecoveryphrase';

  @override
  State<ConfirmsecraterecoveryphraseWidget> createState() =>
      _ConfirmsecraterecoveryphraseWidgetState();
}

class _ConfirmsecraterecoveryphraseWidgetState
    extends State<ConfirmsecraterecoveryphraseWidget> {
  late ConfirmsecraterecoveryphraseModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final correctPhrase = [
    'word1', 'word2', 'word3', 'word4',
    'word5', 'word6', 'word7', 'word8',
    'word9', 'word10', 'word11', 'word12'
  ]; // Replace with the actual seed phrase

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfirmsecraterecoveryphraseModel());

    _model.recoveryWordControllers = List.generate(
      12,
      (_) => TextEditingController(),
    );

    logFirebaseEvent('screen_view', parameters: {
      'screen_name': 'confirmsecraterecoveryphrase',
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    for (var controller in _model.recoveryWordControllers) {
      controller.dispose();
    }
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 17.0),
                child: Text(
                  'Write down your Secret Recovery Phrase',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context)
                      .headlineMedium
                      .override(
                        font: FlutterFlowTheme.of(context).headlineMedium,
                        fontSize: 19.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Type, select or paste in order...',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    final clipboardData =
                        await Clipboard.getData('text/plain');
                    final phrase = clipboardData?.text?.trim().toLowerCase();

                    if (phrase == null || phrase.split(' ').length != 12) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Invalid recovery phrase. Must be 12 words.'),
                        ),
                      );
                      return;
                    }

                    final words = phrase.split(' ');
                    for (int i = 0; i < 12; i++) {
                      _model.recoveryWordControllers[i].text = words[i];
                    }
                  },
                  text: 'Paste Phrase',
                  options: FFButtonOptions(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    color: FlutterFlowTheme.of(context).accent1,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: FlutterFlowTheme.of(context).titleSmall,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Container(
                  width: 356.4,
                  height: 395.88,
                  decoration: BoxDecoration(
                    color: Color(0x280C0C0C),
                    borderRadius: BorderRadius.circular(24.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 12,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 2.8,
                      ),
                      itemBuilder: (context, index) {
                        return TextFormField(
                          controller: _model.recoveryWordControllers[index],
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          decoration: InputDecoration(
                            labelText: 'Word ${index + 1}',
                            filled: true,
                            fillColor: Colors.white12,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(70.0, 0.0, 70.0, 20.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final enteredWords = _model.recoveryWordControllers
                            .map((c) => c.text.trim().toLowerCase())
                            .toList();

                        if (ListEquality().equals(enteredWords, correctPhrase)) {
                          context.pushNamed(HomeWidget.routeName);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Incorrect recovery phrase. Please check and try again.'),
                            ),
                          );
                        }
                      },
                      text: 'Continue',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        color: FlutterFlowTheme.of(context).primaryText,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  font: FlutterFlowTheme.of(context).titleSmall,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 13.0,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
