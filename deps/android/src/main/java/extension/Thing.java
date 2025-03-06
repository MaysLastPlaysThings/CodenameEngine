package extension;

import android.Manifest;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.Settings;
import android.content.pm.PackageManager;
import androidx.core.content.ContextCompat;
import org.haxe.extension.Extension;

import java.util.Arrays;

public class Thing extends Extension {
    public static String getExternalStorageDir() {
        return Environment.getExternalStorageDirectory().getPath();
    }

    public static String getFilesDir() {
        return mainContext.getFilesDir().getAbsolutePath();
    }

    public static boolean hasPermission(String permission) {
        return ContextCompat.checkSelfPermission(mainContext, permission) == PackageManager.PERMISSION_GRANTED;
    }
    
    public static boolean hasManageExternalStoragePermission()
    {
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            return Environment.isExternalStorageManager();
        }
        return false;
    }

    public static void requestPermissions(String[] permissions, int requestCode) {
        mainActivity.requestPermissions(permissions, requestCode);
    }

    public static void openAppSettings(String perm) {
        Intent intent = new Intent(perm);
        Uri uri = Uri.fromParts("package", mainContext.getPackageName(), null);
        intent.setData(uri);
        mainContext.startActivity(intent);
    }

    public static void requestManageExternalStorage() {
        openAppSettings(Settings.ACTION_MANAGE_APP_ALL_FILES_ACCESS_PERMISSION);
    }

    public static int getSDKVersion() {
        return Build.VERSION.SDK_INT;
    }
}