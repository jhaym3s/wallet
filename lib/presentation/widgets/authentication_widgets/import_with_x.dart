import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../../configs/configs.dart';

class ImportWalletWithX extends StatefulWidget {
  static const routeName = "/import_with_x";
  const ImportWalletWithX({Key? key, required this.hintText,required this.isPrivateKeyScreen, this.errorMessage}) : super(key: key);

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
        automaticallyImplyLeading: false,
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
              const Gap(10),
              Container(
                height: 100,
                decoration: BoxDecoration(border: Border.all(width: 1)),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        controller: textEditingController,
                        keyboardType: TextInputType.multiline,
                        showCursor: false,
                        //cursorHeight: 40,
                        // The validator receives the text that the user has entered.
                        // maxLength: 300000,
                        decoration:  InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter ${widget.hintText}',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter ${widget.hintText}';
                          }
                          if(!value.startsWith("0x")|| value.length == 64){
                              return widget.isPrivateKeyScreen?"${widget.errorMessage}": null;
                          }
                          return null;
                        },
                      
                      ),
                    ),
                    TextButton(
                      child: Text(
                        "Paste",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor),
                      ),
                      onPressed: () async {
                        Clipboard.getData(Clipboard.kTextPlain).then((value){ 
                            textEditingController.text = textEditingController.text + value!.text!;
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
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
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
