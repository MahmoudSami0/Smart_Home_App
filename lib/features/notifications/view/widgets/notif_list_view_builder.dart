
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smarthome/core/utils/widgets/custom_text.dart';

import '../../controller/notifictions_cubit.dart';
import 'notif_item_view.dart';

class NotificationsListViewBuilder extends StatelessWidget {
  const NotificationsListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationsCubit, NotificationsState>(
        listener: (context,index){},
        builder: (context, state) {


      if(state is NotificationsLoadingState){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }else{
        if (state is NotificationsSuccessState) {

          if(state.model.isEmpty){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/empty.svg",height: MediaQuery.of(context).size.height*0.7,),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(text: "The Notifications is Empty",isBold: true,fontSize: 20,),
              ],
            );
          }else{
            return ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    width: double.infinity,
                    child: Icon(Icons.delete,size: 50,color: Colors.white,),
                  ),
                  key: Key(state.model[index].body),
                  onDismissed: (direction) async{
                    // Handle item dismissal
                    await FirebaseFirestore.instance.collection('masseges').doc('${state.model[index].id}').delete();
                  },
                  child: NotificationItemView(
                    model: state.model[index],
                  ),
                );
              },
              itemCount: state.model.length,
            );
          }

        } else {
          return const Center(
              child: Icon(
                Icons.hourglass_empty,
                size: 100,
              ));
        }
      }
    });
  }
}
