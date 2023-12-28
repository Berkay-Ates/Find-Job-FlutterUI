import 'package:flutter/material.dart';

import '../init/theme/itheme/iTheme.dart';

class MyJobsWidget extends StatelessWidget {
  const MyJobsWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.application_count,
    required this.salary,
    required this.applyJob,
  }) : super(key: key);

  final String title;
  final String description;
  final String application_count;
  final String salary;
  final Function applyJob;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
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
                      title,
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
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 120.0, 0.0),
                      child: Text(
                        description /* Aracım 2023 salarydir. Sahibind... */,
                        textAlign: TextAlign.justify,
                        style: ITheme.of(context).bodySmall.copyWith(
                              fontFamily: 'Lexend',
                              color: ITheme.of(context).primaryText,
                              fontSize: 13.0,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                    child: Text(
                      "Durum: " /* Durum:  */,
                      style: ITheme.of(context).titleMedium.copyWith(
                            fontFamily: 'Lexend',
                            fontSize: 14.0,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 4.0),
                    child: Icon(
                      Icons.people_alt_sharp,
                      color: ITheme.of(context).primary,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      application_count /* 9.900 application_count */,
                      style: ITheme.of(context).bodyMedium.copyWith(
                            fontFamily: 'Lexend',
                            color: ITheme.of(context).primaryText,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 4.0),
                    child: Icon(
                      Icons.attach_money_sharp,
                      color: ITheme.of(context).primary,
                      size: 24.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                    child: Text(
                      salary /* BMW 435i GRAN COUPE 2023 */,
                      style: ITheme.of(context).bodyMedium.copyWith(
                            fontFamily: 'Lexend',
                            color: ITheme.of(context).primaryText,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: applyJob(),
                    child: Text(
                      "Başvur",
                      style: ITheme.of(context).bodySmall.copyWith(
                            color: ITheme.of(context).primary,
                            fontSize: 12.0,
                          ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
