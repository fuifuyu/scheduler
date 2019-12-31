import 'package:flutter/material.dart';
import 'themes.dart';
import 'navBar.dart';

import 'package:scheduler/screens/timerScreen.dart';
import 'package:scheduler/screens/calendarScreen.dart';
import 'package:scheduler/screens/taskListScreen.dart';
import 'package:scheduler/screens/statsScreen.dart';

import 'package:scheduler/bloc/navBar/navbar_bloc.dart';

import 'package:scheduler/globals.dart';

class LayoutTemplate extends StatefulWidget {
  _LayoutTemplateState createState() => _LayoutTemplateState();

  static Widget getPageWidget(Widget screen, BottomNavBarBloc bloc){
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: backgroundGradient(),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    heightFactor: 0.95,

                    child: screen,
                  ),
                ),

                if(bloc != null) NavBar(bloc: bloc)              
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  final BottomNavBarBloc _bloc = BottomNavBarBloc();

  @override
  Widget build(BuildContext context) {
    ScreenData.setHeightWidth(MediaQuery.of(context));

    return StreamBuilder(
        stream: _bloc.page,
        builder: (context, snapshot) {
        Widget screen;
          switch(_bloc.getPage()) {
            case Pages.timer:
              screen = TimerScreen();
              break;
            case Pages.calendar:
              screen = CalendarScreen();
              break;
            case Pages.taskList:
              screen = TaskListScreen();
              break;
            default:
              screen = StatsScreen();
            }
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body:LayoutTemplate.getPageWidget(screen, _bloc),
          );
        },
    );
  }
}


// Widget Page(BottomNavBarBloc _bloc) {
//   return Stack(
//     children: [
//       Positioned.fill(
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [darkRed[700], orange[700]],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter),
//           ),

//           child : Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: EdgeInsets.only(top: 50.0, left: 10.0, right: 10.0),
//                   child: StreamBuilder(
//                     stream: _bloc.page,
//                     builder: (context, snapshot) {
//                         final pages = [TimerScreen(), CalendarScreen(bloc: _bloc), ScheduleScreen(bloc: _bloc), TaskListScreen()];
//                         switch(_bloc.getPage()) {
//                           case Pages.timer:
//                             return pages[0];
//                           case Pages.calendar:
//                             return pages[1];
//                           case Pages.schedule:
//                             return pages[2];
//                           case Pages.taskList:
//                             return pages[3];
//                           default:
//                             return pages[0];
//                         }
//                       },
//                     ),
//                 ),
//               ),

//               NavBar(bloc: _bloc),
//             ],
//           ),
//         ),
//       ),
//     ],
//   );
// }