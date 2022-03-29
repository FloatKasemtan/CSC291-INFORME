import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({Key? key}) : super(key: key);

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  var _controller = TextEditingController();
  var _controller1 = TextEditingController();
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
      padding: const EdgeInsets.only(
        top: 155,
        right: 25,
        left: 25,
        bottom: 80,
      ),
      child: Column(
        children: [
          TextFormField(
            onChanged: ((value) {
              setState(() {});
            }),
            controller: _controller,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.assignment_ind_rounded,
                color: Color(0xFF141D3B),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              hintText: 'Username',
              // icon: Icon(
              //   Icons.assignment_ind_rounded,
              //   color: Colors.white,
              // ),
              fillColor: Color.fromARGB(130, 255, 255, 255),
              filled: true,
              // suffixIcon: Padding(
              //   padding: EdgeInsets.all(0),
              //   child: Icon(Icons.clear),
              // ),
              suffixIcon: _controller.text.isEmpty
                  ? null
                  : IconButton(
                      onPressed: (() => _clearTextField(_controller)),
                      icon: Icon(
                        Icons.clear,
                        color: Colors.black54,
                      ),
                    ),
            ),
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Color(0xFF141D3B),
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
              controller: _controller1,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.key_rounded,
                  color: Color(0xFF141D3B),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                hintText: 'Password',
                fillColor: Color.fromARGB(130, 255, 255, 255),
                filled: true,
                // suffixIcon: Padding(
                //   padding: EdgeInsets.all(0),
                //   child: Icon(Icons.clear),
                // ),
                suffixIcon: _controller1.text.isEmpty
                    ? null
                    : IconButton(
                        onPressed: (() => _clearTextField1(_controller1)),
                        icon: Icon(
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
                color: Color(0xFF141D3B),
              ),

              cursorColor: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
