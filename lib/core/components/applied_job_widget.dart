import 'package:flutter/material.dart';

import '../init/theme/itheme/iTheme.dart';

class AppliedJobWidget extends StatelessWidget {
  const AppliedJobWidget({
    Key? key,
    required this.applicationId,
    required this.applicationDate,
    required this.companyId,
    required this.jobId,
    required this.userId,
    required this.buttonLabel,
    required this.deleteJobApplication,
  }) : super(key: key);

  final String applicationId;
  final String applicationDate;
  final String companyId;
  final String jobId;
  final String userId;

  final String buttonLabel;
  final Function deleteJobApplication;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 3.0),
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  "Application ID: $applicationId " /* Durum:  */,
                  textAlign: TextAlign.left,
                  style: ITheme.of(context).titleMedium.copyWith(
                        fontFamily: 'Lexend',
                        fontSize: 14.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  "Application Date: $applicationDate" /* Durum:  */,
                  textAlign: TextAlign.left,
                  style: ITheme.of(context).titleMedium.copyWith(
                        fontFamily: 'Lexend',
                        fontSize: 14.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  "Company Id: $companyId" /* Durum:  */,
                  textAlign: TextAlign.left,
                  style: ITheme.of(context).titleMedium.copyWith(
                        fontFamily: 'Lexend',
                        fontSize: 14.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  "Job Id:$jobId " /* Durum:  */,
                  textAlign: TextAlign.left,
                  style: ITheme.of(context).titleMedium.copyWith(
                        fontFamily: 'Lexend',
                        fontSize: 14.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  "User ID: $userId" /* Durum:  */,
                  textAlign: TextAlign.left,
                  style: ITheme.of(context).titleMedium.copyWith(
                        fontFamily: 'Lexend',
                        fontSize: 14.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Spacer(),
                    FilledButton(
                      onPressed: () => deleteJobApplication(),
                      child: Text(
                        buttonLabel,
                        style: ITheme.of(context).bodySmall.copyWith(
                              color: ITheme.of(context).customColor4,
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
      ),
    );
  }
}
