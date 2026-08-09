import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kinguard/features/home/widgets/member_widget.dart';

class JoinMemberScreen extends StatelessWidget {
  const JoinMemberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            buildAppBar(context),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    buildSearchBar(),
                    SizedBox(height: 14.h),
                    buildSearchContactsBanner(),
                    SizedBox(height: 18.h),
                    buildPeopleHeader(),
                    SizedBox(height: 10.h),
                    buildUserCard(
                      name: 'Abdul',
                      phone: '+91 98765 43210',
                      avatar: 'https://i.pravatar.cc/150?img=12',
                      isOnline: true,
                      inContacts: true,
                      buttonText: 'Invite',
                      isFilled: true,
                    ),
                    SizedBox(height: 10.h),
                    buildUserCard(
                      name: 'Ahmed',
                      phone: '+91 91234 56789',
                      avatar: 'https://i.pravatar.cc/150?img=13',
                      isOnline: false,
                      inContacts: false,
                      buttonText: 'Add',
                      isFilled: false,
                    ),
                    SizedBox(height: 10.h),
                    buildUserCard(
                      name: 'Rahul',
                      phone: '+91 99887 66554',
                      avatar: 'https://i.pravatar.cc/150?img=14',
                      isOnline: false,
                      inContacts: false,
                      buttonText: 'Add',
                      isFilled: false,
                    ),
                    SizedBox(height: 18.h),
                    buildInviteViaCard(),
                    SizedBox(height: 14.h),
                    buildStayConnectedBanner(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
