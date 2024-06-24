import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internshala_assignment_prince_soni/features/search_page/bloc/search_bloc.dart';

class DurationDropDown extends StatefulWidget {
  const DurationDropDown({super.key});

  @override
  State<DurationDropDown> createState() => _DurationDropDownState();
}

class _DurationDropDownState extends State<DurationDropDown> {
  @override
 String _months = 'any'; 
 // Default tone
  @override
  Widget build(BuildContext context) {
  SearchBloc bloc=BlocProvider.of<SearchBloc>(context,listen: false);
  _months=bloc.duration;
    return Container(
      
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(10),
        dropdownColor: Colors.white,
        style: TextStyle(fontWeight: FontWeight.w400,color:Colors.grey.shade800,fontSize: 12),
        value: _months,
        isExpanded: true, // Expand dropdown to fill the box width
        icon:  Icon(Icons.arrow_drop_down, color: Colors.grey.shade500),
        underline: const SizedBox(), // Remove the default underline
        onChanged: (String? newValue) {
          setState(() {
            bloc.add(UpdateDuration(newDuration: newValue??"any"));
            _months = newValue!;
           
          });
        },
        items: <String>[
           'any','1', '2','3','4', '6', '12','24','36',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}