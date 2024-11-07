import sys
# Add the directory where 'requests' is located
sys.path.insert(0, r'C:\\Python\\Lib\\site-packages')

from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager

# Initialize Chrome WebDriver without options
driver = webdriver.Chrome(service=Service(ChromeDriverManager().install()))
driver.get("https://google.com")

# Print Cookies
cookies = driver.get_cookies()
for cookie in cookies:
    print(f"Name: {cookie['name']}, Value: {cookie['value']}")

driver.quit()
