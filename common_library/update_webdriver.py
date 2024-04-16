import os
import shutil
from Linkedin.Library.variables import *

from webdriver_manager.chrome import ChromeDriverManager
current_directory = os.getcwd()
print("Current working directory:", current_directory)
driver_path = current_directory+existing_chromedriver_path_with_chromdriver
driver_download_path = current_directory+download_new_chromdriver_path


def install_latest_chromedriver():
    try:
        os.remove(driver_path)
        print("Existing chromedriver deleted successfully")
    except FileNotFoundError:
        print("Chrome driver file not found error")
    except Exception as e:
        print(e)
    driver_path_name = ChromeDriverManager().install()
    if os.path.exists(driver_path_name):
        shutil.move(driver_path_name, os.path.join(driver_download_path, "chromedriver"))
    print("latest_chrome-driver_installed")


if __name__ == "__main__":
    install_latest_chromedriver()