import 'package:date_ranger/date_ranger.dart';
import 'package:flutter/material.dart';
import 'database_page.dart';
import '../model/form.dart';
import '../controller/form_controller.dart';

class FormWidget extends StatefulWidget {

  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  var initialDateRange = DateTimeRange(start: DateTime.now(), end: DateTime.now());

  // TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController dateFromController = TextEditingController();
  TextEditingController dateToController = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      FeedbackForm feedbackForm = FeedbackForm(
        nameController.text,
        emailController.text,
        phoneController.text,
        commentController.text,
        initialDateRange.start.toString(),
        initialDateRange.end.toString(),
      );

      FormController formController = FormController();

      _showSnackbar("Submitting requisition");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm, (String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Feedback is saved succesfully in Google Sheets.
          _showSnackbar("Кequisition Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      });
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constrains) {
          return OrientationBuilder(
              builder: (context, orienation) {
                return Scaffold(
                  key: _scaffoldKey,
                  //resizeToAvoidBottomPadding: false,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text('Booking', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Form(
                            key: _formKey,
                            child: Padding(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: TextFormField(
                                      controller: nameController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Valid Name';
                                        }
                                        return null;
                                      },

                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: new OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: new BorderSide(color: Colors.pink),
                                        ),
                                        enabledBorder: new OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: new BorderSide(color: Colors.grey[200]),
                                        ),
                                        labelText: 'Name and Surname',
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: TextFormField(
                                      controller: emailController,
                                      /*validator: (value) {
                            if (!value.contains("@")) {
                              return 'Enter Valid Description';
                            }
                            return null;
                          },*/
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: new OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: new BorderSide(color: Colors.pink),
                                        ),
                                        enabledBorder: new OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: new BorderSide(color: Colors.grey[200]),
                                        ),
                                        labelText: 'Email',
                                        prefixIcon: Icon(Icons.email),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: TextFormField(
                                      controller: phoneController,
                                      /*validator: (value) {
                            if (value.trim().length != 10) {
                              return 'Enter Type';
                            }
                            return null;
                          },*/
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: new OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: new BorderSide(color: Colors.pink),
                                        ),
                                        enabledBorder: new OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: new BorderSide(color: Colors.grey[200]),
                                        ),
                                        labelText: 'Phone / Whatsapp / Telegram',
                                        prefixIcon: Icon(Icons.phone),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: TextFormField(
                                      controller: commentController,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Enter Photo URL';
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: new OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: new BorderSide(color: Colors.pink),
                                        ),
                                        enabledBorder: new OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          borderSide: new BorderSide(color: Colors.grey[200]),
                                        ),
                                        prefixIcon: Icon(Icons.comment),
                                        labelText: 'Comment',
                                      ),
                                    ),
                                  ),
                                  //date ranger section
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: DateRanger(
                                      itemHeight: responsiveHeight(orienation, constrains),
                                      activeDateBottomSpace: responsiveBottom(orienation, constrains),
                                      borderColors: Colors.pink,
                                      activeItemBackground: Colors.pink,
                                      rangeBackground: Colors.pinkAccent[100],
                                      onRangeChanged: (range) {
                                        setState(() {
                                          initialDateRange = range;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        RaisedButton(
                          color: Colors.pink,
                          textColor: Colors.white,
                          onPressed: _submitForm,
                          child: Text('Book'),
                        ),
                      ],
                    ),
                  ),
                );
              }
          );
        }
    );
  }

  //card with text form widget
  responsiveHeight(orientation, constraints) {
    //double breakpointWidth = orientation == Orientation.portrait ? 200 : 400;
    double breakpointWidth = orientation == Orientation.portrait ? 600 : 800;
    double breakpointWidth2 = orientation == Orientation.portrait ? 900 : 1400;
    if (constraints.maxWidth < breakpointWidth) {
      return MediaQuery.of(context).size.width / 20;
    }  else if (constraints.maxWidth >= breakpointWidth2) {
      return MediaQuery.of(context).size.width / 24;
    }
  }

  responsiveBottom(orientation, constraints) {
    //double breakpointWidth = orientation == Orientation.portrait ? 200 : 400;
    double breakpointWidth = orientation == Orientation.portrait ? 600 : 800;
    double breakpointWidth2 = orientation == Orientation.portrait ? 900 : 1400;
    if (constraints.maxWidth < breakpointWidth) {
      return MediaQuery.of(context).size.width / 20;
    }  else if (constraints.maxWidth >= breakpointWidth2) {
      return MediaQuery.of(context).size.width / 24;
    }
  }
}

Widget cardForm(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(32.0),
    ),
    child: Container(
      height: 930,
      width: MediaQuery.of(context).size.width,
      child: FormWidget(),
    ),
  );
}