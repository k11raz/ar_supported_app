import 'package:auto_route/auto_route.dart';
import 'package:bus/app/app.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingUserView extends StatelessWidget {
  const SettingUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.qr_code, color: Colors.white),
          onPressed: () {},
        ),
        title: Text(
          'GURAL QR',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMenuItem('PURCHASES', () {}),
              _buildMenuItem('RETURNS', () {}),
              _buildMenuItem('NOTIFICATIONS [3]', () {}, hasNotification: true),
              _buildMenuItem('PROFILE', () {}),
              _buildMenuItem('LOCATION | TURKEY', () {}),
              _buildSettingsMenuItem(),
              SizedBox(height: 32),
              _buildMenuItem('FAVORITES', () {}),
              _buildMenuItem('STORES', () {}),
              _buildMenuItem('LOGOUT', () {
                sl<UserCacheService>().removeToken();
                context.router.push(HomeRoute());
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    String title,
    VoidCallback onPressed, {
    bool hasNotification = false,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                if (hasNotification)
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            Icon(Icons.chevron_right, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsMenuItem() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SETTINGS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'New version of the App available',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }
}
