#!/usr/bin/env zsh

SCRIPT_DIR=${0:a:h}
cd "$SCRIPT_DIR"

# Create app bundle structure
echo "Creating app bundle structure..."
rm -rf UKMM.app
mkdir -p UKMM.app/Contents/Resources
mkdir -p UKMM.app/Contents/MacOS

# create Info.plist
PLIST="<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">
<plist version=\"1.0\">
<dict>
	<key>CFBundleDevelopmentRegion</key>
	<string>English</string>
	<key>CFBundleGetInfoString</key>
	<string>UKMM</string>
	<key>CFBundleExecutable</key>
	<string>ukmm</string>
	<key>CFBundleIconFile</key>
	<string>ukmm.icns</string>
	<key>CFBundleIdentifier</key>
	<string>com.github.ukmm</string>
	<key>CFBundleInfoDictionaryVersion</key>
	<string>6.0</string>
	<key>CFBundleName</key>
	<string>UKMM</string>
	<key>CFBundlePackageType</key>
	<string>APPL</string>
	<key>CFBundleSupportedPlatforms</key>
	<array>
		<string>MacOSX</string>
	</array>
	<key>LSArchitecturePriority</key>
	<array>
		<string>arm64</string>
	</array>
	<key>CFBundleVersion</key>
	<string>1.0</string>
	<key>LSMinimumSystemVersion</key>
	<string>11.0</string>
	<key>NSPrincipalClass</key>
	<string>NSApplication</string>
	<key>NSHumanReadableCopyright</key>
	<string>UKMM Dev Team</string>
	<key>NSHighResolutionCapable</key>
	<true/>
	<key>LSApplicationCategoryType</key>
	<string>public.app-category.games</string>
</dict>
</plist>
"
echo "${PLIST}" > UKMM.app/Contents/Info.plist

# Create PkgInfo
PKGINFO="-n APPLUKMM"
echo "${PKGINFO}" > UKMM.app/Contents/PkgInfo


# Bundle resources
cp -R ukmm UKMM.app/Contents/MacOS/
cp -R ukmm.icns UKMM.app/Contents/Resources/

codesign --force --deep --sign - UKMM.app/Contents/MacOS/ukmm