package com.yc.na_plugin.log;


import androidx.annotation.NonNull;

import com.yc.na_plugin.base.BaseConstants;
import com.yc.na_plugin.util.LogUtils;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class LoggerPlugin implements MethodCallHandler{

    private final PluginRegistry.Registrar mRegistrar;

    /**
     * 注册
     * @param registrar                 registrar对象
     */
    public static void registerWith(PluginRegistry.Registrar registrar) {
        BinaryMessenger messenger = registrar.messenger();
        MethodChannel channel = new MethodChannel(messenger, BaseConstants.PATH_LOG_KEY);
        LoggerPlugin instance = new LoggerPlugin(registrar);
        channel.setMethodCallHandler(instance);
    }

    private LoggerPlugin(PluginRegistry.Registrar registrar) {
        this.mRegistrar = registrar;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        String tag = call.argument("tag");
        String param = call.argument("param");
        switch (call.method) {
            case "info":
                LogUtils.i("" + tag + " | " +param);
                break;
            case "debug":
                LogUtils.d("" + tag + " | " +param);
                break;
            case "error":
                LogUtils.e("" + tag + " | " +param);
                break;
            case "warning":
                LogUtils.w("" + tag + " | " +param);
                break;
        }
    }

}
