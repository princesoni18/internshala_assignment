import 'package:flutter/material.dart';
import 'package:internshala_assignment_prince_soni/models/internship_model.dart';
import 'package:internshala_assignment_prince_soni/widgets/custom_button.dart';
import 'package:internshala_assignment_prince_soni/widgets/grey_button_card.dart';
import 'package:internshala_assignment_prince_soni/widgets/status_card.dart';

class ApplicationCard extends StatelessWidget {

  final InternshipModel details;
  const ApplicationCard({super.key,required this.details});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(14),
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black.withOpacity(0.1))),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // all the elements are divided into different widgets
          const StatusCard(status: "Actively hiring"),
          const SizedBox(height: 10,),
          titleRow(details.title, details.company_name??"",context),
          const SizedBox(
            height: 20,
          ),

          locationRow("Mumbai", colors.tertiary),
          const SizedBox(height: 15,),
          durationRow("Starts immediately", details.duration),

          //stipend row
          const SizedBox(height: 15,),
          rowWithIcon(details.stipend, Icons.money),
          const SizedBox(height: 15,),

          
           GreyCard(text: details.ppo!=null&&details.ppo==true?"${details.employmentType} with job offer ":details.employmentType),
          const SizedBox(height: 15,),

           GreyCard(text: details.postedDate??"recently",icon: Icons.restore,),
          const SizedBox(height: 10,),

           Divider(color: Colors.grey.shade300,),
           const SizedBox(height: 5,),
           applyRow(colors.primary),

        ],
      ),
    );
  }





Widget applyRow(Color color){
return Row(
  children: [

    Expanded(child: Container()),
    CustomButton(bgColor: Colors.white, text: "View Details", textColor: color),
    const SizedBox(width: 10,),
    CustomButton(bgColor: color, text: "Apply now", textColor: Colors.white),
  ],
);

}
  Widget titleRow(String role, String companyName,BuildContext context) {
    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            role,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          
           Expanded(
            
      child: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown, // Scale down the text to fit within the space
        child: Text(
         companyName.length>30? "${companyName.substring(0,20)}...":companyName,
          style: TextStyle(
            color: Colors.grey.shade700,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ),
          Container(
          height: 50,
          width: 50,
          child: Image.asset(
            "assets/internshala_logo.png",
            fit: BoxFit.cover,
          ),
        )
        ]),
        
      ],
    );
  }





  Widget locationRow(String loaction, Color color) {
    return rowWithIcon(details.location??"", Icons.pin_drop_outlined);
  }

  Widget durationRow(String start, String totalTime) {
    return Row(
      children: [
        rowWithIcon("Starts Immediately", Icons.play_circle_outline_outlined),
        const SizedBox(
          width: 15,
        ),
        rowWithIcon(totalTime, Icons.calendar_today_rounded)
      ],
    );
  }

  Widget rowWithIcon(String text, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black.withOpacity(0.5),
          size: 14,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 12),
        )
      ],
    );
  }
}
