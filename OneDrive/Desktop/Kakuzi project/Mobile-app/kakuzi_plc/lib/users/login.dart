import 'package:kakuzi_plc/imports.dart';

// ignore: must_be_immutable
class CustomerLogin extends StatefulWidget {
  String userType;
  void Function()? onPressed;
  CustomerLogin({
    super.key,
    required this.userType,
    required this.onPressed,
  });

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _userName = GlobalKey<FormBuilderState>();
  final _password = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _emailFieldKey =
      GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderTextField(
            key: _userName,
            name: 'name',
            decoration: const InputDecoration(labelText: 'Email'),
            validator: FormBuilderValidators.compose(
              [
                FormBuilderValidators.required(),
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
          const SizedBox(height: 10),
          FormBuilderTextField(
            key: _password,
            name: 'password',
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
            ]),
          ),
          MaterialButton(
            color: Theme.of(context).colorScheme.secondary,
            onPressed: widget.onPressed,
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}
