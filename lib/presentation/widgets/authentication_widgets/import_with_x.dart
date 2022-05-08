import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../bloc/authentication_bloc.dart';
import '../../../configs/configs.dart';
import '../../screens/nav_bar_screens/persistent_bottom_nav_bar.dart';

class ImportWalletWithX extends StatefulWidget {
  static const routeName = "/import_with_x";
  const ImportWalletWithX(
      {Key? key,
      required this.hintText,
      required this.isPrivateKeyScreen,
      this.errorMessage})
      : super(key: key);

  final String hintText;
  final bool isPrivateKeyScreen;
  final String? errorMessage;

  @override
  State<ImportWalletWithX> createState() => _ImportWalletWithXState();
}

class _ImportWalletWithXState extends State<ImportWalletWithX> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kTransparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Card(),
              Card(
                elevation: 5,
                shadowColor: kPrimaryColor,
                //shape: BoxDecoration(border: Border.all(width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      controller: textEditingController,
                      keyboardType: TextInputType.multiline,
                      showCursor: true,
                      cursorColor: kPrimaryColor,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter ${widget.hintText}',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter ${widget.hintText}';
                        }
                        if (!value.startsWith("0x") || value.length == 64) {
                          return widget.isPrivateKeyScreen
                              ? "${widget.errorMessage}"
                              : null;
                        }
                        if (value.split(" ").length != 12) {
                          return widget.isPrivateKeyScreen
                              ? null
                              : "Seed phrase must be 12 words";
                        }
                        return null;
                      },
                    ),
                    const Gap(70),
                    TextButton(
                      child: Text(
                        "Paste",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.bold, color: kPrimaryColor),
                      ),
                      onPressed: () async {
                        Clipboard.getData(Clipboard.kTextPlain).then((value) {
                          textEditingController.text =
                              textEditingController.text + value!.text!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: kScreenHeight(context),
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.isPrivateKeyScreen
                          ? context.read<AuthBloc>().add(ImportWithKeyPhrase(
                              keyPhrase: textEditingController.text))
                          : context.read<AuthBloc>().add(ImportWithKeyPhrase(
                              keyPhrase: textEditingController.text));
                      Navigator.of(context).popAndPushNamed(
                        CustomNavigationBar.routeName,
                      );
                    }
                  },
                  child: const Text('Import'),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
