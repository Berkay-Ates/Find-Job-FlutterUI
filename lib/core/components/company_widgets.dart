import 'package:flutter/material.dart';

import '../init/theme/itheme/iTheme.dart';

class CompanyWidget extends StatelessWidget {
  const CompanyWidget({
    Key? key,
    required this.company_img_url,
    required this.name,
    required this.field,
  }) : super(key: key);

  final String company_img_url;
  final String name;
  final String field;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 8.0),
      child: Container(
        width: double.infinity,
        height: 240,
        decoration: BoxDecoration(
          color: ITheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.network(company_img_url).image,
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x430F1113),
              offset: Offset(0.0, 1.0),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        name,
                        textAlign: TextAlign.start,
                        style: ITheme.of(context).bodySmall.copyWith(
                              fontFamily: 'Lexend',
                              color: ITheme.of(context).primary,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 1.0,
                decoration: BoxDecoration(
                  color: ITheme.of(context).primaryBackground,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 4.0),
                      child: Icon(
                        Icons.assignment_rounded,
                        color: ITheme.of(context).primary,
                        size: 32.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                      child: Text(
                        field /* 9.900 KM */,
                        style: ITheme.of(context).bodyMedium.copyWith(
                              fontFamily: 'Lexend',
                              color: ITheme.of(context).primaryText,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
