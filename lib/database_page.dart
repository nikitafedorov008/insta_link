import 'package:flutter/material.dart';
import 'widgets/create_requisition_widget.dart';
import 'model/form.dart';
import 'form_controller.dart';

class DatabaseMobileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Places',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: DatabasePageMobile(title: "Places"));
  }
}

class DatabasePageMobile extends StatefulWidget {
  DatabasePageMobile({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DatabasePageMobileState createState() => _DatabasePageMobileState();
}

class _DatabasePageMobileState extends State<DatabasePageMobile> {
  List<FeedbackForm> feedbackItems = List<FeedbackForm>();

  // Method to Submit Feedback and save it in Google Sheets

  @override
  void initState() {
    super.initState();

    FormController().getFeedbackList().then((feedbackItems) {
      setState(() {
        this.feedbackItems = feedbackItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: ()=> Navigator.pop(context),
        ),
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateRequisitionWidget(),
                  )
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: feedbackItems.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: Column(
              children: [
                ListTile(
                  title: Row(
                    children: <Widget>[
                      //Icon(Icons.description),
                      Expanded(
                        child: Text(feedbackItems[index].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,),),
                      )
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        children: <Widget>[
                          Icon(Icons.message, color: Colors.grey,),
                          SizedBox(width: 4,),
                          Text(feedbackItems[index].email),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.category, color: Colors.grey,),
                          SizedBox(width: 4,),
                          Text(feedbackItems[index].phone),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.map, color: Colors.grey,),
                          SizedBox(width: 4,),
                          Text(feedbackItems[index].comment),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.map, color: Colors.grey,),
                          SizedBox(width: 4,),
                          Text(feedbackItems[index].dateFrom),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.map, color: Colors.grey,),
                          SizedBox(width: 4,),
                          Text(feedbackItems[index].dateTo),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: [
            Icon(Icons.refresh),
            SizedBox(width: 4,),
            Text('Refresh database')
          ],
        ),
        onPressed: () {
          FormController().getFeedbackList().then((feedbackItems) {
            setState(() {
              this.feedbackItems = feedbackItems;
            });
          });
        },
      ),
    );
  }
}