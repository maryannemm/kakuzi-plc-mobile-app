import 'package:flutter/cupertino.dart';
import 'package:kakuzi_plc/imports.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  String userType;
  void Function()? onPressed;
  Register({
    super.key,
    required this.userType,
    required this.onPressed,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _emailFieldKey =
      GlobalKey<FormBuilderState>();

  var options = ["Customer", "Farmer"];
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: <Widget>[
          FormBuilderTextField(
            name: 'First Name',
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(10),
                FormBuilderValidators.maxLength(20),
              ],
            ),
          ),
          FormBuilderTextField(
            name: 'Last Name',
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(10),
                FormBuilderValidators.maxLength(20),
              ],
            ),
          ),
          FormBuilderTextField(
            name: 'username',
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(5),
                FormBuilderValidators.maxLength(20),
              ],
            ),
          ),
          FormBuilderTextField(
            key: _emailFieldKey,
            name: 'email',
            decoration: const InputDecoration(labelText: 'Email'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
          FormBuilderTextField(
            name: 'Phone Number',
            decoration: const InputDecoration(labelText: 'Phone Number'),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.integer(),
              FormBuilderValidators.numeric(),
              FormBuilderValidators.equalLength(10),
            ]),
          ),
          const SizedBox(height: 10),
          FormBuilderTextField(
            name: 'password',
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          FormBuilderField(
            name: "name",
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
            builder: (FormFieldState<dynamic> field) {
              return InputDecorator(
                decoration: InputDecoration(
                  labelText: "Select role",
                  contentPadding: const EdgeInsets.only(top: 10.0, bottom: 0.0),
                  border: InputBorder.none,
                  errorText: field.errorText,
                ),
                child: Container(
                  height: 200,
                  child: CupertinoPicker(
                    itemExtent: 30,
                    children: options.map((c) => Text(c)).toList(),
                    onSelectedItemChanged: (index) {
                      field.didChange(options[index]);
                    },
                  ),
                ),
              );
            },
          ),
          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: widget.onPressed,
            child: const Text('Register'),
          )
        ],
      ),
    );
  }
}
