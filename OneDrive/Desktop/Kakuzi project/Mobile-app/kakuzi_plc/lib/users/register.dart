import 'package:kakuzi_plc/imports.dart';

// ignore: must_be_immutable
class Register extends StatefulWidget {
  String userType;

  Register({
    super.key,
    required this.userType,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _emailFieldKey =
      GlobalKey<FormBuilderState>();
  String? selectedRole; // Track the selected role

  void onSubmit() {
    _formKey.currentState?.reset();
    setState(() {
      selectedRole = null; // Reset the selected role after submitting
    });
  }

  List<DropdownMenuItem<String>> options = [
    const DropdownMenuItem(value: 'Customer', child: Text('Customer')),
    const DropdownMenuItem(value: 'Farmer', child: Text('Farmer')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).size.height * .08),
            width: MediaQuery.of(context).size.width * .75,
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'First name'),
                    name: 'First Name',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(10),
                        FormBuilderValidators.maxLength(20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Last Name'),
                    name: 'Last Name',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(10),
                        FormBuilderValidators.maxLength(20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'user name'),
                    name: 'username',
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(5),
                        FormBuilderValidators.maxLength(20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    key: _emailFieldKey,
                    name: 'email',
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    name: 'Phone Number',
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
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
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(height: 10),
                  FormBuilderDropdown(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Select role'),
                    name: 'Select Role',
                    items: options,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onChanged: (value) {
                      setState(() {
                        selectedRole = value; // Update the selected role
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size.fromHeight(80)),
                    ),
                    onPressed: onSubmit,
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
