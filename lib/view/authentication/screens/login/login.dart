import 'package:admin_panel_tm_store_app/utils/constants/image_strings.dart';
import 'package:admin_panel_tm_store_app/utils/constants/sizes.dart';
import 'package:admin_panel_tm_store_app/utils/constants/text_strings.dart';
import 'package:admin_panel_tm_store_app/view/authentication/screens/login/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isMobile = width < 600;

    return Scaffold(
      backgroundColor: const Color(0xffeef1f7),
      body: Center(
        child: Container(
          height: isMobile ? null : 750,
          width: isMobile ? width : 1700,
          padding: isMobile ? const EdgeInsets.all(20) : EdgeInsets.zero,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(isMobile ? 0 : 18),
          ),

          // SWITCH LAYOUT BASED ON SCREEN SIZE
          child: isMobile ? _mobileLoginForm() : _desktopLayout(),
        ),
      ),
    );
  }

  // DESKTOP / TABLET LAYOUT
  Widget _desktopLayout() {
    return Row(
      children: [
        // LEFT Illustration
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xff3f5efb),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                bottomLeft: Radius.circular(18),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 320,
                    child: Image(
                      fit: BoxFit.contain,
                      image: AssetImage( TImages.shoppingIllustration) ,),
                              ),
                   const SizedBox(height: TSizes.spaceBtwSections,),
                  Text(
                    TTexts.powerTitle,
                    style: GoogleFonts.getFont('Lato',
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),

        // RIGHT Login Form
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: TLoginForm(),
          ),
        ),
      ],
    );
  }

  // MOBILE LAYOUT (ONLY FORM)
  Widget _mobileLoginForm() {
    return SingleChildScrollView(
      child: TLoginForm(),
    );
  }

}


