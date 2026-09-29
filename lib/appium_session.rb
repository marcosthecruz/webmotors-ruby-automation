require 'appium_lib_core'

class AppiumSession
  def self.iniciar
    opcoes = {
      capabilities: {
        'platformName' => 'Android',
        'appium:automationName' => 'UiAutomator2',
        'appium:deviceName' => 'Android',
        'appium:udid' => 'emulator-5554',
        'appium:appPackage' => 'hands.android.webmotors',
        'appium:appWaitActivity' => '.mvvm.view.home.HomeActivity',
        'appium:ignoreHiddenApiPolicyError' => true,
        'appium:skipDeviceInitialization' => true,
        'appium:noReset' => true
      }
    }

    Appium::Core.for(opcoes).start_driver
  end
end