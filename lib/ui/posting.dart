
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_technology/models/entry.dart';
import 'package:software_technology/models/entry_detailed_model.dart';
import 'package:software_technology/models/tag.dart';
import 'package:software_technology/models/topic.dart';
import 'package:software_technology/models/users.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:software_technology/provider/provider.dart';

class Posting extends StatefulWidget {
  @override
  _PostingState createState() => _PostingState();
}

class _PostingState extends State<Posting> {
  Entry entry;
  Topic topic;
  List<Tag> tags;
  int rankUp;
  int rankDown;
  Users user;
  int fav;

  String topicName;

  validatString(String value) {
    if (value == null || value == '') {
      return 'this field is required';
    }
  }

  saveValue(String value) {
    this.entry = Entry(value: value);
  }
List<String> topicList=[];
List<String> tagList=[];
topicsListToString(context){

for(int i =0 ; i<Provider.of<AppProvider>(context).allTopicsList.length ; i++){
 topicList.add(Provider.of<AppProvider>(context).allTopicsList[i].value);
}
return topicList;
}

tagsListToString(context){

for(int i =0 ; i<Provider.of<AppProvider>(context).listOfAllTags.length ; i++){
 tagList.add(Provider.of<AppProvider>(context).listOfAllTags[i].value);
}
return tagList;
}

getTopic(String name){
  for(int i =0 ; i<topicList.length;i++){
    if(name==topicList[i]){
      return i;
    }
  }
}
submitForm(context) async{
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
        print('ASDFGHJKL;');

      await Provider.of<AppProvider>(context , listen: false).addNewEntry(EntryDetaild(
        entry: this.entry,
        rankDown: 1,
        rankUp: 1,
        tags: Provider.of<AppProvider>(context,listen: false).listOfAllTags,
        fav: 2,
        topic: Provider.of<AppProvider>(context , listen: false).allTopicsList[getTopic( topicName)],
        user: Provider.of<AppProvider>(context,listen: false).user
      ));

      Navigator.of(context).pop();
    } else {
      return;
    }
}
     
  

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding new post'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
                  child: Column(
            children: [
               SizedBox(height: 30,),
              CustomTextField(
                textInputType: TextInputType.number,
                label: 'Subject',
                validationFun: validatString,
                saveFormField: saveValue,
              ),
              SizedBox(height: 30,),
              DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: topicsListToString(context),
                  label: "Menu mode",
                  hint: "country in menu mode",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: (value){
                    this.topicName = value;

                  },
                  selectedItem: 'Choos topic related to the post'),
                   SizedBox(height: 30,),
              DropdownSearch<String>(
                  mode: Mode.MENU,
                  showSelectedItem: true,
                  items: tagsListToString(context),
                  label: "Menu mode",
                  hint: "country in menu mode",
                  popupItemDisabled: (String s) => s.startsWith('I'),
                  onChanged: print,
                  selectedItem: 'Choose tag related to the post'),
                                     SizedBox(height: 30,),

                  GestureDetector(
                    onTap: (){

                      submitForm(context);

                    },
                    child: Container(
                      decoration: BoxDecoration(color:Colors.green, borderRadius: BorderRadius.all(Radius.circular(15))),
                      height: 30,
                      width: 150,
                      child: Center(child: Text('Add new Post' ,style: TextStyle(fontSize: 20 , color: Colors.white),)),
                    ),
                  )
                  
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final Function validationFun;
  final Function saveFormField;
  final TextInputType textInputType;
  CustomTextField(
      {this.label, this.validationFun, this.saveFormField, this.textInputType});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      keyboardType: textInputType,
      onSaved: (newValue) => saveFormField(newValue),
      validator: (value) => validationFun(value),
      decoration: InputDecoration(
          fillColor: Colors.blueAccent,
          filled: true,
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
    );
  }
}
