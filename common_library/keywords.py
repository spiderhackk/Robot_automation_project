# from SeleniumLibrary import keywords
import os
import subprocess

import requests
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
from webdriver_manager.chrome import ChromeDriverManager
from selenium import webdriver
import shutil
import configparser


@library
class keywords:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def checking_tab_in_dashboard(self):
        i = 1
        tab_list = self.selLib.get_webelements('//div[@data-at="mega-menu"]/a/span')
        origianl_tab_name = []
        for j in tab_list:
            text = self.selLib.get_text('xpath:(//div[@data-at="mega-menu"]/a/span)[' + str(i) + ']')
            origianl_tab_name.append(text)
            i = i + 1
        print(origianl_tab_name)
        return origianl_tab_name

    @keyword
    def convert_string_to_int(self, stringvalue):
        number = int(stringvalue.replace(',', ''))
        return number


    @keyword
    def file_path_set_up(self, path):
        config = configparser.ConfigParser()
        config['DEFAULT']['file_path'] = path
        with open('properties.ini', 'w') as configFile:
            configFile.write(configFile)
        config.read('properties.ini')
        file_path = config['DEFAULT']['file_path']
        return file_path
