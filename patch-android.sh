#!/bin/bash
# Run AFTER "npx cap add android" (workflow does this automatically)
set -e
M=android/app/src/main/AndroidManifest.xml
G=android/app/build.gradle
python3 - <<'PY'
import re
m='android/app/src/main/AndroidManifest.xml'
s=open(m,encoding='utf-8').read()
if 'READ_EXTERNAL_STORAGE' not in s:
    s=s.replace('</manifest>','    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />\n    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />\n</manifest>')
if 'requestLegacyExternalStorage' not in s:
    s=s.replace('<application','<application android:requestLegacyExternalStorage="true"',1)
open(m,'w',encoding='utf-8').write(s)
g='android/app/build.gradle'
t=open(g,encoding='utf-8').read()
if 'tailor.keystore' not in t:
    t+='''
android {
    signingConfigs {
        debug {
            storeFile file("../../tailor.keystore")
            storePassword "tailor123"
            keyAlias "tailor"
            keyPassword "tailor123"
        }
    }
}
'''
open(g,'w',encoding='utf-8').write(t)
print('patched')
PY
