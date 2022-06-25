import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({Key? key, required this.email, required this.password})
      : super(key: key);
  final TextEditingController email;
  final TextEditingController password;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  void _clearTextField(TextEditingController controller) {
    // Clear everything in the text field
    controller.clear();
    // Call setState to update the UI
    setState(() {});
  }

  void _clearTextField1(TextEditingController controller1) {
    // Clear everything in the text field
    controller1.clear();
    // Call setState to update the UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextFormField(
            onChanged: ((value) {
              setState(() {});
            }),
            controller: widget.email,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.person,
                color: Color(0xFF141D3B),
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              hintText: 'Email',
              // icon: Icon(
              //   Icons.assignment_ind_rounded,
              //   color: Colors.white,
              // ),
              fillColor: const Color.fromARGB(130, 255, 255, 255),
              filled: true,
              // suffixIcon: Padding(
              //   padding: EdgeInsets.all(0),
              //   child: Icon(Icons.clear),
              // ),
              suffixIcon: widget.email.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: (() => _clearTextField(widget.email)),
                      icon: const Icon(
                        Icons.clear,
                        color: Colors.black54,
                      ),
                    ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF141D3B),
            ),
            cursorColor: Colors.black54,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              // right: 25,
              // left: 25,
              // bottom: 80,
            ),
            child: TextFormField(
              onChanged: ((value) {
                setState(() {});
              }),
              controller: widget.password,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.key_rounded,
                  color: Color(0xFF141D3B),
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                hintText: 'Password',
                fillColor: const Color.fromARGB(130, 255, 255, 255),
                filled: true,
                // suffixIcon: Padding(
                //   padding: EdgeInsets.all(0),
                //   child: Icon(Icons.clear),
                // ),
                suffixIcon: widget.password.text.isEmpty
                    ? null
                    : IconButton(
                        onPressed: (() => _clearTextField1(widget.password)),
                        icon: const Icon(
                          Icons.clear,
                          color: Colors.black54,
                        ),
                      ),
              ),
              autofocus: false,
              obscureText: true,
              // style: const TextStyle(color: Color(0xFF141D3B)
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF141D3B),
              ),

              cursorColor: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
