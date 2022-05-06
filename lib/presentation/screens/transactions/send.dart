import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hodl/bloc/wallet_bloc.dart';

import '../../../components/intro_elevated_button.dart';
import '../../../configs/configs.dart';

class SendScreen extends StatefulWidget {
  static const routeName = "send";
  const SendScreen({ Key? key }) : super(key: key);

  @override
  State<SendScreen> createState() => _SendScreenState();
}

class _SendScreenState extends State<SendScreen> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar:AppBar(
         backgroundColor: kPrimaryColor,
       leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  context.read<WalletBloc>().add(FindCurrencyEvent(id: id));
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: kWhite,
                )),
                centerTitle: true,
            title: Text(
              "Send " + id,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: kWhite),
            ),
      ),
      body: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Gap(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              decoration: BoxDecoration(
                 border: Border.all(
      color: kPrimaryColor,
    ),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: InputBorder.none, 
                        hintText: 'Recipient\'s Address',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter recipient\'s Address';
                        }
                        if(value.startsWith('0x')|| value.length == 42){
                          return "Please enter a valid address";
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
                            addressController.text = addressController.text + value!.text!;
                        });
                      }, 
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              decoration: BoxDecoration(
                 border: Border.all(
      color: kPrimaryColor,
    ),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none, 
                        hintText: 'Amount',
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty|| double.parse(value) <= 0) {
                          return 'Please enter amount';
                        }
                        if(double.parse(value) == 0)
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                  }
                },
                label: 'Proceed',
              ),
            ),
          ),
        ],
      ),
    ),
      
    );
  }
}