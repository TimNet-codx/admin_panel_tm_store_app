import 'package:admin_panel_tm_store_app/utils/constants/image_strings.dart';
import 'package:admin_panel_tm_store_app/utils/constants/sizes.dart';
import 'package:admin_panel_tm_store_app/utils/constants/text_strings.dart';
import 'package:admin_panel_tm_store_app/view/Dashboard/DashboardScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
          height: 150 ,
          image: AssetImage( TImages.darkAppLogo) ,),
           const SizedBox(height: TSizes.sm,),
           Text(
              TTexts.loginTitle,
              style: GoogleFonts.getFont('Lato', color: Color(0xFF0d120E),  fontWeight: FontWeight.bold, letterSpacing: 0.2, fontSize: 23 ),
          ),
           const SizedBox(height: TSizes.sm,),
          Text(
            TTexts.loginSubTitle,
            style: GoogleFonts.getFont('Lato', color: Colors.grey,  fontWeight: FontWeight.bold, letterSpacing: 0.2, fontSize: 13),
          ),
          const SizedBox(height: 35),
      
          // Email
          TextFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right,), labelText: TTexts.email),
          ),
      
          const SizedBox(height: TSizes.spaceBtwInputFields,),
          // Password
          TextFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.password_check,),labelText: TTexts.password, suffixIcon: Icon(Iconsax.eye_slash)),
          ),
      
           const SizedBox(height: TSizes.spaceBtwInputFields / 2),
              // Remember Me & Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Row(children: [
                  Checkbox(value: true, onChanged: (value) {}, activeColor: Color(0xFF103DE5), ),
                  const Text(TTexts.rememberMe,  style: TextStyle(color: Color(0xFF103DE5)),)       
                ],),
                // Forgot Password
                TextButton(onPressed: () => {}, child: const Text(TTexts.forgetPassword, style: TextStyle(color: Color(0xFF103DE5)),)),
              ],),
      
         const SizedBox(height: TSizes.spaceBtwSections,),
      
          // Sign In button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (contest)=> DashboardScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff3f5efb),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                TTexts.signIn,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}