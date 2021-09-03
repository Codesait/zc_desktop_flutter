import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:zcdesk_ui/zcdesk_ui.dart';

import 'startup_viewmodel.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text(model.appName)),
        body: Shell(),
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}

class Shell extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subTitle;
  const Shell({Key? key, this.image, this.title, this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.nonReactive(
      builder: (context, model, child) => Row(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              color: kcPrimaryColor,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(model.circularImage),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    model.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  verticalSpaceSmall,
                  Text(
                    model.subTitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  verticalSpaceLarge,
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
      viewModelBuilder: () => StartUpViewModel(),
    );
  }
}
