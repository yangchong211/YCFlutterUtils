
package com.yc.na_plugin.provider;

import android.os.Environment;

import com.yc.na_plugin.base.BaseConstants;
import com.yc.na_plugin.base.BaseMethodConstants;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import io.flutter.util.PathUtils;

/**
 * <pre>
 *     author: 杨充
 *     blog  : https://juejin.cn/user/1978776659695784
 *     time  : 2019/03/13
 *     desc  : PathProviderPlugin
 * </pre>
 */
public class PathProviderPlugin implements MethodCallHandler {
  
    private final Registrar mRegistrar;

    /**
     * 注册
     * @param registrar                 registrar对象
     */
    public static void registerWith(Registrar registrar) {
        BinaryMessenger messenger = registrar.messenger();
        MethodChannel channel = new MethodChannel(messenger, BaseConstants.PATH_PROVIDER_KEY);
        PathProviderPlugin instance = new PathProviderPlugin(registrar);
        channel.setMethodCallHandler(instance);
    }

    private PathProviderPlugin(Registrar registrar) {
        this.mRegistrar = registrar;
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
      if (result==null){
        return;
      }
        switch (call.method) {
            case BaseMethodConstants.GET_TEMPORARY_DIRECTORY:
                result.success(getPathProviderTemporaryDirectory());
                break;
            case BaseMethodConstants.GET_APPLICATION_DOCUMENTS_DIRECTORY:
                result.success(getPathProviderApplicationDocumentsDirectory());
                break;
            case BaseMethodConstants.GET_STORAGE_DIRECTORY:
                result.success(getPathProviderStorageDirectory());
                break;
            default:
                result.notImplemented();
        }
    }

    private String getPathProviderTemporaryDirectory() {
        return mRegistrar.context().getCacheDir().getPath();
    }

    private String getPathProviderApplicationDocumentsDirectory() {
        return PathUtils.getDataDirectory(mRegistrar.context());
    }

    private String getPathProviderStorageDirectory() {
        return Environment.getExternalStorageDirectory().getAbsolutePath();
    }
}
