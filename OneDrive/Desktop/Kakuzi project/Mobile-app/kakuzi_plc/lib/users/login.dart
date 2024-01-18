import 'package:kakuzi_plc/imports.dart';

// ignore: must_be_immutable
class CustomerLogin extends StatefulWidget {
  String userType;

  // Constructor
  CustomerLogin({
    super.key, // Pass the key parameter to the constructor
    required this.userType,
  }); // Pass the key to the super constructor

  @override
  State<CustomerLogin> createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  // Global Keys for form fields
  final _formKey = GlobalKey<FormBuilderState>();
  final _userName = GlobalKey<FormBuilderState>();
  final _password = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> _emailFieldKey =
      GlobalKey<FormBuilderState>();

  void onSubmit() {
    _formKey.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsetsDirectional.only(
                top: MediaQuery.of(context).size.height * .20),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * .75,
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  // Username Text Field
                  FormBuilderTextField(
                    key: _userName,
                    name: 'name',
                    decoration: const InputDecoration(
                        labelText: 'Username', border: OutlineInputBorder()),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Email Text Field
                  FormBuilderTextField(
                    key: _emailFieldKey,
                    name: 'email',
                    decoration: const InputDecoration(
                        labelText: 'Email', border: OutlineInputBorder()),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  const SizedBox(height: 10),

                  // Password Text Field
                  FormBuilderTextField(
                    key: _password,
                    name: 'password',
                    decoration: const InputDecoration(
                        labelText: 'Password', border: OutlineInputBorder()),
                    obscureText: true,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                  ),
                  const SizedBox(height: 20),

                  // Login Button
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize:
                          MaterialStateProperty.all(const Size.fromHeight(60)),
                    ),
                    onPressed: onSubmit,
                    child: const Text('Login',
                        style: TextStyle(color: Colors.white)),
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
