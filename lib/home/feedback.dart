import 'package:flutter/material.dart';
import 'package:flutter_app/constant.dart';
import 'package:flutter_app/destination/home_view.dart';
import 'package:flutter_app/model/Feedbacks.dart';
import 'package:flutter_app/service/Api.dart';

class FeedbackPage extends StatefulWidget {
  FeedbackPage({Key key}) : super(key: key);
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Api _apiService = Api();

  bool _isFieldNameValid;
  bool _isFieldEmailValid;
  bool _isFieldFeedValid;
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerFeed = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(1),
          child: Column(
            children: <Widget>[
              Flexible(
                  flex: 2,
                  child: Container(
                    width: 600,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9.0))),
                      elevation: .0,
                      color: TrainPallete.blueAccent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "FEEDBACK.",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          Text(
                            "Terima kasih telah membantu kami",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: _buildTextFieldName())),
              Flexible(
                  flex: 1,
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: _buildTextFieldEmail())),
              Flexible(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: _buildTextFieldFeed(),
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Send'),
          onPressed: () {
            if (_isFieldNameValid == null ||
                _isFieldEmailValid == null ||
                _isFieldFeedValid == null ||
                !_isFieldNameValid ||
                !_isFieldEmailValid ||
                !_isFieldFeedValid) {
              _scaffoldKey.currentState.showSnackBar(
                SnackBar(
                  content: Text("Please fill all field"),
                ),
              );

              return;
            }
           
            String name = _controllerName.text.toString();
            String email = _controllerEmail.text.toString();
            String feed = _controllerFeed.text.toString();

            Feedbacks feedback =
                Feedbacks(nama: name, email: email, saran: feed);

            _apiService.createFeedback(feedback).then((isSuccess) {
            
              if (isSuccess) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => (HomePage())));
              } else {
               _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text("Submit data failed")));
              }
            });
          },
          icon: Icon(Icons.send),
        ),
      ),
    );
  }

  Widget _buildTextFieldName() {
    return TextField(
      controller: _controllerName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: "Nama",
        errorText: _isFieldNameValid == null || _isFieldNameValid
            ? null
            : "Nama harus disi",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNameValid) {
          setState(() => _isFieldNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldEmail() {
    return TextField(
      controller: _controllerEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: "Email",
        errorText: _isFieldEmailValid == null || _isFieldEmailValid
            ? null
            : "Email harus disi",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldEmailValid) {
          setState(() => _isFieldEmailValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldFeed() {
    return TextField(
      controller: _controllerFeed,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding:
            new EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.message),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: "Feed",
        errorText: _isFieldFeedValid == null || _isFieldFeedValid
            ? null
            : "Feed harus disi",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldFeedValid) {
          setState(() => _isFieldFeedValid = isFieldValid);
        }
      },
    );
  }
}
