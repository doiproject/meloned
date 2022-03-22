import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key key}) : super(key: key);

  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  TextEditingController confirmPasswordController;
  bool confirmPasswordVisibility;
  TextEditingController emailAddressController;
  TextEditingController usernameController;
  TextEditingController passwordController;
  bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    confirmPasswordController = TextEditingController();
    confirmPasswordVisibility = false;
    emailAddressController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/Group_465.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                duration: Duration(milliseconds: 200),
                                reverseDuration: Duration(milliseconds: 200),
                                child: LoginWidget(),
                              ),
                            );
                          },
                          child: Container(
                            width: 140,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F4F8),
                            ),
                            alignment: AlignmentDirectional(-1, 0),
                            child: Text(
                              'เข้าสู่ระบบ',
                              style:
                                  FlutterFlowTheme.of(context).title2.override(
                                        fontFamily: 'Kanit',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500,
                                      ),
                            ),
                          ),
                        ),
                        Container(
                          width: 140,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFFF1F4F8),
                          ),
                          alignment: AlignmentDirectional(-1, 0),
                          child: Text(
                            'ลงทะเบียน',
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Kanit',
                                  color: Color(0xFF090F13),
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'เริ่มต้นด้วยการสร้างบัญชีด้านล่าง',
                          style:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Kanit',
                                    color: Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                    child: TextFormField(
                      controller: usernameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Your username',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        hintText: 'Enter your username',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF1D2429),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                    child: TextFormField(
                      controller: emailAddressController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Your email address...',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        hintText: 'Enter your email...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF1D2429),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: !passwordVisibility,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        hintText: 'Enter your email...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => passwordVisibility = !passwordVisibility,
                          ),
                          child: Icon(
                            passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF95A1AC),
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF1D2429),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 2),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      obscureText: !confirmPasswordVisibility,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        hintText: 'Enter your email...',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF57636C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFDBE2E7),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                        suffixIcon: InkWell(
                          onTap: () => setState(
                            () => confirmPasswordVisibility =
                                !confirmPasswordVisibility,
                          ),
                          child: Icon(
                            confirmPasswordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Color(0xFF95A1AC),
                            size: 22,
                          ),
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF1D2429),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Passwords don\'t match!',
                            ),
                          ),
                        );
                        return;
                      }

                      final user = await createAccountWithEmail(
                        context,
                        emailAddressController.text,
                        passwordController.text,
                      );
                      if (user == null) {
                        return;
                      }

                      final userCreateData = createUserRecordData(
                        email: emailAddressController.text,
                        password: passwordController.text,
                        username: usernameController.text,
                      );
                      await UserRecord.collection
                          .doc(user.uid)
                          .update(userCreateData);

                      await Future.delayed(const Duration(milliseconds: 300));
                      Navigator.pop(context);
                    },
                    text: 'ลงทะเบียน',
                    options: FFButtonOptions(
                      width: 170,
                      height: 50,
                      color: Color(0xFF510000),
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Kanit',
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 40,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
