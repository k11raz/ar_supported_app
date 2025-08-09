import 'package:bus/app/core/extensions/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Required for SystemUiOverlayStyle
import 'package:get/get.dart';

class IAppBar extends StatelessWidget implements PreferredSizeWidget {
  const IAppBar({
    super.key,
    this.title,
    this.showBackArrow = true,
    this.leadingIcon,
    this.actions,
    this.leadingOnPressed,
    this.bottom,
    this.backgroundColor,
    this.centerTitle = false,
    this.elevation = 0.0,
    this.systemOverlayStyle,
    this.leadingIconColor,
    this.leadingButtonBackgroundColor,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final bool centerTitle;
  final double elevation;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Color? leadingIconColor;
  final Color? leadingButtonBackgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appBarTheme = theme.appBarTheme;
    final iconTheme = appBarTheme.iconTheme ?? const IconThemeData(color: Colors.black);
    final resolvedOverlayStyle = systemOverlayStyle ?? theme.systemUiOverlayStyle;

    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? appBarTheme.backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      systemOverlayStyle: resolvedOverlayStyle,
      leading: showBackArrow
          ? Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: leadingIconColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: leadingIconColor ?? iconTheme.color ?? Colors.black,
                  ),
                  onPressed: leadingOnPressed ?? () => Get.back(),
                ),
              ),
            )
          : leadingIcon != null
              ? IconButton(
                  onPressed: leadingOnPressed,
                  icon: Icon(leadingIcon,
                      color: leadingIconColor ?? iconTheme.color ?? Colors.black),
                )
              : null,
      title: DefaultTextStyle(
        style: appBarTheme.titleTextStyle ?? const TextStyle(),
        child: title ?? const SizedBox.shrink(),
      ),
      actions: actions,
      bottom: bottom,
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
