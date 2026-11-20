TAILOR SHOP - ANDROID APP (APK) BANANE KE STEPS
================================================
Note: yeh project maine yahan build/test nahi kiya (internet band tha). Pehli baar build kar ke phone par zaroor check karein
(bill image, backup, restore).

TARIQA 1 - GitHub free (Android Studio nahi chahiye) - ASAN
  1) GitHub par naya repository banayein aur android-app folder ki SAARI files upload karein
     (.github folder, tailor.keystore, patch-android.sh samait).
  2) Repository > Actions > "Build APK" > Run workflow.
  3) Kuch minute baad "TailorShop-APK" artifact se app-debug.apk download kar ke phone mein install karein
     (Settings mein "Install unknown apps" allow karna hoga).

TARIQA 2 - Computer par (Node.js 18+, Java 17, Android Studio/SDK)
        npm install
        npx cap add android
        bash patch-android.sh
        npx cap sync android
        cd android && ./gradlew assembleDebug
     APK: android/app/build/outputs/apk/debug/app-debug.apk

ZAROORI: tailor.keystore
  Is file se app "sign" hoti hai. Hamesha yahi file istemal karein, tab naya APK purane ke UPAR install hota hai
  aur data bacha rehta hai. Agar kisi aur key se bana kar install karenge to Android purani app uninstall karwayega.
  Is file ki copy safe jagah rakhein.

APP UPDATE: www/index.html badlein, dobara build karein, naya APK purane ke upar install karein.

DATA KAHAN HAI / UNINSTALL PAR KYA HOTA HAI
  - Android ka usool: app ke andar ka data uninstall par hamesha khatam hota hai (koi app is se bach nahi sakti).
  - Is liye app har tabdeeli ke 3 second baad, aur roz (app kholne/wapas aane par ya har ghante check) phone ke
    Documents/TailorShop folder mein backup likhti hai:
        auto-backup.json  (taaza)
        backup-YYYY-MM-DD.json  (roz ki, akhri 14 din)
    Yeh folder app uninstall hone par phone mein rehta hai.
  - Dobara install karne par app khali ho to Documents/TailorShop se khud purana backup dhoondti hai aur
    wapas lane ki ijazat mangti hai. Android 11+ par kuch phones purani files parhne nahi dete; tab
    "Restore from Backup File" se Documents/TailorShop ki file chun lein.
  - Documents/TailorShop folder delete na karein. Ahem: mahine mein aik baar backup file Google Drive/WhatsApp par bhi rakhein.
  - Roz ka backup tab banta hai jab app khuli ho ya phone par kholi jaye (Android band app ko background mein chalne nahi deta).
