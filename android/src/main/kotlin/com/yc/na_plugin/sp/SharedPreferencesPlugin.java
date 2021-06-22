

package com.yc.na_plugin.sp;

import android.content.Context;

import com.yc.na_plugin.base.BaseConstants;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

/**
 * <pre>
 *     author: 杨充
 *     blog  : https://juejin.cn/user/1978776659695784
 *     time  : 2019/03/13
 *     desc  : SharedPreferencesPlugin
 * </pre>
 */
public class SharedPreferencesPlugin implements FlutterPlugin {

    private MethodChannel channel;

    @SuppressWarnings("deprecation")
    public static void registerWith(io.flutter.plugin.common.PluginRegistry.Registrar registrar) {
        BinaryMessenger messenger = registrar.messenger();
        final SharedPreferencesPlugin plugin = new SharedPreferencesPlugin();
        plugin.setupChannel(messenger, registrar.context());
    }

    @Override
    public void onAttachedToEngine(FlutterPlugin.FlutterPluginBinding binding) {
        setupChannel(binding.getBinaryMessenger(), binding.getApplicationContext());
    }

    @Override
    public void onDetachedFromEngine(FlutterPlugin.FlutterPluginBinding binding) {
        teardownChannel();
    }

    private void setupChannel(BinaryMessenger messenger, Context context) {
        channel = new MethodChannel(messenger, BaseConstants.PATH_SHARED_PREFERENCES_KEY);
        MethodCallHandlerImpl handler = new MethodCallHandlerImpl(context);
        channel.setMethodCallHandler(handler);
    }

    private void teardownChannel() {
        channel.setMethodCallHandler(null);
        channel = null;
    }
}
