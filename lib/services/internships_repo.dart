import 'dart:convert';

import 'package:internshala_assignment_prince_soni/models/internship_model.dart';

import 'package:http/http.dart' as http;
import 'package:internshala_assignment_prince_soni/services/api_url.dart';

class FetchInternships{






  static Future<List<InternshipModel>> loadInternships()async{



    try{
   var response= await http.get(Uri.parse(apiUrl));


   if(response.statusCode==200){

     

    var  data =jsonDecode(response.body);

   List<dynamic> ids=data["internship_ids"];
    
    
   List<InternshipModel> internships=[];
    
   for(int i=0;i<ids.length;i++){
     
    InternshipModel internship=InternshipModel.fromJson(data["internships_meta"][ids[i].toString()]);
    print(internship.profile);
    internships.add(internship);
   }


   return internships;
    
   }




   return [];
    }

    catch(e){

     
     return [];

    }
  }
}