from SeleniumLibrary import keywords
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class keywords:
    def __init__(self):
        self.selLib=BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def checking_tab_in_dashboard(self):
        i = 1
        tab_list=self.selLib.get_webelements('//div[@data-at="mega-menu"]/a/span')
        origianl_tab_name=[]
        for j in tab_list:
            text=self.selLib.get_text('xpath:(//div[@data-at="mega-menu"]/a/span)['+str(i)+']')
            origianl_tab_name.append(text)
            i = i+1
        print(origianl_tab_name)
        return origianl_tab_name




